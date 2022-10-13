Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC9BC433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 13:29:43 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.7393.1665667777298553555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 06:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ety4RWnh;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1665667777;
  x=1697203777;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n5IT88TEH3e2hmCdBv05MScGGn5ZFpwqKsbjyBx8hRg=;
  b=ety4RWnhgENDmXpOZ26DsmMNVb/lxEQBw47O3DYCmuWvpTI+MlPzV7cz
   cR8BXn3aC+PLETSIUEBvJurI9lNBiJhy5AMeC9J3RvZESIfkpgHMLFU5t
   u1IU3Xj+yOyJvdlH3PetfjdRFJnuaauY8cmgfOCoJxc4jXX8HvlcO0fSG
   LL94H5Hj/EXDFhshHDtZNCS/0DW95jyGVC0VcOVCtJcLh5MvAzMSusa4U
   TleEXHLSu8w0OuUiS/UESxZIPxkH5+5uGJmVV2oq8aqQtVUa6Y+4aTQlu
   45P4QkieQALfn3ElQJQNJmk/WLZOSEnKhZ5XYoABV+rVZyb7iFpWs66ty
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gcc: Allow -Wno-error=poison-system-directories to take effect
Date: Thu, 13 Oct 2022 15:29:26 +0200
Message-ID: <20221013132926.2771530-1-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 13:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171703

The change in commit e903b29f (gcc-cross: pass
-Werror=poison-system-directories to compiler stages) made it impossible
to disable the error using -Wno-error=poison-system-directories.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../0002-gcc-poison-system-directories.patch  | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
index bfec4477c1..5aa635b3d4 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From e1dbdcd0ea667bab4b551294354e04c6fe288ab6 Mon Sep 17 00:00:00 2001
+From 99f1e61b2957226254a116fde7fd73bf07034012 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Mar 2021 16:04:20 -0800
 Subject: [PATCH] gcc: poison-system-directories
@@ -20,12 +20,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/configure       | 19 +++++++++++++++++++
  gcc/configure.ac    | 16 ++++++++++++++++
  gcc/doc/invoke.texi |  9 +++++++++
- gcc/gcc.cc          |  9 +++++++--
+ gcc/gcc.cc          | 15 ++++++++++++---
  gcc/incpath.cc      | 21 +++++++++++++++++++++
- 7 files changed, 86 insertions(+), 2 deletions(-)
+ 7 files changed, 91 insertions(+), 3 deletions(-)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
-index 8a0dafc522d..0357868e22c 100644
+index 8a0dafc52..0357868e2 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
 @@ -710,6 +710,10 @@ Wreturn-local-addr
@@ -40,7 +40,7 @@ index 8a0dafc522d..0357868e22c 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=global.
 diff --git a/gcc/config.in b/gcc/config.in
-index 64c27c9cfac..a693cb8a886 100644
+index 64c27c9cf..a693cb8a8 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
 @@ -230,6 +230,16 @@
@@ -61,7 +61,7 @@ index 64c27c9cfac..a693cb8a886 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index 5ce0557719a..dc2d59701ad 100755
+index 2b83acfb0..8bb97578c 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -1023,6 +1023,7 @@ enable_maintainer_mode
@@ -81,7 +81,7 @@ index 5ce0557719a..dc2d59701ad 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -31982,6 +31985,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -31996,6 +31999,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -105,10 +105,10 @@ index 5ce0557719a..dc2d59701ad 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 23bee7010a3..36ce78924de 100644
+index daf2a708c..6155b83a7 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -7421,6 +7421,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -7435,6 +7435,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -132,7 +132,7 @@ index 23bee7010a3..36ce78924de 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 07b440190c3..b2de464798a 100644
+index ff6c338be..a8ebfa59a 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -379,6 +379,7 @@ Objective-C and Objective-C++ Dialects}.
@@ -159,10 +159,10 @@ index 07b440190c3..b2de464798a 100644
  @opindex Wfloat-equal
  @opindex Wno-float-equal
 diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index bb07cc244e3..ce161d3c853 100644
+index beefde7f6..4e6557b3c 100644
 --- a/gcc/gcc.cc
 +++ b/gcc/gcc.cc
-@@ -1159,6 +1159,8 @@ proper position among the other output files.  */
+@@ -1162,6 +1162,8 @@ proper position among the other output files.  */
     "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
     "%X %{o*} %{e*} %{N} %{n} %{r}\
      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
@@ -171,7 +171,7 @@ index bb07cc244e3..ce161d3c853 100644
      %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
-@@ -1254,8 +1256,11 @@ static const char *cpp_unique_options =
+@@ -1257,8 +1259,11 @@ static const char *cpp_unique_options =
  static const char *cpp_options =
  "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} %{w}\
   %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
@@ -179,27 +179,27 @@ index bb07cc244e3..ce161d3c853 100644
 - %{undef} %{save-temps*:-fpch-preprocess}";
 + %{!fno-working-directory:-fworking-directory}}} %{O*}"
 +#ifdef POISON_BY_DEFAULT
-+ " -Werror=poison-system-directories"
++ " %{!Wno-error=poison-system-directories:-Werror=poison-system-directories}"
 +#endif
 + " %{undef} %{save-temps*:-fpch-preprocess}";
  
  /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
  
-@@ -1265,7 +1270,11 @@ static const char *cc1_options =
+@@ -1287,7 +1292,11 @@ static const char *cc1_options =
   %{coverage:-fprofile-arcs -ftest-coverage}\
   %{fprofile-arcs|fprofile-generate*|coverage:\
     %{!fprofile-update=single:\
 -     %{pthread:-fprofile-update=prefer-atomic}}}";
 +     %{pthread:-fprofile-update=prefer-atomic}}}"
 +#ifdef POISON_BY_DEFAULT
-+ " -Werror=poison-system-directories"
++ " %{!Wno-error=poison-system-directories:-Werror=poison-system-directories}"
 +#endif
 +  ;
-
+ 
  static const char *asm_options =
  "%{-target-help:%:print-asm-header()} "
 diff --git a/gcc/incpath.cc b/gcc/incpath.cc
-index bd2a97938eb..c80f100f476 100644
+index 622204a38..5ac03c086 100644
 --- a/gcc/incpath.cc
 +++ b/gcc/incpath.cc
 @@ -26,6 +26,7 @@

