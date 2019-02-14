Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id C17FE6C491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 20:05:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2019 12:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,369,1544515200"; d="scan'208";a="275138278"
Received: from sgowda-mobl.amr.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.255.150.227])
	by orsmga004.jf.intel.com with ESMTP; 14 Feb 2019 12:05:27 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 04:05:23 +0800
Message-Id: <20190214200523.14038-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] glib-2.0: upgrade 2.58.0 -> 2.58.3
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
X-List-Received-Date: Thu, 14 Feb 2019 20:05:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* For changes, see:
https://gitlab.gnome.org/GNOME/glib/blob/glib-2-58/NEWS

* Upstreamed patch removed: date-lt.patch

* Tweaked another to remove a hunk trying to find a binary from
glib-2.0-native which isn't needed anymore as the code is in python
now.

* Add locale-base-pl-pl to RDEPENDS for ptest as the fix has been
resolved and merged.

* Remove libdir INSANE_SKIP for ptest package. The only libs present
here are in libexecdir which is allowed by the check.

* Revert an upstream patch for now that had changed the behavior of
pkg-config files to use absolute paths which results in build failures.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...e-absolute-paths-in-pkg-config-files.patch | 64 +++++++++++++++++++
 ...ble-more-tests-while-cross-compiling.patch | 42 ++----------
 .../glib-2.0/glib-2.0/date-lt.patch           | 20 ------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
 ...{glib-2.0_2.58.0.bb => glib-2.0_2.58.3.bb} |  8 +--
 meta/recipes-core/glib-2.0/glib.inc           |  5 +-
 6 files changed, 77 insertions(+), 64 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-absolute-paths-in-pkg-config-files.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/date-lt.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.58.0.bb => glib-2.0_2.58.3.bb} (76%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-absolute-paths-in-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-absolute-paths-in-pkg-config-files.patch
new file mode 100644
index 0000000000..f0c5d84ba7
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-absolute-paths-in-pkg-config-files.patch
@@ -0,0 +1,64 @@
+From abc26aed7a28678dfcc20b21726a97c7c02ea73b Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Thu, 14 Feb 2019 14:55:15 +0800
+Subject: [PATCH] Revert "Use absolute paths in pkg-config files"
+
+This reverts commit e7a7c9b97776fa2a638d18ea3a931ba84e778f80.
+
+The glib pkgconfig files now contain absolute paths, but they're
+target paths so when we used them from a sysroot it fails.  Upstream
+thinks that we should be setting
+GLIB_MKENUMS=/path/to/sysroot/usr/bin/glib-mkenums but that really
+doesn't scale.
+
+For now, we just revert the change to put absolute paths into
+the sysroot. This should be re-evaluated when we move the recipe to use
+meson.
+
+Upstream-Status: Inappropriate [Revert of an upstream commit]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ gio-2.0.pc.in  | 7 +++----
+ glib-2.0.pc.in | 7 +++----
+ 2 files changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/gio-2.0.pc.in b/gio-2.0.pc.in
+index d67e80839..526f0daa0 100644
+--- a/gio-2.0.pc.in
++++ b/gio-2.0.pc.in
+@@ -5,11 +5,10 @@ includedir=@includedir@
+ 
+ datadir=@datadir@
+ schemasdir=${datadir}/glib-2.0/schemas
+-bindir=@bindir@
+ giomoduledir=@GIO_MODULE_DIR@
+-glib_compile_schemas=${bindir}/glib-compile-schemas
+-glib_compile_resources=${bindir}/glib-compile-resources
+-gdbus_codegen=${bindir}/gdbus-codegen
++glib_compile_schemas=glib-compile-schemas
++glib_compile_resources=glib-compile-resources
++gdbus_codegen=gdbus-codegen
+ 
+ Name: GIO
+ Description: glib I/O library
+diff --git a/glib-2.0.pc.in b/glib-2.0.pc.in
+index 3c5ea81dc..275fc0163 100644
+--- a/glib-2.0.pc.in
++++ b/glib-2.0.pc.in
+@@ -3,10 +3,9 @@ exec_prefix=@exec_prefix@
+ libdir=@libdir@
+ includedir=@includedir@
+ 
+-bindir=@bindir@
+-glib_genmarshal=${bindir}/glib-genmarshal
+-gobject_query=${bindir}/gobject-query
+-glib_mkenums=${bindir}/glib-mkenums
++glib_genmarshal=glib-genmarshal
++gobject_query=gobject-query
++glib_mkenums=glib-mkenums
+ 
+ Name: GLib
+ Description: C Utility Library
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
index 50781e7892..5060880926 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 4b1a6d247c78125096a6ea5ab3cab8a1f000dc23 Mon Sep 17 00:00:00 2001
+From 70e462e070f8eb20b7660c1cf88271c0449e43cc Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Mon, 9 Nov 2015 11:07:27 +0200
 Subject: [PATCH] Enable more tests while cross-compiling
@@ -9,17 +9,15 @@ case we can depend on glib-2.0-native.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
 ---
- gio/tests/Makefile.am     | 10 ++++++----
- tests/gobject/Makefile.am |  8 +++++---
- 2 files changed, 11 insertions(+), 7 deletions(-)
+ gio/tests/Makefile.am | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
 
 diff --git a/gio/tests/Makefile.am b/gio/tests/Makefile.am
-index 1f0bed7..8295deb 100644
+index c4e7a92..633e85c 100644
 --- a/gio/tests/Makefile.am
 +++ b/gio/tests/Makefile.am
-@@ -550,10 +550,9 @@ test_programs += \
+@@ -583,10 +583,9 @@ test_programs += \
  endif
  
  # -----------------------------------------------------------------------------
@@ -32,7 +30,7 @@ index 1f0bed7..8295deb 100644
  test_programs += resources
  resources_SOURCES = resources.c
  nodist_resources_SOURCES = test_resources.c test_resources2.c test_resources2.h
-@@ -578,7 +577,11 @@ if !ENABLE_INSTALLED_TESTS
+@@ -611,7 +610,11 @@ if !ENABLE_INSTALLED_TESTS
  libresourceplugin_la_LDFLAGS += -rpath /
  endif
  
@@ -44,7 +42,7 @@ index 1f0bed7..8295deb 100644
  
  test-generated.txt: test1.txt
  	$(AM_V_GEN) echo "Generated" > $@ && \
-@@ -599,7 +602,6 @@ test.gresource: test.gresource.xml Makefile $(shell $(glib_compile_resources) --
+@@ -632,7 +635,6 @@ test.gresource: test.gresource.xml Makefile $(shell $(glib_compile_resources) --
  
  EXTRA_DIST += test.gresource.xml test1.txt test2.gresource.xml test2.txt test3.gresource.xml test3.txt test4.gresource.xml
  CLEANFILES += test-generated.txt test_resources.c test_resources2.[ch] plugin_resources.c test.gresource
@@ -52,29 +50,3 @@ index 1f0bed7..8295deb 100644
  
  BUILT_SOURCES += giotypefuncs.inc
  
-diff --git a/tests/gobject/Makefile.am b/tests/gobject/Makefile.am
-index 0e60987..927d13a 100644
---- a/tests/gobject/Makefile.am
-+++ b/tests/gobject/Makefile.am
-@@ -51,10 +51,13 @@ if ENABLE_TIMELOOP
- installed_test_programs += timeloop-closure
- endif
- 
--# The marshal test requires running a binary, which means we cannot
--# build it when cross-compiling
-+# The marshal test requires running a binary, which means we require
-+# glib-native when cross-compiling
- if !CROSS_COMPILING
- glib_genmarshal=$(top_builddir)/gobject/glib-genmarshal
-+else
-+glib_genmarshal=$(shell which glib-genmarshal)
-+endif
- 
- testmarshal.h: stamp-testmarshal.h
- 	@true
-@@ -71,4 +74,3 @@ testmarshal.c: testmarshal.h testmarshal.list $(glib_genmarshal)
- BUILT_SOURCES += testmarshal.h testmarshal.c
- CLEANFILES += stamp-testmarshal.h testmarshal.h testmarshal.c
- EXTRA_DIST += testcommon.h testmarshal.list
--endif # !CROSS_COMPILING
-\ No newline at end of file
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/date-lt.patch b/meta/recipes-core/glib-2.0/glib-2.0/date-lt.patch
deleted file mode 100644
index dd0aff7281..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/date-lt.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Update Lithuanian month names in the test suite as glibc changed the translations.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/merge_requests/373]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/glib/tests/date.c b/glib/tests/date.c
-index b801ca704..6646c227c 100644
---- a/glib/tests/date.c
-+++ b/glib/tests/date.c
-@@ -365,8 +365,8 @@ test_month_names (void)
-       TEST_DATE ( 1,  4, 2018,      "%Y m. %OB",      "2018 m. balandis");
-       TEST_DATE ( 1,  5, 2018,      "%Y m. %OB",        "2018 m. gegužė");
-       TEST_DATE ( 1,  6, 2018,      "%Y m. %OB",      "2018 m. birželis");
--      TEST_DATE (17,  7, 2018, "%Y m. %b %e d.",     "2018 m. Lie 17 d.");
--      TEST_DATE ( 1,  8, 2018,      "%Y m. %Ob",           "2018 m. Rgp");
-+      TEST_DATE (17,  7, 2018, "%Y m. %b %e d.",   "2018 m. Liep. 17 d.");
-+      TEST_DATE ( 1,  8, 2018,      "%Y m. %Ob",         "2018 m. rugp.");
-     }
-   else
-     g_test_skip ("locale lt_LT not available, skipping Lithuanian month names test");
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index f9794d3dd2..9ec011a095 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 8326961841f4d16c7239e747de11e3817c35cfd2 Mon Sep 17 00:00:00 2001
+From 43967e85b7a87f9c2e780504ef30f4c9bf56f8f5 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
similarity index 76%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
index 1271a7c269..8aad570fa9 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
@@ -8,15 +8,15 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://run-ptest \
            file://uclibc_musl_translation.patch \
-           file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
            file://Enable-more-tests-while-cross-compiling.patch \
+           file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
-           file://date-lt.patch \
+           file://0001-Revert-Use-absolute-paths-in-pkg-config-files.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "9b5d21c802f55bf37171c4fbfe7d32d1"
-SRC_URI[sha256sum] = "c0f4ce0730b4f95c47b711613b5406a887c2ee13ea6d25930d72a4fa7fdb77f6"
+SRC_URI[md5sum] = "8058c7bde846dcffe5fa453eca366d73"
+SRC_URI[sha256sum] = "8f43c31767e88a25da72b52a40f3301fefc49a665b56dc10ee7cc9565cbe7481"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index a868b6df23..c9093cee86 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -142,8 +142,6 @@ RDEPENDS_${PN}-ptest += "\
             shared-mime-info \
            "
 
-# When https://gitlab.gnome.org/GNOME/glib/issues/1343 is
-# fixed add locale-base-pl-pl
 RDEPENDS_${PN}-ptest_append_libc-glibc = "\
             glibc-gconv-utf-16 \
             glibc-charmap-utf-8 \
@@ -167,6 +165,5 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
             locale-base-fr-fr \
             locale-base-es-es \
             locale-base-en-gb \
+            locale-base-pl-pl \
            "
-
-INSANE_SKIP_${PN}-ptest += "libdir"
-- 
2.17.1


