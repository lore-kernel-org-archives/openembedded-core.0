Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1956360DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 06:05:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7465DBL015063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Aug 2014 23:05:14 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 3 Aug 2014 23:05:13 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Aug 2014 14:05:20 +0800
Message-ID: <1407132320-22038-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/1] gmp: uprev it to 6.0.0
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
X-List-Received-Date: Mon, 04 Aug 2014 06:05:21 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Uprev gmp from 5.1.1 to 6.0.0, and remove the 4.2.1 version which is GPLv2, 
since gmp-6.0.0 is dual-licensing, LGPLv3 or GPLv2;

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-support/gmp/gmp-4.2.1/configure.patch |  209 --------------------
 .../gmp/gmp-4.2.1/disable-stdc.patch               |   33 ----
 .../gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch  |   48 -----
 .../append_user_provided_flags.patch               |    0
 .../gmp/{gmp-5.1.1 => gmp}/configure.patch         |  128 ++++++------
 meta/recipes-support/gmp/gmp_4.2.1.bb              |   23 ---
 meta/recipes-support/gmp/gmp_5.1.1.bb              |   11 --
 meta/recipes-support/gmp/gmp_6.0.0.bb              |   13 ++
 8 files changed, 83 insertions(+), 382 deletions(-)
 delete mode 100644 meta/recipes-support/gmp/gmp-4.2.1/configure.patch
 delete mode 100644 meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch
 delete mode 100644 meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
 rename meta/recipes-support/gmp/{gmp-5.1.1 => gmp}/append_user_provided_flags.patch (100%)
 rename meta/recipes-support/gmp/{gmp-5.1.1 => gmp}/configure.patch (78%)
 delete mode 100644 meta/recipes-support/gmp/gmp_4.2.1.bb
 delete mode 100644 meta/recipes-support/gmp/gmp_5.1.1.bb
 create mode 100644 meta/recipes-support/gmp/gmp_6.0.0.bb

