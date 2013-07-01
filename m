Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 08DFC6A463
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 04:03:03 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl14so4467710pab.20
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 21:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=W8Z/DoFCmqSrgC7WRycWN0Ac/j0xXn5k/p6Nyqo8914=;
	b=fBRKq8oZh5hsaS0GZjqz0fMmqyyvn5PQpi7JtMevJN6s7hh9eBZ6uD/N0SW9wy+bHX
	LsPHqvIPRpo7v6iqllWnYQbm3ZQMY4C2bU6C5g5j7kn9B9hnB59FKXjXA6xpEokF4zlo
	sGw3j0meNERyuMtkojWh8xcalUOHEqoP0Mp7i2FNFIIHbvxK/769x3Le/YnHgtIPrGkc
	+9S9J3boHo4BPnaO6jmSUhuYW4WTt7zsgTItGKSX+Tu47jKG8cInt7JZIe23cv4TY0X/
	8GMdZFMbJYjSM3ZBmYAMZ/hiMigrvIgIb/6RATHTSWeWcSlSyq2QmZ+NN1e96pJoTzX7
	wvWA==
X-Received: by 10.68.201.66 with SMTP id jy2mr21834710pbc.90.1372651384348;
	Sun, 30 Jun 2013 21:03:04 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	fp2sm19985171pbb.36.2013.06.30.21.03.03 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 30 Jun 2013 21:03:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2013 21:02:42 -0700
Message-Id: <25a3b549c1a24505f8d1f392c04ceb8af5f0ef32.1372651136.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372651136.git.raj.khem@gmail.com>
References: <cover.1372651136.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] uclibc: Update to latest git/master version
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
X-List-Received-Date: Mon, 01 Jul 2013 04:03:03 -0000

Use kernel cfg management infra to manage kconfig
fragments.

Add fragments for locale and obstrack and enable them
by default

Drop aplready applied patches

Drop DP = -1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-config.inc         |   12 ++++
 meta/recipes-core/uclibc/uclibc-git.inc            |    8 +--
 .../0001-add-posix_fadvise-for-arm.patch           |   68 +++++++++++++++++++
 .../0001-i386-sysdep.h-Remove-STABS_-macros.patch  |   71 --------------------
 ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |    9 ++-
 meta/recipes-core/uclibc/uclibc-git/locale.cfg     |    3 +
 meta/recipes-core/uclibc/uclibc-git/obstack.cfg    |    1 +
 .../uclibc/uclibc-git/powerpc_copysignl.patch      |   10 +--
 meta/recipes-core/uclibc/uclibc.inc                |    6 +-
 9 files changed, 102 insertions(+), 86 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-add-posix_fadvise-for-arm.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-i386-sysdep.h-Remove-STABS_-macros.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/locale.cfg
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/obstack.cfg

diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
index 0c7a0ce..8b9e41c 100644
--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -1,3 +1,5 @@
+DEPENDS += "kern-tools-native"
+inherit cml1
 #
 # Set the ARCH environment variable for uClibc compilation.
 # Return value must match one of the architectures known to uClibc:
@@ -128,3 +130,13 @@ def features_to_uclibc_conf(d):
 def features_to_uclibc_del(d):
     cnf, rem = features_to_uclibc_settings(d)
     return rem
+
+# returns all the elements from the src uri that are .cfg files
+def find_cfgs(d):
+    sources=src_patches(d, True)
+    sources_list=[]
+    for s in sources:
+        if s.endswith('.cfg'):
+            sources_list.append(s)
+
+    return sources_list
diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index db00ee6..dab243f 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,6 +1,4 @@
-SRCREV="946799cd0ce0c6c803c9cb173a84f4d607bde350"
-
-DEFAULT_PREFERENCE = "-1"
+SRCREV="c2c684f88157f8bd0c236c7546f922fbf66b64a1"
 
 PV = "0.9.33+git${SRCPV}"
 PR = "${INC_PR}.4"
@@ -10,6 +8,8 @@ FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://uClibc.machine \
 	file://uClibc.distro \
