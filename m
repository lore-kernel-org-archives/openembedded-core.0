Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QsuES-0002c2-Gc
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 12:17:20 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 03:12:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,373,1309762800"; d="scan'208";a="41534195"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.70])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 03:12:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 11:12:37 +0100
Message-Id: <37b40ca01ad11a5b0747949ffae8f8d87c33183e.1313402929.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313402929.git.paul.eggleton@linux.intel.com>
References: <cover.1313402929.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1313402929.git.paul.eggleton@linux.intel.com>
References: <cover.1313402929.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] qt4: package QML plugins and correct their install directory
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
X-List-Received-Date: Mon, 15 Aug 2011 10:17:20 -0000

QML components from Qt were installed to ${prefix} before and never got
packaged. This is now fixed and QML components are now installed into
${libdir}/${QT_DIR_NAME}/imports and packaged into qt4-*-qml-plugins
package.

Additionally qmlviewer and the examples/demos are now dependent upon
these plugins as needed.

Originally based on OE commit 4adf97be8c5b5f71ad92095a19968af534baa9e2
by Simon Busch <morphis@gravedo.de>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |   14 +++++++++++---
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 9b7e071..d464a1d 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1 | GPLv3"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r28"
+INC_PR = "r29"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index b8633de..234cb89 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r25"
+INC_PR = "r26"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 881b445..815ebc2 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -98,7 +98,8 @@ OTHER_PACKAGES = "\
              ${QT_BASE_NAME}-pixeltool \
              ${QT_BASE_NAME}-qmlviewer \
              ${QT_BASE_NAME}-xmlpatterns \
-             ${QT_BASE_NAME}-qt3to4"
+             ${QT_BASE_NAME}-qt3to4 \
+             ${QT_BASE_NAME}-qml-plugins"
 
 PACKAGES += "${LIB_PACKAGES} ${DEV_PACKAGES} ${DBG_PACKAGES} ${OTHER_PACKAGES}"
 PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-* ${QT_BASE_NAME}-fonts-*"
@@ -122,11 +123,15 @@ RRECOMMENDS_${QT_BASE_NAME}-demos += " \
             ${QT_BASE_NAME}-examples \
             ${QT_BASE_NAME}-plugin-sqldriver-sqlite \
             ${QT_BASE_NAME}-plugin-imageformat-jpeg \
+            ${QT_BASE_NAME}-qml-plugins \
             ${QT_BASE_NAME}-assistant \
             ${PN}-doc"
 RRECOMMENDS_${QT_BASE_NAME}-examples += " \
             ${QT_BASE_NAME}-plugin-sqldriver-sqlite \
-            ${QT_BASE_NAME}-plugin-imageformat-jpeg"
+            ${QT_BASE_NAME}-plugin-imageformat-jpeg \
+            ${QT_BASE_NAME}-qml-plugins"
+RRECOMMENDS_${QT_BASE_NAME}-qmlviewer += " \
+            ${QT_BASE_NAME}-qml-plugins"
 
 FILES_${QT_BASE_NAME}-tools                = "${bindir}/qttracereplay ${bindir}/qdoc*"
 FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc*"
@@ -160,7 +165,8 @@ FILES_${QT_BASE_NAME}-makeqpf-dbg          = "${bindir}/.debug/makeqpf"
 FILES_${QT_BASE_NAME}-mkspecs              = "${datadir}/${QT_DIR_NAME}/mkspecs/*"
 FILES_${QT_BASE_NAME}-xmlpatterns          = "${bindir}/xmlpatterns*"
 FILES_${QT_BASE_NAME}-xmlpatterns-dbg      = "${bindir}/.debug/xmlpatterns*"
-
+FILES_${QT_BASE_NAME}-qml-plugins          = "${libdir}/${QT_DIR_NAME}/imports/* ${libdir}/${QT_DIR_NAME}/plugins/qmltooling/*"
+FILES_${QT_BASE_NAME}-qml-plugins-dbg      = "${libdir}/${QT_DIR_NAME}/imports/*/*/*/.debug/* ${libdir}/${QT_DIR_NAME}/imports/*/.debug"
 
 do_configure() {
 	unset QMAKESPEC
@@ -183,6 +189,7 @@ do_configure() {
 	echo "Libraries=${libdir}"                    >> $QT_CONF_PATH
 	echo "Binaries=${bindir}"                     >> $QT_CONF_PATH
 	echo "Plugins=${libdir}/${QT_DIR_NAME}/plugins" >> $QT_CONF_PATH
+	echo "Imports=${libdir}/${QT_DIR_NAME}/imports" >> $QT_CONF_PATH
 	echo "Data=${datadir}/${QT_DIR_NAME}"         >> $QT_CONF_PATH
 	echo "Translations=${datadir}/${QT_DIR_NAME}/translations" >> $QT_CONF_PATH
 	echo "Settings=${sysconfdir}/${QT_DIR_NAME}"  >> $QT_CONF_PATH
@@ -200,6 +207,7 @@ do_configure() {
 			-docdir ${docdir}/${QT_DIR_NAME} \
 			-headerdir ${includedir}/${QT_DIR_NAME} \
 			-plugindir ${libdir}/${QT_DIR_NAME}/plugins \
+			-importdir ${libdir}/${QT_DIR_NAME}/imports \
 			-translationdir ${datadir}/${QT_DIR_NAME}/translations \
 			-examplesdir ${bindir}/${QT_DIR_NAME}/examples \
 			-demosdir ${bindir}/${QT_DIR_NAME}/demos \
-- 
1.7.4.1



