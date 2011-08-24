Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/QUzK7hn0j6HM0hiOFdHiYf8zHomjHQAw=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qw5mS-00025O-31
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 07:13:36 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7O58ob5000714
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 00:08:51 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2011 00:08:50 -0500
Message-Id: <1314162530-4606-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH v2] gcc-4.6: Drop gcc-poison-parameters.patch as its not need
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
X-List-Received-Date: Wed, 24 Aug 2011 05:13:36 -0000

The gcc-poison-parameters was added specifically to deal with an issue
on ppc targets and a bug when we build with -Os -frename-registers.

This bug below reports the issue and is fixed in gcc-4.6.x:

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44618

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
* v2: add changse to recipe (forgot to git-add them ;)

 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 .../gcc/gcc-4.6/gcc-poison-parameters.patch        |   76 --------------------
 2 files changed, 1 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-parameters.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 0a148b4..2f1ae81 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r7"
+PR = "r8"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -62,7 +62,6 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://64bithack.patch \
 	   file://optional_libstdc.patch \
 	   file://disable_relax_pic_calls_flag.patch \
-	   file://gcc-poison-parameters.patch \
 	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
 	   file://COLLECT_GCC_OPTIONS.patch \
            file://volatile_access_backport.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-parameters.patch b/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-parameters.patch
deleted file mode 100644
index 58bf32f..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-parameters.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Upstream-Status: Pending
-
-gcc: add poison parameters detection
-
-Add the logic that, if not configured with "--enable-target-optspace",
-gcc will meet error when build target app with "-Os" option.
-This could avoid potential binary crash.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-Index: gcc-4.6.0/gcc/config.in
-===================================================================
---- gcc-4.6.0.orig/gcc/config.in
-+++ gcc-4.6.0/gcc/config.in
-@@ -150,6 +150,12 @@
- #endif
- 
- 
-+/* Define to enable target optspace support. */
-+#ifndef USED_FOR_TARGET
-+#undef ENABLE_TARGET_OPTSPACE
-+#endif
-+
-+
- /* Define if you want all operations on RTL (the basic data structure of the
-    optimizer and back end) to be checked for dynamic type safety at runtime.
-    This is quite expensive. */
-Index: gcc-4.6.0/gcc/configure
-===================================================================
---- gcc-4.6.0.orig/gcc/configure
-+++ gcc-4.6.0/gcc/configure
-@@ -26434,6 +26434,13 @@ $as_echo "#define ENABLE_LIBQUADMATH_SUP
- fi
- 
- 
-+if test x"$enable_target_optspace" != x; then :
-+
-+$as_echo "#define ENABLE_TARGET_OPTSPACE 1" >>confdefs.h
-+
-+fi
-+
-+
- # Configure the subdirectories
- # AC_CONFIG_SUBDIRS($subdirs)
- 
-Index: gcc-4.6.0/gcc/configure.ac
-===================================================================
---- gcc-4.6.0.orig/gcc/configure.ac
-+++ gcc-4.6.0/gcc/configure.ac
-@@ -4907,6 +4907,11 @@ if test "${ENABLE_LIBQUADMATH_SUPPORT}"
- fi
- 
- 
-+AC_SUBST(enable_target_optspace)
-+if test x"$enable_target_optspace" != x; then
-+  AC_DEFINE(ENABLE_TARGET_OPTSPACE, 1, [Define to enable target optspace support.])
-+fi
-+
- # Configure the subdirectories
- # AC_CONFIG_SUBDIRS($subdirs)
- 
-Index: gcc-4.6.0/gcc/opts.c
-===================================================================
---- gcc-4.6.0.orig/gcc/opts.c
-+++ gcc-4.6.0/gcc/opts.c
-@@ -605,6 +605,10 @@ default_options_optimization (struct gcc
-     maybe_set_param_value (PARAM_MIN_CROSSJUMP_INSNS,
- 			   default_param_value (PARAM_MIN_CROSSJUMP_INSNS),
- 			   opts->x_param_values, opts_set->x_param_values);
-+#ifndef ENABLE_TARGET_OPTSPACE
-+  if (optimize_size == 1)
-+    error ("Do not use -Os option if --enable-target-optspace is not set.");
-+#endif
- 
-   /* Allow default optimizations to be specified on a per-machine basis.  */
-   maybe_default_options (opts, opts_set,
-- 
1.7.3.4



