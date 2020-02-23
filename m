Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD6C616C3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 19:34:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Qb3k3dRjz4J;
	Sun, 23 Feb 2020 20:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582486450;
	bh=mrANx8LwvvvFPCJ/lQJ2svIcSv9cukItOguez6SSOZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jQs3XWCfyLDhI/5YqCznL4I/DSDpcFMt8sfcW0QDcCiR/S+InjywMuZ4f0rsbW2wp
	5+uCebKx1aDbLbbcAOWJVVW1EDQZcpyihvJLe7nbcGyiIqXhHheyJSRDYylW+GqtJs
	KYqTFej5e7pp8SDkwln317lxaDlmVWxJYvG92taGI0ym76WgEIznzOwN+u/+JrSQB7
	pRBzPXg+Tfj6/CysJ7dm/SMdGbpaho3haOWr2k7EgTPHKQo6z+ZEH74QRUc/3u152P
	YJOjOTD2Frdi2KXJ2YRvMvW4628CD9bgcKWk4IxKXe5shfh26B2sFKwqDoTNPZPC6t
	edrS8bsMKetVjcVvdK5Jhom22YD3WMoRKDDyMYp/3rd0VASI/1HYkafW54m1F+7UDi
	pBwx3NV1/ofpL14AYx7kWHasw/aP0KdJz5o8xcpzUovZg8598zdUuMayxuOEdhEhBC
	k5xQRiiNHdcw2kreiIrPo4MnnXWMhyGPIINr79kh5T86BW+jexEiktqVe1RQsI2QX1
	2Z85bHr31GgJDGg3/I0stdQhiEd5kj+du801oFQK1i98GZIsziOkHiYDwS22v4xmPX
	/BwfhElI1XnYlRw4cnFU2SacdLZfktY9aZa5GgGQKFjh+Lg9qtWXcdUxExdgt7Rhi0
	rCFmzAVrO2hK0KdqUvaZ5nc8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 21:34:08 +0200
Message-Id: <20200223193408.5602-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223193408.5602-1-bunk@stusta.de>
References: <20200223193408.5602-1-bunk@stusta.de>
Subject: [RFC][PATCH 2/2] nspr: Move to meta-oe
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
X-List-Received-Date: Sun, 23 Feb 2020 19:34:13 -0000

It was used only by nss.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 .../nspr/0001-md-Fix-build-with-musl.patch    |  31 ---
 .../nspr/nspr/0002-Add-nios2-support.patch    | 102 ---------
 ...remove-_BUILD_STRING-and-_BUILD_TIME.patch | 103 ---------
 .../nspr/nspr/fix-build-on-x86_64.patch       |  52 -----
 meta/recipes-support/nspr/nspr/nspr.pc.in     |  11 -
 .../nspr/nspr/remove-rpath-from-tests.patch   |  26 ---
 .../remove-srcdir-from-configure-in.patch     |  19 --
 meta/recipes-support/nspr/nspr_4.25.bb        | 197 ------------------
 9 files changed, 542 deletions(-)
 delete mode 100644 meta/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
 delete mode 100644 meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
 delete mode 100644 meta/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
 delete mode 100644 meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
 delete mode 100644 meta/recipes-support/nspr/nspr/nspr.pc.in
 delete mode 100644 meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
 delete mode 100644 meta/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
 delete mode 100644 meta/recipes-support/nspr/nspr_4.25.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e4b710d640..874c595f0d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -525,7 +525,6 @@ RECIPE_MAINTAINER_pn-nfs-export-root = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-nfs-utils = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ninja = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-npth = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-nspr = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-ofono = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-opensbi = "Alistair Francis <alistair.francis@wdc.com>"