+	file://obstack.cfg \
+	file://locale.cfg \
 	file://uclibc_enable_log2_test.patch \
 	file://powerpc_copysignl.patch \
 	file://argp-support.patch \
@@ -22,6 +22,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
 	file://0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch \
 	file://0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch \
-	file://0001-i386-sysdep.h-Remove-STABS_-macros.patch \
+	file://0001-add-posix_fadvise-for-arm.patch \
 	"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-add-posix_fadvise-for-arm.patch b/meta/recipes-core/uclibc/uclibc-git/0001-add-posix_fadvise-for-arm.patch
new file mode 100644
index 0000000..7c17a19
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-add-posix_fadvise-for-arm.patch
@@ -0,0 +1,68 @@
+From 236a65abe0a6810e20498fc0ba8d02d90978953b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 29 Jun 2013 22:46:53 -0700
+Subject: [PATCH] add posix_fadvise() for arm
+
+arm call to posix_fadvise simply calls posix_fadvise64
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libc/sysdeps/linux/common/posix_fadvise.c |   24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+Upstream-Status: Pending
+
+diff --git a/libc/sysdeps/linux/common/posix_fadvise.c b/libc/sysdeps/linux/common/posix_fadvise.c
+index d3e1bd4..e102ce7 100644
+--- a/libc/sysdeps/linux/common/posix_fadvise.c
++++ b/libc/sysdeps/linux/common/posix_fadvise.c
+@@ -10,30 +10,38 @@
+ 
+ #include <sys/syscall.h>
+ 
+-#ifdef __NR_fadvise64
++#if defined(__NR_fadvise64) || defined(__NR_arm_fadvise64_64)
+ # include <fcntl.h>
+ # include <endian.h>
+ # include <bits/wordsize.h>
+ 
++# ifdef __NR_arm_fadvise64_64
++int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
++# endif
++
+ int posix_fadvise(int fd, off_t offset, off_t len, int advice)
+ {
++# ifdef __NR_arm_fadvise64_64
++	return posix_fadvise64(fd, offset, len, advice);
++# else
+ 	int ret;
+ 	INTERNAL_SYSCALL_DECL(err);
+-# if __WORDSIZE == 64
++#  if __WORDSIZE == 64
+ 	ret = INTERNAL_SYSCALL(fadvise64, err, 4, fd, offset, len, advice);
+-# else
+-#  if defined(__UCLIBC_SYSCALL_ALIGN_64BIT__)
+-	ret = INTERNAL_SYSCALL(fadvise64, err, 6, fd, /*unused*/0,
+ #  else
++#   if defined(__UCLIBC_SYSCALL_ALIGN_64BIT__)
++	ret = INTERNAL_SYSCALL(fadvise64, err, 6, fd, /*unused*/0,
++#   else
+ 	ret = INTERNAL_SYSCALL(fadvise64, err, 5, fd,
+-#  endif
++#   endif
+ 			OFF_HI_LO (offset), len, advice);
+-# endif
++#  endif
+ 	if (INTERNAL_SYSCALL_ERROR_P (ret, err))
+ 		return INTERNAL_SYSCALL_ERRNO (ret, err);
+ 	return 0;
++#  endif
+ }
+-# if defined __UCLIBC_HAS_LFS__ && (!defined __NR_fadvise64_64 || __WORDSIZE == 64)
++# if defined __UCLIBC_HAS_LFS__ && ((!defined __NR_fadvise64_64 && !defined __NR_arm_fadvise64_64) || __WORDSIZE == 64)
+ strong_alias(posix_fadvise,posix_fadvise64)
+ # endif
+ #endif
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-i386-sysdep.h-Remove-STABS_-macros.patch b/meta/recipes-core/uclibc/uclibc-git/0001-i386-sysdep.h-Remove-STABS_-macros.patch
deleted file mode 100644
index 8512c45..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0001-i386-sysdep.h-Remove-STABS_-macros.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Upstream-Status: Submitted
-
--Khem
-
-From e20fd2c2427be981c16cb936cc6866d08520de9b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 25 Mar 2013 19:34:39 -0700
-Subject: [PATCH] i386/sysdep.h: Remove STABS_* macros
-
-uclibc is compiled with elf/dwarf and secondly HAVE_CPP_ASM_DEBUGINFO
-is not defined so we generate bogus .stab sections needlessly
-
-Some of post processing tools get confused when they see both
-dwarf and stab sections
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libc/sysdeps/linux/i386/sysdep.h |   27 ---------------------------
- 1 file changed, 27 deletions(-)
-
-diff --git a/libc/sysdeps/linux/i386/sysdep.h b/libc/sysdeps/linux/i386/sysdep.h
-index 983c4f5..7a8d2e2 100644
---- a/libc/sysdeps/linux/i386/sysdep.h
-+++ b/libc/sysdeps/linux/i386/sysdep.h
-@@ -43,12 +43,9 @@
-    incomplete stabs information.  Fake some entries here which specify
-    the current source file.  */
- #define	ENTRY(name)							      \
--  STABS_CURRENT_FILE1("")						      \
--  STABS_CURRENT_FILE(name)						      \
-   ASM_GLOBAL_DIRECTIVE C_SYMBOL_NAME(name);				      \
-   ASM_TYPE_DIRECTIVE (C_SYMBOL_NAME(name),@function)			      \
-   .align ALIGNARG(4);							      \
--  STABS_FUN(name)							      \
-   C_LABEL(name)								      \
-   cfi_startproc;							      \
-   CALL_MCOUNT
-@@ -57,30 +54,6 @@
- #define END(name)							      \
-   cfi_endproc;								      \
-   ASM_SIZE_DIRECTIVE(name)						      \
--  STABS_FUN_END(name)
--
--#ifdef HAVE_CPP_ASM_DEBUGINFO
--/* Disable that goop, because we just pass -g through to the assembler
--   and it generates proper line number information directly.  */
--# define STABS_CURRENT_FILE1(name)
--# define STABS_CURRENT_FILE(name)
--# define STABS_FUN(name)
--# define STABS_FUN_END(name)
--#else
--/* Remove the following two lines once the gdb bug is fixed.  */
--#define STABS_CURRENT_FILE(name)					      \
--  STABS_CURRENT_FILE1 (#name)
--#define STABS_CURRENT_FILE1(name)					      \
--  1: .stabs name,100,0,0,1b;
--/* Emit stabs definition lines.  We use F(0,1) and define t(0,1) as `int',
--   the same way gcc does it.  */
--#define STABS_FUN(name) STABS_FUN2(name, name##:F(0,1))
--#define STABS_FUN2(name, namestr)					      \
--  .stabs "int:t(0,1)=r(0,1);-2147483648;2147483647;",128,0,0,0;		      \
--  .stabs #namestr,36,0,0,name;
--#define STABS_FUN_END(name)						      \
--  1: .stabs "",36,0,0,1b-name;
--#endif
- 
- /* If compiled for profiling, call `mcount' at the start of each function.  */
- #ifdef	PROF
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch b/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
index 7fc5bd3..7e7c579 100644
--- a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
@@ -13,9 +13,9 @@ Upstream-Status: Pending
 
 Index: git/libc/sysdeps/linux/arm/Makefile.arch
 ===================================================================
---- git.orig/libc/sysdeps/linux/arm/Makefile.arch	2013-03-25 19:48:48.000000000 -0700
-+++ git/libc/sysdeps/linux/arm/Makefile.arch	2013-03-25 19:51:57.496677771 -0700
-@@ -13,7 +13,10 @@
+--- git.orig/libc/sysdeps/linux/arm/Makefile.arch	2013-05-23 11:13:32.000000000 -0700
++++ git/libc/sysdeps/linux/arm/Makefile.arch	2013-05-23 11:16:18.304333131 -0700
+@@ -13,7 +13,9 @@
  	vfork.S clone.S
  
  SSRC-$(UCLIBC_HAS_LFS) += mmap64.S
@@ -23,7 +23,6 @@ Index: git/libc/sysdeps/linux/arm/Makefile.arch
 +SSRC-$(UCLIBC_HAS_THREADS_NATIVE) += libc-thumb_atomics.S
 +libc-nonshared-$(UCLIBC_HAS_THREADS_NATIVE) += $(ARCH_OUT)/libc-aeabi_read_tp.os
 +libc-static-$(UCLIBC_HAS_THREADS_NATIVE) += $(ARCH_OUT)/libc-aeabi_read_tp.o
-+
- CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise.c
  CSRC-$(UCLIBC_HAS_CONTEXT_FUNCS) += makecontext.c
  SSRC-$(UCLIBC_HAS_CONTEXT_FUNCS) += getcontext.S setcontext.S swapcontext.S
+ 
diff --git a/meta/recipes-core/uclibc/uclibc-git/locale.cfg b/meta/recipes-core/uclibc/uclibc-git/locale.cfg
new file mode 100644
index 0000000..fc66435
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/locale.cfg
@@ -0,0 +1,3 @@
+UCLIBC_HAS_LOCALE=y
+UCLIBC_HAS_XLOCALE=y
+UCLIBC_BUILD_MINIMAL_LOCALE=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/obstack.cfg b/meta/recipes-core/uclibc/uclibc-git/obstack.cfg
new file mode 100644
index 0000000..36bf9d6
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/obstack.cfg
@@ -0,0 +1 @@
+UCLIBC_HAS_OBSTACK=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch b/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
index ce58583..2f014cd 100644
--- a/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
@@ -6,21 +6,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: git/libc/sysdeps/linux/powerpc/Makefile.arch
 ===================================================================
---- git.orig/libc/sysdeps/linux/powerpc/Makefile.arch	2013-01-21 16:18:22.000000000 -0800
-+++ git/libc/sysdeps/linux/powerpc/Makefile.arch	2013-01-21 16:21:25.363552429 -0800
+--- git.orig/libc/sysdeps/linux/powerpc/Makefile.arch	2013-05-23 11:09:50.000000000 -0700
++++ git/libc/sysdeps/linux/powerpc/Makefile.arch	2013-05-23 11:12:06.072328399 -0700
 @@ -5,7 +5,7 @@
  # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
  #
  
--CSRC-y := __syscall_error.c pread_write.c ioctl.c
-+CSRC-y := __syscall_error.c pread_write.c ioctl.c copysignl.c
+-CSRC-y := __syscall_error.c ioctl.c
++CSRC-y := __syscall_error.c ioctl.c copysignl.c
  
  SSRC-y := \
  	__longjmp.S setjmp.S bsd-setjmp.S bsd-_setjmp.S brk.S \
 Index: git/libc/sysdeps/linux/powerpc/copysignl.c
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libc/sysdeps/linux/powerpc/copysignl.c	2013-01-21 16:20:46.807552554 -0800
++++ git/libc/sysdeps/linux/powerpc/copysignl.c	2013-05-23 11:11:37.600327865 -0700
 @@ -0,0 +1,89 @@
 +/* s_copysignl.c -- long double version of s_copysign.c.
 + * Conversion to long double by Ulrich Drepper,
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index c25c4d1..86a7417 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -60,8 +60,10 @@ export V="2"
 CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
 UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
 UCLIBC_EXTRA_LDFLAGS := "${@oe_filter_out('(-L\S+|-l\S+)', '${LDFLAGS}', d)}"
+
 do_compile_prepend () {
   unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+  oe_runmake pregen
 }
 
 configmangle = '/^KERNEL_HEADERS/d; \
@@ -146,8 +148,10 @@ do_configure() {
 
         # Mangle the resulting .config depending on OE variables
         sed -i -e '${configmangle}' ${S}/merged.config
+	cp ${S}/merged.config .config
+        merge_config.sh -r -n -m .config ${@" ".join(find_cfgs(d))}
+	cml1_do_configure
 
-        oe_runmake KCONFIG_ALLCONFIG=${S}/merged.config allnoconfig
 }
 
 do_install() {
-- 
1.7.9.5


