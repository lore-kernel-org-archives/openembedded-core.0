Return-Path: <carlo.caione@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA5461013
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 17:55:51 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so4358906ead.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 10:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8yZvT1uUuQQB0EOKKOLkI8kIVRfrNk1Xqiu7UHGFcmI=;
	b=zUPx6tiwTaqByVIR2h1PUfgPjVQ30uCXqRFjhZVcQ7Nh0Fm6lembntdXDkWQ0M+zTA
	YFg3KL+ifJQs90lCJFV32Sr5trezAjSec0DoL7ytry1IBRhBdLxpKNHjFrNBQCF6ryEO
	DsW7PanzOhoPn07Yla4qrUrDran+3Iw1H9LpOE3vF84v2ODk/zAOEyOmqPyVMb0/4BxE
	hfxny3mqzBlFQrYsJSYZmWJHWG2/ogDiTxkAbLrOt/mFgvAeppWb/7M9TKt4LhxwUEXo
	ofkU82DgkKctG0d0GOD3gtglFeawcUzNV2S+P7IlApes98KLzR4Yyaue5BlMZNcesv3D
	UVyw==
X-Received: by 10.14.37.4 with SMTP id x4mr3765307eea.16.1379613352308;
	Thu, 19 Sep 2013 10:55:52 -0700 (PDT)
Received: from satan.fastwebnet.it (2-238-57-164.ip242.fastwebnet.it.
	[2.238.57.164]) by mx.google.com with ESMTPSA id
	y47sm13091535eew.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 10:55:51 -0700 (PDT)
From: Carlo Caione <carlo.caione@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2013 19:59:12 +0200
Message-Id: <1379613552-1630-1-git-send-email-carlo.caione@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] uclibc-git: add two patches to fix build breakage with thumb2
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
X-List-Received-Date: Thu, 19 Sep 2013 17:55:52 -0000

uclibc doesn't compile for Thumb2-aware CPUs.
Added two patches (from uclibc) to make it compiling.

Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
---
 yocto/meta/recipes-core/uclibc/uclibc-git.inc      |   2 +
 .../add-missing-IT-instruction-for-Thumb2.patch    |  22 ++
 .../move-check-for-BX-to-its-own-header.patch      | 247 +++++++++++++++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 yocto/meta/recipes-core/uclibc/uclibc-git/add-missing-IT-instruction-for-Thumb2.patch
 create mode 100644 yocto/meta/recipes-core/uclibc/uclibc-git/move-check-for-BX-to-its-own-header.patch

diff --git a/yocto/meta/recipes-core/uclibc/uclibc-git.inc b/yocto/meta/recipes-core/uclibc/uclibc-git.inc
index db00ee6..29e3ba3 100644
--- a/yocto/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/yocto/meta/recipes-core/uclibc/uclibc-git.inc
@@ -23,5 +23,7 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch \
 	file://0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch \
 	file://0001-i386-sysdep.h-Remove-STABS_-macros.patch \
+	file://add-missing-IT-instruction-for-Thumb2.patch \
+	file://move-check-for-BX-to-its-own-header.patch \
 	"
 S = "${WORKDIR}/git"
