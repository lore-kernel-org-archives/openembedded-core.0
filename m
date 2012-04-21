Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SLc52-00082y-1Z
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Apr 2012 17:18:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Apr 2012 08:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91626929"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Apr 2012 08:08:58 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Apr 2012 23:05:53 +0800
Message-Id: <1725bfcc510d29b1db42e8f6269918578b2bc054.1335020669.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1335020669.git.dongxiao.xu@intel.com>
References: <cover.1335020669.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1335020669.git.dongxiao.xu@intel.com>
References: <cover.1335020669.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] qt4: move functions from python to shell style
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
X-List-Received-Date: Sat, 21 Apr 2012 15:18:32 -0000

In qt4's do_configure operation, it will refer to some variables that
are derived from 'd', however these variable values may be not correct
in multilib case since the extraction of these variables happens before
the multilib handler.

The fix is to move these python style functions back to shell style.

This fixes [YOCTO #2355]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc        |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |   15 ++++++++++++---
 meta/recipes-qt/qt4/qt4-x11-free.inc        |    2 +-
 meta/recipes-qt/qt4/qt4.inc                 |   27 +++++++++++++++++++++++----
 meta/recipes-qt/qt4/qt4_arch.inc            |   25 -------------------------
 5 files changed, 37 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/qt4_arch.inc

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 8c15352..291e62a 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r43"
+INC_PR = "r44"
 
 QT_BASE_LIB  ?= "libqt-embedded"
 
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index efb61bf..d350f28 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
@@ -26,7 +26,15 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
-require qt4_arch.inc
+set_arch() {
+   case ${TARGET_ARCH} in
+       arm*)     QT_ARCH=arm ;;
+       i*86*)    QT_ARCH=i386 ;;
+       mips*)    QT_ARCH=mips ;;
+       powerpc*) QT_ARCH=powerpc ;;
+       x86_64*)  QT_ARCH=x86_64 ;;
+   esac
+}
 
 # FIXME: make it work with "${STAGING_BINDIR_NATIVE}/pkg-config --cflags dbus-1"
 EXTRA_OECONF = "-prefix ${prefix} \
@@ -40,7 +48,7 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -verbose -release -fast -static \
                 -platform ${TARGET_OS}-oe-g++ \
                 -xplatform ${TARGET_OS}-oe-g++ \
-                -arch ${@qt_arch(d)} \
+                -arch ${QT_ARCH} \
                 -embedded -no-freetype -no-glib -no-iconv \
                 -qt3support \
                 -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/dbus-1.0 \
@@ -71,6 +79,7 @@ do_configure() {
     if [ ! -e bin/qmake ]; then
         ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
     fi
+    set_arch
     (echo o; echo yes) | CC="${CC}" CXX="${CXX}" ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 072c522..aab9304 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r41"
+INC_PR = "r42"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 468a46f..bc8dea0 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -3,10 +3,6 @@ inherit qmake_base
 DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3 tiff"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 
-require qt4_arch.inc
-QT_ARCH := "${@qt_arch(d)}"
-QT_ENDIAN = "${@qt_endian(d)}"
-
 QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"
 QT_DISTRO_FLAGS_linuxstdbase = "-sm"
 
@@ -196,10 +192,33 @@ FILES_${QT_BASE_NAME}-xmlpatterns-dbg      = "${bindir}/.debug/xmlpatterns*"
 FILES_${QT_BASE_NAME}-qml-plugins          = "${libdir}/${QT_DIR_NAME}/imports/* ${libdir}/${QT_DIR_NAME}/plugins/qmltooling/*"
 FILES_${QT_BASE_NAME}-qml-plugins-dbg      = "${libdir}/${QT_DIR_NAME}/imports/*/*/*/.debug/* ${libdir}/${QT_DIR_NAME}/imports/*/.debug ${libdir}/${QT_DIR_NAME}/plugins/qmltooling/.debug"
 
+ARM_INSTRUCTION_SET = "arm"
+
+set_arch() {
+   case ${TARGET_ARCH} in
+       arm*)     QT_ARCH=arm ;;
+       i*86*)    QT_ARCH=i386 ;;
+       mips*)    QT_ARCH=mips ;;
+       powerpc*) QT_ARCH=powerpc ;;
+       x86_64*)  QT_ARCH=x86_64 ;;
+   esac
+}
+
+set_endian() {
+    if [ ${SITEINFO_ENDIANNESS} = "le" ] ; then
+        QT_ENDIAN="-little-endian"
+    elif [ ${SITEINFO_ENDIANNESS} = "be" ] ; then
+        QT_ENDIAN="-big-endian"
+    fi
+}
+
 do_configure() {
 	unset QMAKESPEC
 	unset QTDIR
 
+    set_arch
+    set_endian
+
 	if [ ! -e bin/qmake ]; then
 		ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
 	fi
diff --git a/meta/recipes-qt/qt4/qt4_arch.inc b/meta/recipes-qt/qt4/qt4_arch.inc
deleted file mode 100644
index bde68dc..0000000
--- a/meta/recipes-qt/qt4/qt4_arch.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-inherit siteinfo
-
-ARM_INSTRUCTION_SET = "arm"
-
-def qt_arch(d):
-    import bb, re
-    arch = d.getVar('TARGET_ARCH', True)
-    if re.match("^i.86$", arch):
-        arch = "i386"
-    elif re.match("^arm.*", arch):
-        arch = "arm"
-    elif arch == "x86_64":
-        arch = "x86"
-    elif arch == "mipsel":
-        arch = "mips"
-    return arch
-
-def qt_endian(d):
-    import bb
-    if d.getVar('SITEINFO_ENDIANNESS', True) == "le":
-        return "-little-endian"
-    elif d.getVar('SITEINFO_ENDIANNESS', True) == "be":
-        return "-big-endian"
-    else:
-        assert False
-- 
1.7.4.1