diff --git a/meta/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch b/meta/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
deleted file mode 100644
index f3cd670026..0000000000
--- a/meta/recipes-support/nspr/nspr/0001-md-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 147f3c2acbd96d44025cec11800ded0282327764 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 18 Sep 2017 17:22:43 -0700
-Subject: [PATCH] md: Fix build with musl
-
-The MIPS specific header <sgidefs.h> is not provided by musl
-linux kernel headers provide <asm/sgidefs.h> which has same definitions
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- pr/include/md/_linux.cfg | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
-index 640b19c..31296a8 100644
---- a/pr/include/md/_linux.cfg
-+++ b/pr/include/md/_linux.cfg
-@@ -499,7 +499,7 @@
- #elif defined(__mips__)
- 
- /* For _ABI64 */
--#include <sgidefs.h>
-+#include <asm/sgidefs.h>
- 
- #ifdef __MIPSEB__
- #define IS_BIG_ENDIAN 1
--- 
-2.14.1
-
diff --git a/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch b/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
deleted file mode 100644
index 3a04d426a8..0000000000
--- a/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 95bda64fb4cf1825fea745e918cfe8202843f0ba Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Sat, 30 Jan 2016 07:18:02 +0100
-Subject: [PATCH] Add nios2 support
-
-Add support for the nios2 CPU.
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=1244421 ]
----
- nspr/pr/include/md/_linux.cfg | 45 +++++++++++++++++++++++++++++++++++++++++++
- nspr/pr/include/md/_linux.h   | 14 ++++++++++++++
- 2 files changed, 59 insertions(+)
-
-Index: nspr/pr/include/md/_linux.cfg
-===================================================================
---- nspr.orig/pr/include/md/_linux.cfg
-+++ nspr/pr/include/md/_linux.cfg
-@@ -975,6 +975,51 @@
- #define PR_BYTES_PER_WORD_LOG2   2
- #define PR_BYTES_PER_DWORD_LOG2  3
- 
-+#elif defined(__nios2__)
-+
-+#define IS_LITTLE_ENDIAN    1
-+#undef  IS_BIG_ENDIAN
-+
-+#define PR_BYTES_PER_BYTE   1
-+#define PR_BYTES_PER_SHORT  2
-+#define PR_BYTES_PER_INT    4
-+#define PR_BYTES_PER_INT64  8
-+#define PR_BYTES_PER_LONG   4
-+#define PR_BYTES_PER_FLOAT  4
-+#define PR_BYTES_PER_DOUBLE 8
-+#define PR_BYTES_PER_WORD   4
-+#define PR_BYTES_PER_DWORD  8
-+
-+#define PR_BITS_PER_BYTE    8
-+#define PR_BITS_PER_SHORT   16
-+#define PR_BITS_PER_INT     32
-+#define PR_BITS_PER_INT64   64
-+#define PR_BITS_PER_LONG    32
-+#define PR_BITS_PER_FLOAT   32
-+#define PR_BITS_PER_DOUBLE  64
-+#define PR_BITS_PER_WORD    32
-+
-+#define PR_BITS_PER_BYTE_LOG2   3
-+#define PR_BITS_PER_SHORT_LOG2  4
-+#define PR_BITS_PER_INT_LOG2    5
-+#define PR_BITS_PER_INT64_LOG2  6
-+#define PR_BITS_PER_LONG_LOG2   5
-+#define PR_BITS_PER_FLOAT_LOG2  5
-+#define PR_BITS_PER_DOUBLE_LOG2 6
-+#define PR_BITS_PER_WORD_LOG2   5
-+
-+#define PR_ALIGN_OF_SHORT   2
-+#define PR_ALIGN_OF_INT     4
-+#define PR_ALIGN_OF_LONG    4
-+#define PR_ALIGN_OF_INT64   4
-+#define PR_ALIGN_OF_FLOAT   4
-+#define PR_ALIGN_OF_DOUBLE  4
-+#define PR_ALIGN_OF_POINTER 4
-+#define PR_ALIGN_OF_WORD    4
-+
-+#define PR_BYTES_PER_WORD_LOG2   2
-+#define PR_BYTES_PER_DWORD_LOG2  3
-+
- #elif defined(__or1k__)
- 
- #undef  IS_LITTLE_ENDIAN
-Index: nspr/pr/include/md/_linux.h
-===================================================================
---- nspr.orig/pr/include/md/_linux.h
-+++ nspr/pr/include/md/_linux.h
-@@ -55,6 +55,8 @@
- #define _PR_SI_ARCHITECTURE "avr32"
- #elif defined(__m32r__)
- #define _PR_SI_ARCHITECTURE "m32r"
-+#elif defined(__nios2__)
-+#define _PR_SI_ARCHITECTURE "nios2"
- #elif defined(__or1k__)
- #define _PR_SI_ARCHITECTURE "or1k"
- #elif defined(__riscv) && (__riscv_xlen == 32)
-@@ -129,6 +131,18 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRIn
- #define _MD_ATOMIC_SET                _PR_x86_64_AtomicSet
- #endif
- 
-+#if defined(__nios2__)
-+#if defined(__GNUC__)
-+/* Use GCC built-in functions */
-+#define _PR_HAVE_ATOMIC_OPS
-+#define _MD_INIT_ATOMIC()
-+#define _MD_ATOMIC_INCREMENT(ptr) __sync_add_and_fetch(ptr, 1)
-+#define _MD_ATOMIC_DECREMENT(ptr) __sync_sub_and_fetch(ptr, 1)
-+#define _MD_ATOMIC_ADD(ptr, i) __sync_add_and_fetch(ptr, i)
-+#define _MD_ATOMIC_SET(ptr, nv) __sync_lock_test_and_set(ptr, nv)
-+#endif
-+#endif
-+
- #if defined(__or1k__)
- #if defined(__GNUC__)
- /* Use GCC built-in functions */
diff --git a/meta/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch b/meta/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
deleted file mode 100644
index 90fe45f34d..0000000000
--- a/meta/recipes-support/nspr/nspr/Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 8a592e4ead4ed6befe6044da3dd2dc7523c33905 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Fri, 16 Nov 2018 13:52:49 +0800
-Subject: [PATCH] Makefile.in: remove _BUILD_STRING and _BUILD_TIME
-
-Remove _BUILD_STRING and _BUILD_TIME to avoid
-adding timestamp to _pl_bld.h which can result
-in adding timestamp in library file such as
-libnspr4.so.
- $ readelf --wide --decompress --hex-dump=.rodata libnspr4.so
- [snip]
-  0x00004000 32303138 2d31312d 31352030 353a3439 2018-11-15 05:49
- [snip]
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- lib/ds/Makefile.in        | 8 +-------
- lib/libc/src/Makefile.in  | 8 +-------
- lib/prstreams/Makefile.in | 8 +-------
- pr/src/Makefile.in        | 8 +-------
- 4 files changed, 4 insertions(+), 28 deletions(-)
-
-diff --git a/lib/ds/Makefile.in b/lib/ds/Makefile.in
-index e737791..b578476 100644
---- a/lib/ds/Makefile.in
-+++ b/lib/ds/Makefile.in
-@@ -114,13 +114,7 @@ GARBAGE += $(TINC)
- 
- $(TINC):
- 	@$(MAKE_OBJDIR)
--	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
--	@if test ! -z "$(SH_NOW)"; then \
--	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
--	else \
--	    true; \
--	fi
--	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
-+	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
- 
- 
- $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
-diff --git a/lib/libc/src/Makefile.in b/lib/libc/src/Makefile.in
-index e8a6d9f..978ed28 100644
---- a/lib/libc/src/Makefile.in
-+++ b/lib/libc/src/Makefile.in
-@@ -116,13 +116,7 @@ GARBAGE += $(TINC)
- 
- $(TINC):
- 	@$(MAKE_OBJDIR)
--	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
--	@if test ! -z "$(SH_NOW)"; then \
--	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
--	else \
--	    true; \
--	fi
--	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
-+	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
- 
- 
- $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
-diff --git a/lib/prstreams/Makefile.in b/lib/prstreams/Makefile.in
-index aeb2944..f318097 100644
---- a/lib/prstreams/Makefile.in
-+++ b/lib/prstreams/Makefile.in
-@@ -116,13 +116,7 @@ endif
- 
- $(TINC):
- 	@$(MAKE_OBJDIR)
--	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
--	@if test ! -z "$(SH_NOW)"; then \
--	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
--	else \
--	    true; \
--	fi
--	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
-+	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
- 
- 
- $(OBJDIR)/plvrsion.$(OBJ_SUFFIX): plvrsion.c $(TINC)
-diff --git a/pr/src/Makefile.in b/pr/src/Makefile.in
-index 19c5a69..b4ac31c 100644
---- a/pr/src/Makefile.in
-+++ b/pr/src/Makefile.in
-@@ -326,13 +326,7 @@ GARBAGE += $(TINC)
- 
- $(TINC):
- 	@$(MAKE_OBJDIR)
--	@$(ECHO) '#define _BUILD_STRING "$(SH_DATE)"' > $(TINC)
--	@if test ! -z "$(SH_NOW)"; then \
--	    $(ECHO) '#define _BUILD_TIME $(SH_NOW)$(SUF)' >> $(TINC); \
--	else \
--	    true; \
--	fi
--	@$(ECHO) '#define _PRODUCTION "$(PROD)"' >> $(TINC)
-+	@$(ECHO) '#define _PRODUCTION "$(PROD)"' > $(TINC)
- 
- 
- $(OBJDIR)/prvrsion.$(OBJ_SUFFIX): prvrsion.c $(TINC)
--- 
-2.7.4
-
diff --git a/meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch b/meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
deleted file mode 100644
index f12acc8548..0000000000
--- a/meta/recipes-support/nspr/nspr/fix-build-on-x86_64.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Fix build failure on x86_64
-
-When the target_cpu is x86_64, we should assume that the pkg uses 64bit,
-only if USE_N32 is set, we can assume that the pkg uses 32bit. It used a
-opposite logic before.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Upstream-Status: Pending
----
- configure.in |   12 ++++++------
- 1 files changed, 6 insertions(+), 6 deletions(-)
-
-Index: nspr/configure.in
-===================================================================
---- nspr.orig/configure.in
-+++ nspr/configure.in
-@@ -1875,28 +1875,24 @@ tools are selected during the Xcode/Deve
-         PR_MD_ASFILES=os_Linux_ia64.s
-         ;;
-     x86_64)
--        if test -n "$USE_64"; then
--            PR_MD_ASFILES=os_Linux_x86_64.s
--        elif test -n "$USE_X32"; then
-+        if test -n "$USE_X32"; then
-+            AC_DEFINE(i386)
-             PR_MD_ASFILES=os_Linux_x86_64.s
-             CC="$CC -mx32"
-             CXX="$CXX -mx32"
-         else
--            AC_DEFINE(i386)
--            PR_MD_ASFILES=os_Linux_x86.s
--            CC="$CC -m32"
--            CXX="$CXX -m32"
-+            PR_MD_ASFILES=os_Linux_x86_64.s
-         fi
-         ;;
-     ppc|powerpc)
-         PR_MD_ASFILES=os_Linux_ppc.s
-         ;;
-     powerpc64)
--        if test -n "$USE_64"; then
-+        if test -n "$USE_N32"; then
-+            PR_MD_ASFILES=os_Linux_ppc.s
-+        else
-             CC="$CC -m64"
-             CXX="$CXX -m64"
--        else
--            PR_MD_ASFILES=os_Linux_ppc.s
-         fi
-         ;;
-     esac    
diff --git a/meta/recipes-support/nspr/nspr/nspr.pc.in b/meta/recipes-support/nspr/nspr/nspr.pc.in
deleted file mode 100644
index 1f15d19cfa..0000000000
--- a/meta/recipes-support/nspr/nspr/nspr.pc.in
+++ /dev/null
@@ -1,11 +0,0 @@
-os_libs=-lpthread -ldl
-prefix=OEPREFIX
-exec_prefix=OEEXECPREFIX
-libdir=OELIBDIR
-includedir=OEINCDIR
-
-Name: NSPR
-Description: The Netscape Portable Runtime
-Version: NSPRVERSION
-Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl
-Cflags: -I${includedir}/nspr
diff --git a/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch b/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
deleted file mode 100644
index 7ba59ed644..0000000000
--- a/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Author: Andrei Gherzan <andrei@gherzan.ro>
-Date:   Thu Feb 9 00:03:38 2012 +0200
-
-Avoid QA warnings by removing hardcoded rpath from binaries.
-
-[...]
-WARNING: QA Issue: package nspr contains bad RPATH {builddir}/tmp/work/armv5te-poky-linux-gnueabi/nspr-4.8.9-r1/nspr-4.8.9/mozilla/nsprpub/pr/tests/../../dist/lib
-in file {builddir}/tmp/work/armv5te-poky-linux-gnueabi/nspr-4.8.9-r1/packages-split/nspr/usr/lib/nspr/tests/multiwait
-[...]
-
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-Upstream-Status: Pending
-
-Index: nspr/pr/tests/Makefile.in
-===================================================================
---- nspr.orig/pr/tests/Makefile.in
-+++ nspr/pr/tests/Makefile.in
-@@ -316,7 +316,7 @@ ifeq ($(OS_ARCH), SunOS)
- endif # SunOS
- 
- ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
--    LDOPTS += -Xlinker -rpath $(ABSOLUTE_LIB_DIR)
-+    LDOPTS += -Xlinker
-     ifeq ($(USE_PTHREADS),1)
-         EXTRA_LIBS = -lpthread
-     endif
diff --git a/meta/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch b/meta/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
deleted file mode 100644
index bde715c5dc..0000000000
--- a/meta/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-the $srcdir is not defined at the time of gnu-configurize.
-
-Upstream-Status: Inappropriate [OE-Core specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: nspr/configure.in
-===================================================================
---- nspr.orig/configure.in
-+++ nspr/configure.in
-@@ -8,7 +8,7 @@ AC_PREREQ(2.61)
- AC_INIT
- AC_CONFIG_SRCDIR([pr/include/nspr.h])
- 
--AC_CONFIG_AUX_DIR(${srcdir}/build/autoconf)
-+AC_CONFIG_AUX_DIR(build/autoconf)
- AC_CANONICAL_TARGET
- 
- dnl ========================================================
diff --git a/meta/recipes-support/nspr/nspr_4.25.bb b/meta/recipes-support/nspr/nspr_4.25.bb
deleted file mode 100644
index 1de26e1eed..0000000000
--- a/meta/recipes-support/nspr/nspr_4.25.bb
+++ /dev/null
@@ -1,197 +0,0 @@
-SUMMARY = "Netscape Portable Runtime Library"
-HOMEPAGE =  "http://www.mozilla.org/projects/nspr/"
-LICENSE = "GPL-2.0 | MPL-2.0 | LGPL-2.1"
-LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=6;md5=90c2fdee38e45d6302abcfe475c8b5c5 \
-                    file://Makefile.in;beginline=4;endline=38;md5=beda1dbb98a515f557d3e58ef06bca99"
-SECTION = "libs/network"
-
-SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
-           file://remove-rpath-from-tests.patch \
-           file://fix-build-on-x86_64.patch \
-           file://remove-srcdir-from-configure-in.patch \
-           file://0002-Add-nios2-support.patch \
-           file://0001-md-Fix-build-with-musl.patch \
-           file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
-           file://nspr.pc.in \
-"
-
-CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE \
-                                          -D_PR_HAVE_OFF64_T -D_PR_INET6 -D_PR_HAVE_INET_NTOP \
-                                          -D_PR_HAVE_GETHOSTBYNAME2 -D_PR_HAVE_GETADDRINFO \
-                                          -D_PR_INET6_PROBE -DNO_DLOPEN_NULL'"
-
-UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
-UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
-
-SRC_URI[md5sum] = "4ca4d75a424f30fcdc766296bb103d17"
-SRC_URI[sha256sum] = "0bc309be21f91da4474c56df90415101c7f0c7c7cab2943cd943cd7896985256"
-
-CVE_PRODUCT = "netscape_portable_runtime"
-
-S = "${WORKDIR}/nspr-${PV}/nspr"
-
-RDEPENDS_${PN}-dev += "perl"
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-TESTS = " \
-    accept \
-    acceptread \
-    acceptreademu \
-    affinity \
-    alarm \
-    anonfm \
-    atomic \
-    attach \
-    bigfile \
-    cleanup \
-    cltsrv  \
-    concur \
-    cvar \
-    cvar2 \
-    dlltest \
-    dtoa \
-    errcodes \
-    exit \
-    fdcach \
-    fileio \
-    foreign \
-    formattm \
-    fsync \
-    gethost \
-    getproto \
-    i2l \
-    initclk \
-    inrval \
-    instrumt \
-    intrio \
-    intrupt \
-    io_timeout \
-    ioconthr \
-    join \
-    joinkk \
-    joinku \
-    joinuk \
-    joinuu \
-    layer \
-    lazyinit \
-    libfilename \
-    lltest \
-    lock \
-    lockfile \
-    logfile \
-    logger \
-    many_cv \
-    multiwait \
-    nameshm1 \
-    nblayer \
-    nonblock \
-    ntioto \
-    ntoh \
-    op_2long \
-    op_excl \
-    op_filnf \
-    op_filok \
-    op_nofil \
-    parent \
-    parsetm \
-    peek \
-    perf \
-    pipeping \
-    pipeping2 \
-    pipeself \
-    poll_nm \
-    poll_to \
-    pollable \
-    prftest \
-    primblok \
-    provider \
-    prpollml \
-    ranfile \
-    randseed \
-    reinit \
-    rwlocktest \
-    sel_spd \
-    selct_er \
-    selct_nm \
-    selct_to \
-    selintr \
-    sema \
-    semaerr \
-    semaping \
-    sendzlf \
-    server_test \
-    servr_kk \
-    servr_uk \
-    servr_ku \
-    servr_uu \
-    short_thread \
-    sigpipe \
-    socket \
-    sockopt \
-    sockping \
-    sprintf \
-    stack \
-    stdio \
-    str2addr \
-    strod \
-    switch \
-    system \
-    testbit \
-    testfile \
-    threads \
-    timemac \
-    timetest \
-    tpd \
-    udpsrv \
-    vercheck \
-    version \
-    writev \
-    xnotify \
-    zerolen"
-
-inherit autotools multilib_script
-
-MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/nspr-config"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-
-# Do not install nspr in usr/include, but in usr/include/nspr, the
-# preferred path upstream.
-EXTRA_OECONF += "--includedir=${includedir}/nspr"
-
-do_compile_prepend() {
-	oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
-}
-
-do_compile_append() {
-	oe_runmake -C pr/tests
-}
-
-do_install_append() {
-    install -D ${WORKDIR}/nspr.pc.in ${D}${libdir}/pkgconfig/nspr.pc
-    sed -i  \
-    -e 's:NSPRVERSION:${PV}:g' \
-    -e 's:OEPREFIX:${prefix}:g' \
-    -e 's:OELIBDIR:${libdir}:g' \
-    -e 's:OEINCDIR:${includedir}:g' \
-    -e 's:OEEXECPREFIX:${exec_prefix}:g' \
-    ${D}${libdir}/pkgconfig/nspr.pc
-
-    mkdir -p ${D}${libdir}/nspr/tests
-    install -m 0755 ${S}/pr/tests/runtests.pl ${D}${libdir}/nspr/tests
-    install -m 0755 ${S}/pr/tests/runtests.sh ${D}${libdir}/nspr/tests
-    cd ${B}/pr/tests
-    install -m 0755 ${TESTS} ${D}${libdir}/nspr/tests
-
-    # delete compile-et.pl and perr.properties from ${bindir} because these are
-    # only used to generate prerr.c and prerr.h files from prerr.et at compile
-    # time
-    rm ${D}${bindir}/compile-et.pl ${D}${bindir}/prerr.properties
-}
-
-FILES_${PN} = "${libdir}/lib*.so"
-FILES_${PN}-dev = "${bindir}/* ${libdir}/nspr/tests/* ${libdir}/pkgconfig \
-                ${includedir}/* ${datadir}/aclocal/* "
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


