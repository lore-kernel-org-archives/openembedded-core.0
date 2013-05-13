Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ubn8l-0001Xf-AY
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 09:25:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 May 2013 00:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,659,1363158000"; d="scan'208";a="301532870"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.117])
	by azsmga001.ch.intel.com with ESMTP; 13 May 2013 00:07:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 00:07:31 -0700
Message-Id: <1368428851-29843-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] pkgconfig: Update to 0.28
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 07:26:02 -0000

Remove older patches that have been fixed upstream, added new patch to
use the correct alias-libtool instead of ./libtool.

pkgconfig provides an internal glib library, so use it to avoid ciruclar
dependecny issues.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../pkgconfig-0.25/obsolete_automake_macros.patch  | 35 ----------------
 .../autofoo.patch                                  |  0
 .../fix-glib-configure-libtool-usage.patch         | 45 ++++++++++++++++++++
 .../glibconfig-sysdefs.h                           |  0
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |  6 +--
 .../pkgconfig/pkgconfig/disable-legacy.patch       | 48 ----------------------
 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb  | 13 ------
 meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb  | 10 +++++
 8 files changed, 58 insertions(+), 99 deletions(-)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.25/obsolete_automake_macros.patch
 rename meta/recipes-devtools/pkgconfig/{pkgconfig-0.25 => pkgconfig-0.28}/autofoo.patch (100%)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.28/fix-glib-configure-libtool-usage.patch
 rename meta/recipes-devtools/pkgconfig/{pkgconfig-0.25 => pkgconfig-0.28}/glibconfig-sysdefs.h (100%)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/obsolete_automake_macros.patch b/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/obsolete_automake_macros.patch
