Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 754F178EFF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2018 05:41:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9K5eq3E024402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 22:41:08 -0700
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 19 Oct 2018 22:41:02 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 20 Oct 2018 01:40:26 -0400
Message-ID: <20181020054026.9619-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20181020054026.9619-1-Randy.MacLeod@windriver.com>
References: <20181020054026.9619-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2] valgrind: update from 3.13.0 to 3.14.0
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
X-List-Received-Date: Sat, 20 Oct 2018 05:41:17 -0000
Content-Type: text/plain

The removed patches are all upstream.
Adjusted two patches due to rebase.
Guard against __GLIBC_PREREQ for musl libc

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...against-__GLIBC_PREREQ-for-musl-libc.patch | 36 ++++++++
 ...se-ucontext_t-instead-of-struct-ucon.patch | 30 -------
 ...ntext-APIs-are-not-available-on-musl.patch | 17 ++--
 ...-inline-asm-in-tests-on-mips32-linux.patch | 47 ----------
 .../0004-Fix-out-of-tree-builds.patch         | 49 ++++++-----
 .../valgrind/valgrind/link-gz-tests.patch     | 27 ------
 ...sk-CPUID-support-in-HWCAP-on-aarch64.patch | 36 --------
 .../valgrind/valgrind/ppc-headers.patch       | 87 -------------------
 ...{valgrind_3.13.0.bb => valgrind_3.14.0.bb} | 12 +--
 9 files changed, 77 insertions(+), 264 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-fix-broken-inline-asm-in-tests-on-mips32-linux.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/link-gz-tests.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/mask-CPUID-support-in-HWCAP-on-aarch64.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.13.0.bb => valgrind_3.14.0.bb} (91%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
new file mode 100644
index 0000000000..3efe65a940
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
@@ -0,0 +1,36 @@
+From 1b5b6f827ac1153a41fc93e78bf34ccdf5720b9b Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Fri, 19 Oct 2018 10:31:12 -0400
+Subject: [PATCH] Guard against __GLIBC_PREREQ for musl libc
+
+Upstream-Status: Pending
+
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ memcheck/tests/linux/sys-statx.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/memcheck/tests/linux/sys-statx.c b/memcheck/tests/linux/sys-statx.c
+index fe9f9ba45..473c2cd7f 100644
+--- a/memcheck/tests/linux/sys-statx.c
++++ b/memcheck/tests/linux/sys-statx.c
+@@ -7,11 +7,16 @@
+ #include <assert.h>
+ #include <string.h>
+ #include <sys/syscall.h>
++
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if __GLIBC_PREREQ(2,28)
+ /* struct statx provided in sys/stat.h */
+ #else
+ #include <linux/stat.h>
+ #endif
++#else
++#include <linux/stat.h>
++#endif
+ #include <errno.h>
+ 
+ int check_stat2;
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch
deleted file mode 100644
index bf16a1adfe..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 629ac492b1d9bc709d17337eb9b1c28603eca250 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 28 Jun 2017 11:01:25 -0700
-Subject: [PATCH] memcheck/tests: Use ucontext_t instead of struct ucontext
-
-glibc 2.26 does not expose struct ucontext anymore
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=381769]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- memcheck/tests/linux/stack_changes.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/memcheck/tests/linux/stack_changes.c b/memcheck/tests/linux/stack_changes.c
-index ffb49c6..acc4109 100644
---- a/memcheck/tests/linux/stack_changes.c
-+++ b/memcheck/tests/linux/stack_changes.c
-@@ -11,7 +11,7 @@
- // checks that Valgrind notices their stack changes properly.
- 
- #ifdef __GLIBC__
--typedef  struct ucontext  mycontext;
-+typedef ucontext_t  mycontext;
- 
- mycontext ctx1, ctx2, oldc;
- int count;
--- 
-2.13.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
index 3f9f33b487..480fe33247 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
@@ -1,17 +1,20 @@
-From 862b807076d57f2f58ed9d572ddac8bb402774a2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 10 Jun 2017 01:01:10 -0700
-Subject: [PATCH 2/6] context APIs are not available on musl
+From bd4e926e7e14747b3cd4d7b2a1bd5410b22f3ea2 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Tue, 16 Oct 2018 21:27:46 -0400
+Subject: [PATCH] context APIs are not available on musl
 
 Upstream-Status: Pending
 
