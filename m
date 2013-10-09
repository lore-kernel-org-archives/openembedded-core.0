Return-Path: <net147@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id A23476CE6D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 13:23:47 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id xb4so895634pbc.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2013 06:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SWzWn/issSc81GzKWEfB12qa3/tAX3nKptrw1XXnVy4=;
	b=WP6U2Qtt0280WGiaqdsvgKxs+7K+4Pe/5KDOCLdfQSluAzd5PAOCmpM/nZoMnJmezb
	U2h39vdLlgRBZ/zXNhhVPoG4C+Of5OA4zvxXjQE3GKW62gpbhdbrMVoTJhtzU15z+bsX
	slI/WSVeNnbcVD4Ara96sqro0L3Sysrp77dKp9rWh7KNyoZr6xKQcFnkcOPOqqUPSYVn
	JaCoeubkeIXJPqyxOCfwVeRtuIDyZccLKymqhdiSiiECe9M1U/+Yg6mrJjpUD9jEJqII
	xuIouEwZkYWgPzI23xr3yEySgkTh9gN+wXhw7vATrif9oQm0ZhE9DkTkXI4w7USxvstz
	L4dA==
X-Received: by 10.68.251.133 with SMTP id zk5mr7771580pbc.69.1381325029825;
	Wed, 09 Oct 2013 06:23:49 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ve9sm46668516pbc.19.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 06:23:49 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2013 00:21:46 +1100
Message-Id: <1381324906-24278-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] qt4: add upstream QTBUG-31579 patch for QPainter regression
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
X-List-Received-Date: Wed, 09 Oct 2013 13:23:48 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.5.inc                  |  1 +
 ...Pixel.y-is-also-initalized-to-1-when-nece.patch | 48 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.5.inc b/meta/recipes-qt/qt4/qt4-4.8.5.inc
index 95a14f3..9935992 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.5.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.5.inc
@@ -23,6 +23,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0020-webkit-disable-the-fuse-ld-gold-flag.patch \
            file://0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch \
            file://0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch \
+           file://0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch \
            file://0027-tools.pro-disable-qmeegographicssystemhelper.patch \
            file://g++.conf \
            file://linux.conf \
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch
new file mode 100644
index 0000000..7825205
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.5/0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch
@@ -0,0 +1,48 @@
+From 0726127285413829f58618b5b82fb3e2da0c3a74 Mon Sep 17 00:00:00 2001
+From: Andy Shaw <andy.shaw@digia.com>
+Date: Tue, 8 Oct 2013 15:45:42 +0200
+Subject: [PATCH] Ensure lastPixel.y is also initalized to -1 when necessary
+
+Task-number: QTBUG-31579
+
+Upstream-Status: Accepted [https://codereview.qt-project.org/#change,67624]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Change-Id: Ia4916ac0d384ea523bbfad0dafbc90044da7ec3e
+Reviewed-by: Gunnar Sletta <gunnar.sletta@digia.com>
+(cherry picked from qtbase/f0b950144dde85b65df0c3cf83f7c8df0e94bbbf)
+---
+ src/gui/painting/qcosmeticstroker.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/gui/painting/qcosmeticstroker.cpp b/src/gui/painting/qcosmeticstroker.cpp
+index 4413170..36616d4 100644
+--- a/src/gui/painting/qcosmeticstroker.cpp
++++ b/src/gui/painting/qcosmeticstroker.cpp
+@@ -305,6 +305,7 @@ void QCosmeticStroker::setup()
+     ymax = deviceRect.bottom() + 2;
+ 
+     lastPixel.x = -1;
++    lastPixel.y = -1;
+ }
+ 
+ // returns true if the whole line gets clipped away
+@@ -533,6 +534,7 @@ void QCosmeticStroker::drawPath(const QVectorPath &path)
+             QPointF p = QPointF(points[0], points[1]) * state->matrix;
+             patternOffset = state->lastPen.dashOffset()*64;
+             lastPixel.x = -1;
++            lastPixel.y = -1;
+ 
+             bool closed;
+             const QPainterPath::ElementType *e = subPath(type, end, points, &closed);
+@@ -587,6 +589,7 @@ void QCosmeticStroker::drawPath(const QVectorPath &path)
+         QPointF movedTo = p;
+         patternOffset = state->lastPen.dashOffset()*64;
+         lastPixel.x = -1;
++        lastPixel.y = -1;
+ 
+         const qreal *begin = points;
+         const qreal *end = points + 2*path.elementCount();
+-- 
+1.8.4
+
-- 
1.8.4