deleted file mode 100644
index b6e7f62..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Backport [fixed in 0.27]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd pkg-config-0.25/configure.in pkg-config-0.25/configure.in
---- pkg-config-0.25/configure.in	2010-05-28 18:55:09.000000000 +0300
-+++ pkg-config-0.25/configure.in	2013-01-01 22:13:47.009573426 +0200
-@@ -4,7 +4,7 @@
- AM_INIT_AUTOMAKE(pkg-config, 0.25)
- AM_MAINTAINER_MODE
-
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- AM_PROG_LIBTOOL
-
-diff -Nurd pkg-config-0.25/glib-1.2.10/configure.in pkg-config-0.25/glib-1.2.10/configure.in
---- pkg-config-0.25/glib-1.2.10/configure.in	2009-12-06 22:43:59.000000000 +0200
-+++ pkg-config-0.25/glib-1.2.10/configure.in	2013-01-01 22:23:36.701560486 +0200
-@@ -63,7 +63,7 @@
- AM_INIT_AUTOMAKE($PACKAGE, $VERSION, no-define)
-
- # Specify a configuration file
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- AC_DEFINE_UNQUOTED(GLIB_MAJOR_VERSION, $GLIB_MAJOR_VERSION)
- AC_DEFINE_UNQUOTED(GLIB_MINOR_VERSION, $GLIB_MINOR_VERSION)
-@@ -154,7 +154,6 @@
-
- # Checks for programs.
- AC_PROG_CC
--AM_PROG_CC_STDC
- AC_PROG_INSTALL
-
- changequote(,)dnl
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/autofoo.patch b/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/autofoo.patch
similarity index 100%
rename from meta/recipes-devtools/pkgconfig/pkgconfig-0.25/autofoo.patch
rename to meta/recipes-devtools/pkgconfig/pkgconfig-0.28/autofoo.patch
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/fix-glib-configure-libtool-usage.patch b/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/fix-glib-configure-libtool-usage.patch
new file mode 100644
index 0000000..9bee438
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/fix-glib-configure-libtool-usage.patch
@@ -0,0 +1,45 @@
+
+Upstream-Status: Inapropriate [embedded specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+
+Index: pkg-config-0.28/glib/configure.ac
+===================================================================
+--- pkg-config-0.28.orig/glib/configure.ac
++++ pkg-config-0.28/glib/configure.ac
+@@ -1438,7 +1438,7 @@ if test x"$glib_native_win32" = xyes; th
+   G_MODULE_LDFLAGS=
+ else
+   export SED
+-  G_MODULE_LDFLAGS=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
++  G_MODULE_LDFLAGS=`(./${host_alias}-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
+ fi
+ dnl G_MODULE_IMPL= don't reset, so cmd-line can override
+ G_MODULE_NEED_USCORE=0
+@@ -1503,13 +1503,13 @@ if test "$G_MODULE_IMPL" = "G_MODULE_IMP
+ 	LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
+ dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
+ 	echo "void glib_plugin_test(void) { }" > plugin.c
+-	${SHELL} ./libtool --mode=compile --tag=CC ${CC} ${CFLAGS} \
++	${SHELL} ./${host_alias}-libtool --mode=compile --tag=CC ${CC} ${CFLAGS} \
+ 		${CPPFLAGS} -c -o plugin.lo plugin.c >/dev/null 2>&1
+-	${SHELL} ./libtool --mode=link --tag=CC ${CC} ${CFLAGS} \
++	${SHELL} ./${host_alias}-libtool --mode=link --tag=CC ${CC} ${CFLAGS} \
+ 		${LDFLAGS} -module -o plugin.la -export-dynamic \
+ 		-shrext ".o" -avoid-version plugin.lo \
+ 		-rpath /dont/care >/dev/null 2>&1
+-	eval `./libtool --config | grep ^objdir`
++	eval `./${host_alias}-libtool --config | grep ^objdir`
+ 	AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
+ 		glib_cv_rtldglobal_broken,[
+ 		AC_TRY_RUN([
+@@ -1582,7 +1582,7 @@ fi
+ 
+ AC_MSG_CHECKING(for the suffix of module shared libraries)
+ export SED
+-shrext_cmds=`./libtool --config | grep '^shrext_cmds='`
++shrext_cmds=`./${host_alias}-libtool --config | grep '^shrext_cmds='`
+ eval $shrext_cmds
+ module=yes eval std_shrext=$shrext_cmds
+ # chop the initial dot
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/glibconfig-sysdefs.h b/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/glibconfig-sysdefs.h
similarity index 100%
rename from meta/recipes-devtools/pkgconfig/pkgconfig-0.25/glibconfig-sysdefs.h
rename to meta/recipes-devtools/pkgconfig/pkgconfig-0.28/glibconfig-sysdefs.h
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
index 52b9ad1..3e655a9 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
@@ -18,9 +18,9 @@ S = "${WORKDIR}/pkg-config-${PV}/"
 
 inherit autotools
 
-EXTRA_OECONF = "--with-installed-glib --with-installed-popt --disable-legacy-scripts"
-EXTRA_OECONF_class-native = "--disable-legacy-scripts"
-EXTRA_OECONF_class-nativesdk = "--disable-legacy-scripts"
+EXTRA_OECONF = "--with-installed-glib --with-installed-popt --disable-legacy-scripts --with-internal-glib"
+EXTRA_OECONF_class-native = "--disable-legacy-scripts --with-internal-glib"
+EXTRA_OECONF_class-nativesdk = "--disable-legacy-scripts --with-internal-glib"
 
 acpaths = "-I ."
 do_configure_prepend () {
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch
deleted file mode 100644
index 30db36c..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-On an Fedora host with glib-config installed pkgconfig-native can get into a
-horrible state with recursive calls between pkg-config and glib-config.
-The patch adds a configure time option to disable legacy script support in
-pkgconfig with the --disable-legacy-scripts option, to maintain compatibility
-the default is to leave the scripts enabled.
-
-JL - 22/06/10
-Index: pkg-config-0.25/configure.in
-===================================================================
---- pkg-config-0.25.orig/configure.in	2011-10-05 18:52:24.879726050 +0100
-+++ pkg-config-0.25/configure.in	2011-10-05 18:55:39.639726152 +0100
-@@ -151,6 +151,18 @@
- AC_SUBST([POPT_LIBS])
- AM_CONDITIONAL([USE_INSTALLED_POPT], [test "x$with_installed_popt" = xyes])
- 
-+# legacy *-configure scripts can cause headaches, add option to disable
-+AC_ARG_ENABLE(legacy-scripts,
-+        [AC_HELP_STRING([--enable-legacy-scripts=@<:@no/yes@:>@],
-+                        [Whether pkg-config will try and use legacy scripts such as glib-config and gnome-config @<:@default=yes@:>@])],
-+        [],
-+        [enable_legacy=yes])
-+AM_CONDITIONAL([NO_LEGACY_SCRIPTS], [test x$enable_legacy != xyes])
-+if test x$enable_legacy != xyes; then
-+  AC_DEFINE(NO_LEGACY_SCRIPTS, 1, [We are not using legacy scripts])
-+fi
-+
-+
- AC_FUNC_ALLOCA
- 
- AC_CHECK_FUNCS(setresuid setreuid,break)
-Index: pkg-config-0.25/parse.c
-===================================================================
---- pkg-config-0.25.orig/parse.c	2011-10-05 18:52:24.869726050 +0100
-+++ pkg-config-0.25/parse.c	2011-10-05 18:54:49.909726133 +0100
-@@ -1237,6 +1237,11 @@
-    * messages.
-    */
-   return NULL;
-+#elif defined(NO_LEGACY_SCRIPTS)
-+  /* There are scenarios where we might not want to use these legacy
-+   * scripts even if they are available.
-+   */
-+  return NULL;
- #else
- 
-   Package *pkg;
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
deleted file mode 100644
index a55d017..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require pkgconfig.inc
-
-PR = "r7"
-
-SRC_URI += "file://autofoo.patch \
-            file://glibconfig-sysdefs.h \
-            file://pkg-config-native.in \
-            file://disable-legacy.patch \
-            file://obsolete_automake_macros.patch \
-           "
-
-SRC_URI[md5sum] = "a3270bab3f4b69b7dc6dbdacbcae9745"
-SRC_URI[sha256sum] = "3ba691ee2431f32ccb8efa131e59bf23e37f122dc66791309023ca6dcefcd10e"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
new file mode 100644
index 0000000..99bb47f
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
@@ -0,0 +1,10 @@
+require pkgconfig.inc
+
+SRC_URI += " \
+            file://glibconfig-sysdefs.h \
+            file://pkg-config-native.in \
+            file://fix-glib-configure-libtool-usage.patch \
+           "
+
+SRC_URI[md5sum] = "aa3c86e67551adc3ac865160e34a2a0d"
+SRC_URI[sha256sum] = "6b6eb31c6ec4421174578652c7e141fdaae2dabad1021f420d8713206ac1f845"
-- 
1.8.0.2