diff --git a/meta/recipes-support/gmp/gmp-4.2.1/configure.patch b/meta/recipes-support/gmp/gmp-4.2.1/configure.patch
deleted file mode 100644
index 7597a93..0000000
--- a/meta/recipes-support/gmp/gmp-4.2.1/configure.patch
+++ /dev/null
@@ -1,209 +0,0 @@
-Upstream-Status: Pending
-
- acinclude.m4 |   26 ++++++++++++++------------
- configure.in |   24 +++++++++---------------
- 2 files changed, 23 insertions(+), 27 deletions(-)
-
-Index: gmp-5.0.3/acinclude.m4
-===================================================================
---- gmp-5.0.3.orig/acinclude.m4
-+++ gmp-5.0.3/acinclude.m4
-@@ -30,29 +30,29 @@ dnl    a_out.exe - OpenVMS DEC C called 
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
- [[athlon64-*-* | k8-*-* | k10-*-* | bobcat-*-* | bulldozer-*-* | pentium4-*-* | atom-*-* | core2-*-* | corei*-*-* | x86_64-*-* | nano-*-*]])
- 
- dnl  GMP_FAT_SUFFIX(DSTVAR, DIRECTORY)
-@@ -70,7 +70,7 @@ dnl      x86         ->  x86
- dnl      x86/k6      ->  k6
- dnl      x86/k6/mmx  ->  k6_mmx
- 
--define(GMP_FAT_SUFFIX,
-+define([GMP_FAT_SUFFIX],
- [[$1=`echo $2 | sed -e '/\//s:^[^/]*/::' -e 's:[\\/]:_:g'`]])
- 
- 
-@@ -79,7 +79,7 @@ dnl  ----------------------------------
- dnl  Emit code to remove any occurrence of ITEM from $LISTVAR.  ITEM can be a
- dnl  shell expression like $foo if desired.
- 
--define(GMP_REMOVE_FROM_LIST,
-+define([GMP_REMOVE_FROM_LIST],
- [remove_from_list_tmp=
- for remove_from_list_i in $[][$1]; do
-   if test $remove_from_list_i = [$2]; then :;
-@@ -95,12 +95,12 @@ dnl  GMP_STRIP_PATH(subdir)
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
-@@ -121,7 +121,7 @@ dnl
- dnl  Dummy value for GMP_LIMB_BITS is enough
- dnl  for all current configure-time uses of gmp.h.
- 
--define(GMP_INCLUDE_GMP_H,
-+define([GMP_INCLUDE_GMP_H],
- [[#define __GMP_WITHIN_CONFIGURE 1   /* ignore template stuff */
- #define GMP_NAIL_BITS $GMP_NAIL_BITS
- #define GMP_LIMB_BITS 123
-@@ -136,7 +136,7 @@ dnl  Expand at autoconf time to the valu
- dnl  FILE.  The regexps here aren't very rugged, but are enough for gmp.
- dnl  /dev/null as a parameter prevents a hang if $2 is accidentally omitted.
- 
--define(GMP_HEADER_GETVAL,
-+define([GMP_HEADER_GETVAL],
- [patsubst(patsubst(
- esyscmd([grep "^#define $1 " $2 /dev/null 2>/dev/null]),
- [^.*$1[ 	]+],[]),
-@@ -150,7 +150,7 @@ dnl  The gmp version number, extracted f
- dnl  autoconf time.  Two digits like 3.0 if patchlevel <= 0, or three digits
- dnl  like 3.0.1 if patchlevel > 0.
- 
--define(GMP_VERSION,
-+define([GMP_VERSION],
- [GMP_HEADER_GETVAL(__GNU_MP_VERSION,gmp-h.in)[]dnl
- .GMP_HEADER_GETVAL(__GNU_MP_VERSION_MINOR,gmp-h.in)[]dnl
- .GMP_HEADER_GETVAL(__GNU_MP_VERSION_PATCHLEVEL,gmp-h.in)])
-@@ -1512,7 +1512,9 @@ esac
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
-Index: gmp-5.0.3/configure.in
-===================================================================
---- gmp-5.0.3.orig/configure.in
-+++ gmp-5.0.3/configure.in
-@@ -29,12 +29,6 @@ AC_REVISION($Revision$)
- AC_PREREQ(2.59)
- AC_INIT(GNU MP, GMP_VERSION, [gmp-bugs@gmplib.org, see http://gmplib.org/manual/Reporting-Bugs.html], gmp)
- AC_CONFIG_SRCDIR(gmp-impl.h)
--m4_pattern_forbid([^[ \t]*GMP_])
--m4_pattern_allow(GMP_LDFLAGS)
--m4_pattern_allow(GMP_LIMB_BITS)
--m4_pattern_allow(GMP_MPARAM_H_SUGGEST)
--m4_pattern_allow(GMP_NAIL_BITS)
--m4_pattern_allow(GMP_NUMB_BITS)
- 
- # If --target is not used then $target_alias is empty, but if say
- # "./configure athlon-pc-freebsd3.5" is used, then all three of
-@@ -311,7 +305,7 @@ AH_VERBATIM([HAVE_HOST_CPU_1],
- # After GMP specific searches and tests, the standard autoconf AC_PROG_CC is
- # called.  User selections of CC etc are respected.
- #
--# Care is taken not to use macros like AC_TRY_COMPILE during the GMP
-+# Care is taken not to use macros like AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],[],[]) during the GMP
- # pre-testing, since they of course depend on AC_PROG_CC, and also some of
- # them cache their results, which is not wanted.
- #
-@@ -403,7 +397,7 @@ abilist="standard"
- # FIXME: We'd like to prefer an ANSI compiler, perhaps by preferring
- # c89 over cc here.  But note that on HP-UX c89 provides a castrated
- # environment, and would want to be excluded somehow.  Maybe
--# AC_PROG_CC_STDC already does enough to stick cc into ANSI mode and
-+#  already does enough to stick cc into ANSI mode and
- # we don't need to worry.
- #
- cclist="gcc cc"
-@@ -1666,7 +1660,7 @@ esac
- CFLAGS_or_unset=${CFLAGS-'(unset)'}
- CPPFLAGS_or_unset=${CPPFLAGS-'(unset)'}
- 
--cat >&AC_FD_CC <<EOF
-+cat >&AS_MESSAGE_LOG_FD() <<EOF
- User:
- ABI=$ABI
- CC=$CC
-@@ -2073,7 +2067,6 @@ AC_SUBST(DEFN_LONG_LONG_LIMB)
- 
- # The C compiler and preprocessor, put into ANSI mode if possible.
- AC_PROG_CC
--AC_PROG_CC_STDC
- AC_PROG_CPP
- GMP_H_ANSI
- 
-@@ -2096,11 +2089,11 @@ AC_SUBST(CCAS)
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
-@@ -2206,7 +2199,7 @@ case $host in
- esac
- 
- 
--cat >&AC_FD_CC <<EOF
-+cat >&AS_MESSAGE_LOG_FD() <<EOF
- Decided:
- ABI=$ABI
- CC=$CC
-@@ -3465,7 +3458,7 @@ GMP_FINISH
- # FIXME: Upcoming version of autoconf/automake may not like broken lines.
- #        Right now automake isn't accepting the new AC_CONFIG_FILES scheme.
- 
--AC_OUTPUT(Makefile							\
-+AC_CONFIG_FILES([Makefile							\
-   mpbsd/Makefile mpf/Makefile mpn/Makefile mpq/Makefile			\
-   mpz/Makefile printf/Makefile scanf/Makefile cxx/Makefile		\
-   tests/Makefile tests/devel/Makefile tests/mpbsd/Makefile		\
-@@ -3474,4 +3467,5 @@ AC_OUTPUT(Makefile							\
-   tests/cxx/Makefile							\
-   doc/Makefile tune/Makefile						\
-   demos/Makefile demos/calc/Makefile demos/expr/Makefile		\
--  gmp.h:gmp-h.in mp.h:mp-h.in)
-+  gmp.h:gmp-h.in mp.h:mp-h.in])
-+AC_OUTPUT
diff --git a/meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch b/meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch
deleted file mode 100644
index aaffaf1..0000000
--- a/meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Pending
-
-# "extern inline" in traditional gcc means that the function should be 
-# inlined wherever it's seen, while in C99, "extern inline" means that i
-# the function should only be inlined where the inline definition is 
-# seen while in other places it's not inlined:
-# http://gcc.gnu.org/ml/gcc/2006-11/msg00006.html
-#
-# gmp checks "--std=gnu99" to use C99 convention however it internally 
-# defines some "extern inline" functions in gmp.h, which is included
-# by mainly .c files and finally lead a flood of redefinition function
-# errors when linking objects together.
-#
-# So disable C99/ANSI detection to stick to tranditional gcc behavior
-#
-# by Kevin Tian <kevin.tian@intel.com>, 2010-08-13
-#
-# (this patch is licensed under GPLv2+)
-
-diff --git a/configure.in b/configure.in
-index 450cc92..aab0b59 100644
---- a/configure.in
-+++ b/configure.in
-@@ -1869,9 +1869,7 @@ AC_SUBST(DEFN_LONG_LONG_LIMB)
- 
- # The C compiler and preprocessor, put into ANSI mode if possible.
- AC_PROG_CC
--AC_PROG_CC_STDC
- AC_PROG_CPP
--GMP_H_ANSI
- 
- 
- # The C compiler on the build system, and associated tests.
diff --git a/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch b/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
deleted file mode 100644
index fbd8a39..0000000
--- a/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Upstream-Status: Pending
-
-automake 1.12 has depricated automatic de-ANSI-fication support
-
-this patch avoids these kinds of errors:
-
-| configure.in:2240: error: automatic de-ANSI-fication support has been removed
-| Makefile.am:28: error: automatic de-ANSI-fication support has been removed
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/02
-
-Index: gmp-4.2.1/configure.in
-===================================================================
---- gmp-4.2.1.orig/configure.in
-+++ gmp-4.2.1/configure.in
-@@ -67,7 +67,7 @@ dnl
- dnl  Note that there's a copy of these options in the top-level Makefile.am,
- dnl  so update there too if changing anything.
- dnl
--AM_INIT_AUTOMAKE([1.8 gnu no-dependencies $(top_builddir)/ansi2knr])
-+AM_INIT_AUTOMAKE([1.8 gnu no-dependencies])
- AM_CONFIG_HEADER(config.h:config.in)
- AM_MAINTAINER_MODE
- 
-@@ -2022,9 +2022,6 @@ fi
- echo "      MPN_PATH=\"$path\""
- 
- 
--# Automake ansi2knr support.
--AM_C_PROTOTYPES
--
- GMP_PROG_AR
- GMP_PROG_NM
- 
-Index: gmp-4.2.1/Makefile.am
-===================================================================
---- gmp-4.2.1.orig/Makefile.am
-+++ gmp-4.2.1/Makefile.am
-@@ -27,7 +27,7 @@
- # Makefiles in subdirectories, but here we must omit it so automake gives
- # the actual ansi2knr build rule, not "cd $(top_builddir) && make ansi2knr".
- #
--AUTOMAKE_OPTIONS = 1.8 gnu no-dependencies ansi2knr
-+AUTOMAKE_OPTIONS = 1.8 gnu no-dependencies
- 
- 
- # Libtool -version-info for libgmp.la and libmp.la.  See "Versioning" in the
diff --git a/meta/recipes-support/gmp/gmp-5.1.1/append_user_provided_flags.patch b/meta/recipes-support/gmp/gmp/append_user_provided_flags.patch
similarity index 100%
rename from meta/recipes-support/gmp/gmp-5.1.1/append_user_provided_flags.patch
rename to meta/recipes-support/gmp/gmp/append_user_provided_flags.patch
diff --git a/meta/recipes-support/gmp/gmp-5.1.1/configure.patch b/meta/recipes-support/gmp/gmp/configure.patch
similarity index 78%
rename from meta/recipes-support/gmp/gmp-5.1.1/configure.patch
rename to meta/recipes-support/gmp/gmp/configure.patch
index 591ea79..349da3c 100644
--- a/meta/recipes-support/gmp/gmp-5.1.1/configure.patch
+++ b/meta/recipes-support/gmp/gmp/configure.patch
@@ -4,17 +4,23 @@ Updated to apply to gmp-5.1.0
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
 
-diff -Nurd gmp-5.1.0/acinclude.m4 gmp-5.1.0/acinclude.m4
---- gmp-5.1.0/acinclude.m4	2012-12-18 21:05:09.000000000 +0200
-+++ gmp-5.1.0/acinclude.m4	2013-01-02 05:19:26.977013073 +0200
-@@ -30,29 +30,29 @@
+---
+ acinclude.m4 | 32 +++++++++++++++++---------------
+ configure.ac | 26 +++++++++-----------------
+ 2 files changed, 26 insertions(+), 32 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 227712a..199aa6f 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -40,29 +40,29 @@ dnl    a_out.exe - OpenVMS DEC C called via GNV wrapper (gnv.sourceforge.net)
  dnl    conftest.exe - various DOS compilers
-
-
+ 
+ 
 -define(IA64_PATTERN,
 +define([IA64_PATTERN],
  [[ia64*-*-* | itanium-*-* | itanium2-*-*]])
-
+ 
  dnl  Need to be careful not to match m6811, m6812, m68hc11 and m68hc12, all
  dnl  of which config.sub accepts.  (Though none of which are likely to work
  dnl  with GMP.)
@@ -22,105 +28,106 @@ diff -Nurd gmp-5.1.0/acinclude.m4 gmp-5.1.0/acinclude.m4
 -define(M68K_PATTERN,
 +define([M68K_PATTERN],
  [[m68k-*-* | m68[0-9][0-9][0-9]-*-*]])
-
+ 
 -define(POWERPC64_PATTERN,
 +define([POWERPC64_PATTERN],
  [[powerpc64-*-* | powerpc64le-*-* | powerpc620-*-* | powerpc630-*-* | powerpc970-*-* | power[3-9]-*-*]])
-
+ 
 -define(S390_PATTERN,
 +define([S390_PATTERN],
  [[s390-*-* | z900esa-*-* | z990esa-*-* | z9esa-*-* | z10esa-*-* | z196esa-*-*]])
-
+ 
 -define(S390X_PATTERN,
 +define([S390X_PATTERN],
  [[s390x-*-* | z900-*-* | z990-*-* | z9-*-* | z10-*-* | z196-*-*]])
-
+ 
 -define(X86_PATTERN,
 +define([X86_PATTERN],
  [[i?86*-*-* | k[5-8]*-*-* | pentium*-*-* | athlon-*-* | viac3*-*-* | geode*-*-* | atom-*-*]])
-
+ 
 -define(X86_64_PATTERN,
 +define([X86_64_PATTERN],
- [[athlon64-*-* | k8-*-* | k10-*-* | bobcat-*-* | bulldozer-*-* | pentium4-*-* | atom-*-* | core2-*-* | corei*-*-* | x86_64-*-* | nano-*-*]])
-
+ [[athlon64-*-* | k8-*-* | k10-*-* | bobcat-*-* | jaguar-*-* | bulldozer-*-* | piledriver-*-* | steamroller-*-* | excavator-*-* | pentium4-*-* | atom-*-* | core2-*-* | corei*-*-* | x86_64-*-* | nano-*-*]])
+ 
  dnl  GMP_FAT_SUFFIX(DSTVAR, DIRECTORY)
-@@ -70,7 +70,7 @@
+@@ -80,7 +80,7 @@ dnl      x86         ->  x86
  dnl      x86/k6      ->  k6
  dnl      x86/k6/mmx  ->  k6_mmx
-
+ 
 -define(GMP_FAT_SUFFIX,
 +define([GMP_FAT_SUFFIX],
  [[$1=`echo $2 | sed -e '/\//s:^[^/]*/::' -e 's:[\\/]:_:g'`]])
-
-
-@@ -79,7 +79,7 @@
+ 
+ 
+@@ -89,7 +89,7 @@ dnl  ----------------------------------
  dnl  Emit code to remove any occurrence of ITEM from $LISTVAR.  ITEM can be a
  dnl  shell expression like $foo if desired.
-
+ 
 -define(GMP_REMOVE_FROM_LIST,
 +define([GMP_REMOVE_FROM_LIST],
  [remove_from_list_tmp=
  for remove_from_list_i in $[][$1]; do
    if test $remove_from_list_i = [$2]; then :;
-@@ -95,12 +95,12 @@
+@@ -105,12 +105,12 @@ dnl  GMP_STRIP_PATH(subdir)
  dnl  ----------------------
  dnl  Strip entries */subdir from $path and $fat_path.
-
+ 
 -define(GMP_STRIP_PATH,
 +define([GMP_STRIP_PATH],
  [GMP_STRIP_PATH_VAR(path, [$1])
  GMP_STRIP_PATH_VAR(fat_path, [$1])
  ])
-
+ 
 -define(GMP_STRIP_PATH_VAR,
 +define([GMP_STRIP_PATH_VAR],
  [tmp_path=
  for i in $[][$1]; do
    case $i in
-@@ -121,7 +121,7 @@
+@@ -131,7 +131,7 @@ dnl
  dnl  Dummy value for GMP_LIMB_BITS is enough
  dnl  for all current configure-time uses of gmp.h.
-
+ 
 -define(GMP_INCLUDE_GMP_H,
 +define([GMP_INCLUDE_GMP_H],
  [[#define __GMP_WITHIN_CONFIGURE 1   /* ignore template stuff */
  #define GMP_NAIL_BITS $GMP_NAIL_BITS
  #define GMP_LIMB_BITS 123
-@@ -136,7 +136,7 @@
+@@ -146,7 +146,7 @@ dnl  Expand at autoconf time to the value of a "#define NAME" from the given
  dnl  FILE.  The regexps here aren't very rugged, but are enough for gmp.
  dnl  /dev/null as a parameter prevents a hang if $2 is accidentally omitted.
-
+ 
 -define(GMP_HEADER_GETVAL,
 +define([GMP_HEADER_GETVAL],
  [patsubst(patsubst(
  esyscmd([grep "^#define $1 " $2 /dev/null 2>/dev/null]),
  [^.*$1[ 	]+],[]),
-@@ -150,7 +150,7 @@
+@@ -160,7 +160,7 @@ dnl  The gmp version number, extracted from the #defines in gmp-h.in at
  dnl  autoconf time.  Two digits like 3.0 if patchlevel <= 0, or three digits
  dnl  like 3.0.1 if patchlevel > 0.
-
+ 
 -define(GMP_VERSION,
 +define([GMP_VERSION],
  [GMP_HEADER_GETVAL(__GNU_MP_VERSION,gmp-h.in)[]dnl
  .GMP_HEADER_GETVAL(__GNU_MP_VERSION_MINOR,gmp-h.in)[]dnl
  .GMP_HEADER_GETVAL(__GNU_MP_VERSION_PATCHLEVEL,gmp-h.in)])
-@@ -1512,7 +1512,9 @@
+@@ -1524,7 +1524,9 @@ esac
  echo ["define(<CONFIG_TOP_SRCDIR>,<\`$tmp'>)"] >>$gmp_tmpconfigm4
-
+ 
  # All CPUs use asm-defs.m4
 -echo ["include][(CONFIG_TOP_SRCDIR\`/mpn/asm-defs.m4')"] >>$gmp_tmpconfigm4i
 +echo -n ["include("] >>$gmp_tmpconfigm4i
 +echo -n ["CONFIG_TOP_SRCDIR\`/mpn/asm-defs.m4'"] >>$gmp_tmpconfigm4i
 +echo [")"] >>$gmp_tmpconfigm4i
  ])
-
-
-diff -Nurd gmp-5.1.0/configure.ac gmp-5.1.0/configure.ac
---- gmp-5.1.0/configure.ac	2012-12-18 21:05:09.000000000 +0200
-+++ gmp-5.1.0/configure.ac	2013-01-02 05:19:26.977013073 +0200
-@@ -29,13 +29,6 @@
+ 
+ 
+diff --git a/configure.ac b/configure.ac
+index 64b2c50..f07b821 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -39,14 +39,6 @@ AC_REVISION($Revision$)
  AC_PREREQ(2.59)
- AC_INIT(GNU MP, GMP_VERSION, [gmp-bugs@gmplib.org, see http://gmplib.org/manual/Reporting-Bugs.html], gmp)
+ AC_INIT(GNU MP, GMP_VERSION, [gmp-bugs@gmplib.org, see https://gmplib.org/manual/Reporting-Bugs.html], gmp)
  AC_CONFIG_SRCDIR(gmp-impl.h)
 -m4_pattern_forbid([^[ \t]*GMP_])
 -m4_pattern_allow(GMP_LDFLAGS)
@@ -129,10 +136,11 @@ diff -Nurd gmp-5.1.0/configure.ac gmp-5.1.0/configure.ac
 -m4_pattern_allow(GMP_NAIL_BITS)
 -m4_pattern_allow(GMP_NUMB_BITS)
 -m4_pattern_allow(GMP_NONSTD_ABI)
-
+-m4_pattern_allow(GMP_CPU_TYPE)
+ 
  # If --target is not used then $target_alias is empty, but if say
  # "./configure athlon-pc-freebsd3.5" is used, then all three of
-@@ -314,7 +307,7 @@
+@@ -348,7 +340,7 @@ AH_VERBATIM([HAVE_HOST_CPU_1],
  # After GMP specific searches and tests, the standard autoconf AC_PROG_CC is
  # called.  User selections of CC etc are respected.
  #
@@ -141,7 +149,7 @@ diff -Nurd gmp-5.1.0/configure.ac gmp-5.1.0/configure.ac
  # pre-testing, since they of course depend on AC_PROG_CC, and also some of
  # them cache their results, which is not wanted.
  #
-@@ -406,7 +399,7 @@
+@@ -440,7 +432,7 @@ abilist="standard"
  # FIXME: We'd like to prefer an ANSI compiler, perhaps by preferring
  # c89 over cc here.  But note that on HP-UX c89 provides a castrated
  # environment, and would want to be excluded somehow.  Maybe
@@ -150,61 +158,65 @@ diff -Nurd gmp-5.1.0/configure.ac gmp-5.1.0/configure.ac
  # we don't need to worry.
  #
  cclist="gcc cc"
-@@ -1727,7 +1720,7 @@
+@@ -1843,7 +1835,7 @@ esac
  CFLAGS_or_unset=${CFLAGS-'(unset)'}
  CPPFLAGS_or_unset=${CPPFLAGS-'(unset)'}
-
+ 
 -cat >&AC_FD_CC <<EOF
 +cat >&AS_MESSAGE_LOG_FD() <<EOF
  User:
  ABI=$ABI
  CC=$CC
-@@ -2147,7 +2140,6 @@
-
+@@ -2264,7 +2256,6 @@ AC_SUBST(DEFN_LONG_LONG_LIMB)
+ 
  # The C compiler and preprocessor, put into ANSI mode if possible.
  AC_PROG_CC
 -AC_PROG_CC_STDC
  AC_PROG_CPP
-
-
-@@ -2169,11 +2161,11 @@
-
+ 
+ 
+@@ -2286,11 +2277,11 @@ AC_SUBST(CCAS)
+ 
  # The C++ compiler, if desired.
  want_cxx=no
 +AC_PROG_CXX
  if test $enable_cxx != no; then
    test_CXXFLAGS=${CXXFLAGS+set}
 -  AC_PROG_CXX
-
+ 
 -  echo "CXXFLAGS chosen by autoconf: $CXXFLAGS" >&AC_FD_CC
 +  echo "CXXFLAGS chosen by autoconf: $CXXFLAGS" >&AS_MESSAGE_LOG_FD()
    cxxflags_ac_prog_cxx=$CXXFLAGS
    cxxflags_list=ac_prog_cxx
-
-@@ -2289,7 +2281,7 @@
+ 
+@@ -2412,7 +2403,7 @@ if test "$enable_assembly" = "no"; then
  fi
-
-
+ 
+ 
 -cat >&AC_FD_CC <<EOF
 +cat >&AS_MESSAGE_LOG_FD() <<EOF
  Decided:
  ABI=$ABI
  CC=$CC
-@@ -3638,7 +3630,7 @@
+@@ -3781,7 +3772,7 @@ GMP_FINISH
  # FIXME: Upcoming version of autoconf/automake may not like broken lines.
  #        Right now automake isn't accepting the new AC_CONFIG_FILES scheme.
-
+ 
 -AC_OUTPUT(Makefile							\
 +AC_CONFIG_FILES([Makefile							\
    mpf/Makefile mpn/Makefile mpq/Makefile				\
    mpz/Makefile printf/Makefile scanf/Makefile rand/Makefile cxx/Makefile \
    tests/Makefile tests/devel/Makefile					\
-@@ -3647,7 +3639,8 @@
+@@ -3790,7 +3781,8 @@ AC_OUTPUT(Makefile							\
    tests/cxx/Makefile							\
    doc/Makefile tune/Makefile						\
    demos/Makefile demos/calc/Makefile demos/expr/Makefile		\
 -  gmp.h:gmp-h.in)
 +  gmp.h:gmp-h.in])
 +AC_OUTPUT
-
+ 
  AC_MSG_NOTICE([summary of build options:
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
deleted file mode 100644
index 69ad0ca..0000000
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "GNU multiprecision arithmetic library"
-DESCRIPTION = "GMP is a free library for arbitrary precision arithmetic, operating on signed integers, rational numbers, and floating point numbers"
-HOMEPAGE = "http://gmplib.org/"
-BUGTRACKER = "http://gmplib.org/mailman/listinfo/gmp-bugs"
-# demo is licensed under GPLv2+, which however we don't package at all
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a \
-                    file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
-                    file://gmp-h.in;beginline=6;endline=21;md5=e056f74a12c3277d730dbcfb85d2ca34"
-PR = "r2"
-
-SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
-           file://disable-stdc.patch \
-           file://gmp_fix_for_automake-1.12.patch \
-           "
-
-SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
-SRC_URI[sha256sum] = "d07ffcb37eecec35c5ec72516d10b35fdf6e6fef1fcf1dcd37e30b8cbf8bf941"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[readline] = "--with-readline=yes,--with-readline=no,readline"
-
-inherit autotools texinfo
diff --git a/meta/recipes-support/gmp/gmp_5.1.1.bb b/meta/recipes-support/gmp/gmp_5.1.1.bb
deleted file mode 100644
index 6020610..0000000
--- a/meta/recipes-support/gmp/gmp_5.1.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require gmp.inc
-LICENSE="LGPLv3&GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
-
-SRC_URI_append = " file://use-includedir.patch \
-                   file://append_user_provided_flags.patch \
-                   "
-
-SRC_URI[md5sum] = "2fa018a7cd193c78494525f236d02dd6"
-SRC_URI[sha256sum] = "a0d4779f48b36519dfaceb5f987a7c76fcac223258bebea3bb2244310970afad"
diff --git a/meta/recipes-support/gmp/gmp_6.0.0.bb b/meta/recipes-support/gmp/gmp_6.0.0.bb
new file mode 100644
index 0000000..19e5f4d
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp_6.0.0.bb
@@ -0,0 +1,13 @@
+require gmp.inc
+LICENSE="GPLv2 | LGPLv3"
+REVISION="a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+		    file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
+		    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+"
+SRC_URI_append = " file://use-includedir.patch \
+                   file://append_user_provided_flags.patch \
+"
+
+SRC_URI[md5sum] = "b7ff2d88cae7f8085bd5006096eed470"
+SRC_URI[sha256sum] = "7f8e9a804b9c6d07164cf754207be838ece1219425d64e28cfa3e70d5c759aaf"
-- 
1.7.10.4