+Updated patch for valgrind-3.14
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 ---
  memcheck/tests/linux/stack_changes.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/memcheck/tests/linux/stack_changes.c b/memcheck/tests/linux/stack_changes.c
-index a978fc2..ffb49c6 100644
+index 7f97b90a5..a26cb4ae6 100644
 --- a/memcheck/tests/linux/stack_changes.c
 +++ b/memcheck/tests/linux/stack_changes.c
 @@ -10,6 +10,7 @@
@@ -19,7 +22,7 @@ index a978fc2..ffb49c6 100644
  // checks that Valgrind notices their stack changes properly.
  
 +#ifdef __GLIBC__
- typedef  struct ucontext  mycontext;
+ typedef  ucontext_t  mycontext;
  
  mycontext ctx1, ctx2, oldc;
 @@ -51,9 +52,11 @@ int init_context(mycontext *uc)
@@ -45,5 +48,5 @@ index a978fc2..ffb49c6 100644
      return 0;
  }
 -- 
-2.13.1
+2.17.0
 
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-fix-broken-inline-asm-in-tests-on-mips32-linux.patch b/meta/recipes-devtools/valgrind/valgrind/0002-fix-broken-inline-asm-in-tests-on-mips32-linux.patch
deleted file mode 100644
index 6df295f8a2..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0002-fix-broken-inline-asm-in-tests-on-mips32-linux.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 63ce36396348e7c4c021cffa652d2e3d20f7963a Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 27 Jul 2018 17:51:54 +0800
-Subject: [PATCH 2/2] fix broken inline asm in tests on mips32-linux
-
-While build tests(`make check') with gcc 8.1.0 on mips32-linux,
-there is a failure
-[snip]
-|mips-wrsmllib32-linux-gcc  -meb -mabi=32 -mhard-float -march=mips32
--c -o tc08_hbl2-tc08_hbl2.o `test -f 'tc08_hbl2.c' || echo '../../../
-valgrind-3.13.0/helgrind/tests/'`tc08_hbl2.c
-|/tmp/cc37aJxQ.s: Assembler messages:
-|/tmp/cc37aJxQ.s:275: Error: symbol `L1xyzzy1main' is already defined
-|Makefile:1323: recipe for target 'tc08_hbl2-tc08_hbl2.o' failed
-[snip]
-
-Remove the duplicated L1xyzzy1main, and use local symbol to replace.
-http://tigcc.ticalc.org/doc/gnuasm.html#SEC46
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=396906]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- helgrind/tests/tc08_hbl2.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/helgrind/tests/tc08_hbl2.c b/helgrind/tests/tc08_hbl2.c
-index 2a757a008..f660d82dd 100644
---- a/helgrind/tests/tc08_hbl2.c
-+++ b/helgrind/tests/tc08_hbl2.c
-@@ -121,12 +121,12 @@
- #elif defined(PLAT_mips32_linux) || defined(PLAT_mips64_linux)
- #  define INC(_lval,_lqual)                         \
-      __asm__ __volatile__ (                         \
--      "L1xyzzy1" _lqual":\n"                        \
-+      "1:\n"                                        \
-       "        move  $t0, %0\n"                     \
-       "        ll    $t1, 0($t0)\n"                 \
-       "        addiu $t1, $t1, 1\n"                 \
-       "        sc    $t1, 0($t0)\n"                 \
--      "        beqz  $t1, L1xyzzy1" _lqual          \
-+      "        beqz  $t1, 1b\n"                     \
-       : /*out*/ : /*in*/ "r"(&(_lval))              \
-       : /*trash*/ "t0", "t1", "memory"              \
-         )
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
index 39022d04ae..75bb0aa7cb 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
@@ -1,7 +1,7 @@
-From 739421e253e6eba3eb6438651822f80fa9c0502a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 15 Dec 2015 15:31:50 +0200
-Subject: [PATCH 1/2] Fix out of tree builds.
+From 8f916dcb395fe5a2429f2867ba4daf8ef3af073a Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Tue, 16 Oct 2018 21:01:04 -0400
+Subject: [PATCH] Fix out of tree builds.
 
 The paths to these files need to be fully specified in
 the out of tree build case. glibc-2.X.supp is a generated file so the full path
@@ -9,18 +9,21 @@ is deliberately not specified in that case.
 
 RP 2013/03/23
 
+Patch refreshed for valgrind-3.14.0.
+
 Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 ---
- configure.ac | 68 ++++++++++++++++++++++++++++++------------------------------
+ configure.ac | 68 ++++++++++++++++++++++++++--------------------------
  1 file changed, 34 insertions(+), 34 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3874296fde0b..7a5ba2c8557e 100644
+index c18ae5f2a..99667ce57 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -373,50 +373,50 @@ case "${host_os}" in
+@@ -392,50 +392,50 @@ case "${host_os}" in
  	     9.*)
  		  AC_MSG_RESULT([Darwin 9.x (${kernel}) / Mac OS X 10.5 Leopard])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_5, [Darwin / Mac OS X version])
@@ -85,16 +88,18 @@ index 3874296fde0b..7a5ba2c8557e 100644
 +		  DEFAULT_SUPP="$srcdir/darwin16.supp ${DEFAULT_SUPP}"
 +		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
  		  ;;
-              *) 
- 		  AC_MSG_RESULT([unsupported (${kernel})])
-@@ -428,13 +428,13 @@ case "${host_os}" in
-      solaris2.11*)
-         AC_MSG_RESULT([ok (${host_os})])
-         VGCONF_OS="solaris"
--        DEFAULT_SUPP="solaris11.supp ${DEFAULT_SUPP}"
-+        DEFAULT_SUPP="$srcdir/solaris11.supp ${DEFAULT_SUPP}"
+ 	     17.*)
+ 		  AC_MSG_RESULT([Darwin 17.x (${kernel}) / macOS 10.13 High Sierra])
+@@ -460,7 +460,7 @@ case "${host_os}" in
+                  DEFAULT_SUPP="solaris12.supp ${DEFAULT_SUPP}"
+                  ;;
+              *)
+-                 DEFAULT_SUPP="solaris11.supp ${DEFAULT_SUPP}"
++                 DEFAULT_SUPP="$srcdir/solaris11.supp ${DEFAULT_SUPP}"
+                  ;;
+ 	esac
          ;;
- 
+@@ -468,7 +468,7 @@ case "${host_os}" in
       solaris2.12*)
          AC_MSG_RESULT([ok (${host_os})])
          VGCONF_OS="solaris"
@@ -103,7 +108,7 @@ index 3874296fde0b..7a5ba2c8557e 100644
          ;;
  
       *) 
-@@ -982,29 +982,29 @@ AC_MSG_CHECKING([the glibc version])
+@@ -1051,29 +1051,29 @@ AC_MSG_CHECKING([the glibc version])
  case "${GLIBC_VERSION}" in
       2.2)
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
@@ -143,7 +148,7 @@ index 3874296fde0b..7a5ba2c8557e 100644
  	;;
       2.*)
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
-@@ -1013,8 +1013,8 @@ case "${GLIBC_VERSION}" in
+@@ -1082,8 +1082,8 @@ case "${GLIBC_VERSION}" in
  	AC_DEFINE([GLIBC_MANDATORY_INDEX_AND_STRLEN_REDIRECT], 1,
  		  [Define to 1 if index() and strlen() have been optimized heavily (x86 glibc >= 2.12)])
  	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
@@ -154,7 +159,7 @@ index 3874296fde0b..7a5ba2c8557e 100644
  	;;
       darwin)
  	AC_MSG_RESULT(Darwin)
-@@ -1024,7 +1024,7 @@ case "${GLIBC_VERSION}" in
+@@ -1093,7 +1093,7 @@ case "${GLIBC_VERSION}" in
       bionic)
  	AC_MSG_RESULT(Bionic)
  	AC_DEFINE([BIONIC_LIBC], 1, [Define to 1 if you're using Bionic])
@@ -163,7 +168,7 @@ index 3874296fde0b..7a5ba2c8557e 100644
  	;;
       solaris)
  	AC_MSG_RESULT(Solaris)
-@@ -1051,11 +1051,11 @@ if test "$VGCONF_OS" != "solaris"; then
+@@ -1120,11 +1120,11 @@ if test "$VGCONF_OS" != "solaris"; then
      # attempt to detect whether such libraries are installed on the
      # build machine (or even if any X facilities are present); just
      # add the suppressions antidisirregardless.
@@ -179,5 +184,5 @@ index 3874296fde0b..7a5ba2c8557e 100644
  
  
 -- 
-2.13.2.3.g44cd85c14
+2.17.0
 
diff --git a/meta/recipes-devtools/valgrind/valgrind/link-gz-tests.patch b/meta/recipes-devtools/valgrind/valgrind/link-gz-tests.patch
deleted file mode 100644
index db322398c2..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/link-gz-tests.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-When checking if the compiler supports compressed debug sections we need to
-actually link instead of just compile.  Otherwise the compiler thinks that
-they are supported, but gold does not support -gz=zlib.
-
-Upstream-Status: Backport (r16459)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
---- a/configure.ac~	2017-07-11 11:53:16.000000000 +0100
-+++ b/configure.ac	2017-07-11 18:16:13.674130483 +0100
-@@ -2119,7 +2119,7 @@
- safe_CFLAGS=$CFLAGS
- CFLAGS="-g -gz=zlib"
- 
--AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[ ]], [[
-+AC_LINK_IFELSE([AC_LANG_PROGRAM([[ ]], [[
-   return 0;
- ]])], [
- ac_have_gz_zlib=yes
-@@ -2139,7 +2139,7 @@
- safe_CFLAGS=$CFLAGS
- CFLAGS="-g -gz=zlib-gnu"
- 
--AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[ ]], [[
-+AC_LINK_IFELSE([AC_LANG_PROGRAM([[ ]], [[
-   return 0;
- ]])], [
- ac_have_gz_zlib_gnu=yes
diff --git a/meta/recipes-devtools/valgrind/valgrind/mask-CPUID-support-in-HWCAP-on-aarch64.patch b/meta/recipes-devtools/valgrind/valgrind/mask-CPUID-support-in-HWCAP-on-aarch64.patch
deleted file mode 100644
index 89a95b82fe..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/mask-CPUID-support-in-HWCAP-on-aarch64.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fix runtime Valgrind failure
-
-This patch is derived from
-https://bugzilla.redhat.com/show_bug.cgi?id=1464211
-
-At runtime it will fails like this:
-
-ARM64 front end: branch_etc
-disInstr(arm64): unhandled instruction 0xD5380001
-disInstr(arm64): 1101'0101 0011'1000 0000'0000 0000'0001 ==2082==
-valgrind: Unrecognised instruction at address 0x4014e64.
-
-This patch is a workaround by masking all HWCAP
-
-Upstream-Status: Pending
-
-Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
-
-Index: valgrind-3.13.0/coregrind/m_initimg/initimg-linux.c
-===================================================================
-
---- valgrind-3.13.0.orig/coregrind/m_initimg/initimg-linux.c   2018-03-04 22:22:17.698572675 -0800
-+++ valgrind-3.13.0/coregrind/m_initimg/initimg-linux.c        2018-03-04 22:23:25.727815624 -0800
-@@ -703,6 +703,12 @@
-                   (and anything above) are not supported by Valgrind. */
-                auxv->u.a_val &= VKI_HWCAP_S390_TE - 1;
-             }
-+#           elif defined(VGP_arm64_linux)
-+            {
-+               /* Linux 4.11 started populating this for arm64, but we
-+                  currently don't support any. */
-+               auxv->u.a_val = 0;
-+            }
- #           endif
-             break;
- #        if defined(VGP_ppc64be_linux) || defined(VGP_ppc64le_linux)
diff --git a/meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch b/meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch
deleted file mode 100644
index 51259db001..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/ppc-headers.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-Backport a patch from upstream to fix test compilation for PPC where
-system headers don't get included.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-r16450 | mjw | 2017-06-16 10:33:35 +0100 (Fri, 16 Jun 2017) | 7 lines
-
-ppc64 doesn't compile test_isa_2_06_partx.c without VSX support
-
-The #ifdef HAS_VSX guard is wrongly placed. It makes the standard
-include headers not be used. Causing a build failure. Fix by moving
-the #ifdef HAS_VSX after the standard includes.
-
-Index: none/tests/ppc32/test_isa_2_06_part3.c
-===================================================================
---- a/none/tests/ppc32/test_isa_2_06_part3.c	(revision 16449)
-+++ b/none/tests/ppc32/test_isa_2_06_part3.c	(revision 16450)
-@@ -20,17 +20,18 @@
-  The GNU General Public License is contained in the file COPYING.
-  */
- 
--#ifdef HAS_VSX
--
- #include <stdio.h>
- #include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
- #include <malloc.h>
--#include <altivec.h>
- #include <math.h>
- #include <unistd.h>    // getopt
- 
-+#ifdef HAS_VSX
-+
-+#include <altivec.h>
-+
- #ifndef __powerpc64__
- typedef uint32_t HWord_t;
- #else
-Index: none/tests/ppc32/test_isa_2_06_part1.c
-===================================================================
---- a/none/tests/ppc32/test_isa_2_06_part1.c	(revision 16449)
-+++ b/none/tests/ppc32/test_isa_2_06_part1.c	(revision 16450)
-@@ -20,13 +20,14 @@
-  The GNU General Public License is contained in the file COPYING.
-  */
- 
--#ifdef HAS_VSX
--
- #include <stdio.h>
- #include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
- #include <malloc.h>
-+
-+#ifdef HAS_VSX
-+
- #include <altivec.h>
- 
- #ifndef __powerpc64__
-Index: none/tests/ppc32/test_isa_2_06_part2.c
-===================================================================
---- a/none/tests/ppc32/test_isa_2_06_part2.c	(revision 16449)
-+++ b/none/tests/ppc32/test_isa_2_06_part2.c	(revision 16450)
-@@ -20,17 +20,18 @@
-  The GNU General Public License is contained in the file COPYING.
-  */
- 
--#ifdef HAS_VSX
--
- #include <stdio.h>
- #include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
- #include <malloc.h>
--#include <altivec.h>
- #include <math.h>
- #include <unistd.h>    // getopt
- 
-+#ifdef HAS_VSX
-+
-+#include <altivec.h>
-+
- #ifndef __powerpc64__
- typedef uint32_t HWord_t;
- #else
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
similarity index 91%
rename from meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
index 39ec6f5cc8..2fa529516b 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} \
         "
 
-SRC_URI = "ftp://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
+SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://run-ptest \
@@ -30,18 +30,14 @@ SRC_URI = "ftp://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0004-pth_atfork1.c-Define-error-API-for-musl.patch \
            file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
            file://0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch \
-           file://0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch \
            file://0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch \
            file://0002-memcheck-x86-Define-__THROW-if-not-defined.patch \
            file://0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch \
-           file://link-gz-tests.patch \
-           file://ppc-headers.patch \
-           file://mask-CPUID-support-in-HWCAP-on-aarch64.patch \
            file://0001-fix-opcode-not-supported-on-mips32-linux.patch \
-           file://0002-fix-broken-inline-asm-in-tests-on-mips32-linux.patch \
+           file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
            "
-SRC_URI[md5sum] = "817dd08f1e8a66336b9ff206400a5369"
-SRC_URI[sha256sum] = "d76680ef03f00cd5e970bbdcd4e57fb1f6df7d2e2c071635ef2be74790190c3b"
+SRC_URI[md5sum] = "74175426afa280184b62591b58c671b3"
+SRC_URI[sha256sum] = "037c11bfefd477cc6e9ebe8f193bb237fe397f7ce791b4a4ce3fa1c6a520baa5"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
-- 
2.17.0


