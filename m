Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQQC2-0001VX-WC
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:05:23 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2011 12:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,517,1315206000"; d="scan'208";a="37410733"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Nov 2011 12:58:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 12:58:47 -0800
Message-Id: <541a6b483a1f1cdd28c6e602812b9b6d63b05b9d.1321389699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/16] gobject-introspection: update frome meta-oe
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
X-List-Received-Date: Tue, 15 Nov 2011 21:05:23 -0000

From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

OE-Core uses very old version of gobject-introspection. The recipe says
0.10.8, but in reality it's GOBJECT_INTROSPECTION_0_6_3-41-gefa7266.
That version e.g. doesn't compile with python 2.7 (default in some
versions), etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../gnome/gobject-introspection/configure.patch    |   27 ----------------
 .../gnome/gobject-introspection/pathfix.patch      |   27 ----------------
 .../use-usr-bin-env-for-python.patch               |   20 ++++++++++++
 .../gnome/gobject-introspection_git.bb             |   32 +++++++++++--------
 4 files changed, 38 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gobject-introspection/configure.patch
 delete mode 100644 meta/recipes-gnome/gnome/gobject-introspection/pathfix.patch
 create mode 100644 meta/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch

diff --git a/meta/recipes-gnome/gnome/gobject-introspection/configure.patch b/meta/recipes-gnome/gnome/gobject-introspection/configure.patch
deleted file mode 100644
index 5dcd9b0..0000000
--- a/meta/recipes-gnome/gnome/gobject-introspection/configure.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/common.mk
-===================================================================
---- git.orig/common.mk	2009-08-19 11:11:26.000000000 +0100
-+++ git/common.mk	2009-08-19 11:12:05.000000000 +0100
-@@ -4,7 +4,7 @@
- 	UNINSTALLED_INTROSPECTION_SRCDIR=$(top_srcdir) \
- 	UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir)
- SCANNER_ARGS = -v --add-include-path=$(top_builddir)/gir --add-include-path=.
--SCANNER = $(AM_V_GEN) env LPATH=.libs $(CHECK_DEBUG) $(SCANNER_ENV) $(SCANNER_BIN) $(SCANNER_ARGS)
-+SCANNER = $(AM_V_GEN) env LPATH=.libs $(CHECK_DEBUG) $(SCANNER_ENV) g-ir-scanner $(SCANNER_ARGS)
- SCANNER_LIBS = \
- 	$(top_srcdir)/giscanner/*.py \
- 	$(top_builddir)/giscanner/libgiscanner.la \
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2009-08-19 11:11:26.000000000 +0100
-+++ git/configure.ac	2009-08-19 11:11:28.000000000 +0100
-@@ -201,7 +201,6 @@
- 	pyexecdir=`echo $pyexecdir | tr '\\\\' '/'`
- 	;;
- esac
--AM_CHECK_PYTHON_HEADERS(,AC_MSG_ERROR([Python headers not found]))
- 
- AC_CONFIG_FILES([
- Makefile
diff --git a/meta/recipes-gnome/gnome/gobject-introspection/pathfix.patch b/meta/recipes-gnome/gnome/gobject-introspection/pathfix.patch
deleted file mode 100644
index a96e4b1..0000000
--- a/meta/recipes-gnome/gnome/gobject-introspection/pathfix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Pending
-
-Index: git/giscanner/dumper.py
-===================================================================
---- git.orig/giscanner/dumper.py	2010-11-29 15:14:35.000000000 -0800
-+++ git/giscanner/dumper.py	2010-11-29 15:14:57.115747154 -0800
-@@ -82,7 +82,7 @@
-         self._tmpdir = tempfile.mkdtemp('', 'tmp-introspect', dir=os.getcwd())
- 
-         self._compiler_cmd = os.environ.get('CC', 'gcc')
--        self._linker_cmd = os.environ.get('LD', self._compiler_cmd)
-+        self._linker_cmd = os.environ.get('CCLD', self._compiler_cmd)
-         self._pkgconfig_cmd = os.environ.get('PKG_CONFIG', 'pkg-config')
- 
-         self._uninst_srcdir = os.environ.get(
-Index: git/giscanner/scannermain.py
-===================================================================
---- git.orig/giscanner/scannermain.py	2010-11-29 15:14:35.000000000 -0800
-+++ git/giscanner/scannermain.py	2010-11-29 15:14:57.120747321 -0800
-@@ -283,6 +283,7 @@
-     shown_include_warning = False
-     for include in options.includes:
-         if os.sep in include:
-+            continue
-             raise ValueError("Invalid include path %r" % (include, ))
-         include_obj = Include.from_string(include)
-         transformer.register_include(include_obj)
diff --git a/meta/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch b/meta/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch
new file mode 100644
index 0000000..67b8547
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch
@@ -0,0 +1,20 @@
+Index: gobject-introspection-0.9.10/tools/g-ir-annotation-tool.in
+===================================================================
+--- gobject-introspection-0.9.10.orig/tools/g-ir-annotation-tool.in
++++ gobject-introspection-0.9.10/tools/g-ir-annotation-tool.in
+@@ -1,4 +1,4 @@
+-#!@PYTHON@
++#!/usr/bin/env python
+ # -*- Mode: Python -*-
+ # GObject-Introspection - a framework for introspecting GObject libraries
+ # Copyright (C) 2008  Johan Dahlin
+Index: gobject-introspection-0.9.10/tools/g-ir-scanner.in
+===================================================================
+--- gobject-introspection-0.9.10.orig/tools/g-ir-scanner.in
++++ gobject-introspection-0.9.10/tools/g-ir-scanner.in
+@@ -1,4 +1,4 @@
+-#!@PYTHON@
++#!/usr/bin/env python
+ # -*- Mode: Python -*-
+ # GObject-Introspection - a framework for introspecting GObject libraries
+ # Copyright (C) 2008  Johan Dahlin
diff --git a/meta/recipes-gnome/gnome/gobject-introspection_git.bb b/meta/recipes-gnome/gnome/gobject-introspection_git.bb
index 5e37255..8352384 100644
--- a/meta/recipes-gnome/gnome/gobject-introspection_git.bb
+++ b/meta/recipes-gnome/gnome/gobject-introspection_git.bb
@@ -1,29 +1,33 @@
-SRC_URI = "git://git.gnome.org/gobject-introspection;protocol=git \
-           file://configure.patch \
-           file://pathfix.patch"
+# NOTE: WIP! This recipe does not cross-compile atm., only -native
+DEPENDS = "glib-2.0 libffi python-native gobject-introspection-native"
+DEPENDS_virtclass-native = "glib-2.0-native libffi-native python-native bison-native flex-native"
+BBCLASSEXTEND = "native"
 
-SRC_URI_virtclass-native = "git://git.gnome.org/gobject-introspection;protocol=git \
-                            file://pathfix.patch"
+SRC_URI = "git://git.gnome.org/gobject-introspection;protocol=git \
+  file://use-usr-bin-env-for-python.patch \
+"
 
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING.tools;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.lib;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-SRCREV = "efa7266bcf78478ce62e8dd778a4f0417bfd4d15"
-PV = "0.10.8+git${SRCPV}"
-PR = "r4"
+SRCREV = "8d64bc23d2b837421ecf9c7b0e4b8d5d95ca0d21"
+PV = "1.29.0+gitr${SRCPV}"
+DEFAULT_PREFERENCE = "-1"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libffi python-native gobject-introspection-native"
-DEPENDS_virtclass-native = "libffi-native python-native bison-native flex-native"
-
 inherit autotools
 
-TARGET_CFLAGS += "-I${STAGING_INCDIR_NATIVE}/python2.5"
+BBCLASSEXTEND = "native"
 
 do_configure_prepend () {
-	echo "EXTRA_DIST = " > ${S}/gtk-doc.make
+        echo "EXTRA_DIST = " > ${S}/gtk-doc.make
 }
 
-BBCLASSEXTEND = "native"
+EXTRA_OECONF = "\
+  --disable-gtk-doc \
+  --disable-gtk-doc-html \
+  --disable-gtk-doc-pdf \
+  --disable-tests \
+"
-- 
1.7.6.4



