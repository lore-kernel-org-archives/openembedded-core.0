Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S1mhR-0004wH-2w
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 23:36:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Feb 2012 14:27:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129643772"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.61])
	by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2012 14:27:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2012 22:27:41 +0000
Message-Id: <d99c9fb25d75049e2386a7f15ce2c6a780e3cad4.1330294151.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1330294151.git.paul.eggleton@linux.intel.com>
References: <cover.1330294151.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1330294151.git.paul.eggleton@linux.intel.com>
References: <cover.1330294151.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] qt4: build qmake for the target
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
X-List-Received-Date: Sun, 26 Feb 2012 22:36:13 -0000

qmake was not being built at all (since we had the host version from
qt4-native) and the default is to build for the host machine within
configure. With a minor hack we can build qmake for the target as well,
which is useful if you want to build Qt 4 software on an actual device.
This is now installed as part of the tools package (together with uic,
moc etc.)

Additionally, add an environment setup script (installed in
/usr/share/qt4/environment-setup or /usr/share/qtopia/environment-setup
for the embedded version) as part of the mkspecs package since the
mkspecs will not work without the paths set up by this script. The code
to create this script was adapted from the qmake2 recipe in meta-oe.

Also move do_compile() from qt-${PV}.inc up to qt4.inc as both versions
have the exact same content.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/files/target_qmake.patch       |   16 ++++++
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |   11 +----
 meta/recipes-qt/qt4/qt-4.8.0.inc                   |   12 +----
 meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch |   51 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |   47 ++++++++++++++++--
 7 files changed, 115 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/target_qmake.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch

diff --git a/meta/recipes-qt/qt4/files/target_qmake.patch b/meta/recipes-qt/qt4/files/target_qmake.patch
new file mode 100644
index 0000000..a4650c8
--- /dev/null
+++ b/meta/recipes-qt/qt4/files/target_qmake.patch
@@ -0,0 +1,16 @@
+Allow building a separate qmake for the target
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Upstream-Status: Inappropriate [config]
+
+--- qt-everywhere-opensource-src-4.8.0.orig/qmake/qmake.pro
++++ qt-everywhere-opensource-src-4.8.0/qmake/qmake.pro
+@@ -7,6 +7,7 @@ CONFIG += console bootstrap
+ CONFIG -= qt shared app_bundle uic
+ DEFINES += QT_BUILD_QMAKE QT_BOOTSTRAPPED
+ DESTDIR = ../bin/
++TARGET = qmake2
+ 
+ OBJECTS_DIR = .
+ MOC_DIR = .
diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.7.4.inc
index 9ddb055..216472c 100644
--- a/meta/recipes-qt/qt4/qt-4.7.4.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://blacklist-diginotar-certs.diff \
            file://fix-translations.patch \
            file://add_nostrip_for_debug_packages.diff \
+           file://target_qmake.patch \
            file://g++.conf \
            file://linux.conf \
            file://fix-qtbug-20925.patch \
@@ -43,13 +44,3 @@ do_configure_prepend() {
     ${S}/configure
 }
 
-do_compile() {
-    # Fixup missing wsegl header in some SGX SDKs
-    if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
-        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/QWSWSEGL/
-    fi
-
-    unset CFLAGS CXXFLAGS
-
-    oe_runmake ${EXTRA_ENV}
-}
diff --git a/meta/recipes-qt/qt4/qt-4.8.0.inc b/meta/recipes-qt/qt4/qt-4.8.0.inc
index 532f1ff..28586be 100644
--- a/meta/recipes-qt/qt4/qt-4.8.0.inc
+++ b/meta/recipes-qt/qt4/qt-4.8.0.inc
@@ -15,6 +15,8 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://add_nostrip_for_debug_packages.diff \
            file://qmake_cxx_eval.patch \
            file://configure_oe_compiler.patch \
+           file://target_qmake.patch \
+           file://qmake_pri_fixes.patch \
            file://g++.conf \
            file://linux.conf \
            "
@@ -50,13 +52,3 @@ do_configure_prepend() {
     unset LD
 }
 
