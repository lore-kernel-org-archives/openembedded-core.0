Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B79BD771CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 01:48:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174773"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:48 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:55 +0300
Message-Id: <2495e40521f7c8ec920c922cbaa9fd4a6fded1f6.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 37/37] gtk-engines: Remove as unused
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:50 -0000

gtk-engines is no longer used by any theme in oe-core

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gtk-engines/gtk-engines-2.20.2/glib-2.32.patch | 23 ---------
 .../gtk-engines-2.20.2/substitute-tests.patch      | 37 ---------------
 .../gtk-engines/gtk-engines_2.20.2.bb              | 55 ----------------------
 3 files changed, 115 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch
 delete mode 100644 meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/substitute-tests.patch
 delete mode 100644 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb

diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch b/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch
deleted file mode 100644
index f0b878d..0000000
--- a/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 8d49a386f467cbf8e0842d2218126f643e50f834 Mon Sep 17 00:00:00 2001
-From: Dominique Leuenberger <dimstar@opensuse.org>
-Date: Sun, 27 Nov 2011 14:24:57 +0000
-Subject: Fix build with glib 2.31: Only glib.h can be #include'd. Fixes bug #664914
-
-Upstream-Status: Backport
-
----
-diff --git a/engines/clearlooks/src/animation.c b/engines/clearlooks/src/animation.c
-index 1f7a41f..56a9286 100644
---- a/engines/clearlooks/src/animation.c
-+++ b/engines/clearlooks/src/animation.c
-@@ -28,7 +28,7 @@
- #include "animation.h"
- 
- #ifdef HAVE_WORKING_ANIMATION
--#include <glib/gtimer.h>
-+#include <glib.h>
- 
- struct _AnimationInfo {
- 	GTimer *timer;
---
-cgit v0.9.0.2
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/substitute-tests.patch b/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/substitute-tests.patch
deleted file mode 100644
index 5c557ba..0000000
--- a/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/substitute-tests.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd gtk-engines-2.20.2/configure.ac gtk-engines-2.20.2/configure.ac
---- gtk-engines-2.20.2/configure.ac	2010-10-01 15:42:37.000000000 +0300
-+++ gtk-engines-2.20.2/configure.ac	2013-08-20 02:50:27.930510565 +0300
-@@ -166,6 +166,9 @@
-
- AC_SUBST(DEVELOPMENT_CFLAGS)
-
-+AC_SUBST([exported_symbols_tests], [[$(EXPORTED_SYMBOLS_TESTS)]])
-+AC_SUBST([torture_test_tests], [[$(TORTURE_TEST_TESTS)]])
-+
- AM_CONFIG_HEADER([engines/support/config.h])
-
- AC_CONFIG_FILES([
-diff -Nurd gtk-engines-2.20.2/test/Makefile.am gtk-engines-2.20.2/test/Makefile.am
---- gtk-engines-2.20.2/test/Makefile.am	2010-09-19 18:18:21.000000000 +0300
-+++ gtk-engines-2.20.2/test/Makefile.am	2013-08-20 02:50:36.842510865 +0300
-@@ -66,7 +66,7 @@
- # Prefix with exported_
- EXPORTED_SYMBOLS_TESTS = $(patsubst %,exported_%,$(BUILD_ENGINES))
-
--TESTS += $(EXPORTED_SYMBOLS_TESTS)
-+TESTS += @exported_symbols_tests@
-
-
- #############################################################
-@@ -88,7 +88,7 @@
- TORTURE_TEST_TESTS = torture_buildin $(patsubst %,torture_%,$(TORTURE_TEST_ENGINES))
-
- # Add TORTURE_TEST_ENGINES to list of tests
--TESTS += $(TORTURE_TEST_TESTS)
-+TESTS += @torture_test_tests@
-
- # Possible other tests:
- #  - An extensive theme switch tests that loads/unloads the engine
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
deleted file mode 100644
index c0ac911..0000000
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY = "GTK+ theme engines"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-SECTION = "x11/base"
-DEPENDS = "intltool-native gtk+ gettext-native"
-
-PR = "r3"
-
-PACKAGES += "${PN}-schemas"
-PACKAGES_DYNAMIC += "^gtk-engine-.* ^gtk-theme-.*"
-
-RDEPENDS_gtk-theme-redmond = "gtk-engine-redmond95"
-RDEPENDS_gtk-theme-metal = "gtk-engine-metal"
-RDEPENDS_gtk-theme-mist = "gtk-engine-mist"
-RDEPENDS_gtk-theme-crux = "gtk-engine-crux-engine"
-RDEPENDS_gtk-theme-lighthouseblue = "gtk-engine-lighthouseblue"
-RDEPENDS_gtk-theme-thinice = "gtk-engine-thinice"
-RDEPENDS_gtk-theme-industrial = "gtk-engine-industrial"
-RDEPENDS_gtk-theme-clearlooks = "gtk-engine-clearlooks"
-
-FILES_${PN} = ""
-FILES_${PN}-dev += "${libdir}/gtk-2.0/*/engines/*.la"
-FILES_${PN}-schemas = "${datadir}/gtk-engines/*.xml"
-
-CFLAGS_prepend = "-DHAVE_ANIMATION "
-
-RDEPENDS_${PN}-dev = ""
-
-inherit gnomebase
-GNOME_COMPRESS_TYPE="bz2"
-
-inherit distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-# This picks stable releases in the 2.x series (but not 2.90 onwards,
-# which were GNOME 3 betas).
-UPSTREAM_CHECK_REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
-
-python populate_packages_prepend() {
-    engines_root = os.path.join(d.getVar('libdir', True), "gtk-2.0/2.10.0/engines")
-    themes_root = os.path.join(d.getVar('datadir', True), "themes")
-
-    do_split_packages(d, engines_root, '^lib(.*)\.so$', 'gtk-engine-%s', 'GTK %s theme engine', extra_depends='')
-    do_split_packages(d, themes_root, '(.*)', 'gtk-theme-%s', 'GTK theme %s', allow_dirs=True, extra_depends='')
-    # TODO: mark theme packages as arch all
-}
-
-SRC_URI += "file://glib-2.32.patch \
-            file://substitute-tests.patch"
-SRC_URI[archive.md5sum] = "5deb287bc6075dc21812130604c7dc4f"
-SRC_URI[archive.sha256sum] = "15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5"
-- 
2.1.4


