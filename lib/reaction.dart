import 'package:flutter/material.dart';
import 'dart:math';

class ReactionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReactionState();

}

class _ReactionState extends State<ReactionScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: CustomPaint(
        size: Size(MediaQuery.of(context).size.width,
            (MediaQuery.of(context).size.width / 2) + 60),
        painter: IconReaction(),
      ),
    );
  }
}

class IconReaction extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 60.0;
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    Offset offCircle = Offset(centerX, centerY);
    Paint circlePaint = gradientPaint(Rect.fromCircle(center: offCircle, radius: radius), Color(0xFFfe0944), Color(0xFFfeae96))
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(offCircle, radius, circlePaint);
    var leftSmile = centerX - radius + 30;
    var rightSmile = centerX + radius - 30;
    Path path = Path();
    path.moveTo(leftSmile, centerY + (radius / 2));
    path.quadraticBezierTo(centerX, centerY + 5, rightSmile, centerY + (radius / 2));
    canvas.drawPath(path, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  Paint gradientPaint(Rect rect, Color startColor, Color endColor) {
   final linearGradient = LinearGradient(colors: [startColor, endColor]);
   return Paint()
       ..strokeWidth = 5
       ..style = PaintingStyle.stroke
       ..shader = linearGradient.createShader(rect);
  }

}