Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RsjvA-0003eh-9d
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 00:49:00 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Feb 2012 15:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="62271866"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Feb 2012 15:41:03 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 15:40:56 -0800
Message-Id: <d09d913dd828e3a3881bb6dedead679d0a9d08de.1328139407.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <6e7973add09749de3b14543fde53791076063657.1328139407.git.nitin.a.kamble@intel.com>
References: <6e7973add09749de3b14543fde53791076063657.1328139407.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1328139407.git.nitin.a.kamble@intel.com>
References: <cover.1328139407.git.nitin.a.kamble@intel.com>
Subject: [patch-v2 2/7] gmp: upgrade from 5.0.2 to 5.0.3
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
X-List-Received-Date: Wed, 01 Feb 2012 23:49:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

rebased configure.patch & amd64.patchto the newer code.
Removed sh4-asmfix.patch as it is not needed with the newer code.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/gmp/gmp/amd64.patch           |    8 ++-
 meta/recipes-support/gmp/gmp/configure.patch       |   60 ++++++++++++--------
 meta/recipes-support/gmp/gmp/sh4-asmfix.patch      |   28 ---------
 .../gmp/{gmp_5.0.2.bb => gmp_5.0.3.bb}             |    9 +--
 4 files changed, 45 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-support/gmp/gmp/sh4-asmfix.patch
 rename meta/recipes-support/gmp/{gmp_5.0.2.bb => gmp_5.0.3.bb} (57%)

diff --git a/meta/recipes-support/gmp/gmp/amd64.patch b/meta/recipes-support/gmp/gmp/amd64.patch
index 38c89c7..564d12d 100644
--- a/meta/recipes-support/gmp/gmp/amd64.patch
+++ b/meta/recipes-support/gmp/gmp/amd64.patch
@@ -1,8 +1,10 @@
 Upstream-Status: Pending
 
