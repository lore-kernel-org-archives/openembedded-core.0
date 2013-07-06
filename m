Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 894D36AD81
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 01:36:58 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id ld11so2673720pab.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2013 18:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9xlnDlQU9Vo3Zfp9dL+MOPXCL3N7ucep8+fL/4W5lCQ=;
	b=CRtq480xhRzURoh8tjWScOL7EWZUI0UScBbhFyh3u8J/Y3dKHINSf5Bofa/PZfhZay
	01DDYSpM/4KebkywTf0on/2dfGFE5vMaKyK7N1yrDnvw8SU6Mpq+7mYZn2nOaG0IDuN/
	k1qGvDgQZGKi1k6ow1KOg4h1xvsWbvbU5jXSX3ciyo9m4n25Z+Ct0efa08XT9zcTFHEU
	pixOkfX1rlRwk2HoIk2gLWKVkatmKgj7FEeg7oGNS3yNWqIM2qJ2Sq+o9PTseUCuCahR
	o9P55s9N6i0P3HcGZXvO+GSVEyFCbwECgDQaeSDlufVoKxjGSNimc/k53IiLGowObUwJ
	u4IA==
X-Received: by 10.67.8.98 with SMTP id dj2mr13403632pad.47.1373074619644;
	Fri, 05 Jul 2013 18:36:59 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id mr3sm9631113pbb.27.2013.07.05.18.36.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Jul 2013 18:36:58 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Jul 2013 11:51:42 +1000
Message-Id: <1373075502-16820-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH v2] qt4: add upstream QTBUG-31579 patch to fix polyline drawing regression
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
X-List-Received-Date: Sat, 06 Jul 2013 01:36:58 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.5.inc                  |   1 +
 ...-of-0-width-polylines-from-outside-the-de.patch | 148 +++++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.5.inc b/meta/recipes-qt/qt4/qt4-4.8.5.inc
index 810a01b..d05b174 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.5.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.5.inc
@@ -21,6 +21,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0018-configure-make-pulseaudio-a-configurable-option.patch \
            file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
            file://0020-webkit-disable-the-fuse-ld-gold-flag.patch \
+           file://0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch \
            file://0027-tools.pro-disable-qmeegographicssystemhelper.patch \
            file://g++.conf \
            file://linux.conf \
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


