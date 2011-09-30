Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R9g70-00062T-3m
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 18:38:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Sep 2011 09:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="57738546"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.157])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2011 09:33:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:33:18 +0100
Message-Id: <c3a784cb13f0afc0616ae3ed4102271c6dde17af.1317400021.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1317400021.git.paul.eggleton@linux.intel.com>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1317400021.git.paul.eggleton@linux.intel.com>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Fri, 30 Sep 2011 16:38:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Eric Bénard <eric@eukrea.com>

- 4.7.4 was release on the 1st of september, the changelog is available
here : http://qt.gitorious.org/+qt-developers/qt/releases/blobs/v4.7.4/dist/changes-4.7.4
and mostly contains bug fix.

- this patch include the fix for QTBUG-20925 which was a regression
against 4.7.3 : https://bugreports.qt.nokia.com/browse/QTBUG-20925
http://qt.gitorious.org/qt/qt/commit/852abfca6f4c349dce9b895956922f96d82df579
thanks to Paul Eggleton to point us to this bug.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |   62 ++++++++++++++++++
 .../0001-Added-Openembedded-crossarch-option.patch |   47 ++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.4/fix-qtbug-20925.patch |   56 +++++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.4/g++.conf              |   60 ++++++++++++++++++
 .../qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch          |   31 +++++++++
 meta/recipes-qt/qt4/qt-4.7.4/linux.conf            |   66 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |   12 ++++
 meta/recipes-qt/qt4/qt4-native_4.7.4.bb            |   18 +++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |   11 +++
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |   13 ++++
 10 files changed, 376 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4.inc
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-crossarch-option.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/fix-qtbug-20925.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/g++.conf
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/linux.conf
 create mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-native_4.7.4.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb

diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.7.4.inc
new file mode 100644
index 0000000..5c06bbe
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -0,0 +1,62 @@
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
+           file://0008-qt-lib-infix.patch \
+           file://0009-support-2bpp.patch \
+           file://0001-Added-Openembedded-crossarch-option.patch \
+           file://blacklist-diginotar-certs.diff \
+           file://g++.conf \
+           file://linux.conf \
+           file://fix-qtbug-20925.patch \
+           "
+
+SRC_URI[md5sum] = "9831cf1dfa8d0689a06c2c54c5c65aaf"
+SRC_URI[sha256sum] = "97195ebce8a46f9929fb971d9ae58326d011c4d54425389e6e936514f540221e"
+
+S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
+
+FILES_${QT_BASE_NAME}-tools                += "${bindir}/qml"
+
+do_configure_prepend() {
+    for pro in $(find ${S} -name "*.pro") ; do
+        sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $pro
+    done
+
+    sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
+    sed -i \
+    -e /QMAKE_MOC\ /d \
+    -e /QMAKE_UIC\ /d \
+    -e /QMAKE_UIC3\ /d \
+    -e /QMAKE_RCC\ /d \
+    ${S}/configure
+}
+
+do_configure_append() {
+    sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makefile
+}
+
+QT_GLFLAGS ?= ""
+QT_CONFIG_FLAGS += " -xmlpatterns -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAGS}"
+
+do_compile() {
+    # Fixup missing wsegl header in some SGX SDKs
+    if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
+        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/QWSWSEGL/
+    fi
+
+    unset CFLAGS CXXFLAGS
+    install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
+    install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
+    install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
+    install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrelease
+
+    oe_runmake ${EXTRA_ENV}
+}
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-crossarch-option.patch b/meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-crossarch-option.patch
new file mode 100644
index 0000000..f302c5b
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-crossarch-option.patch
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
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/fix-qtbug-20925.patch b/meta/recipes-qt/qt4/qt-4.7.4/fix-qtbug-20925.patch
new file mode 100644
index 0000000..f99b764
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/fix-qtbug-20925.patch
@@ -0,0 +1,56 @@
+From 852abfca6f4c349dce9b895956922f96d82df579 Mon Sep 17 00:00:00 2001
+From: Andrew den Exter <andrew.den-exter@nokia.com>
+Date: Thu, 8 Sep 2011 12:28:49 +1000
+Subject: [PATCH] Fix double click and drag not extending word selection.
+
+mousePressed isn't set on the second press of a double click and so
+can't be used to determine if all selections should be skipped.  Instead
+skip only the single click and drag selections if mousePressed is false.
+
+Change-Id: I5e7ba033f38b0f9b98fdca5c61a8548f92991601
+Task-number: QTBUG-20925
+Reviewed-by: Martin Jones
+
+https://bugreports.qt.nokia.com/browse/QTBUG-20925
+
+Original Author:Andrew den Exter <andrew.den-exter@nokia.com>
+Upstream-Status: Integrated in upcoming versions (4.8) as commit 852abfca6f4c349dce9b895956922f96d82df579
+---
+ src/gui/text/qtextcontrol.cpp          |    7 +----
+ tests/auto/qtextedit/tst_qtextedit.cpp |   41 ++++++++++++++++++++++++++++++++
+ 2 files changed, 43 insertions(+), 5 deletions(-)
+
+diff --git a/src/gui/text/qtextcontrol.cpp b/src/gui/text/qtextcontrol.cpp
+index aacac04..996d488 100644
+--- a/src/gui/text/qtextcontrol.cpp
++++ b/src/gui/text/qtextcontrol.cpp
+@@ -1628,16 +1628,13 @@ void QTextControlPrivate::mouseMoveEvent(QEvent *e, Qt::MouseButton button, cons
+         return;
+     }
+ 
+-    if (!mousePressed)
+-        return;
+-
+     const qreal mouseX = qreal(mousePos.x());
+ 
+     int newCursorPos = q->hitTest(mousePos, Qt::FuzzyHit);
+     if (newCursorPos == -1)
+         return;
+ 
+-    if (wordSelectionEnabled && !selectedWordOnDoubleClick.hasSelection()) {
++    if (mousePressed && wordSelectionEnabled && !selectedWordOnDoubleClick.hasSelection()) {
+         selectedWordOnDoubleClick = cursor;
+         selectedWordOnDoubleClick.select(QTextCursor::WordUnderCursor);
+     }
+@@ -1646,7 +1643,7 @@ void QTextControlPrivate::mouseMoveEvent(QEvent *e, Qt::MouseButton button, cons
+         extendBlockwiseSelection(newCursorPos);
+     else if (selectedWordOnDoubleClick.hasSelection())
+         extendWordwiseSelection(newCursorPos, mouseX);
+-    else
++    else if (mousePressed)
+         setCursorPosition(newCursorPos, QTextCursor::KeepAnchor);
+ 
+     if (interactionFlags & Qt::TextEditable) {
+-- 
+1.6.1
+
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/g++.conf b/meta/recipes-qt/qt4/qt-4.7.4/g++.conf
new file mode 100644
index 0000000..80f925c
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/g++.conf
@@ -0,0 +1,60 @@
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
+QMAKE_LFLAGS_SHLIB	+= -shared
+QMAKE_LFLAGS_PLUGIN	+= $$QMAKE_LFLAGS_SHLIB
+QMAKE_LFLAGS_SONAME	+= -Wl,-soname,
+QMAKE_LFLAGS_THREAD	+=
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
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch b/meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch
new file mode 100644
index 0000000..39c5f4a
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch
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
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/linux.conf b/meta/recipes-qt/qt4/qt-4.7.4/linux.conf
new file mode 100644
index 0000000..a541355
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/linux.conf
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
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
new file mode 100644
index 0000000..9d893f9
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
@@ -0,0 +1,12 @@
+require qt-${PV}.inc
+require qt4-embedded.inc
+
+PR = "${INC_PR}.2"
+
+QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
+
+QT_CONFIG_FLAGS += " \
+ -exceptions \
+"
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-qt/qt4/qt4-native_4.7.4.bb b/meta/recipes-qt/qt4/qt4-native_4.7.4.bb
new file mode 100644
index 0000000..7196c73
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-native_4.7.4.bb
@@ -0,0 +1,18 @@
+require qt4-native.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI += "file://blacklist-diginotar-certs.diff \
+            file://fix-qtbug-20925.patch"
+
+# Find the g++.conf/linux.conf in the right directory.
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
+
+EXTRA_OECONF += " -no-fast -silent -no-rpath"
+
+TOBUILD := "src/tools/bootstrap ${TOBUILD}"
+
+SRC_URI[md5sum] = "9831cf1dfa8d0689a06c2c54c5c65aaf"
+SRC_URI[sha256sum] = "97195ebce8a46f9929fb971d9ae58326d011c4d54425389e6e936514f540221e"
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
new file mode 100644
index 0000000..77e1f36
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
@@ -0,0 +1,11 @@
+require qt4-tools-nativesdk.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://blacklist-diginotar-certs.diff \
+            file://fix-qtbug-20925.patch"
+
+SRC_URI[md5sum] = "9831cf1dfa8d0689a06c2c54c5c65aaf"
+SRC_URI[sha256sum] = "97195ebce8a46f9929fb971d9ae58326d011c4d54425389e6e936514f540221e"
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
new file mode 100644
index 0000000..2f39ec0
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
@@ -0,0 +1,13 @@
+require qt4-x11-free.inc
+require qt-${PV}.inc
+
+PR = "${INC_PR}.2"
+
+QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
+
+QT_CONFIG_FLAGS += " \
+ -no-embedded \
+ -xrandr \
+ -x11"
+
+DEFAULT_PREFERENCE = "-1"
-- 
1.7.4.1



