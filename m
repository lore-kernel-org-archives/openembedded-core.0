Return-Path: <eric@eukrea.com>
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB4C60664
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 11:57:25 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp6-g21.free.fr (Postfix) with ESMTP id 58F5082296
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 13:57:22 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2013 13:57:26 +0200
Message-Id: <1379591846-1760-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Subject: [PATCH] qt-mobility: fix build without X11
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
X-List-Received-Date: Thu, 19 Sep 2013 11:57:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

else we get :
arm-oe-linux-gnueabi-g++  -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon .../...
ibQtSystemInfoE.so.1 -o libQtSystemInfoE.so.1.2.0 .../... -lblkid -ludev -lX11 -lXrandr -lQtDBusE -lQtXmlE -lQtGuiE -lEGL -lQtNetworkE -lQtCoreE -lpthread
.../build/tmp-defaultsetup-eglibc-eglibc/sysroots/x86_64-linux/usr/libexec/armv7a-vfp-neon-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: cannot find -lXrandr
make[2]: *** [../../lib/libQtSystemInfoE.so.1.2.0] Error 1

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 ...embedded-usage-doesn-t-work-outside-of-Qt.patch | 73 ++++++++++++++++++++++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/0001-fix-embedded-usage-doesn-t-work-outside-of-Qt.patch

diff --git a/meta/recipes-qt/qt4/qt-mobility-1.2.0/0001-fix-embedded-usage-doesn-t-work-outside-of-Qt.patch b/meta/recipes-qt/qt4/qt-mobility-1.2.0/0001-fix-embedded-usage-doesn-t-work-outside-of-Qt.patch
new file mode 100644
index 0000000..d8d88c2
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-mobility-1.2.0/0001-fix-embedded-usage-doesn-t-work-outside-of-Qt.patch
@@ -0,0 +1,73 @@
+From de2b568a4f14f38ae26960f543277bd2ac57c9d6 Mon Sep 17 00:00:00 2001
+From: Alex <qt-info@nokia.com>
+Date: Tue, 10 May 2011 14:54:49 +1000
+Subject: [PATCH] fix !embedded usage (doesn't work outside of Qt)
+
+embedded is part of QT_CONFIG and not CONFIG
+
+Task-number: QTMOBILITY-1586
+---
+Upstream-Status: Backport
+https://qt.gitorious.org/qt-mobility/qt-mobility/commit/de2b568a4f14f38ae26960f543277bd2ac57c9d6
+EB: refreshed the patch for it to apply properly
+
+ plugins/multimedia/gstreamer/gstreamer.pro | 2 +-
+ src/systeminfo/systeminfo.pro              | 6 +++---
+ tests/auto/auto.pro                        | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+Index: qt-mobility-opensource-src-1.2.0/plugins/multimedia/gstreamer/gstreamer.pro
+===================================================================
+--- qt-mobility-opensource-src-1.2.0.orig/plugins/multimedia/gstreamer/gstreamer.pro	2013-09-19 10:34:40.880862884 +0200
++++ qt-mobility-opensource-src-1.2.0/plugins/multimedia/gstreamer/gstreamer.pro	2013-09-19 10:35:22.844862550 +0200
+@@ -85,7 +85,7 @@
+     qgstutils.cpp
+ 
+ 
+-!win32:!embedded:!mac:!symbian:!simulator:!contains(QT_CONFIG, qpa) {
++!win32:!contains(QT_CONFIG,embedded):!mac:!symbian:!simulator:!contains(QT_CONFIG, qpa) {
+     LIBS += -lXv -lX11 -lXext
+ 
+     HEADERS += \
+Index: qt-mobility-opensource-src-1.2.0/src/systeminfo/systeminfo.pro
+===================================================================
+--- qt-mobility-opensource-src-1.2.0.orig/src/systeminfo/systeminfo.pro	2013-09-19 10:34:40.884862884 +0200
++++ qt-mobility-opensource-src-1.2.0/src/systeminfo/systeminfo.pro	2013-09-19 10:36:05.480862210 +0200
+@@ -101,7 +101,7 @@
+             LIBS += -lblkid
+         }
+ 
+-        !embedded:!contains(QT_CONFIG,qpa): {
++        !contains(QT_CONFIG,embedded):!contains(QT_CONFIG,qpa): {
+             LIBS += -lX11 -lXrandr
+         }
+ 
+@@ -154,7 +154,7 @@
+                 #for now... udisks
+             } else {
+                 DEFINES += QT_NO_UDISKS
+-                !embedded:!contains(QT_CONFIG,qpa): LIBS += -lX11 -lXrandr
++                !contains(QT_CONFIG,embedded):!contains(QT_CONFIG,qpa): LIBS += -lX11 -lXrandr
+             }
+ 
+             contains(connman_enabled, yes): {
+@@ -165,7 +165,7 @@
+             }
+         } else {
+             DEFINES += QT_NO_NETWORKMANAGER QT_NO_UDISKS QT_NO_CONNMAN
+-            !embedded:!contains(QT_CONFIG,qpa): LIBS += -lX11 -lXrandr
++            !contains(QT_CONFIG,embedded):!contains(QT_CONFIG,qpa): LIBS += -lX11 -lXrandr
+         }
+      }
+ 
+Index: qt-mobility-opensource-src-1.2.0/tests/auto/auto.pro
+===================================================================
+--- qt-mobility-opensource-src-1.2.0.orig/tests/auto/auto.pro	2013-09-19 10:34:40.884862884 +0200
++++ qt-mobility-opensource-src-1.2.0/tests/auto/auto.pro	2013-09-19 10:35:22.844862550 +0200
+@@ -21,5 +21,5 @@
+ # which require that the autotest is run on the same machine
+ # doing the build - i.e. cross-compilation is not allowed.
+ win32|mac|linux-g++* {
+-    !embedded:!maemo5:!maemo6:SUBDIRS+=host.pro
++    !contains(QT_CONFIG,embedded):!maemo5:!maemo6:SUBDIRS+=host.pro
+ }
diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index b9367a8..062702f 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -18,6 +18,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.t
            file://qt-mobility-no-opengl.patch \
            file://gcc-scope.patch \
            file://qt-mobility-no-xvideo.patch \
+           file://0001-fix-embedded-usage-doesn-t-work-outside-of-Qt.patch \
 	   "
 
 SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
-- 
1.8.4.rc3


