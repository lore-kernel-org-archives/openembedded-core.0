Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 109676FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064217"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:15 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:25 +0200
Message-Id: <601979795e08afdaad1fae5e9cd9f4fa0d9c05e8.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/20] gmp: update to 6.1.0
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:15 -0000

gmp-6.0.0-ppc64.patch was a backport
configure.patch was a very old patch with an unclear purpose and significant
rebasing effort required.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/gmp/gmp-6.0.0/configure.patch | 222 ---------------------
 .../gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch            |  26 ---
 ...ser-provided-flags-to-the-auto-detected-.patch} |  39 ++--
 .../gmp/{gmp-6.0.0 => gmp-6.1.0}/amd64.patch       |   0
 .../{gmp-6.0.0 => gmp-6.1.0}/use-includedir.patch  |   0
 .../gmp/{gmp_6.0.0.bb => gmp_6.1.0.bb}             |  17 +-
 6 files changed, 31 insertions(+), 273 deletions(-)
 delete mode 100644 meta/recipes-support/gmp/gmp-6.0.0/configure.patch
 delete mode 100644 meta/recipes-support/gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch
 rename meta/recipes-support/gmp/{gmp-6.0.0/append_user_provided_flags.patch => gmp-6.1.0/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch} (50%)
 rename meta/recipes-support/gmp/{gmp-6.0.0 => gmp-6.1.0}/amd64.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.0.0 => gmp-6.1.0}/use-includedir.patch (100%)
 rename meta/recipes-support/gmp/{gmp_6.0.0.bb => gmp_6.1.0.bb} (58%)

