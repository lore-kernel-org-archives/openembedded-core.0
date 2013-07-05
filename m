Return-Path: <net147@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 87BCD6AD81
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 03:25:54 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so1717478pbb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 20:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=B8M295+vrZTWuJIMT6uye/lNxWq/pyvIvQTDbCytU0E=;
	b=djXVV1NdMMCLl7S9ZiG5NnMk2XfCTadhIF5QSH62QCPzGTyWogU/qe+GO5fPUnXZsE
	2Nh1c1npwl+r742OmSJkxURK4hDZJrkx0Pcqg3D1aZe1lHZyMUFRlFrs3LoRuRkdRRJt
	FOueYRos2osXYjS+mpq4aCb94OaPhgpePt8X3VjjwAXLHvTw5DQ9ThYaoLL9sFKGdu+i
	2ad9xrvyjkEn06zUGJnK8AJWhKzcmF6VYmc8fTpyPgQKI7TSVv370lphHwPdC3Z47leI
	Tyh/kpFRP70jr99MWV3+bOvxr8NpOHf6id9EZiptg+OZJBrJiVPtjO4xe/8CXt/bEjYl
	022w==
X-Received: by 10.66.162.135 with SMTP id ya7mr9290799pab.173.1372994755642;
	Thu, 04 Jul 2013 20:25:55 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id fn9sm5903556pab.2.2013.07.04.20.25.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 20:25:54 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 13:41:23 +1000
Message-Id: <1372995683-12459-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] qt4: add upstream QTBUG-31579 patch to fix polyline drawing regression
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jul 2013 03:25:54 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.5.inc                  |   1 +
 ...-of-0-width-polylines-from-outside-the-de.patch | 148 +++++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.5.inc b/meta/recipes-qt/qt4/qt4-4.8.5.inc
index 184261a..709e3a8 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.5.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.5.inc
@@ -21,6 +21,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0018-configure-make-pulseaudio-a-configurable-option.patch \
            file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
            file://0020-webkit-disable-the-fuse-ld-gold-flag.patch \
