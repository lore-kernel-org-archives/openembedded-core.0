Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 141B360797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 13:22:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2016 06:22:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="977873409"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2016 06:22:52 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 16:22:38 +0300
Message-Id: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463404035.git.jussi.kukkonen@intel.com>
References: <cover.1463404035.git.jussi.kukkonen@intel.com>
Subject: [PATCH 01/13] glib-2.0: Upgrade 2.46.2 -> 2.48.1
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
X-List-Received-Date: Mon, 16 May 2016 13:22:53 -0000

* Remove now unnecessary readlink patches and
  ignore-format-nonliteral-warning.patch
* Port relocate-modules.patch
* Add ${datadir}/gettext/its to FILES_${PN}-dev: this could be done in
  gettext.bbclass but so far glib is the first and only ITS rule
  installer

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...c-Do-not-use-readlink-when-cross-compilin.patch | 31 ----------
 .../glib-2.0/glib-2.0-configure-readlink.patch     | 29 ----------
 .../ignore-format-nonliteral-warning.patch         | 39 -------------
 .../glib-2.0/glib-2.0/relocate-modules.patch       | 66 +++++++++++-----------
 .../{glib-2.0_2.46.2.bb => glib-2.0_2.48.1.bb}     |  7 +--
 meta/recipes-core/glib-2.0/glib.inc                |  3 +-
 6 files changed, 36 insertions(+), 139 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-2.0-configure-readlink.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ignore-format-nonliteral-warning.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.46.2.bb => glib-2.0_2.48.1.bb} (73%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch
deleted file mode 100644
index 0be3631..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-commit 9b38d507ec37b3d7d4df6095fa7ed16b47d399f7
-Author: Drew Moseley <drew_moseley@mentor.com>
-Date:   Sat Mar 29 21:10:43 2014 -0400
-
-    configure.ac: Do not use readlink when cross compiling.
-
-    Do not use readlink to set ABS_GLIB_RUNTIME_LIBDIR when cross
-    compiling.  Doing so causes host paths to potentially pollute
-    the target.
-
-    Note that in this case the path is not converted to absolute if
-    it contains any ".." references so it's not completely correct.
-
-    Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=727575]
-    Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
-
-diff -rub glib-2.38.2.orig/configure.ac glib-2.38.2/configure.ac
---- glib-2.38.2.orig/configure.ac	2014-04-03 20:17:13.035567143 -0400
-+++ glib-2.38.2/configure.ac	2014-04-03 20:19:07.071566057 -0400
-@@ -275,7 +275,11 @@
-            [],
- 	   [with_runtime_libdir=""])
- GLIB_RUNTIME_LIBDIR="$with_runtime_libdir"
-+AS_IF([ test $cross_compiling = yes ], [
-+ABS_GLIB_RUNTIME_LIBDIR="$libdir/$with_runtime_libdir"
-+], [
- ABS_GLIB_RUNTIME_LIBDIR="`readlink -m $libdir/$with_runtime_libdir`"
-+])
- AC_SUBST(GLIB_RUNTIME_LIBDIR)
- AC_SUBST(ABS_GLIB_RUNTIME_LIBDIR)
- AM_CONDITIONAL(HAVE_GLIB_RUNTIME_LIBDIR, [test "x$with_runtime_libdir" != "x"])
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0-configure-readlink.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0-configure-readlink.patch
deleted file mode 100644
index 9759d11..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0-configure-readlink.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-configure.ac: change readlink -f to -m
-
-Change "readlink -f" to "readlink -m" since $libdir/$with_runtime_libdir
-may not exist.
-
-This patch should go to the upstream, I will send it sooner.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -271,7 +271,7 @@ AC_ARG_WITH(runtime-libdir,
-            [],
- 	   [with_runtime_libdir=""])
- GLIB_RUNTIME_LIBDIR="$with_runtime_libdir"
--ABS_GLIB_RUNTIME_LIBDIR="`readlink -f $libdir/$with_runtime_libdir`"
-+ABS_GLIB_RUNTIME_LIBDIR="`readlink -m $libdir/$with_runtime_libdir`"
- AC_SUBST(GLIB_RUNTIME_LIBDIR)
- AC_SUBST(ABS_GLIB_RUNTIME_LIBDIR)
- AM_CONDITIONAL(HAVE_GLIB_RUNTIME_LIBDIR, [test "x$with_runtime_libdir" != "x"])
--- 
-1.8.1.2
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/ignore-format-nonliteral-warning.patch b/meta/recipes-core/glib-2.0/glib-2.0/ignore-format-nonliteral-warning.patch
deleted file mode 100644
index d533975..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/ignore-format-nonliteral-warning.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 8cdbc7fb2c8c876902e457abe46ee18a0b134486 Mon Sep 17 00:00:00 2001
-From: coypu <coypu@sdf.org>
-Date: Wed, 2 Mar 2016 19:38:48 +0200
-Subject: gdate: Move warning pragma outside of function
-
-Commit 0817af40e8c74c721c30f6ef482b1f53d12044c7 breaks the build on
-older versions of GCC, which don't allow pragma inside functions.
-
-https://bugzilla.gnome.org/761550
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- glib/gdate.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/glib/gdate.c b/glib/gdate.c
-index cdc735c..92c34d2 100644
---- a/glib/gdate.c
-+++ b/glib/gdate.c
-@@ -2439,6 +2439,9 @@ win32_strftime_helper (const GDate     *d,
-  *
-  * Returns: number of characters written to the buffer, or 0 the buffer was too small
-  */
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
-+
- gsize     
- g_date_strftime (gchar       *s, 
-                  gsize        slen, 
-@@ -2552,3 +2552,5 @@ g_date_strftime (gchar       *s,
-   return retval;
- #endif
- }
-+
-+#pragma GCC diagnostic pop
--- 
-cgit v0.12
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index f9e3f3d..65d5b43 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -6,44 +6,42 @@ This solves relocation problems with GIOModule for native builds of glib.
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+Port patch to 2.48
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ gio/giomodule.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 56c498c..a2e32b7 100644
+index da7c167..cc0bc7c 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -47,6 +47,27 @@
- #include "gdesktopappinfo.h"
+@@ -40,6 +40,8 @@
+ #include "gnetworkmonitor.h"
+ #ifdef G_OS_WIN32
+ #include "gregistrysettingsbackend.h"
++#else
++#include <dlfcn.h>
  #endif
+ #include <glib/gstdio.h>
  
-+#include <dlfcn.h>
-+
-+/*
-+ * Generate a GIO module directory based on where glib is installed
-+ */
-+static const char *
-+_get_gio_module_dir (void)
-+{
-+  Dl_info info;
-+
-+  if (dladdr (g_io_module_new, &info)) {
-+    char *libdir = g_path_get_dirname (info.dli_fname);
-+    char *dir = g_build_filename (libdir, "gio", "modules", NULL);
-+    g_free (libdir);
-+    return dir;
-+  } else {
-+    return GIO_MODULE_DIR;
-+  }
-+}
-+
+@@ -1036,7 +1038,15 @@ get_gio_module_dir (void)
+ #endif
+       g_free (install_dir);
+ #else
+-      module_dir = g_strdup (GIO_MODULE_DIR);
++      Dl_info info;
 +
- /**
-  * SECTION:giomodule
-  * @short_description: Loadable GIO Modules
-@@ -1057,7 +1078,7 @@ _g_io_modules_ensure_loaded (void)
-       /* Then load the compiled in path */
-       module_dir = g_getenv ("GIO_MODULE_DIR");
-       if (module_dir == NULL)
--        module_dir = GIO_MODULE_DIR;
-+        module_dir = _get_gio_module_dir ();
- 
-       g_io_modules_scan_all_in_directory_with_scope (module_dir, scope);
++      if (dladdr (g_io_module_new, &info)) {
++        char *libdir = g_path_get_dirname (info.dli_fname);
++        module_dir = g_build_filename (libdir, "gio", "modules", NULL);
++        g_free (libdir);
++      } else {
++        module_dir = g_strdup (GIO_MODULE_DIR);
++      }
+ #endif
+     }
  
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.48.1.bb
similarity index 73%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.48.1.bb
index 9e95149..ef96ca1 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.48.1.bb
@@ -7,17 +7,14 @@ SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://fix-conflicting-rand.patch \
-           file://glib-2.0-configure-readlink.patch \
            file://run-ptest \
            file://ptest-paths.patch \
            file://uclibc_musl_translation.patch \
-           file://0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch \
            file://allow-run-media-sdX-drive-mount-if-username-root.patch \
            file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
            file://Enable-more-tests-while-cross-compiling.patch \
            file://gi-exclude.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
-           file://ignore-format-nonliteral-warning.patch \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0002-tests-Ignore-y2k-warnings.patch \
            "
@@ -25,5 +22,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch \
                                 file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "7f815d6e46df68e070cb421ed7f1139e"
-SRC_URI[sha256sum] = "5031722e37036719c1a09163cc6cf7c326e4c4f1f1e074b433c156862bd733db"
+SRC_URI[md5sum] = "67bd3b75c9f6d5587b457dc01cdcd5bb"
+SRC_URI[sha256sum] = "74411bff489cb2a3527bac743a51018841a56a4d896cc1e0d0d54f8166a14612"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index e764fad..ddf5e40 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -59,7 +59,8 @@ FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${bindir}/glib-mkenums \
                     ${bindir}/glib-compile-resources \
                     ${datadir}/glib-2.0/gettext/po/Makefile.in.in \
-                    ${datadir}/glib-2.0/schemas/gschema.dtd"
+                    ${datadir}/glib-2.0/schemas/gschema.dtd \
+                    ${datadir}/gettext/its"
 FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb"
 FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py \
                        ${bindir}/gdbus-codegen"
-- 
2.1.4