diff --git a/yocto/meta/recipes-core/uclibc/uclibc-git/add-missing-IT-instruction-for-Thumb2.patch b/yocto/meta/recipes-core/uclibc/uclibc-git/add-missing-IT-instruction-for-Thumb2.patch
new file mode 100644
index 0000000..c761d08
--- /dev/null
+++ b/yocto/meta/recipes-core/uclibc/uclibc-git/add-missing-IT-instruction-for-Thumb2.patch
@@ -0,0 +1,22 @@
+The conditional load needs to be made part of an IT block on Thumb2
+cores.
+
+Signed-off-by: Will Newton <will.newton at linaro.org>
+---
+ libc/sysdeps/linux/arm/clone.S | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libc/sysdeps/linux/arm/clone.S b/libc/sysdeps/linux/arm/clone.S
+index 98dde22..e73ddb6 100644
+--- a/libc/sysdeps/linux/arm/clone.S
++++ b/libc/sysdeps/linux/arm/clone.S
+@@ -110,6 +110,7 @@ __clone:
+ 	ldr	r4, [sp, #12]
+ 	DO_CALL (clone)
+ 	movs	a1, a1
++	IT(t, ne)
+ 	ldmnefd	sp!, {r4}
+ 	blt	__error
+ 	IT(t, ne)
+-- 
+1.8.1.4
diff --git a/yocto/meta/recipes-core/uclibc/uclibc-git/move-check-for-BX-to-its-own-header.patch b/yocto/meta/recipes-core/uclibc/uclibc-git/move-check-for-BX-to-its-own-header.patch
new file mode 100644
index 0000000..5cfe0dc
--- /dev/null
+++ b/yocto/meta/recipes-core/uclibc/uclibc-git/move-check-for-BX-to-its-own-header.patch
@@ -0,0 +1,247 @@
+As Will noticed, the header this check is currently done in
+is asm-only, and is not meant to be included from C code.
+This breaks compilation when compiled for a Thumb2-aware CPU.
+
+Move the BX check to its own header, and revert 7a246fd.
+
+Reported-by: Will Newton <will.newton at gmail.com>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998 at free.fr>
+Cc: Will Newton <will.newton at gmail.com>
+---
+ ldso/ldso/arm/dl-startup.h            |    2 +-
+ ldso/ldso/arm/resolve.S               |    1 +
+ libc/string/arm/_memcpy.S             |    1 +
+ libc/string/arm/memcmp.S              |    1 +
+ libc/string/arm/memset.S              |    1 +
+ libc/string/arm/strcmp.S              |    1 +
+ libc/string/arm/strlen.S              |    1 +
+ libc/sysdeps/linux/arm/__longjmp.S    |    1 +
+ libc/sysdeps/linux/arm/bits/arm_asm.h |    8 -------
+ libc/sysdeps/linux/arm/bits/arm_bx.h  |   34 +++++++++++++++++++++++++++++++++
+ libc/sysdeps/linux/arm/clone.S        |    1 +
+ libc/sysdeps/linux/arm/mmap64.S       |    1 +
+ libc/sysdeps/linux/arm/syscall-eabi.S |    1 +
+ libc/sysdeps/linux/arm/sysdep.h       |    2 +-
+ libc/sysdeps/linux/arm/vfork.S        |    1 +
+ 15 files changed, 47 insertions(+), 10 deletions(-)
+ create mode 100644 libc/sysdeps/linux/arm/bits/arm_bx.h
+
+diff --git a/ldso/ldso/arm/dl-startup.h b/ldso/ldso/arm/dl-startup.h
+index 0723d29..df2c824 100644
+--- a/ldso/ldso/arm/dl-startup.h
++++ b/ldso/ldso/arm/dl-startup.h
+@@ -7,7 +7,7 @@
+  */
+ 
+ #include <features.h>
+-#include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #if !defined(__thumb__)
+ __asm__(
+diff --git a/ldso/ldso/arm/resolve.S b/ldso/ldso/arm/resolve.S
+index b0907f7..c1caf9a 100644
+--- a/ldso/ldso/arm/resolve.S
++++ b/ldso/ldso/arm/resolve.S
+@@ -92,6 +92,7 @@
+ 
+ #include <sys/syscall.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #include <features.h>
+ 
+diff --git a/libc/string/arm/_memcpy.S b/libc/string/arm/_memcpy.S
+index b26080d..c59f5b8 100644
+--- a/libc/string/arm/_memcpy.S
++++ b/libc/string/arm/_memcpy.S
+@@ -40,6 +40,7 @@
+ #include <features.h>
+ #include <endian.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #if !defined(THUMB1_ONLY)
+ /*
+diff --git a/libc/string/arm/memcmp.S b/libc/string/arm/memcmp.S
+index 65409f4..9f78415 100644
+--- a/libc/string/arm/memcmp.S
++++ b/libc/string/arm/memcmp.S
+@@ -31,6 +31,7 @@
+ 
+ #include <features.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ .text
+ .global memcmp
+diff --git a/libc/string/arm/memset.S b/libc/string/arm/memset.S
+index c66b599..8ddc47e 100644
+--- a/libc/string/arm/memset.S
++++ b/libc/string/arm/memset.S
+@@ -19,6 +19,7 @@
+ #include <features.h>
+ #include <sys/syscall.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ .text
+ .global memset
+diff --git a/libc/string/arm/strcmp.S b/libc/string/arm/strcmp.S
+index 97363c1..8b77ab0 100644
+--- a/libc/string/arm/strcmp.S
++++ b/libc/string/arm/strcmp.S
+@@ -31,6 +31,7 @@
+ 
+ #include <features.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ .text
+ .global strcmp
+diff --git a/libc/string/arm/strlen.S b/libc/string/arm/strlen.S
+index cfe041a..0e7737e 100644
+--- a/libc/string/arm/strlen.S
++++ b/libc/string/arm/strlen.S
+@@ -20,6 +20,7 @@
+ #include <endian.h>
+ #include <sys/syscall.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ /* size_t strlen(const char *S)
+  * entry: r0 -> string
+diff --git a/libc/sysdeps/linux/arm/__longjmp.S b/libc/sysdeps/linux/arm/__longjmp.S
+index b6e4961..853b906 100644
+--- a/libc/sysdeps/linux/arm/__longjmp.S
++++ b/libc/sysdeps/linux/arm/__longjmp.S
+@@ -18,6 +18,7 @@
+ 
+ #include <features.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ .global __longjmp
+ .type __longjmp,%function
+diff --git a/libc/sysdeps/linux/arm/bits/arm_asm.h b/libc/sysdeps/linux/arm/bits/arm_asm.h
+index 921c9a3..ff8ea92 100644
+--- a/libc/sysdeps/linux/arm/bits/arm_asm.h
++++ b/libc/sysdeps/linux/arm/bits/arm_asm.h
+@@ -24,12 +24,4 @@
+ #define THUMB1_ONLY 1
+ #endif
+ 
+-#if defined(__USE_BX__)
+-# if (   defined (__ARM_ARCH_2__)  || defined (__ARM_ARCH_3__) \
+-      || defined (__ARM_ARCH_3M__) || defined (__ARM_ARCH_4__) \
+-     )
+-#  error Use of BX was requested, but is not available on the target processor.
+-# endif /* ARCH level */
+-#endif /* __USE_BX__ */
+-
+ #endif /* _ARM_ASM_H */
+diff --git a/libc/sysdeps/linux/arm/bits/arm_bx.h b/libc/sysdeps/linux/arm/bits/arm_bx.h
+new file mode 100644
+index 0000000..321490e
+--- /dev/null
++++ b/libc/sysdeps/linux/arm/bits/arm_bx.h
+@@ -0,0 +1,34 @@
++/* Copyright (C) 2013 Yann E. MORIN <yann.morin.1998 at free.fr>
++ *
++ * This file is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU Lesser General Public License as
++ * published by the Free Software Foundation; either version 2.1 of
++ * the License, or (at your option) any later version.
++ *
++ * This file is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with the GNU C Library; if not, see
++ * <http://www.gnu.org/licenses/>.
++ */
++
++#ifndef _ARM_BX_H
++#define _ARM_BX_H
++
++/* We need features.h first */
++#if !defined _FEATURES_H
++#error Please include features.h first
++#endif /* features.h not yet included */
++
++#if defined(__USE_BX__)
++# if (   defined (__ARM_ARCH_2__)  || defined (__ARM_ARCH_3__) \
++      || defined (__ARM_ARCH_3M__) || defined (__ARM_ARCH_4__) \
++     )
++#  error Use of BX was requested, but is not available on the target processor.
++# endif /* ARCH level */
++#endif /* __USE_BX__ */
++
++#endif /* _ARM_BX_H */
+diff --git a/libc/sysdeps/linux/arm/clone.S b/libc/sysdeps/linux/arm/clone.S
+index 98dde22..670a058 100644
+--- a/libc/sysdeps/linux/arm/clone.S
++++ b/libc/sysdeps/linux/arm/clone.S
+@@ -24,6 +24,7 @@
+ #include <bits/errno.h>
+ #include <sys/syscall.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #if defined(__NR_clone)
+ /* int clone(int (*fn)(void *arg), void *child_stack, int flags, void *arg); */
+diff --git a/libc/sysdeps/linux/arm/mmap64.S b/libc/sysdeps/linux/arm/mmap64.S
+index 3b66ef3..f4c491a 100644
+--- a/libc/sysdeps/linux/arm/mmap64.S
++++ b/libc/sysdeps/linux/arm/mmap64.S
+@@ -20,6 +20,7 @@
+ #include <bits/errno.h>
+ #include <sys/syscall.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #ifdef __NR_mmap2
+ 
+diff --git a/libc/sysdeps/linux/arm/syscall-eabi.S b/libc/sysdeps/linux/arm/syscall-eabi.S
+index 5643904..005cfe3 100644
+--- a/libc/sysdeps/linux/arm/syscall-eabi.S
++++ b/libc/sysdeps/linux/arm/syscall-eabi.S
+@@ -17,6 +17,7 @@
+ 
+ #include <sys/syscall.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ /* In the EABI syscall interface, we don't need a special syscall to
+    implement syscall().  It won't work reliably with 64-bit arguments
+diff --git a/libc/sysdeps/linux/arm/sysdep.h b/libc/sysdeps/linux/arm/sysdep.h
+index d4a86d3..a1b650f 100644
+--- a/libc/sysdeps/linux/arm/sysdep.h
++++ b/libc/sysdeps/linux/arm/sysdep.h
+@@ -20,7 +20,7 @@
+ #define _LINUX_ARM_SYSDEP_H 1
+ 
+ #include <common/sysdep.h>
+-#include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #include <sys/syscall.h>
+ /* For Linux we can use the system call table in the header file
+diff --git a/libc/sysdeps/linux/arm/vfork.S b/libc/sysdeps/linux/arm/vfork.S
+index 6a1c65e..99fb6cb 100644
+--- a/libc/sysdeps/linux/arm/vfork.S
++++ b/libc/sysdeps/linux/arm/vfork.S
+@@ -7,6 +7,7 @@
+ 
+ #include <features.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #define _ERRNO_H
+ #include <bits/errno.h>
+-- 
+1.7.2.5
+
+
-- 
1.8.4


