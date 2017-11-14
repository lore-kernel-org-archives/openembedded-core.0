Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C09D784B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:57:52 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402183"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:57:52 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:35 +0200
Message-Id: <20171114145754.9643-8-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 08/27] glib-2.0: update to 2.54.2
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
X-List-Received-Date: Tue, 14 Nov 2017 14:57:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LGPL version has been updated from 2.0 to 2.1, adjust the checksums accordingly.

Rebase various patches.

A few tools have been rewritten from perl (or C) to python, so
add a patch that avoids hardcoding the python path in the shebang,
and remove previous patching with sed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...warning-about-deprecated-paths-in-schemas.patch | 25 +++++++-----
 ...t-hardcode-python-path-into-various-tools.patch | 46 ++++++++++++++++++++++
 .../Enable-more-tests-while-cross-compiling.patch  | 30 ++++++++------
 .../glib-2.0/glib-2.0/configure-libtool.patch      | 38 ++++--------------
 .../{glib-2.0_2.52.3.bb => glib-2.0_2.54.2.bb}     |  5 ++-
 meta/recipes-core/glib-2.0/glib.inc                | 16 +++-----
 6 files changed, 95 insertions(+), 65 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.52.3.bb => glib-2.0_2.54.2.bb} (79%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 41a190eddfa..67ca6240bc8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,7 +1,7 @@
-From 41534253b6b61ed4769eb6a3966698a50ee73b71 Mon Sep 17 00:00:00 2001
+From 2acf40361eecd17c6981743dabd06e25a9934258 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
-Subject: [PATCH] Remove the warning about deprecated paths in schemas
+Subject: [PATCH 05/10] Remove the warning about deprecated paths in schemas
 
 Some schemas in gsettings-desktop-schemas (such as proxy and locale)
 are still using deprecated paths, as of 3.16.1. This causes warning
@@ -11,26 +11,33 @@ Upstream-Status: Inappropriate
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- gio/glib-compile-schemas.c | 6 ------
- 1 file changed, 6 deletions(-)
+ gio/glib-compile-schemas.c | 13 -------------
+ 1 file changed, 13 deletions(-)
 
 diff --git a/gio/glib-compile-schemas.c b/gio/glib-compile-schemas.c
-index e42949b..ec79d7c 100644
+index b8de090..130f89b 100644
 --- a/gio/glib-compile-schemas.c
 +++ b/gio/glib-compile-schemas.c
-@@ -1202,12 +1202,6 @@ parse_state_start_schema (ParseState  *state,
+@@ -1219,19 +1219,6 @@ parse_state_start_schema (ParseState  *state,
        return;
      }
  
 -  if (path && (g_str_has_prefix (path, "/apps/") ||
 -               g_str_has_prefix (path, "/desktop/") ||
 -               g_str_has_prefix (path, "/system/")))
--    g_printerr ("warning: Schema '%s' has path '%s'.  Paths starting with "
--                "'/apps/', '/desktop/' or '/system/' are deprecated.\n", id, path);
+-    {
+-      gchar *message = NULL;
+-      message = g_strdup_printf (_("Warning: Schema “%s” has path “%s”.  "
+-                                   "Paths starting with "
+-                                   "“/apps/”, “/desktop/” or “/system/” are deprecated."),
+-                                 id, path);
+-      g_printerr ("%s\n", message);
+-      g_free (message);
+-    }
 -
    state->schema_state = schema_state_new (path, gettext_domain,
                                            extends, extends_name, list_of);
  
 -- 
-2.1.4
+2.14.1
 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
new file mode 100644
index 00000000000..697d63d5feb
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -0,0 +1,46 @@
+From b9160d951b9af647b97766c57295ca4f45cf9521 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 3 Oct 2017 10:45:55 +0300
+Subject: [PATCH 10/10] Do not hardcode python path into various tools
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gio/gdbus-2.0/codegen/gdbus-codegen.in | 2 +-
+ gobject/glib-genmarshal.in             | 2 +-
+ gobject/glib-mkenums.in                | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gio/gdbus-2.0/codegen/gdbus-codegen.in b/gio/gdbus-2.0/codegen/gdbus-codegen.in
+index 8050981..e693ef3 100644
+--- a/gio/gdbus-2.0/codegen/gdbus-codegen.in
++++ b/gio/gdbus-2.0/codegen/gdbus-codegen.in
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env @PYTHON@
++#!/usr/bin/env python3
+ 
+ # GDBus - GLib D-Bus Library
+ #
+diff --git a/gobject/glib-genmarshal.in b/gobject/glib-genmarshal.in
+index 09e8408..b2f9d99 100755
+--- a/gobject/glib-genmarshal.in
++++ b/gobject/glib-genmarshal.in
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env @PYTHON@
++#!/usr/bin/env python3
+ 
+ # pylint: disable=too-many-lines, missing-docstring, invalid-name
+ 
+diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
+index d4bfd11..051fce4 100755
+--- a/gobject/glib-mkenums.in
++++ b/gobject/glib-mkenums.in
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env @PYTHON@
++#!/usr/bin/env python3
+ 
+ # If the code below looks horrible and unpythonic, do not panic.
+ #
+-- 
+2.14.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
index 9b4ded14d58..b98f933dae3 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
@@ -1,7 +1,7 @@
-From 310dfe1bdd16d4b254732fcc202c6211629bc7b6 Mon Sep 17 00:00:00 2001
+From d762907d33b81cf7469b5696c87f2188d2050afb Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Mon, 9 Nov 2015 11:07:27 +0200
-Subject: [PATCH] Enable more tests while cross-compiling
+Subject: [PATCH 06/10] Enable more tests while cross-compiling
 
 Upstream disables a few tests while cross-compiling because their build requires
 running other built binaries. This usually makes sense but in the cross-compile
@@ -9,16 +9,17 @@ case we can depend on glib-2.0-native.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
- gio/tests/Makefile.am     | 8 +++-----
- tests/gobject/Makefile.am | 8 +++-----
- 2 files changed, 6 insertions(+), 10 deletions(-)
+ gio/tests/Makefile.am     | 10 ++++++----
+ tests/gobject/Makefile.am |  8 +++++---
+ 2 files changed, 11 insertions(+), 7 deletions(-)
 
 diff --git a/gio/tests/Makefile.am b/gio/tests/Makefile.am
-index 868873f..533e454 100644
+index acc1da4..9176640 100644
 --- a/gio/tests/Makefile.am
 +++ b/gio/tests/Makefile.am
-@@ -503,10 +503,9 @@ test_programs += \
+@@ -516,10 +516,9 @@ test_programs += \
  endif
  
  # -----------------------------------------------------------------------------
@@ -31,7 +32,7 @@ index 868873f..533e454 100644
  test_programs += resources
  resources_SOURCES = resources.c
  nodist_resources_SOURCES = test_resources.c test_resources2.c test_resources2.h
-@@ -528,7 +527,11 @@ if !ENABLE_INSTALLED_TESTS
+@@ -543,7 +542,11 @@ if !ENABLE_INSTALLED_TESTS
  libresourceplugin_la_LDFLAGS += -rpath /
  endif
  
@@ -41,18 +42,18 @@ index 868873f..533e454 100644
 +glib_compile_resources=glib-compile-resources
 +endif
  
- resources.o: test_resources2.h
- test_resources.c: test2.gresource.xml Makefile $(shell $(glib_compile_resources) --sourcedir=$(srcdir) --generate-dependencies $(srcdir)/test2.gresource.xml)
-@@ -545,7 +548,6 @@ test.gresource: test.gresource.xml Makefile $(shell $(glib_compile_resources) --
+ test-generated.txt: test1.txt
+ 	$(AM_V_GEN) echo "Generated" > $@ && \
+@@ -564,7 +567,6 @@ test.gresource: test.gresource.xml Makefile $(shell $(glib_compile_resources) --
  
  EXTRA_DIST += test.gresource.xml test1.txt test2.gresource.xml test2.txt test3.gresource.xml test3.txt test4.gresource.xml
  CLEANFILES += test-generated.txt test_resources.c test_resources2.[ch] plugin_resources.c test.gresource
 -endif # !CROSS_COMPILING
  
- BUILT_SOURCES += giotypefuncs.c
+ BUILT_SOURCES += giotypefuncs.inc
  
 diff --git a/tests/gobject/Makefile.am b/tests/gobject/Makefile.am
-index 16f2827..4c2208e 100644
+index 656941d..68555ff 100644
 --- a/tests/gobject/Makefile.am
 +++ b/tests/gobject/Makefile.am
 @@ -48,10 +48,13 @@ if ENABLE_TIMELOOP
@@ -79,3 +80,6 @@ index 16f2827..4c2208e 100644
  
  dist-hook: $(BUILT_EXTRA_DIST)
  	files='$(BUILT_EXTRA_DIST)';				\
+-- 
+2.14.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
index aa5de27d125..59b891347da 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
@@ -1,7 +1,7 @@
-From e8740833336c59d6f616a1781b256e648e338c26 Mon Sep 17 00:00:00 2001
+From 1dd1e6ddca5deada049bac2e1ee1fe4ecc5342c5 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 28 Apr 2012 18:24:50 +0200
-Subject: [PATCH] configure: use $host_alias-libtool instead of libtool
+Subject: [PATCH 01/10] configure: use $host_alias-libtool instead of libtool
  directly
 
 Poky renames libtool to $host_alias-libtool.
@@ -18,24 +18,16 @@ Rebased to glib-2.31.20+ by Andre McCurdy <armccurdy@gmail.com>
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
- configure.ac | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1af90c5..f6b7a73 100644
+index 6fa6eb0..b6f78a6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1378,7 +1378,7 @@ if test x"$glib_native_win32" = xyes; then
-   G_MODULE_LDFLAGS=
- else
-   export SED
--  G_MODULE_LDFLAGS=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
-+  G_MODULE_LDFLAGS=`(./$host_alias-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
- fi
- dnl G_MODULE_IMPL= don't reset, so cmd-line can override
- G_MODULE_NEED_USCORE=0
-@@ -1427,13 +1427,13 @@ AS_IF([ test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL" ], [
+@@ -1428,9 +1428,9 @@ AS_IF([ test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL" ], [
  	LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
  dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
  	echo "void glib_plugin_test(void) { }" > plugin.c
@@ -47,20 +39,6 @@ index 1af90c5..f6b7a73 100644
  		${LDFLAGS} -module -o plugin.la -export-dynamic \
  		-shrext ".o" -avoid-version plugin.lo \
  		-rpath /dont/care >/dev/null 2>&1
--	eval `./libtool --config | grep ^objdir`
-+	eval `./$host_alias-libtool --config | grep ^objdir`
- 	AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
- 		glib_cv_rtldglobal_broken,[
- 		AC_TRY_RUN([
-@@ -1506,7 +1506,7 @@ fi
- 
- AC_MSG_CHECKING(for the suffix of module shared libraries)
- export SED
--shrext_cmds=`./libtool --config | grep '^shrext_cmds='`
-+shrext_cmds=`./$host_alias-libtool --config | grep '^shrext_cmds='`
- eval $shrext_cmds
- module=yes eval std_shrext=$shrext_cmds
- # chop the initial dot
 -- 
-1.9.1
+2.14.1
 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb
similarity index 79%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb
index b1fe600992c..60ce1b5f7fb 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.54.2.bb
@@ -15,9 +15,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0001-Test-for-pthread_getname_np-before-using-it.patch \
+           file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "89265d0289a436e99cad54491eb21ef4"
-SRC_URI[sha256sum] = "25ee7635a7c0fcd4ec91cbc3ae07c7f8f5ce621d8183511f414ded09e7e4e128"
+SRC_URI[md5sum] = "50f83e08f080f99b1e2f0ad2b760fb81"
+SRC_URI[sha256sum] = "bb89e5c5aad33169a8c7f28b45671c7899c12f74caf707737f784d7102758e6c"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 8434b7dae38..42ab5f1562d 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -4,11 +4,11 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
 
 # pcre is under BSD;
 # docs/reference/COPYING is with a 'public domai'-like license!
-LICENSE = "LGPLv2+ & BSD & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://glib/glib.h;beginline=4;endline=17;md5=b4f0f4a399c19e5ebb20c31b79d6bc32 \
-                    file://gmodule/COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=b4f0f4a399c19e5ebb20c31b79d6bc32 \
+LICENSE = "LGPLv2.1+ & BSD & PD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
+                    file://gmodule/COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
                     file://glib/pcre/COPYING;md5=266ebc3ff74ee9ce6fad65577667c0f4 \
                     file://glib/pcre/pcre.h;beginline=11;endline=35;md5=de27f2bf633d20a2b7af0b1983423283 \
                     file://docs/reference/COPYING;md5=f51a5100c17af6bae00735cd791e1fcc"
@@ -95,12 +95,6 @@ do_install_append () {
 	rm -f ${D}${datadir}/glib-2.0/codegen/*.pyc
 	rm -f ${D}${datadir}/glib-2.0/codegen/*.pyo
 
-	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-	if [ -f ${D}${bindir}/glib-mkenums ]; then
-		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
-	fi
-
 	if [ -e ${D}${libdir}/charset.alias ]; then
 		rm -f ${D}${libdir}/charset.alias
 	fi
-- 
2.15.0