diff --git a/meta/recipes-support/gmp/gmp-6.0.0/configure.patch b/meta/recipes-support/gmp/gmp-6.0.0/configure.patch
deleted file mode 100644
index 349da3c..0000000
--- a/meta/recipes-support/gmp/gmp-6.0.0/configure.patch
+++ /dev/null
@@ -1,222 +0,0 @@
-Upstream-Status: Pending
-
-Updated to apply to gmp-5.1.0
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-
----
- acinclude.m4 | 32 +++++++++++++++++---------------
- configure.ac | 26 +++++++++-----------------
- 2 files changed, 26 insertions(+), 32 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 227712a..199aa6f 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -40,29 +40,29 @@ dnl    a_out.exe - OpenVMS DEC C called via GNV wrapper (gnv.sourceforge.net)
- dnl    conftest.exe - various DOS compilers
- 
- 
--define(IA64_PATTERN,
-+define([IA64_PATTERN],
- [[ia64*-*-* | itanium-*-* | itanium2-*-*]])
- 
- dnl  Need to be careful not to match m6811, m6812, m68hc11 and m68hc12, all
- dnl  of which config.sub accepts.  (Though none of which are likely to work
- dnl  with GMP.)
- dnl
--define(M68K_PATTERN,
-+define([M68K_PATTERN],
- [[m68k-*-* | m68[0-9][0-9][0-9]-*-*]])
- 
--define(POWERPC64_PATTERN,
-+define([POWERPC64_PATTERN],
- [[powerpc64-*-* | powerpc64le-*-* | powerpc620-*-* | powerpc630-*-* | powerpc970-*-* | power[3-9]-*-*]])
- 
--define(S390_PATTERN,
-+define([S390_PATTERN],
- [[s390-*-* | z900esa-*-* | z990esa-*-* | z9esa-*-* | z10esa-*-* | z196esa-*-*]])
- 
--define(S390X_PATTERN,
-+define([S390X_PATTERN],
- [[s390x-*-* | z900-*-* | z990-*-* | z9-*-* | z10-*-* | z196-*-*]])
- 
--define(X86_PATTERN,
-+define([X86_PATTERN],
- [[i?86*-*-* | k[5-8]*-*-* | pentium*-*-* | athlon-*-* | viac3*-*-* | geode*-*-* | atom-*-*]])
- 
--define(X86_64_PATTERN,
-+define([X86_64_PATTERN],
- [[athlon64-*-* | k8-*-* | k10-*-* | bobcat-*-* | jaguar-*-* | bulldozer-*-* | piledriver-*-* | steamroller-*-* | excavator-*-* | pentium4-*-* | atom-*-* | core2-*-* | corei*-*-* | x86_64-*-* | nano-*-*]])
- 
- dnl  GMP_FAT_SUFFIX(DSTVAR, DIRECTORY)
-@@ -80,7 +80,7 @@ dnl      x86         ->  x86
- dnl      x86/k6      ->  k6
- dnl      x86/k6/mmx  ->  k6_mmx
- 
--define(GMP_FAT_SUFFIX,
-+define([GMP_FAT_SUFFIX],
- [[$1=`echo $2 | sed -e '/\//s:^[^/]*/::' -e 's:[\\/]:_:g'`]])
- 
- 
-@@ -89,7 +89,7 @@ dnl  ----------------------------------
- dnl  Emit code to remove any occurrence of ITEM from $LISTVAR.  ITEM can be a
- dnl  shell expression like $foo if desired.
- 
--define(GMP_REMOVE_FROM_LIST,
-+define([GMP_REMOVE_FROM_LIST],
- [remove_from_list_tmp=
- for remove_from_list_i in $[][$1]; do
-   if test $remove_from_list_i = [$2]; then :;
-@@ -105,12 +105,12 @@ dnl  GMP_STRIP_PATH(subdir)
- dnl  ----------------------
- dnl  Strip entries */subdir from $path and $fat_path.
- 
--define(GMP_STRIP_PATH,
-+define([GMP_STRIP_PATH],
- [GMP_STRIP_PATH_VAR(path, [$1])
- GMP_STRIP_PATH_VAR(fat_path, [$1])
- ])
- 
--define(GMP_STRIP_PATH_VAR,
-+define([GMP_STRIP_PATH_VAR],
- [tmp_path=
- for i in $[][$1]; do
-   case $i in
-@@ -131,7 +131,7 @@ dnl
- dnl  Dummy value for GMP_LIMB_BITS is enough
- dnl  for all current configure-time uses of gmp.h.
- 
--define(GMP_INCLUDE_GMP_H,
-+define([GMP_INCLUDE_GMP_H],
- [[#define __GMP_WITHIN_CONFIGURE 1   /* ignore template stuff */
- #define GMP_NAIL_BITS $GMP_NAIL_BITS
- #define GMP_LIMB_BITS 123
-@@ -146,7 +146,7 @@ dnl  Expand at autoconf time to the value of a "#define NAME" from the given
- dnl  FILE.  The regexps here aren't very rugged, but are enough for gmp.
- dnl  /dev/null as a parameter prevents a hang if $2 is accidentally omitted.
- 
--define(GMP_HEADER_GETVAL,
-+define([GMP_HEADER_GETVAL],
- [patsubst(patsubst(
- esyscmd([grep "^#define $1 " $2 /dev/null 2>/dev/null]),
- [^.*$1[ 	]+],[]),
-@@ -160,7 +160,7 @@ dnl  The gmp version number, extracted from the #defines in gmp-h.in at
- dnl  autoconf time.  Two digits like 3.0 if patchlevel <= 0, or three digits
- dnl  like 3.0.1 if patchlevel > 0.
- 
--define(GMP_VERSION,
-+define([GMP_VERSION],
- [GMP_HEADER_GETVAL(__GNU_MP_VERSION,gmp-h.in)[]dnl
- .GMP_HEADER_GETVAL(__GNU_MP_VERSION_MINOR,gmp-h.in)[]dnl
- .GMP_HEADER_GETVAL(__GNU_MP_VERSION_PATCHLEVEL,gmp-h.in)])
-@@ -1524,7 +1524,9 @@ esac
- echo ["define(<CONFIG_TOP_SRCDIR>,<\`$tmp'>)"] >>$gmp_tmpconfigm4
- 
- # All CPUs use asm-defs.m4
--echo ["include][(CONFIG_TOP_SRCDIR\`/mpn/asm-defs.m4')"] >>$gmp_tmpconfigm4i
-+echo -n ["include("] >>$gmp_tmpconfigm4i
-+echo -n ["CONFIG_TOP_SRCDIR\`/mpn/asm-defs.m4'"] >>$gmp_tmpconfigm4i
-+echo [")"] >>$gmp_tmpconfigm4i
- ])
- 
- 
-diff --git a/configure.ac b/configure.ac
-index 64b2c50..f07b821 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -39,14 +39,6 @@ AC_REVISION($Revision$)
- AC_PREREQ(2.59)
- AC_INIT(GNU MP, GMP_VERSION, [gmp-bugs@gmplib.org, see https://gmplib.org/manual/Reporting-Bugs.html], gmp)
- AC_CONFIG_SRCDIR(gmp-impl.h)
--m4_pattern_forbid([^[ \t]*GMP_])
--m4_pattern_allow(GMP_LDFLAGS)
--m4_pattern_allow(GMP_LIMB_BITS)
--m4_pattern_allow(GMP_MPARAM_H_SUGGEST)
--m4_pattern_allow(GMP_NAIL_BITS)
--m4_pattern_allow(GMP_NUMB_BITS)
--m4_pattern_allow(GMP_NONSTD_ABI)
--m4_pattern_allow(GMP_CPU_TYPE)
- 
- # If --target is not used then $target_alias is empty, but if say
- # "./configure athlon-pc-freebsd3.5" is used, then all three of
-@@ -348,7 +340,7 @@ AH_VERBATIM([HAVE_HOST_CPU_1],
- # After GMP specific searches and tests, the standard autoconf AC_PROG_CC is
- # called.  User selections of CC etc are respected.
- #
--# Care is taken not to use macros like AC_TRY_COMPILE during the GMP
-+# Care is taken not to use macros like AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],[],[]) during the GMP
- # pre-testing, since they of course depend on AC_PROG_CC, and also some of
- # them cache their results, which is not wanted.
- #
-@@ -440,7 +432,7 @@ abilist="standard"
- # FIXME: We'd like to prefer an ANSI compiler, perhaps by preferring
- # c89 over cc here.  But note that on HP-UX c89 provides a castrated
- # environment, and would want to be excluded somehow.  Maybe
--# AC_PROG_CC_STDC already does enough to stick cc into ANSI mode and
-+#  already does enough to stick cc into ANSI mode and
- # we don't need to worry.
- #
- cclist="gcc cc"
-@@ -1843,7 +1835,7 @@ esac
- CFLAGS_or_unset=${CFLAGS-'(unset)'}
- CPPFLAGS_or_unset=${CPPFLAGS-'(unset)'}
- 
--cat >&AC_FD_CC <<EOF
-+cat >&AS_MESSAGE_LOG_FD() <<EOF
- User:
- ABI=$ABI
- CC=$CC
-@@ -2264,7 +2256,6 @@ AC_SUBST(DEFN_LONG_LONG_LIMB)
- 
- # The C compiler and preprocessor, put into ANSI mode if possible.
- AC_PROG_CC
--AC_PROG_CC_STDC
- AC_PROG_CPP
- 
- 
-@@ -2286,11 +2277,11 @@ AC_SUBST(CCAS)
- 
- # The C++ compiler, if desired.
- want_cxx=no
-+AC_PROG_CXX
- if test $enable_cxx != no; then
-   test_CXXFLAGS=${CXXFLAGS+set}
--  AC_PROG_CXX
- 
--  echo "CXXFLAGS chosen by autoconf: $CXXFLAGS" >&AC_FD_CC
-+  echo "CXXFLAGS chosen by autoconf: $CXXFLAGS" >&AS_MESSAGE_LOG_FD()
-   cxxflags_ac_prog_cxx=$CXXFLAGS
-   cxxflags_list=ac_prog_cxx
- 
-@@ -2412,7 +2403,7 @@ if test "$enable_assembly" = "no"; then
- fi
- 
- 
--cat >&AC_FD_CC <<EOF
-+cat >&AS_MESSAGE_LOG_FD() <<EOF
- Decided:
- ABI=$ABI
- CC=$CC
-@@ -3781,7 +3772,7 @@ GMP_FINISH
- # FIXME: Upcoming version of autoconf/automake may not like broken lines.
- #        Right now automake isn't accepting the new AC_CONFIG_FILES scheme.
- 
--AC_OUTPUT(Makefile							\
-+AC_CONFIG_FILES([Makefile							\
-   mpf/Makefile mpn/Makefile mpq/Makefile				\
-   mpz/Makefile printf/Makefile scanf/Makefile rand/Makefile cxx/Makefile \
-   tests/Makefile tests/devel/Makefile					\
-@@ -3790,7 +3781,8 @@ AC_OUTPUT(Makefile							\
-   tests/cxx/Makefile							\
-   doc/Makefile tune/Makefile						\
-   demos/Makefile demos/calc/Makefile demos/expr/Makefile		\
--  gmp.h:gmp-h.in)
-+  gmp.h:gmp-h.in])
-+AC_OUTPUT
- 
- AC_MSG_NOTICE([summary of build options:
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-support/gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch b/meta/recipes-support/gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch
deleted file mode 100644
index 1113b41..0000000
--- a/meta/recipes-support/gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
-This patch with pulled from gmp.
-https://gmplib.org/repo/gmp/rev/4a6d258b467f
-Upstream-Status: Backport
-
-# HG changeset patch
-# User Torbjorn Granlund <tege@gmplib.org>
-# Date 1395835068 -3600
-# Node ID 4a6d258b467f661da0894cc60ecd060f2e3c67c7
-# Parent  301ce2788826a2d4d2725bd5cf01e998638db37a
-Provide default for BMOD_1_TO_MOD_1_THRESHOLD.
-
-diff -r 301ce2788826 -r 4a6d258b467f mpn/powerpc64/mode64/gcd_1.asm
---- a/mpn/powerpc64/mode64/gcd_1.asm    Tue Mar 25 15:34:52 2014 +0100
-+++ b/mpn/powerpc64/mode64/gcd_1.asm    Wed Mar 26 12:57:48 2014 +0100
-@@ -43,6 +43,9 @@
- define(`n',     `r4')
- define(`v0',    `r5')
-
-+ifdef(`BMOD_1_TO_MOD_1_THRESHOLD',,
-+  `define(`BMOD_1_TO_MOD_1_THRESHOLD',30)')
-+
- EXTERN_FUNC(mpn_mod_1)
- EXTERN_FUNC(mpn_modexact_1c_odd)
diff --git a/meta/recipes-support/gmp/gmp-6.0.0/append_user_provided_flags.patch b/meta/recipes-support/gmp/gmp-6.1.0/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch
similarity index 50%
rename from meta/recipes-support/gmp/gmp-6.0.0/append_user_provided_flags.patch
rename to meta/recipes-support/gmp/gmp-6.1.0/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch
index ae1386c..325ffe4 100644
--- a/meta/recipes-support/gmp/gmp-6.0.0/append_user_provided_flags.patch
+++ b/meta/recipes-support/gmp/gmp-6.1.0/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch
@@ -1,14 +1,20 @@
-Upstream-Status: Inappropriate
-
-Append the user provided flags to the auto-detected ones.
+From d3b9fc523fc11260ced890c35bc5c9e6391c8656 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 14 Dec 2015 14:19:49 +0200
+Subject: [PATCH] Append the user provided flags to the auto-detected ones.
 
+Upstream-Status: Inappropriate
 Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
 
-Index: gmp-5.1.1/configure.ac
-===================================================================
---- gmp-5.1.1.orig/configure.ac	2014-02-11 15:05:44.925202403 +0200
-+++ gmp-5.1.1/configure.ac	2014-02-11 15:19:03.918511398 +0200
-@@ -1745,8 +1745,12 @@
+diff --git a/configure.ac b/configure.ac
+index 9cedfeb..87caee5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1921,8 +1921,12 @@ cclist=$cclist
  EOF
  
  
@@ -23,16 +29,16 @@ Index: gmp-5.1.1/configure.ac
  
  for abi in $abilist; do
    abi_last="$abi"
-@@ -2175,7 +2179,7 @@
+@@ -2353,7 +2357,7 @@ AC_SUBST(CCAS)
+ # The C++ compiler, if desired.
  want_cxx=no
- AC_PROG_CXX
  if test $enable_cxx != no; then
 -  test_CXXFLAGS=${CXXFLAGS+set}
 +  test_CXXFLAGS=
+   AC_PROG_CXX
  
-   echo "CXXFLAGS chosen by autoconf: $CXXFLAGS" >&AS_MESSAGE_LOG_FD()
-   cxxflags_ac_prog_cxx=$CXXFLAGS
-@@ -2202,7 +2206,7 @@
+   echo "CXXFLAGS chosen by autoconf: $CXXFLAGS" >&AC_FD_CC
+@@ -2381,7 +2385,7 @@ if test $enable_cxx != no; then
    # Automake includes $CPPFLAGS in a C++ compile, so we do the same here.
    #
    for cxxflags_choice in $cxxflags_list; do
@@ -41,12 +47,15 @@ Index: gmp-5.1.1/configure.ac
      GMP_PROG_CXX_WORKS($CXX $CPPFLAGS $CXXFLAGS,
        [want_cxx=yes
        break])
-@@ -2292,6 +2296,8 @@
+@@ -2477,6 +2481,8 @@ if test "$enable_assembly" = "no"; then
  #  done
  fi
  
 +CFLAGS="$CFLAGS $user_CFLAGS"
 +CPPFLAGS="$CPPFLAGS $user_CPPFLAGS"
  
- cat >&AS_MESSAGE_LOG_FD() <<EOF
+ cat >&AC_FD_CC <<EOF
  Decided:
+-- 
+2.6.2
+
diff --git a/meta/recipes-support/gmp/gmp-6.0.0/amd64.patch b/meta/recipes-support/gmp/gmp-6.1.0/amd64.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-6.0.0/amd64.patch
rename to meta/recipes-support/gmp/gmp-6.1.0/amd64.patch
diff --git a/meta/recipes-support/gmp/gmp-6.0.0/use-includedir.patch b/meta/recipes-support/gmp/gmp-6.1.0/use-includedir.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-6.0.0/use-includedir.patch
rename to meta/recipes-support/gmp/gmp-6.1.0/use-includedir.patch
diff --git a/meta/recipes-support/gmp/gmp_6.0.0.bb b/meta/recipes-support/gmp/gmp_6.1.0.bb
similarity index 58%
rename from meta/recipes-support/gmp/gmp_6.0.0.bb
rename to meta/recipes-support/gmp/gmp_6.1.0.bb
index 19b63e5..b26b4d5 100644
--- a/meta/recipes-support/gmp/gmp_6.0.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.0.bb
@@ -2,21 +2,18 @@ require gmp.inc
 
 LICENSE="GPLv2+ | LGPLv3+"
 
-REVISION="a"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                    file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
                    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 "
 
-SRC_URI += "file://configure.patch \
-            file://amd64.patch \
-            file://use-includedir.patch \
-            file://append_user_provided_flags.patch \
-            file://gmp-6.0.0-ppc64.patch \
-            "
-SRC_URI[md5sum] = "b7ff2d88cae7f8085bd5006096eed470"
-SRC_URI[sha256sum] = "7f8e9a804b9c6d07164cf754207be838ece1219425d64e28cfa3e70d5c759aaf"
+SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
+           file://amd64.patch \
+           file://use-includedir.patch \
+           file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
+           "
+SRC_URI[md5sum] = "86ee6e54ebfc4a90b643a65e402c4048"
+SRC_URI[sha256sum] = "498449a994efeba527885c10405993427995d3f86b8768d8cdf8d9dd7c6b73e8"
 
 acpaths = ""
 
-- 
2.6.2