+           file://0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch
new file mode 100644
index 0000000..ad45dd0
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.5/0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch
@@ -0,0 +1,148 @@
+From b7029fbd12c32e851ed7d81b692197176eb71d9e Mon Sep 17 00:00:00 2001
+From: Gunnar Sletta <gunnar.sletta@digia.com>
+Date: Thu, 4 Jul 2013 16:20:40 +1000
+Subject: [PATCH] Fix drawing of 0-width polylines from outside the devicerect.
+
+This was broken by a previous fix which aimed to fix gaps in
+polylines with tiny line segments. The result was that we
+skipped updating the origin point when stroke() didn't produce
+pixels which accidentally included the case of the line
+being completely outside the deviceRect. I fixed this
+by returning the value of clipLine in drawLine to the caller
+so we could still update the origin for this case.
+
+Upstream-Status: Accepted [https://codereview.qt-project.org/#change,60427]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Task-number: QTBUG-31579
+Change-Id: Iac29436f042da7658bbeaf9370351dc6f2c95065
+(cherry picked from qtbase/900cccfd459fcbdbc4aa3d313afe12cfbf68fd87)
+---
+ src/gui/painting/qcosmeticstroker.cpp | 42 ++++++++++++++++++++++-------------
+ src/gui/painting/qcosmeticstroker_p.h |  2 +-
+ 2 files changed, 27 insertions(+), 17 deletions(-)
+
+diff --git a/src/gui/painting/qcosmeticstroker.cpp b/src/gui/painting/qcosmeticstroker.cpp
+index 0061ecb..4413170 100644
+--- a/src/gui/painting/qcosmeticstroker.cpp
++++ b/src/gui/painting/qcosmeticstroker.cpp
+@@ -133,10 +133,15 @@ struct NoDasher {
+ 
+ };
+ 
++/*
++ * The return value is the result of the clipLine() call performed at the start
++ * of each of the two functions, aka "false" means completely outside the devices
++ * rect.
++ */
+ template<DrawPixel drawPixel, class Dasher>
+-static void drawLine(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
++static bool drawLine(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
+ template<DrawPixel drawPixel, class Dasher>
+-static void drawLineAA(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
++static bool drawLineAA(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
+ 
+ inline void drawPixel(QCosmeticStroker *stroker, int x, int y, int coverage)
+ {
+@@ -602,17 +607,20 @@ void QCosmeticStroker::drawPath(const QVectorPath &path)
+                 caps |= CapEnd;
+ 
+             QCosmeticStroker::Point last = this->lastPixel;
+-            stroke(this, p.x(), p.y(), p2.x(), p2.y(), caps);
++            bool unclipped = stroke(this, p.x(), p.y(), p2.x(), p2.y(), caps);
+ 
+             /* fix for gaps in polylines with fastpen and aliased in a sequence
+                of points with small distances: if current point p2 has been dropped
+-               out, keep last non dropped point p. */
+-            if (fastPenAliased) {
+-                if (last.x != lastPixel.x || last.y != lastPixel.y ||
+-                    points == begin + 2 || points == end - 2 ) {
+-                    {
+-                        p = p2;
+-                    }
++               out, keep last non dropped point p.
++
++               However, if the line was completely outside the devicerect, we
++               still need to update p to avoid drawing the line after this one from
++               a bad starting position.
++            */
++            if (fastPenAliased && unclipped) {
++                if (last.x != lastPixel.x || last.y != lastPixel.y
++                    || points == begin + 2 || points == end - 2) {
++                    p = p2;
+                 }
+             } else {
+                 p = p2;
+@@ -720,10 +728,10 @@ static inline void capAdjust(int caps, int &x1, int &x2, int &y, int yinc)
+   the drawing shifts from horizontal to vertical or back.
+   */
+ template<DrawPixel drawPixel, class Dasher>
+-static void drawLine(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2, qreal ry2, int caps)
++static bool drawLine(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2, qreal ry2, int caps)
+ {
+     if (stroker->clipLine(rx1, ry1, rx2, ry2))
+-        return;
++        return false;
+ 
+     static const int half = 31;
+     int x1 = toF26Dot6(rx1) + half;
+@@ -813,7 +821,7 @@ static void drawLine(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2,
+     } else {
+         // horizontal
+         if (!dx)
+-            return;
++            return true;
+ 
+         QCosmeticStroker::Direction dir = QCosmeticStroker::LeftToRight;
+ 
+@@ -886,14 +894,15 @@ static void drawLine(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2,
+         }
+     }
+     stroker->lastPixel = last;
++    return true;
+ }
+ 
+ 
+ template<DrawPixel drawPixel, class Dasher>
+-static void drawLineAA(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2, qreal ry2, int caps)
++static bool drawLineAA(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2, qreal ry2, int caps)
+ {
+     if (stroker->clipLine(rx1, ry1, rx2, ry2))
+-        return;
++        return false;
+ 
+     int x1 = toF26Dot6(rx1);
+     int y1 = toF26Dot6(ry1);
+@@ -967,7 +976,7 @@ static void drawLineAA(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx
+     } else {
+         // horizontal
+         if (!dx)
+-            return;
++            return true;
+ 
+         int yinc = F16Dot16FixedDiv(dy, dx);
+ 
+@@ -1029,6 +1038,7 @@ static void drawLineAA(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx
+             drawPixel(stroker, x, (y>>16) + 1, alpha * alphaEnd >> 6);
+         }
+     }
++    return true;
+ }
+ 
+ QT_END_NAMESPACE
+diff --git a/src/gui/painting/qcosmeticstroker_p.h b/src/gui/painting/qcosmeticstroker_p.h
+index 870738b..3216856 100644
+--- a/src/gui/painting/qcosmeticstroker_p.h
++++ b/src/gui/painting/qcosmeticstroker_p.h
+@@ -56,7 +56,7 @@ QT_MODULE(Gui)
+ class QCosmeticStroker;
+ 
+ 
+-typedef void (*StrokeLine)(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
++typedef bool (*StrokeLine)(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
+ 
+ class QCosmeticStroker
+ {
+-- 
+1.8.3.2
+
-- 
1.8.3.2


