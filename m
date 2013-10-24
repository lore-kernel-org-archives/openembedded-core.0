Return-Path: <net147@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 86E0E6D3D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 10:41:05 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id w10so428759pde.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aN4j7DW1F7+/jHLjcN6K1dX//1QrbT2/Zwokfg2BJ7Q=;
	b=ATioeVNGZkwwIMVk3G8zDHM8y/7Q+T1ervWFHBO6NfyztawLG8jjvq48lscwey297N
	LXe+4lg8tsSdE9GT4KArt+6F5nuMz3M1B/5yhJmuLjYM0bEGS1T/Tr55M0VFxNOrpaFE
	Ya0Hi/Rj/YRaEcWi7DYh3ypj13iq0WifT5A6Fb541mfPIZpuQ8Zo1TKoAJFGEd6a/gko
	dBynQbs8z6/3Q8xU16q/ZXvZSHJB3oJMTsr3CAzO+lWJBmg4b3yoxGRzg1y+9zDP3PFv
	yx9oo5s0ld2yAb+7Kk730MzbmU5v5ZHcSjuyOeTfr6s1sYCZ/04ctJUx5UP4+92Hungc
	0ZaQ==
X-Received: by 10.66.154.1 with SMTP id vk1mr2499349pab.85.1382611267391;
	Thu, 24 Oct 2013 03:41:07 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id tu6sm1655668pbc.41.2013.10.24.03.41.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Oct 2013 03:41:06 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 21:39:52 +1100
Message-Id: <1382611192-5154-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] qt4: add upstream QTBUG-34218/QTBUG-34234 misaligned selection patch
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
X-List-Received-Date: Thu, 24 Oct 2013 10:41:05 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.5.inc                  |  1 +
 ...ned-selection-region-with-text-when-cente.patch | 75 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0025-Fix-misaligned-selection-region-with-text-when-cente.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.5.inc b/meta/recipes-qt/qt4/qt4-4.8.5.inc
index 9935992..dcbf26f 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.5.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.5.inc
@@ -24,6 +24,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch \
            file://0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch \
            file://0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch \
+           file://0025-Fix-misaligned-selection-region-with-text-when-cente.patch \
            file://0027-tools.pro-disable-qmeegographicssystemhelper.patch \
            file://g++.conf \
            file://linux.conf \
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0025-Fix-misaligned-selection-region-with-text-when-cente.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0025-Fix-misaligned-selection-region-with-text-when-cente.patch
new file mode 100644
index 0000000..964bcf8
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.5/0025-Fix-misaligned-selection-region-with-text-when-cente.patch
@@ -0,0 +1,75 @@
+From c368cbad3a505d44894ff150dc25c74d0174ca15 Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Wed, 23 Oct 2013 00:28:17 +1100
+Subject: [PATCH] Fix misaligned selection region with text when centered
+
+If the text is centered, the x/y position in the selection QRectF may
+be a multiple of 0.5 which is rounded up. This rounding causes
+misalignment of the selection region with the text.
+
+The alignment is fixed by using qFloor on the x and y components.
+
+Upstream-Status: Accepted [https://codereview.qt-project.org/#change,68935]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Task-number: QTBUG-34218
+Task-number: QTBUG-34234
+Change-Id: I4f2fadeb38602f62a93773c6e5faecf03b28069f
+Reviewed-by: Gunnar Sletta <gunnar.sletta@digia.com>
+(cherry picked from qtbase/5d8a882c11201a29475c5ea71cfb76c9de6573f5)
+---
+ src/gui/text/qtextlayout.cpp | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/src/gui/text/qtextlayout.cpp b/src/gui/text/qtextlayout.cpp
+index 3d340cb..8d652ea 100644
+--- a/src/gui/text/qtextlayout.cpp
++++ b/src/gui/text/qtextlayout.cpp
+@@ -44,6 +44,7 @@
+ 
+ #include <qfont.h>
+ #include <qapplication.h>
++#include <qmath.h>
+ #include <qpainter.h>
+ #include <qvarlengtharray.h>
+ #include <qtextformat.h>
+@@ -979,15 +980,23 @@ static void addSelectedRegionsToPath(QTextEngine *eng, int lineNumber, const QPo
+                 continue;
+             }
+ 
+-            if (lastSelectionWidth > 0)
+-                region->addRect(boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight));
++            if (lastSelectionWidth > 0) {
++                QRectF rect = boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight);
++                rect.moveLeft(qFloor(rect.left()));
++                rect.moveTop(qFloor(rect.top()));
++                region->addRect(rect);
++            }
+ 
+             lastSelectionX = selectionX;
+             lastSelectionWidth = selectionWidth;
+         }
+     }
+-    if (lastSelectionWidth > 0)
+-        region->addRect(boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight));
++    if (lastSelectionWidth > 0) {
++        QRectF rect = boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight);
++        rect.moveLeft(qFloor(rect.left()));
++        rect.moveTop(qFloor(rect.top()));
++        region->addRect(rect);
++    }
+ }
+ 
+ static inline QRectF clipIfValid(const QRectF &rect, const QRectF &clip)
+@@ -2081,7 +2090,7 @@ static void setPenAndDrawBackground(QPainter *p, const QPen &defaultPen, const Q
+ 
+     QBrush bg = chf.background();
+     if (bg.style() != Qt::NoBrush && !chf.property(SuppressBackground).toBool())
+-        p->fillRect(r, bg);
++        p->fillRect(QRectF(qFloor(r.x()), qFloor(r.y()), r.width(), r.height()), bg);
+     if (c.style() != Qt::NoBrush) {
+         p->setPen(QPen(c, 0));
+     }
+-- 
+1.8.4
+
-- 
1.8.4


