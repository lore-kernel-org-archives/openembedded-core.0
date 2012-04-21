Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1SLj39-00054U-2R
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Apr 2012 00:45:03 +0200
Received: (qmail invoked by alias); 21 Apr 2012 22:28:52 -0000
Received: from unknown (EHLO jethro.cheepee.homedns.org) [95.76.68.223]
	by mail.gmx.net (mp033) with SMTP; 22 Apr 2012 00:28:52 +0200
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX1/UvPJo08/UuJPCiIPuRLR4w9nWweyqh/fJ9xenxw
	Q56LcyadCPEBr8
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Apr 2012 01:28:43 +0300
Message-Id: <1335047323-12316-1-git-send-email-cheepeero@gmx.net>
X-Mailer: git-send-email 1.7.3.4
X-Y-GMX-Trusted: 0
Subject: [oe] Fix bad linkage towards host qt-mobility sensors module
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Apr 2012 22:45:04 -0000

Prevent qmake from using mobilityconfig.prf from host system when build webkit.
---
 meta/recipes-qt/qt4/qt-4.8.0.inc                  |    1 +
 meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch |   52 +++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb         |    2 +-
 3 files changed, 54 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch

diff --git a/meta/recipes-qt/qt4/qt-4.8.0.inc b/meta/recipes-qt/qt4/qt-4.8.0.inc
index c0d90cd..af8db2a 100644
--- a/meta/recipes-qt/qt4/qt-4.8.0.inc
+++ b/meta/recipes-qt/qt4/qt-4.8.0.inc
@@ -20,6 +20,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://pulseaudio-config.patch \
            file://g++.conf \
            file://linux.conf \
+           file://no-qt-mobility.patch \
            "
 
 SRC_URI[md5sum] = "e8a5fdbeba2927c948d9f477a6abe904"
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch b/meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch
new file mode 100644
index 0000000..ed66509
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch
@@ -0,0 +1,52 @@
+diff --git a/src/3rdparty/webkit/Source/WebCore/features.pri b/src/3rdparty/webkit/Source/WebCore/features.pri
+index f04d0b4..aac0482 100644
+--- a/src/3rdparty/webkit/Source/WebCore/features.pri
++++ b/src/3rdparty/webkit/Source/WebCore/features.pri
+@@ -14,7 +14,7 @@ meegotouch {
+ }
+ 
+ ## load mobilityconfig if mobility is available
+-load(mobilityconfig, true)
++#load(mobilityconfig, true)
+ 
+ ## Define default features macros for optional components
+ ## (look for defs in config.h and included files!)
+diff --git a/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platformplugin.pro b/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platformplugin.pro
+index 80cecb3..856351a 100644
+--- a/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platformplugin.pro
++++ b/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platformplugin.pro
+@@ -4,7 +4,7 @@ TEMPLATE = lib
+ CONFIG += plugin
+ 
+ ## load mobilityconfig if mobility is available
+-load(mobilityconfig, true)
++#load(mobilityconfig, true)
+ 
+ # HTML5 Media Support
+ # We require QtMultimedia
+diff --git a/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platformplugin.pro b/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platformplugin.pro
+index fd31e1e..52f1b46 100644
+--- a/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platformplugin.pro
++++ b/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platformplugin.pro
+@@ -11,7 +11,7 @@ QT       += core gui \
+             xml
+ 
+ ## load mobilityconfig if mobility is available
+-load(mobilityconfig, true)
++#load(mobilityconfig, true)
+ 
+ isEmpty(OUTPUT_DIR): OUTPUT_DIR = ../../../..
+ 
+diff --git a/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri b/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri
+index 812fe93..ccbc5a0 100644
+--- a/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri
++++ b/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri
+@@ -7,7 +7,7 @@ CONFIG(QTDIR_build) { load(qttest_p4) }
+ ELSE { TARGET = tst_$$TARGET }
+ 
+ # Load mobilityconfig if Qt Mobility is available
+-load(mobilityconfig, true)
++#load(mobilityconfig, true)
+ contains(MOBILITY_CONFIG, multimedia) {
+     # This define is used by tests depending on Qt Multimedia
+     DEFINES -= WTF_USE_QT_MULTIMEDIA=0
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
index 6a0b0b8..63a3769 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.3.4



