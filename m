Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CDCCB77141
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 12:41:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 04:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,265,1444719600"; d="scan'208";a="596861445"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 04:41:01 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 14:44:00 +0200
Message-Id: <32fd71f16d65e21a1d662ac381784ad59fb9fc6a.1447072488.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
References: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447072488.git.jussi.kukkonen@intel.com>
References: <cover.1447072488.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 3/8] glib-2.0: Enable more tests while cross-compiling
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
X-List-Received-Date: Mon, 09 Nov 2015 12:41:12 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../Enable-more-tests-while-cross-compiling.patch  | 79 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb      |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
new file mode 100644
index 0000000..011e094
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
@@ -0,0 +1,79 @@
+From 310dfe1bdd16d4b254732fcc202c6211629bc7b6 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 9 Nov 2015 11:07:27 +0200
+Subject: [PATCH] Enable more tests while cross-compiling
+
+Upstream disables a few tests while cross-compiling because their build
+requires running other built binaries. This usually makes sense but we
+have a native glib already built: enable these tests.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ gio/tests/Makefile.am     | 8 +++-----
+ tests/gobject/Makefile.am | 8 +++-----
+ 2 files changed, 6 insertions(+), 10 deletions(-)
+
+diff --git a/gio/tests/Makefile.am b/gio/tests/Makefile.am
+index 9fa0e11..6bb9e01 100644
+--- a/gio/tests/Makefile.am
++++ b/gio/tests/Makefile.am
+@@ -502,10 +502,9 @@ test_programs += \
+ endif
+ 
+ # -----------------------------------------------------------------------------
+-#  The resources test is a bit more complicated, and we cannot build it when
+-#  cross-compiling GIO because it requires running a binary...
++#  The resources test is a bit more complicated, and requires glib-native
++#  for running a binary
+ 
+-if !CROSS_COMPILING
+ test_programs += resources
+ resources_SOURCES = resources.c
+ nodist_resources_SOURCES = test_resources.c test_resources2.c test_resources2.h
+@@ -529,7 +528,7 @@ if !ENABLE_INSTALLED_TESTS
+ libresourceplugin_la_LDFLAGS += -rpath /
+ endif
+ 
+-glib_compile_resources=$(top_builddir)/gio/glib-compile-resources
++glib_compile_resources=glib-compile-resources
+ 
+ resources.o: test_resources2.h
+ test_resources.c: test2.gresource.xml Makefile $(shell $(glib_compile_resources) --sourcedir=$(srcdir) --generate-dependencies $(srcdir)/test2.gresource.xml)
+@@ -546,7 +545,6 @@ test.gresource: test.gresource.xml Makefile $(shell $(glib_compile_resources) --
+ 
+ EXTRA_DIST += test.gresource.xml test1.txt test2.gresource.xml test2.txt test3.gresource.xml test3.txt test4.gresource.xml
+ CLEANFILES += test_resources.c test_resources2.[ch] plugin_resources.c test.gresource
+-endif # !CROSS_COMPILING
+ 
+ BUILT_SOURCES += giotypefuncs.c
+ 
+diff --git a/tests/gobject/Makefile.am b/tests/gobject/Makefile.am
+index 16f2827..8246ae8 100644
+--- a/tests/gobject/Makefile.am
++++ b/tests/gobject/Makefile.am
+@@ -48,10 +48,9 @@ if ENABLE_TIMELOOP
+ installed_test_programs += timeloop-closure
+ endif
+ 
+-# The marshal test requires running a binary, which means we cannot
+-# build it when cross-compiling
+-if !CROSS_COMPILING
+-glib_genmarshal=$(top_builddir)/gobject/glib-genmarshal
++# The marshal test requires running a binary, which means we require
++# glib-native when cross-compiling
++glib_genmarshal=$(shell which glib-genmarshal)
+ 
+ testmarshal.h: stamp-testmarshal.h
+ 	@true
+@@ -69,7 +68,6 @@ BUILT_SOURCES += testmarshal.h testmarshal.c
+ CLEANFILES += stamp-testmarshal.h
+ EXTRA_DIST += testcommon.h testmarshal.list
+ BUILT_EXTRA_DIST += testmarshal.h testmarshal.c
+-endif # !CROSS_COMPILING
+ 
+ dist-hook: $(BUILT_EXTRA_DIST)
+ 	files='$(BUILT_EXTRA_DIST)';				\
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb
index 22fd34a..04951f4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://allow-run-media-sdX-drive-mount-if-username-root.patch \
 	   file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
 	   file://0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch \
+           file://Enable-more-tests-while-cross-compiling.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-- 
2.1.4


