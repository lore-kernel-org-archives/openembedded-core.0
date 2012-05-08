Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SRdBh-0001Rt-Qb
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 07:42:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 May 2012 22:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="138066395"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2012 22:32:07 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 13:28:30 +0800
Message-Id: <ad81aeddba7ac9bbd855e92304dafab2a811b523.1336454749.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1336454749.git.dongxiao.xu@intel.com>
References: <cover.1336454749.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1336454749.git.dongxiao.xu@intel.com>
References: <cover.1336454749.git.dongxiao.xu@intel.com>
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
X-List-Received-Date: Tue, 08 May 2012 05:42:18 -0000

In qt4's do_configure operation, it will refer to some variables that
are derived from 'd', however these variable values may be not correct
in multilib case since the extraction of these variables happens before
the multilib handler.

The fix is to move these python style functions back to shell style.

This fixes [YOCTO #2355]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc        |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |    5 ++-
 meta/recipes-qt/qt4/qt4-x11-free.inc        |    2 +-
 meta/recipes-qt/qt4/qt4.inc                 |    5 ++-
 meta/recipes-qt/qt4/qt4_arch.inc            |   36 ++++++++++++---------------
 5 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 0b304a0..05803d1 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r45"
+INC_PR = "r46"
 
 QT_BASE_LIB  ?= "libqt-embedded"
 
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index efb61bf..a1dd8df 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
@@ -40,7 +40,7 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -verbose -release -fast -static \
                 -platform ${TARGET_OS}-oe-g++ \
                 -xplatform ${TARGET_OS}-oe-g++ \
-                -arch ${@qt_arch(d)} \
+                -arch ${QT_ARCH} \
                 -embedded -no-freetype -no-glib -no-iconv \
                 -qt3support \
                 -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/dbus-1.0 \
@@ -71,6 +71,7 @@ do_configure() {
     if [ ! -e bin/qmake ]; then
         ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
     fi
+    set_arch
     (echo o; echo yes) | CC="${CC}" CXX="${CXX}" ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index da98962..29bbfc6 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r43"
+INC_PR = "r44"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 468a46f..4bc6070 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -4,8 +4,6 @@ DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gst
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 
 require qt4_arch.inc
-QT_ARCH := "${@qt_arch(d)}"
-QT_ENDIAN = "${@qt_endian(d)}"
 
 QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"
 QT_DISTRO_FLAGS_linuxstdbase = "-sm"
@@ -200,6 +198,9 @@ do_configure() {
 	unset QMAKESPEC
 	unset QTDIR
 
+    set_arch
+    set_endian
+
 	if [ ! -e bin/qmake ]; then
 		ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
 	fi
diff --git a/meta/recipes-qt/qt4/qt4_arch.inc b/meta/recipes-qt/qt4/qt4_arch.inc
index bde68dc..c1d35ab 100644
--- a/meta/recipes-qt/qt4/qt4_arch.inc
+++ b/meta/recipes-qt/qt4/qt4_arch.inc
@@ -2,24 +2,20 @@ inherit siteinfo
 
 ARM_INSTRUCTION_SET = "arm"
 
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
+set_arch() {
+   case ${TARGET_ARCH} in
+       arm*)     QT_ARCH=arm ;;
+       i*86*)    QT_ARCH=i386 ;;
+       mips*)    QT_ARCH=mips ;;
+       powerpc*) QT_ARCH=powerpc ;;
+       x86_64*)  QT_ARCH=x86_64 ;;
+   esac
+}
 
-def qt_endian(d):
-    import bb
-    if d.getVar('SITEINFO_ENDIANNESS', True) == "le":
-        return "-little-endian"
-    elif d.getVar('SITEINFO_ENDIANNESS', True) == "be":
-        return "-big-endian"
-    else:
-        assert False
+set_endian() {
+    if [ ${SITEINFO_ENDIANNESS} = "le" ] ; then
+        QT_ENDIAN="-little-endian"
+    elif [ ${SITEINFO_ENDIANNESS} = "be" ] ; then
+        QT_ENDIAN="-big-endian"
+    fi
+}
-- 
1.7.4.1