---- gmp-4.1.4/longlong.h.orig	2004-04-22 00:34:28.000000000 +0200
-+++ gmp-4.1.4/longlong.h	2005-07-18 01:13:06.000000000 +0200
-@@ -738,8 +738,10 @@
+Index: gmp-5.0.3/longlong.h
+===================================================================
+--- gmp-5.0.3.orig/longlong.h
++++ gmp-5.0.3/longlong.h
+@@ -994,8 +994,10 @@ extern UWtype __MPN(udiv_qrnnd) _PROTO (
     count is only an int. */
  #define count_trailing_zeros(count, x)					\
    do {									\
diff --git a/meta/recipes-support/gmp/gmp/configure.patch b/meta/recipes-support/gmp/gmp/configure.patch
index 638fead..7597a93 100644
--- a/meta/recipes-support/gmp/gmp/configure.patch
+++ b/meta/recipes-support/gmp/gmp/configure.patch
@@ -4,11 +4,11 @@ Upstream-Status: Pending
  configure.in |   24 +++++++++---------------
  2 files changed, 23 insertions(+), 27 deletions(-)
 
-Index: gmp-5.0.1/acinclude.m4
+Index: gmp-5.0.3/acinclude.m4
 ===================================================================
---- gmp-5.0.1.orig/acinclude.m4
-+++ gmp-5.0.1/acinclude.m4
-@@ -30,20 +30,20 @@ dnl    a_out.exe - OpenVMS DEC C called 
+--- gmp-5.0.3.orig/acinclude.m4
++++ gmp-5.0.3/acinclude.m4
+@@ -30,29 +30,29 @@ dnl    a_out.exe - OpenVMS DEC C called 
  dnl    conftest.exe - various DOS compilers
  
  
@@ -28,12 +28,24 @@ Index: gmp-5.0.1/acinclude.m4
 +define([POWERPC64_PATTERN],
  [[powerpc64-*-* | powerpc64le-*-* | powerpc620-*-* | powerpc630-*-* | powerpc970-*-* | power[3-9]-*-*]])
  
+-define(S390_PATTERN,
++define([S390_PATTERN],
+ [[s390-*-* | z900esa-*-* | z990esa-*-* | z9esa-*-* | z10esa-*-* | z196esa-*-*]])
+ 
+-define(S390X_PATTERN,
++define([S390X_PATTERN],
+ [[s390x-*-* | z900-*-* | z990-*-* | z9-*-* | z10-*-* | z196-*-*]])
+ 
 -define(X86_PATTERN,
 +define([X86_PATTERN],
  [[i?86*-*-* | k[5-8]*-*-* | pentium*-*-* | athlon-*-* | viac3*-*-* | geode*-*-* | atom-*-*]])
  
- define(X86_64_PATTERN,
-@@ -64,7 +64,7 @@ dnl      x86         ->  x86
+-define(X86_64_PATTERN,
++define([X86_64_PATTERN],
+ [[athlon64-*-* | k8-*-* | k10-*-* | bobcat-*-* | bulldozer-*-* | pentium4-*-* | atom-*-* | core2-*-* | corei*-*-* | x86_64-*-* | nano-*-*]])
+ 
+ dnl  GMP_FAT_SUFFIX(DSTVAR, DIRECTORY)
+@@ -70,7 +70,7 @@ dnl      x86         ->  x86
  dnl      x86/k6      ->  k6
  dnl      x86/k6/mmx  ->  k6_mmx
  
@@ -42,7 +54,7 @@ Index: gmp-5.0.1/acinclude.m4
  [[$1=`echo $2 | sed -e '/\//s:^[^/]*/::' -e 's:[\\/]:_:g'`]])
  
  
-@@ -73,7 +73,7 @@ dnl  ----------------------------------
+@@ -79,7 +79,7 @@ dnl  ----------------------------------
  dnl  Emit code to remove any occurrence of ITEM from $LISTVAR.  ITEM can be a
  dnl  shell expression like $foo if desired.
  
@@ -51,7 +63,7 @@ Index: gmp-5.0.1/acinclude.m4
  [remove_from_list_tmp=
  for remove_from_list_i in $[][$1]; do
    if test $remove_from_list_i = [$2]; then :;
-@@ -89,12 +89,12 @@ dnl  GMP_STRIP_PATH(subdir)
+@@ -95,12 +95,12 @@ dnl  GMP_STRIP_PATH(subdir)
  dnl  ----------------------
  dnl  Strip entries */subdir from $path and $fat_path.
  
@@ -66,7 +78,7 @@ Index: gmp-5.0.1/acinclude.m4
  [tmp_path=
  for i in $[][$1]; do
    case $i in
-@@ -115,7 +115,7 @@ dnl
+@@ -121,7 +121,7 @@ dnl
  dnl  Dummy value for GMP_LIMB_BITS is enough
  dnl  for all current configure-time uses of gmp.h.
  
@@ -75,7 +87,7 @@ Index: gmp-5.0.1/acinclude.m4
  [[#define __GMP_WITHIN_CONFIGURE 1   /* ignore template stuff */
  #define GMP_NAIL_BITS $GMP_NAIL_BITS
  #define GMP_LIMB_BITS 123
-@@ -130,7 +130,7 @@ dnl  Expand at autoconf time to the valu
+@@ -136,7 +136,7 @@ dnl  Expand at autoconf time to the valu
  dnl  FILE.  The regexps here aren't very rugged, but are enough for gmp.
  dnl  /dev/null as a parameter prevents a hang if $2 is accidentally omitted.
  
@@ -84,7 +96,7 @@ Index: gmp-5.0.1/acinclude.m4
  [patsubst(patsubst(
  esyscmd([grep "^#define $1 " $2 /dev/null 2>/dev/null]),
  [^.*$1[ 	]+],[]),
-@@ -144,7 +144,7 @@ dnl  The gmp version number, extracted f
+@@ -150,7 +150,7 @@ dnl  The gmp version number, extracted f
  dnl  autoconf time.  Two digits like 3.0 if patchlevel <= 0, or three digits
  dnl  like 3.0.1 if patchlevel > 0.
  
@@ -93,7 +105,7 @@ Index: gmp-5.0.1/acinclude.m4
  [GMP_HEADER_GETVAL(__GNU_MP_VERSION,gmp-h.in)[]dnl
  .GMP_HEADER_GETVAL(__GNU_MP_VERSION_MINOR,gmp-h.in)[]dnl
  .GMP_HEADER_GETVAL(__GNU_MP_VERSION_PATCHLEVEL,gmp-h.in)])
-@@ -1506,7 +1506,9 @@ esac
+@@ -1512,7 +1512,9 @@ esac
  echo ["define(<CONFIG_TOP_SRCDIR>,<\`$tmp'>)"] >>$gmp_tmpconfigm4
  
  # All CPUs use asm-defs.m4
@@ -104,13 +116,13 @@ Index: gmp-5.0.1/acinclude.m4
  ])
  
  
-Index: gmp-5.0.1/configure.in
+Index: gmp-5.0.3/configure.in
 ===================================================================
---- gmp-5.0.1.orig/configure.in
-+++ gmp-5.0.1/configure.in
+--- gmp-5.0.3.orig/configure.in
++++ gmp-5.0.3/configure.in
 @@ -29,12 +29,6 @@ AC_REVISION($Revision$)
  AC_PREREQ(2.59)
- AC_INIT(GNU MP, GMP_VERSION, gmp-bugs@gmplib.org, gmp)
+ AC_INIT(GNU MP, GMP_VERSION, [gmp-bugs@gmplib.org, see http://gmplib.org/manual/Reporting-Bugs.html], gmp)
  AC_CONFIG_SRCDIR(gmp-impl.h)
 -m4_pattern_forbid([^[ \t]*GMP_])
 -m4_pattern_allow(GMP_LDFLAGS)
@@ -121,7 +133,7 @@ Index: gmp-5.0.1/configure.in
  
  # If --target is not used then $target_alias is empty, but if say
  # "./configure athlon-pc-freebsd3.5" is used, then all three of
-@@ -303,7 +297,7 @@ AH_VERBATIM([HAVE_HOST_CPU_1],
+@@ -311,7 +305,7 @@ AH_VERBATIM([HAVE_HOST_CPU_1],
  # After GMP specific searches and tests, the standard autoconf AC_PROG_CC is
  # called.  User selections of CC etc are respected.
  #
@@ -130,7 +142,7 @@ Index: gmp-5.0.1/configure.in
  # pre-testing, since they of course depend on AC_PROG_CC, and also some of
  # them cache their results, which is not wanted.
  #
-@@ -395,7 +389,7 @@ abilist="standard"
+@@ -403,7 +397,7 @@ abilist="standard"
  # FIXME: We'd like to prefer an ANSI compiler, perhaps by preferring
  # c89 over cc here.  But note that on HP-UX c89 provides a castrated
  # environment, and would want to be excluded somehow.  Maybe
@@ -139,7 +151,7 @@ Index: gmp-5.0.1/configure.in
  # we don't need to worry.
  #
  cclist="gcc cc"
-@@ -1580,7 +1574,7 @@ esac
+@@ -1666,7 +1660,7 @@ esac
  CFLAGS_or_unset=${CFLAGS-'(unset)'}
  CPPFLAGS_or_unset=${CPPFLAGS-'(unset)'}
  
@@ -148,7 +160,7 @@ Index: gmp-5.0.1/configure.in
  User:
  ABI=$ABI
  CC=$CC
-@@ -1987,7 +1981,6 @@ AC_SUBST(DEFN_LONG_LONG_LIMB)
+@@ -2073,7 +2067,6 @@ AC_SUBST(DEFN_LONG_LONG_LIMB)
  
  # The C compiler and preprocessor, put into ANSI mode if possible.
  AC_PROG_CC
@@ -156,7 +168,7 @@ Index: gmp-5.0.1/configure.in
  AC_PROG_CPP
  GMP_H_ANSI
  
-@@ -2010,11 +2003,11 @@ AC_SUBST(CCAS)
+@@ -2096,11 +2089,11 @@ AC_SUBST(CCAS)
  
  # The C++ compiler, if desired.
  want_cxx=no
@@ -170,7 +182,7 @@ Index: gmp-5.0.1/configure.in
    cxxflags_ac_prog_cxx=$CXXFLAGS
    cxxflags_list=ac_prog_cxx
  
-@@ -2120,7 +2113,7 @@ case $host in
+@@ -2206,7 +2199,7 @@ case $host in
  esac
  
  
@@ -179,7 +191,7 @@ Index: gmp-5.0.1/configure.in
  Decided:
  ABI=$ABI
  CC=$CC
-@@ -3376,7 +3369,7 @@ GMP_FINISH
+@@ -3465,7 +3458,7 @@ GMP_FINISH
  # FIXME: Upcoming version of autoconf/automake may not like broken lines.
  #        Right now automake isn't accepting the new AC_CONFIG_FILES scheme.
  
@@ -188,7 +200,7 @@ Index: gmp-5.0.1/configure.in
    mpbsd/Makefile mpf/Makefile mpn/Makefile mpq/Makefile			\
    mpz/Makefile printf/Makefile scanf/Makefile cxx/Makefile		\
    tests/Makefile tests/devel/Makefile tests/mpbsd/Makefile		\
-@@ -3385,4 +3378,5 @@ AC_OUTPUT(Makefile							\
+@@ -3474,4 +3467,5 @@ AC_OUTPUT(Makefile							\
    tests/cxx/Makefile							\
    doc/Makefile tune/Makefile						\
    demos/Makefile demos/calc/Makefile demos/expr/Makefile		\
diff --git a/meta/recipes-support/gmp/gmp/sh4-asmfix.patch b/meta/recipes-support/gmp/gmp/sh4-asmfix.patch
deleted file mode 100644
index ac25110..0000000
--- a/meta/recipes-support/gmp/gmp/sh4-asmfix.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
---- gmp-4.1.4/mpn/sh/add_n.s	2005/11/17 08:44:00	1.1
-+++ gmp-4.1.4/mpn/sh/add_n.s	2005/11/17 08:18:57
-@@ -29,8 +29,8 @@
- 
- 	.text
- 	.align 2
--	.global	___gmpn_add_n
--___gmpn_add_n:
-+	.global	__gmpn_add_n
-+__gmpn_add_n:
- 	mov	#0,r3		! clear cy save reg
- 
- Loop:	mov.l	@r5+,r1
---- gmp-4.1.4/mpn/sh/sub_n.s	2005/11/17 08:44:04	1.1
-+++ gmp-4.1.4/mpn/sh/sub_n.s	2005/11/17 08:18:59
-@@ -29,8 +29,8 @@
- 
- 	.text
- 	.align 2
--	.global	___gmpn_sub_n
--___gmpn_sub_n:
-+	.global	__gmpn_sub_n
-+__gmpn_sub_n:
- 	mov	#0,r3		! clear cy save reg
- 
- Loop:	mov.l	@r5+,r1
diff --git a/meta/recipes-support/gmp/gmp_5.0.2.bb b/meta/recipes-support/gmp/gmp_5.0.3.bb
similarity index 57%
rename from meta/recipes-support/gmp/gmp_5.0.2.bb
rename to meta/recipes-support/gmp/gmp_5.0.3.bb
index d39e500..9f37943 100644
--- a/meta/recipes-support/gmp/gmp_5.0.2.bb
+++ b/meta/recipes-support/gmp/gmp_5.0.3.bb
@@ -2,14 +2,13 @@ require gmp.inc
 LICENSE="LGPLv3&GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
-PR = "r4"
+PR = "r0"
 
-SRC_URI_append += "file://sh4-asmfix.patch \
-                   file://gmp_bugfix.patch \
+SRC_URI_append += "file://gmp_bugfix.patch \
                    file://use-includedir.patch \
                    file://gmp_fix_for_x32.patch"
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 
-SRC_URI[md5sum] = "0bbaedc82fb30315b06b1588b9077cd3"
-SRC_URI[sha256sum] = "dbc2db76fdd4e99f85d5e35aa378ed62c283e0d586b91bd8703aff75a7804c28"
+SRC_URI[md5sum] = "8061f765cc86b9765921a0c800615804"
+SRC_URI[sha256sum] = "dcafe9989c7f332b373e1f766af8e9cd790fc802fdec422a1910a6ef783480e3"
-- 
1.7.6.4



