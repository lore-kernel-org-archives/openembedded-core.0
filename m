Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Ri4je-0007dw-0k
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 14:49:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jan 2012 05:41:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92470662"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.79])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 05:41:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 13:41:33 +0000
Message-Id: <653e4e5b3c3a44cbacd8857961092791110ce2e0.1325597850.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325597850.git.paul.eggleton@linux.intel.com>
References: <cover.1325597850.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325597850.git.paul.eggleton@linux.intel.com>
References: <cover.1325597850.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] qt4: add version 4.8.0
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
X-List-Received-Date: Tue, 03 Jan 2012 13:49:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Version 4.8.0 makes a few minor changes in the internal build system -
the following issues had to be worked around:

* The -qt-gif configure option has been removed. This is actually the
  default and has been for some time, so remove it from qt4.inc.
* The mkspecs have been refactored requiring us to copy our g++.conf
  file over the top of g++-unix.conf instead. Some modifications to this
  file were also necessary to remove some settings that are now in other
  conf files (and we don't modify those values in any case).
* The LD environment variable needs to be unset during configure, or
  else the configure script overrides our value of QMAKE_LINK which
  selects ${CXX} as our linker.
* QMAKE_CXX contains a reference to OE_QMAKE_CXX which the configure
  script does not expect and cannot expand and this results in webkit
  being disabled, so add a workaround for this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt-4.8.0.inc                   |   61 ++++++++++++++++++
 .../0001-Added-Openembedded-crossarch-option.patch |   47 ++++++++++++++
 .../recipes-qt/qt4/qt-4.8.0/fix-translations.patch |   32 ++++++++++
 meta/recipes-qt/qt4/qt-4.8.0/g++.conf              |   56 +++++++++++++++++
 .../qt4/qt-4.8.0/hack-out-pg2-4.7.0.patch          |   31 +++++++++
 meta/recipes-qt/qt4/qt-4.8.0/linux.conf            |   66 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch  |   20 ++++++
 meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb          |   13 ++++
 meta/recipes-qt/qt4/qt4-native.inc                 |   13 +++-
 meta/recipes-qt/qt4/qt4-native_4.8.0.bb            |   14 ++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb   |    8 +++
 meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb          |   13 ++++
 meta/recipes-qt/qt4/qt4.inc                        |   12 +++-
 14 files changed, 382 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0.inc
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/0001-Added-Openembedded-crossarch-option.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/fix-translations.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/g++.conf
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/hack-out-pg2-4.7.0.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/linux.conf
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.0.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb

diff --git a/meta/recipes-qt/qt4/qt-4.8.0.inc b/meta/recipes-qt/qt4/qt-4.8.0.inc
new file mode 100644
index 0000000..2addbb2
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0.inc
@@ -0,0 +1,61 @@
+LICENSE = "LGPLv2.1 | GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
+                    file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
+                    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
+
+FILESPATH =. "${FILE_DIRNAME}/qt-${PV}:"
+
+SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+           file://0004-no-qmake.patch \
+           file://hack-out-pg2-4.7.0.patch \
+           file://0006-freetype-host-includes.patch \
+           file://0009-support-2bpp.patch \
+           file://0001-Added-Openembedded-crossarch-option.patch \
+           file://fix-translations.patch \
+           file://add_nostrip_for_debug_packages.diff \
+           file://qmake_cxx_eval.patch \
+           file://g++.conf \
+           file://linux.conf \
+           "
+
+SRC_URI[md5sum] = "e8a5fdbeba2927c948d9f477a6abe904"
+SRC_URI[sha256sum] = "9392b74e485e15f75a3e07a527547d4f6747eaf55ebce71ba0e863a9fd320b6e"
+
+S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
+
+FILES_${QT_BASE_NAME}-tools_append     = " ${bindir}/qml ${bindir}/qmlplugindump"
+FILES_${QT_BASE_NAME}-tools-dbg_append = " ${bindir}/.debug/qml ${bindir}/.debug/qmlplugindump"
+
+PACKAGES_append = " ${QT_BASE_NAME}-tests-dbg ${QT_BASE_NAME}-tests"
+FILES_${QT_BASE_NAME}-tests-dbg        = "/usr/tests/qt4/*/.debug"
+FILES_${QT_BASE_NAME}-tests            = "/usr/tests/qt4/*"
+
+do_configure_prepend() {
+    for pro in $(find ${S} -name "*.pro") ; do
+        sed -i \
+            -e 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' \
+            -e 's:qtPrepareTool(LRELEASE, lrelease):LRELEASE = ${OE_QMAKE_LRELEASE}:g' $pro
+    done
+
+    sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
+    sed -i \
+    -e /QMAKE_MOC\ /d \
+    -e /QMAKE_UIC\ /d \
+    -e /QMAKE_UIC3\ /d \
+    -e /QMAKE_RCC\ /d \
+    ${S}/configure
+
+    # Avoid problems with Qt 4.8.0 configure setting QMAKE_LINK from LD (since we want the linker to be g++)
+    unset LD
+}
+
+do_compile() {
+    # Fixup missing wsegl header in some SGX SDKs
+    if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
+        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/QWSWSEGL/
+    fi
+
+    unset CFLAGS CXXFLAGS
+
+    oe_runmake ${EXTRA_ENV}
+}
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/0001-Added-Openembedded-crossarch-option.patch b/meta/recipes-qt/qt4/qt-4.8.0/0001-Added-Openembedded-crossarch-option.patch
new file mode 100644
index 0000000..f302c5b
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/0001-Added-Openembedded-crossarch-option.patch
@@ -0,0 +1,47 @@
+From b1ba119f6a824dc01bd42ee00dba4a1653867b72 Mon Sep 17 00:00:00 2001
+From: Matthias Günther <matgnt@gmail.com>
+Date: Wed, 12 May 2010 16:52:45 +0200
+Subject: [PATCH 1/9] Added Openembedded "-crossarch" option
+
+Original Author: Michael Lauer <mickey@vanille-media.de>
+Upstream-Status: Pending
+
+---
+ configure |    7 ++++++-
+ 1 files changed, 6 insertions(+), 1 deletions(-)
+
+diff --git a/configure b/configure
+index facd192..9d15136 100755
+--- a/configure
++++ b/configure
+@@ -954,7 +954,7 @@ while [ "$#" -gt 0 ]; do
+         shift
+         VAL=$1
+         ;;
+-    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config)
++    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-crossarch)
+         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
+         shift
+         VAL="$1"
+@@ -1443,6 +1443,9 @@ while [ "$#" -gt 0 ]; do
+     xplatform)
+         XPLATFORM="$VAL"
+         ;;
++	crossarch)
++		CROSSARCH="$VAL"
++		;;
+     debug-and-release)
+         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
+             CFG_DEBUG_RELEASE="$VAL"
+@@ -2918,6 +2921,8 @@ elif [ "$PLATFORM_MAC" = "yes" ] || [ -z "$CFG_ARCH" ]; then
+     CFG_ARCH=$CFG_HOST_ARCH
+ fi
+ 
++CFG_ARCH="$CROSSARCH"
++
+ if [ -d "$relpath/src/corelib/arch/$CFG_ARCH" ]; then
+     if [ "$OPT_VERBOSE" = "yes" ]; then
+         echo "    '$CFG_ARCH' is supported"
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/fix-translations.patch b/meta/recipes-qt/qt4/qt-4.8.0/fix-translations.patch
new file mode 100644
index 0000000..906d4e3
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/fix-translations.patch
@@ -0,0 +1,32 @@
+fix phony translation linking error
+
+  | .../usr/lib/crt1.o: In function `_start':
+  | .../../sysdeps/i386/elf/start.S:115: undefined reference to `main'
+  | collect2: ld returned 1 exit status
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff --git a/translations/translations.pro b/translations/translations.pro
+index cdaf04a..24fa668 100644
+--- a/translations/translations.pro
++++ b/translations/translations.pro
+@@ -20,7 +20,7 @@ updateqm.name = LRELEASE ${QMAKE_FILE_IN}
+ updateqm.CONFIG += no_link
+ QMAKE_EXTRA_COMPILERS += updateqm
+ 
+-isEmpty(vcproj) {
++!isEmpty(vcproj) {
+     QMAKE_LINK = @: IGNORE THIS LINE
+     OBJECTS_DIR =
+     win32:CONFIG -= embed_manifest_exe
+@@ -30,7 +30,7 @@ isEmpty(vcproj) {
+     phony_src.input = PHONY_DEPS
+     phony_src.output = phony.c
+     phony_src.variable_out = GENERATED_SOURCES
+-    phony_src.commands = echo int main() { return 0; } > phony.c
++    phony_src.commands = echo \"int main() { return 0; }\" > phony.c
+     phony_src.name = CREATE phony.c
+     phony_src.CONFIG += combine
+     QMAKE_EXTRA_COMPILERS += phony_src
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/g++.conf b/meta/recipes-qt/qt4/qt-4.8.0/g++.conf
new file mode 100644
index 0000000..e58fb15
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/g++.conf
@@ -0,0 +1,56 @@
+#
+# qmake configuration for common gcc
+#
+
+QMAKE_CC       = $(OE_QMAKE_CC)
+QMAKE_CFLAGS       += -pipe $(OE_QMAKE_CFLAGS)
+QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $(OE_QMAKE_CFLAGS)
+QMAKE_CFLAGS_DEPS	+= -M
+QMAKE_CFLAGS_WARN_ON	+= -Wall -W
+QMAKE_CFLAGS_WARN_OFF	+= -w
+QMAKE_CFLAGS_RELEASE	+=
+QMAKE_CFLAGS_DEBUG	+= -g
+QMAKE_CFLAGS_SHLIB	+= -fPIC
+QMAKE_CFLAGS_STATIC_LIB	+= -fPIC
+QMAKE_CFLAGS_YACC	+= -Wno-unused -Wno-parentheses
+QMAKE_CFLAGS_HIDESYMS   += -fvisibility=hidden
+QMAKE_CFLAGS_PRECOMPILE += -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
+QMAKE_CFLAGS_USE_PRECOMPILE += -include ${QMAKE_PCH_OUTPUT_BASE}
+
+QMAKE_CXX      = $(OE_QMAKE_CXX)
+QMAKE_CXXFLAGS     += $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS)
+QMAKE_CXXFLAGS_DEPS	+= $$QMAKE_CFLAGS_DEPS
+QMAKE_CXXFLAGS_WARN_ON	+= $$QMAKE_CFLAGS_WARN_ON
+QMAKE_CXXFLAGS_WARN_OFF	+= $$QMAKE_CFLAGS_WARN_OFF
+QMAKE_CXXFLAGS_RELEASE	+= $$QMAKE_CFLAGS_RELEASE
+QMAKE_CXXFLAGS_RELEASE_WITH_DEBUGINFO += $$QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO
+QMAKE_CXXFLAGS_DEBUG	+= $$QMAKE_CFLAGS_DEBUG
+QMAKE_CXXFLAGS_SHLIB	+= $$QMAKE_CFLAGS_SHLIB
+QMAKE_CXXFLAGS_STATIC_LIB += $$QMAKE_CFLAGS_STATIC_LIB
+QMAKE_CXXFLAGS_YACC	+= $$QMAKE_CFLAGS_YACC
+QMAKE_CXXFLAGS_HIDESYMS += $$QMAKE_CFLAGS_HIDESYMS -fvisibility-inlines-hidden
+QMAKE_CXXFLAGS_PRECOMPILE += -x c++-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
+QMAKE_CXXFLAGS_USE_PRECOMPILE = $$QMAKE_CFLAGS_USE_PRECOMPILE
+
+QMAKE_LINK     = $(OE_QMAKE_LINK)
+QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
+QMAKE_LINK_C		= $(OE_QMAKE_LINK)
+QMAKE_LINK_C_SHLIB	= $(OE_QMAKE_LINK)
+QMAKE_LFLAGS       += $(OE_QMAKE_LDFLAGS)
+QMAKE_LFLAGS_RELEASE	+=
+QMAKE_LFLAGS_DEBUG	+=
+QMAKE_LFLAGS_APP	+=
+QMAKE_LFLAGS_NOUNDEF	+= -Wl,--no-undefined
+QMAKE_LFLAGS_RPATH        = -Wl,-rpath-link,
+
+QMAKE_PCH_OUTPUT_EXT    = .gch
+
+# -Bsymbolic-functions (ld) support
+QMAKE_LFLAGS_BSYMBOLIC_FUNC = -Wl,-Bsymbolic-functions
+QMAKE_LFLAGS_DYNAMIC_LIST = -Wl,--dynamic-list,
+
+# some linking helper...
+CONFIG += rpath_libdirs
+
+# for the SDK
+isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/hack-out-pg2-4.7.0.patch b/meta/recipes-qt/qt4/qt-4.8.0/hack-out-pg2-4.7.0.patch
new file mode 100644
index 0000000..39c5f4a
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/hack-out-pg2-4.7.0.patch
@@ -0,0 +1,31 @@
+Hack to not use the pg_config of the host system which will add /usr/include
+
+pg_config is a native binary so using that when cross compiling
+will always fail.  The commented out fix would do, but for OE
+our -platform and -xplatform is the same so we are actually not
+really cross compiling. Just comment out the test, we are passing
+the location to the postgres headers and if they are okay we
+will pad.
+
+Original Author: Holger Hans Peter Freyther <zecke@selfish.org>
+Upstream-Status: Inappropriate [configuration]
+
+Index: qt-everywhere-opensource-src-4.7.0/configure
+===================================================================
+--- qt-everywhere-opensource-src-4.7.0.orig/configure	2010-09-22 15:43:51.191162141 -0400
++++ qt-everywhere-opensource-src-4.7.0/configure	2010-09-22 15:44:35.179981232 -0400
+@@ -4921,10 +4921,10 @@
+         psql)
+             if [ "$CFG_SQL_psql" != "no" ]; then
+                 # Be careful not to use native pg_config when cross building.
+-                if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
+-                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
+-                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
+-                fi
++#                if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
++#                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
++#                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
++#                fi
+                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
+                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
+                 # But, respect PSQL_LIBS if set
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/linux.conf b/meta/recipes-qt/qt4/qt-4.8.0/linux.conf
new file mode 100644
index 0000000..a541355
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/linux.conf
@@ -0,0 +1,66 @@
+#
+# qmake configuration for common linux
+#
+
+QMAKE_CFLAGS_THREAD	+= -D_REENTRANT
+QMAKE_CXXFLAGS_THREAD	+= $$QMAKE_CFLAGS_THREAD
+
+QMAKE_INCDIR          =
+QMAKE_LIBDIR          =
+QMAKE_INCDIR_X11      =
+QMAKE_LIBDIR_X11      =
+QMAKE_INCDIR_QT       = $(OE_QMAKE_INCDIR_QT)
+QMAKE_LIBDIR_QT       = $(OE_QMAKE_LIBDIR_QT)
+QMAKE_INCDIR_OPENGL   =
+QMAKE_LIBDIR_OPENGL   =
+QMAKE_INCDIR_OPENGL_ES1 = $$QMAKE_INCDIR_OPENGL
+QMAKE_LIBDIR_OPENGL_ES1 = $$QMAKE_LIBDIR_OPENGL
+QMAKE_INCDIR_OPENGL_ES2 = $$QMAKE_INCDIR_OPENGL
+QMAKE_LIBDIR_OPENGL_ES2 = $$QMAKE_LIBDIR_OPENGL
+QMAKE_INCDIR_EGL      =
+QMAKE_LIBDIR_EGL      =
+QMAKE_INCDIR_OPENVG   =
+QMAKE_LIBDIR_OPENVG   =
+
+
+QMAKE_LIBS            =
+QMAKE_LIBS_DYNLOAD    = -ldl
+QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
+QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
+QMAKE_LIBS_NIS        = -lnsl
+QMAKE_LIBS_EGL        = -lEGL
+QMAKE_LIBS_OPENGL     = -lGLU -lGL
+QMAKE_LIBS_OPENGL_QT  = -lGL
+QMAKE_LIBS_OPENGL_ES1 = -lGLES_CM
+QMAKE_LIBS_OPENGL_ES2 = -lGLESv2
+QMAKE_LIBS_OPENVG     = -lOpenVG
+QMAKE_LIBS_THREAD     = -lpthread
+
+QMAKE_MOC             = $(OE_QMAKE_MOC)
+QMAKE_UIC             = $(OE_QMAKE_UIC)
+QMAKE_UIC3            = $(OE_QMAKE_UIC3)
+QMAKE_RCC             = $(OE_QMAKE_RCC)
+QMAKE_QDBUSCPP2XML    = $(OE_QMAKE_QDBUSCPP2XML)
+QMAKE_QDBUSXML2CPP    = $(OE_QMAKE_QDBUSXML2CPP)
+
+QMAKE_AR              = $(OE_QMAKE_AR) cqs
+QMAKE_OBJCOPY         = objcopy
+QMAKE_RANLIB          =
+
+QMAKE_TAR             = tar -cf
+QMAKE_GZIP            = gzip -9f
+
+QMAKE_COPY            = cp -f
+QMAKE_COPY_FILE       = $(COPY)
+QMAKE_COPY_DIR        = $(COPY) -r
+QMAKE_MOVE            = mv -f
+QMAKE_DEL_FILE        = rm -f
+QMAKE_DEL_DIR         = rmdir
+QMAKE_STRIP           = $(OE_QMAKE_STRIP)
+QMAKE_STRIPFLAGS_LIB += --strip-unneeded
+QMAKE_CHK_DIR_EXISTS  = test -d
+QMAKE_MKDIR           = mkdir -p
+QMAKE_INSTALL_FILE    = install -m 644 -p
+QMAKE_INSTALL_PROGRAM = install -m 755 -p
+
+include(unix.conf)
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch b/meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch
new file mode 100644
index 0000000..a82f0ff
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch
@@ -0,0 +1,20 @@
+Allow expansion of $(...) references in QMAKE_CXX (currently its value
+is $(OE_QMAKE_CXX)) in order to allow compiler version check to succeed
+which allows WebKit to be enabled.
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Index: qt-everywhere-opensource-src-4.8.0/configure
+===================================================================
+--- qt-everywhere-opensource-src-4.8.0.orig/configure
++++ qt-everywhere-opensource-src-4.8.0/configure
+@@ -3322,7 +3322,8 @@ else
+     CFG_FRAMEWORK=no
+ fi
+ 
+-QMAKE_CONF_COMPILER=`getQMakeConf "$XQMAKESPEC" | grep "^QMAKE_CXX[^_A-Z0-9]" | sed "s,.* *= *\(.*\)$,\1," | tail -1`
++QMAKE_CONF_COMPILER=`getQMakeConf "$XQMAKESPEC" | grep "^QMAKE_CXX[^_A-Z0-9]" | sed "s,.* *= *\(.*\)$,\1," | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg' | tail -1`
++QMAKE_CONF_COMPILER=`eval "echo $QMAKE_CONF_COMPILER"`
+ TEST_COMPILER="$CXX"
+ 
+ [ -z "$TEST_COMPILER" ] && TEST_COMPILER=$QMAKE_CONF_COMPILER
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb
new file mode 100644
index 0000000..5c1c97e
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb
@@ -0,0 +1,13 @@
+require qt-${PV}.inc
+require qt4-embedded.inc
+
+PR = "${INC_PR}.0"
+
+DEFAULT_PREFERENCE = "-1"
+
+QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+
+QT_CONFIG_FLAGS += " \
+ -exceptions \
+"
+
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 8a6eb4b..86f2440 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -22,7 +22,7 @@ S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 EXTRA_OECONF = "-prefix ${prefix} \
                 -L ${STAGING_LIBDIR_NATIVE} \
                 -I ${STAGING_INCDIR_NATIVE} \
-                -qt-libjpeg -qt-gif -system-zlib \
+                -qt-libjpeg -system-zlib \
                 -no-libjpeg -no-libpng -no-libmng -no-libtiff \
                 -no-accessibility \
                 -no-cups \
@@ -39,6 +39,9 @@ EXTRA_OECONF = "-prefix ${prefix} \
 EXTRA_OEMAKE = " "
 
 do_configure() {
+	# Avoid problems with Qt 4.8.0 configure setting QMAKE_LINK from LD (since we want the linker to be g++)
+	unset LD
+
 	(echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
 
@@ -78,7 +81,13 @@ do_install() {
 	install -d ${D}${datadir}/qt4/
 	cp -PfR mkspecs ${D}${datadir}/qt4/
 	ln -sf linux-g++ ${D}${datadir}/qt4/mkspecs/${BUILD_OS}-oe-g++
-	cp -f ${WORKDIR}/g++.conf ${WORKDIR}/linux.conf ${D}${datadir}/qt4/mkspecs/common/
+	if [ -f ${D}${datadir}/qt4/mkspecs/common/g++-unix.conf ] ; then
+		# mkspecs were refactored for 4.8.0
+		cp -f ${WORKDIR}/g++.conf ${D}${datadir}/qt4/mkspecs/common/g++-unix.conf
+	else
+		cp -f ${WORKDIR}/g++.conf ${D}${datadir}/qt4/mkspecs/common/g++.conf
+	fi
+	cp -f ${WORKDIR}/linux.conf ${D}${datadir}/qt4/mkspecs/common/
 
 	install -m 0644 tools/porting/src/q3porting.xml ${D}${datadir}/qt4/
 
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.0.bb b/meta/recipes-qt/qt4/qt4-native_4.8.0.bb
new file mode 100644
index 0000000..86c0500
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-native_4.8.0.bb
@@ -0,0 +1,14 @@
+require qt4-native.inc
+
+PR = "${INC_PR}.0"
+
+DEFAULT_PREFERENCE = "-1"
+
+# Find the g++.conf/linux.conf in the right directory.
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
+
+TOBUILD := "src/tools/bootstrap ${TOBUILD}"
+
+SRC_URI[md5sum] = "e8a5fdbeba2927c948d9f477a6abe904"
+SRC_URI[sha256sum] = "9392b74e485e15f75a3e07a527547d4f6747eaf55ebce71ba0e863a9fd320b6e"
+
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index a71c3ae..275fdcc 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -30,7 +30,7 @@ require qt4_arch.inc
 
 # FIXME: make it work with "${STAGING_BINDIR_NATIVE}/pkg-config --cflags dbus-1"
 EXTRA_OECONF = "-prefix ${prefix} \
-                -qt-libjpeg -qt-gif -system-zlib \
+                -qt-libjpeg -system-zlib \
                 -no-libjpeg -no-libpng -no-libmng -no-libtiff \
                 -no-accessibility \
                 -no-cups \
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
new file mode 100644
index 0000000..e615d36
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
@@ -0,0 +1,8 @@
+require qt4-tools-nativesdk.inc
+
+PR = "${INC_PR}.0"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI[md5sum] = "e8a5fdbeba2927c948d9f477a6abe904"
+SRC_URI[sha256sum] = "9392b74e485e15f75a3e07a527547d4f6747eaf55ebce71ba0e863a9fd320b6e"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
new file mode 100644
index 0000000..edd3e0e
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
@@ -0,0 +1,13 @@
+require qt4-x11-free.inc
+require qt-${PV}.inc
+
+PR = "${INC_PR}.0"
+
+DEFAULT_PREFERENCE = "-1"
+
+QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+
+QT_CONFIG_FLAGS += " \
+ -no-embedded \
+ -xrandr \
+ -x11"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 87a12e6..ea868ff 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -15,7 +15,7 @@ QT_GLFLAGS ?= ""
 
 QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
                     -shared -no-nas-sound -no-nis \
-                    -qt-gif -system-libjpeg -system-libpng -system-zlib \
+                    -system-libjpeg -system-libpng -system-zlib \
                     -no-pch -qdbus -stl -glib -phonon -webkit \
                     -xmlpatterns -no-rpath -qt3support -silent \
                     ${QT_SQL_DRIVER_FLAGS} \
@@ -160,7 +160,7 @@ FILES_${QT_BASE_NAME}-fonts-ttf-vera       = "${libdir}/fonts/Vera*.ttf"
 FILES_${QT_BASE_NAME}-fonts-ttf-dejavu     = "${libdir}/fonts/DejaVu*.ttf"
 FILES_${QT_BASE_NAME}-fonts-pfa            = "${libdir}/fonts/*.pfa"
 FILES_${QT_BASE_NAME}-fonts-pfb            = "${libdir}/fonts/*.pfb"
-FILES_${QT_BASE_NAME}-fonts-qpf            = "${libdir}/fonts/*.qpf"
+FILES_${QT_BASE_NAME}-fonts-qpf            = "${libdir}/fonts/*.qpf*"
 FILES_${QT_BASE_NAME}-fonts                = "${libdir}/fonts/README ${libdir}/fonts/fontdir"
 FILES_${QT_BASE_NAME}-linguist             = "${bindir}/*linguist* ${bindir}/lrelease ${bindir}/lupdate ${bindir}/lconvert ${bindir}/qm2ts"
 FILES_${QT_BASE_NAME}-linguist-dbg         = "${bindir}/.debug/*linguist* ${bindir}/.debug/lrelease ${bindir}/.debug/lupdate ${bindir}/.debug/lconvert ${bindir}/.debug/qm2ts"
@@ -190,7 +190,13 @@ do_configure() {
 		ln -sf linux-g++ mkspecs/${TARGET_OS}-oe-g++
 	fi
 
-	cp -f ${WORKDIR}/g++.conf ${WORKDIR}/linux.conf mkspecs/common/
+	if [ -f mkspecs/common/g++-unix.conf ] ; then
+		# mkspecs were refactored for 4.8.0
+		cp -f ${WORKDIR}/g++.conf mkspecs/common/g++-unix.conf
+	else
+		cp -f ${WORKDIR}/g++.conf mkspecs/common/g++.conf
+	fi
+	cp -f ${WORKDIR}/linux.conf mkspecs/common/
 
 	echo "[Paths]"                                 > $QT_CONF_PATH
 	echo "Prefix=${prefix}/"                      >> $QT_CONF_PATH
-- 
1.7.5.4