-do_compile() {
-    # Fixup missing wsegl header in some SGX SDKs
-    if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
-        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/QWSWSEGL/
-    fi
-
-    unset CFLAGS CXXFLAGS
-
-    oe_runmake ${EXTRA_ENV}
-}
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch b/meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch
new file mode 100644
index 0000000..82bff04
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch
@@ -0,0 +1,51 @@
+From c56ed5f64a5f47cf8d539aa4ca9bedbe1fea2264 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Fri, 10 Feb 2012 15:32:12 +0000
+Subject: [PATCH] qmake: fix source file references in qmake.pri
+
+Fix duplicate entries in SOURCES and HEADERS, and fix the source file
+list for the split of qlocale.cpp.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ qmake/qmake.pri |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/qmake/qmake.pri b/qmake/qmake.pri
+index f2a3705..2d4e94c 100644
+--- a/qmake/qmake.pri
++++ b/qmake/qmake.pri
+@@ -22,8 +22,7 @@ SOURCES += project.cpp property.cpp main.cpp generators/makefile.cpp \
+            generators/symbian/initprojectdeploy_symbian.cpp \
+            generators/integrity/gbuild.cpp \
+            windows/registry.cpp \
+-           symbian/epocroot.cpp \
+-           generators/integrity/gbuild.cpp
++           symbian/epocroot.cpp
+ 
+ HEADERS += project.h property.h generators/makefile.h \
+            generators/unix/unixmake.h meta.h option.h cachekeys.h \
+@@ -40,8 +39,7 @@ HEADERS += project.h property.h generators/makefile.h \
+            generators/symbian/initprojectdeploy_symbian.h \
+            generators/integrity/gbuild.h \
+            windows/registry_p.h \
+-           symbian/epocroot_p.h \
+-           generators/integrity/gbuild.h
++           symbian/epocroot_p.h
+ 
+ contains(QT_EDITION, OpenSource) {
+    DEFINES += QMAKE_OPENSOURCE_EDITION
+@@ -72,6 +70,8 @@ bootstrap { #Qt code
+         qlist.cpp \
+         qlinkedlist.cpp \
+         qlocale.cpp \
++        qlocale_tools.cpp \
++        qlocale_unix.cpp \
+         qmalloc.cpp \
+         qmap.cpp \
+         qmetatype.cpp \
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
index 9b66d03..a1fcafb 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
@@ -1,7 +1,7 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.6"
+PR = "${INC_PR}.7"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
index 6dedf00..e7f848e 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.6"
+PR = "${INC_PR}.7"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index ea868ff..1e76dec 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -142,8 +142,8 @@ RRECOMMENDS_${QT_BASE_NAME}-qmlviewer += " \
 RRECOMMENDS_${QT_BASE_NAME}-doc += " \
             ${QT_BASE_NAME}-demos-doc"
 
-FILES_${QT_BASE_NAME}-tools                = "${bindir}/qttracereplay ${bindir}/qdoc* ${bindir}/moc ${bindir}/uic* ${bindir}/rcc"
-FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc* ${bindir}/.debug/uic* ${bindir}/.debug/moc ${bindir}/.debug/rcc"
+FILES_${QT_BASE_NAME}-tools                = "${bindir}/qttracereplay ${bindir}/qdoc* ${bindir}/qmake ${bindir}/moc ${bindir}/uic* ${bindir}/rcc"
+FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc* ${bindir}/.debug/qmake ${bindir}/.debug/uic* ${bindir}/.debug/moc ${bindir}/.debug/rcc"
 FILES_${QT_BASE_NAME}-assistant            = "${bindir}/*assistant* ${bindir}/qcollectiongenerator ${bindir}/qhelpconverter ${bindir}/qhelpgenerator"
 FILES_${QT_BASE_NAME}-assistant-dbg        = "${bindir}/.debug/*assistant* ${bindir}/.debug/qcollectiongenerator ${bindir}/.debug/qhelpconverter ${bindir}/.debug/qhelpgenerator"
 FILES_${QT_BASE_NAME}-common               = "${bindir}/qtconfig"
@@ -172,7 +172,7 @@ FILES_${QT_BASE_NAME}-qmlviewer            = "${bindir}/qmlviewer"
 FILES_${QT_BASE_NAME}-qmlviewer-dbg        = "${bindir}/.debug/qmlviewer"
 FILES_${QT_BASE_NAME}-makeqpf              = "${bindir}/makeqpf"
 FILES_${QT_BASE_NAME}-makeqpf-dbg          = "${bindir}/.debug/makeqpf"
-FILES_${QT_BASE_NAME}-mkspecs              = "${datadir}/${QT_DIR_NAME}/mkspecs/*"
+FILES_${QT_BASE_NAME}-mkspecs              = "${datadir}/${QT_DIR_NAME}/mkspecs/* ${datadir}/${QT_DIR_NAME}/environment-setup"
 FILES_${QT_BASE_NAME}-xmlpatterns          = "${bindir}/xmlpatterns*"
 FILES_${QT_BASE_NAME}-xmlpatterns-dbg      = "${bindir}/.debug/xmlpatterns*"
 FILES_${QT_BASE_NAME}-qml-plugins          = "${libdir}/${QT_DIR_NAME}/imports/* ${libdir}/${QT_DIR_NAME}/plugins/qmltooling/*"
@@ -236,6 +236,24 @@ do_configure() {
 			-I${STAGING_INCDIR}/freetype2
 }
 
+do_compile() {
+    # Fixup missing wsegl header in some SGX SDKs
+    if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
+        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/QWSWSEGL/
+    fi
+
+    unset CFLAGS CXXFLAGS
+
+    oe_runmake ${EXTRA_ENV}
+
+    # Build target qmake
+    export QMAKESPEC="${S}/mkspecs/${TARGET_OS}-oe-g++"
+    cd ${S}/qmake
+    ${OE_QMAKE_QMAKE}
+    oe_runmake CC="${CC}" CXX="${CXX}"
+    cd ${S}
+}
+
 python populate_packages_prepend() {
         translation_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/translations/', d)
         translation_name = bb.data.expand('${QT_BASE_NAME}-translation-%s', d)
@@ -295,8 +313,9 @@ python populate_packages_prepend() {
 do_install() {
 	oe_runmake install INSTALL_ROOT=${D}
 
-	# These are host binaries, we should only use them in staging
+	# Install a proper target version of qmake
 	rm ${D}/${bindir}/qmake
+	install -m 0755 bin/qmake2 ${D}${bindir}/qmake
 
 	# fix pkgconfig, libtool and prl files
 	sed -i -e 's#-L${S}/lib/\?##g' \
@@ -333,4 +352,24 @@ do_install() {
 	if [ -n "${QT_LIBINFIX}" ] ; then
 		[ -f ${D}${bindir}/qtdemo ] && mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
 	fi
+
+	script="${D}/${datadir}/${QT_DIR_NAME}/environment-setup"
+	touch $script
+	echo 'export QT_DIR_NAME=${QT_DIR_NAME}' >> $script
+	echo 'export QT_LIBINFIX=${QT_LIBINFIX}' >> $script
+	echo 'export OE_QMAKE_AR=ar' >> $script
+	echo 'export OE_QMAKE_CC=gcc' >> $script
+	echo 'export OE_QMAKE_CXX=g++' >> $script
+	echo 'export OE_QMAKE_LINK=g++' >> $script
+	echo 'export OE_QMAKE_LIBDIR_QT=${libdir}' >> $script
+	echo 'export OE_QMAKE_INCDIR_QT=${includedir}/${QT_DIR_NAME}' >> $script
+	echo 'export OE_QMAKE_MOC=${bindir}/moc' >> $script
+	echo 'export OE_QMAKE_UIC=${bindir}/uic' >> $script
+	echo 'export OE_QMAKE_UIC3=${bindir}/uic3' >> $script
+	echo 'export OE_QMAKE_RCC=${bindir}/rcc' >> $script
+	echo 'export OE_QMAKE_QDBUSCPP2XML=${bindir}/qdbuscpp2xml' >> $script
+	echo 'export OE_QMAKE_QDBUSXML2CPP=${bindir}/qdbusxml2cpp' >> $script
+	echo 'export OE_QMAKE_QT_CONFIG=${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+	echo 'export QMAKESPEC=${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
+	chmod 0755 $script
 }
-- 
1.7.5.4



