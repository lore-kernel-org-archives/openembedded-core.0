Received: from mail-pd0-f181.google.com ([209.85.192.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKc0F-0001OJ-E9
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 23:06:00 +0100
Received: by mail-pd0-f181.google.com with SMTP id q10so3222524pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 14:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=TgdmzUk3HEpfDkgvLB4KZpwd+kp/8yfzpMHpvdVUhDk=;
	b=LBlsTDfDYr1Cq+CwPHDbq55rZcDbn76cL4NBdkaKDvyf4G2hA+4dtue2iIxcF4EQX1
	lMk8A3xpz7bP2kVa0IakFqQ9uAHiLGIq2wfjMMQxcF8pvSrKt+N1q52ylxolNsD6eKLe
	vEWjZrZfY9INem1ODzXujAEr7azdP1E1YKaTgwmTy3p0e5mJyFU33qkq2F0hT6JA0VLl
	Kgsb5g+reLv2zhUunnGeI7gjcasey6e8PJxz5cwJuEK+4jiOGdXHMBLhKSlc7GBniXwC
	1NvEFtWM4tDcE30klELLHr2ZZ9sPUMKgDCeFKTVwwZLp19ke4cYu1ob4YvEM2GP1yPXO
	VMhA==
X-Received: by 10.66.172.77 with SMTP id ba13mr26078385pac.63.1364334538559;
	Tue, 26 Mar 2013 14:48:58 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id
	qb10sm18794380pbb.43.2013.03.26.14.48.57
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 14:48:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 14:48:27 -0700
Message-Id: <1364334507-16539-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] uclibc-git: Fix build on x86 and move to latest master
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
X-List-Received-Date: Tue, 26 Mar 2013 22:06:00 -0000

debugedit from rpm has unearthed a bug in uclibc
where it was mixing stabs with elf/dwarf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
 .../0001-i386-sysdep.h-Remove-STABS_-macros.patch  |   71 ++++
 ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |    8 +-
 .../uclibc/uclibc-git/posix_fallocate.patch        |  408 --------------------
 .../uclibc/uclibc-git/uclibc-execvpe.patch         |  163 --------
 5 files changed, 77 insertions(+), 578 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-i386-sysdep.h-Remove-STABS_-macros.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/posix_fallocate.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index ed9b5fd..db00ee6 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,4 +1,4 @@
-SRCREV="9591091f150e8a86c47efbea5def21fa67fffb07"
+SRCREV="946799cd0ce0c6c803c9cb173a84f4d607bde350"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -16,13 +16,12 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://argp-headers.patch \
 	file://remove_attribute_optimize_Os.patch \
 	file://compile-arm-fork-with-O2.patch \
-	file://uclibc-execvpe.patch \
 	file://orign_path.patch \
-	file://posix_fallocate.patch \
 	file://0001-atexit_old-Do-not-add-it-to-shared-libc.patch \
 	file://0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch \
 	file://0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
 	file://0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch \
 	file://0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch \
+	file://0001-i386-sysdep.h-Remove-STABS_-macros.patch \
 	"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-i386-sysdep.h-Remove-STABS_-macros.patch b/meta/recipes-core/uclibc/uclibc-git/0001-i386-sysdep.h-Remove-STABS_-macros.patch
new file mode 100644
index 0000000..8512c45
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-i386-sysdep.h-Remove-STABS_-macros.patch
@@ -0,0 +1,71 @@
+Upstream-Status: Submitted
+
+-Khem
+
+From e20fd2c2427be981c16cb936cc6866d08520de9b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2013 19:34:39 -0700
+Subject: [PATCH] i386/sysdep.h: Remove STABS_* macros
+
+uclibc is compiled with elf/dwarf and secondly HAVE_CPP_ASM_DEBUGINFO
+is not defined so we generate bogus .stab sections needlessly
+
+Some of post processing tools get confused when they see both
+dwarf and stab sections
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libc/sysdeps/linux/i386/sysdep.h |   27 ---------------------------
+ 1 file changed, 27 deletions(-)
+
+diff --git a/libc/sysdeps/linux/i386/sysdep.h b/libc/sysdeps/linux/i386/sysdep.h
+index 983c4f5..7a8d2e2 100644
+--- a/libc/sysdeps/linux/i386/sysdep.h
++++ b/libc/sysdeps/linux/i386/sysdep.h
+@@ -43,12 +43,9 @@
+    incomplete stabs information.  Fake some entries here which specify
+    the current source file.  */
+ #define	ENTRY(name)							      \
+-  STABS_CURRENT_FILE1("")						      \
+-  STABS_CURRENT_FILE(name)						      \
+   ASM_GLOBAL_DIRECTIVE C_SYMBOL_NAME(name);				      \
+   ASM_TYPE_DIRECTIVE (C_SYMBOL_NAME(name),@function)			      \
+   .align ALIGNARG(4);							      \
+-  STABS_FUN(name)							      \
+   C_LABEL(name)								      \
+   cfi_startproc;							      \
+   CALL_MCOUNT
+@@ -57,30 +54,6 @@
+ #define END(name)							      \
+   cfi_endproc;								      \
+   ASM_SIZE_DIRECTIVE(name)						      \
+-  STABS_FUN_END(name)
+-
+-#ifdef HAVE_CPP_ASM_DEBUGINFO
+-/* Disable that goop, because we just pass -g through to the assembler
+-   and it generates proper line number information directly.  */
+-# define STABS_CURRENT_FILE1(name)
+-# define STABS_CURRENT_FILE(name)
+-# define STABS_FUN(name)
+-# define STABS_FUN_END(name)
+-#else
+-/* Remove the following two lines once the gdb bug is fixed.  */
+-#define STABS_CURRENT_FILE(name)					      \
+-  STABS_CURRENT_FILE1 (#name)
+-#define STABS_CURRENT_FILE1(name)					      \
+-  1: .stabs name,100,0,0,1b;
+-/* Emit stabs definition lines.  We use F(0,1) and define t(0,1) as `int',
+-   the same way gcc does it.  */
+-#define STABS_FUN(name) STABS_FUN2(name, name##:F(0,1))
+-#define STABS_FUN2(name, namestr)					      \
+-  .stabs "int:t(0,1)=r(0,1);-2147483648;2147483647;",128,0,0,0;		      \
+-  .stabs #namestr,36,0,0,name;
+-#define STABS_FUN_END(name)						      \
+-  1: .stabs "",36,0,0,1b-name;
+-#endif
+ 
+ /* If compiled for profiling, call `mcount' at the start of each function.  */
+ #ifdef	PROF
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch b/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
index 407beb6..7fc5bd3 100644
--- a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
@@ -13,12 +13,12 @@ Upstream-Status: Pending
 
 Index: git/libc/sysdeps/linux/arm/Makefile.arch
 ===================================================================
---- git.orig/libc/sysdeps/linux/arm/Makefile.arch	2013-01-21 16:29:25.000000000 -0800
-+++ git/libc/sysdeps/linux/arm/Makefile.arch	2013-01-21 16:33:11.575571091 -0800
-@@ -12,7 +12,10 @@
- 	bsd-_setjmp.S sigrestorer.S mmap64.S \
+--- git.orig/libc/sysdeps/linux/arm/Makefile.arch	2013-03-25 19:48:48.000000000 -0700
++++ git/libc/sysdeps/linux/arm/Makefile.arch	2013-03-25 19:51:57.496677771 -0700
+@@ -13,7 +13,10 @@
  	vfork.S clone.S
  
+ SSRC-$(UCLIBC_HAS_LFS) += mmap64.S
 -SSRC-$(UCLIBC_HAS_THREADS_NATIVE) += libc-aeabi_read_tp.S libc-thumb_atomics.S
 +SSRC-$(UCLIBC_HAS_THREADS_NATIVE) += libc-thumb_atomics.S
 +libc-nonshared-$(UCLIBC_HAS_THREADS_NATIVE) += $(ARCH_OUT)/libc-aeabi_read_tp.os
diff --git a/meta/recipes-core/uclibc/uclibc-git/posix_fallocate.patch b/meta/recipes-core/uclibc/uclibc-git/posix_fallocate.patch
deleted file mode 100644
index 46448ba..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/posix_fallocate.patch
+++ /dev/null
@@ -1,408 +0,0 @@
-Delivered-To: raj.khem@gmail.com
-Received: by 10.152.129.134 with SMTP id nw6csp47712lab;
-        Tue, 17 Apr 2012 00:30:48 -0700 (PDT)
-Received: by 10.68.216.167 with SMTP id or7mr34112133pbc.140.1334647840512;
-        Tue, 17 Apr 2012 00:30:40 -0700 (PDT)
-Return-Path: <uclibc-bounces@uclibc.org>
-Received: from hemlock.osuosl.org (hemlock.osuosl.org. [140.211.166.133])
-        by mx.google.com with ESMTP id gr10si13305623pbc.339.2012.04.17.00.30.39;
-        Tue, 17 Apr 2012 00:30:40 -0700 (PDT)
-Received-SPF: neutral (google.com: 140.211.166.133 is neither permitted nor denied by best guess record for domain of uclibc-bounces@uclibc.org) client-ip=140.211.166.133;
-Authentication-Results: mx.google.com; spf=neutral (google.com: 140.211.166.133 is neither permitted nor denied by best guess record for domain of uclibc-bounces@uclibc.org) smtp.mail=uclibc-bounces@uclibc.org; dkim=neutral (body hash did not verify) header.i=@gmail.com
-Received: from localhost (localhost [127.0.0.1])
-	by hemlock.osuosl.org (Postfix) with ESMTP id 7C494A0277;
-	Tue, 17 Apr 2012 07:30:39 +0000 (UTC)
-X-Virus-Scanned: amavisd-new at osuosl.org
-Received: from hemlock.osuosl.org ([127.0.0.1])
-	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
-	with ESMTP id ZsSp5xE48GwC; Tue, 17 Apr 2012 07:30:34 +0000 (UTC)
-Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
-	by hemlock.osuosl.org (Postfix) with ESMTP id 1C4F5A0274;
-	Tue, 17 Apr 2012 07:30:33 +0000 (UTC)
-X-Original-To: uclibc@lists.busybox.net
-Delivered-To: uclibc@osuosl.org
-Received: from fraxinus.osuosl.org (fraxinus.osuosl.org [140.211.166.137])
- by ash.osuosl.org (Postfix) with ESMTP id 17FDE8F75B
- for <uclibc@lists.busybox.net>; Tue, 17 Apr 2012 07:30:32 +0000 (UTC)
-Received: from localhost (localhost [127.0.0.1])
- by fraxinus.osuosl.org (Postfix) with ESMTP id 07B491016A1
- for <uclibc@lists.busybox.net>; Tue, 17 Apr 2012 07:30:32 +0000 (UTC)
-X-Virus-Scanned: amavisd-new at osuosl.org
-Received: from fraxinus.osuosl.org ([127.0.0.1])
- by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
- with ESMTP id XKP7jhcUijp4 for <uclibc@lists.busybox.net>;
- Tue, 17 Apr 2012 07:30:27 +0000 (UTC)
-X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
-Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
- [74.125.82.174])
- by fraxinus.osuosl.org (Postfix) with ESMTPS id 2CC0B100190
- for <uclibc@uclibc.org>; Tue, 17 Apr 2012 07:30:26 +0000 (UTC)
-Received: by wejx9 with SMTP id x9so5218587wej.33
- for <uclibc@uclibc.org>; Tue, 17 Apr 2012 00:30:25 -0700 (PDT)
-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
- h=from:to:cc:subject:date:message-id:x-mailer;
- bh=vadTQ1GL81XLDadHLtwCrcdL0YvVNNbIuISfTaQphgg=;
- b=KkyW95PC1TUTmwGt+iBJ8p0FfGtTPAsTlXmul/1iH2p21itEpWkU+WcVd2jBH+jc6L
- gzf4d6K1pmmfscdbPY3OkpFfvO/v/E4KYN7JmeI+fX1NY+gLBSHhExAVhM1Opue9z09V
- 54MrEMtlIA9Wo/5QPd1+W7o9gXHYEnMkoqYYZLmfPlG3+pCXZ6RP36fOZnSV44BQgOFz
- KBqn7XLo6nxgP5X/+JuEe4stvCrI9/66nX30u/Sh77a9poj5pp8hQZmtIpbbm3xRKGnM
- Fi72jNCq/0nHh3M7eMqn+rvwi1JQjk/90zWNv8v5ShAKqSJVrfqLVN72KjTJtXfLOqbL
- e2qA==
-Received: by 10.216.133.72 with SMTP id p50mr8903959wei.78.1334647825412;
- Tue, 17 Apr 2012 00:30:25 -0700 (PDT)
-Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
- [85.127.86.115])
- by mx.google.com with ESMTPS id n20sm40466274wiw.5.2012.04.17.00.30.23
- (version=TLSv1/SSLv3 cipher=OTHER);
- Tue, 17 Apr 2012 00:30:24 -0700 (PDT)
-Received: from cow by s42.loc with local (Exim 4.77)
- (envelope-from <rep.dot.nop@gmail.com>)
- id 1SK2rm-0008Pl-V3; Tue, 17 Apr 2012 09:30:23 +0200
-From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-To: uclibc@uclibc.org
-Subject: [PATCH,CFT] libc: add posix_fallocate()
-Date: Tue, 17 Apr 2012 09:30:15 +0200
-Message-Id: <1334647815-32315-1-git-send-email-rep.dot.nop@gmail.com>
-X-Mailer: git-send-email 1.7.9.1
-X-BeenThere: uclibc@uclibc.org
-X-Mailman-Version: 2.1.14
-Precedence: list
-List-Id: "Discussion and development of uClibc \(the embedded C library\)"
- <uclibc.uclibc.org>
-List-Unsubscribe: <http://lists.busybox.net/mailman/options/uclibc>,
- <mailto:uclibc-request@uclibc.org?subject=unsubscribe>
-List-Archive: <http://lists.busybox.net/pipermail/uclibc>
-List-Post: <mailto:uclibc@uclibc.org>
-List-Help: <mailto:uclibc-request@uclibc.org?subject=help>
-List-Subscribe: <http://lists.busybox.net/mailman/listinfo/uclibc>,
- <mailto:uclibc-request@uclibc.org?subject=subscribe>
-MIME-Version: 1.0
-Content-Type: text/plain; charset="us-ascii"
-Content-Transfer-Encoding: 7bit
-Errors-To: uclibc-bounces@uclibc.org
-Sender: uclibc-bounces@uclibc.org
-
-Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-Upstream-Status: Pending
----
- include/fcntl.h                                  |    4 +-
- libc/sysdeps/linux/common/Makefile.in            |    3 +-
- libc/sysdeps/linux/common/bits/kernel-features.h |    8 ++
- libc/sysdeps/linux/common/posix_fallocate.c      |   43 ++++++++
- libc/sysdeps/linux/common/posix_fallocate64.c    |   39 +++++++
- libc/sysdeps/linux/common/stubs.c                |    4 +
- test/.gitignore                                  |    1 +
- test/unistd/Makefile.in                          |    3 +
- test/unistd/tst-posix_fallocate.c                |  121 ++++++++++++++++++++++
- 9 files changed, 222 insertions(+), 4 deletions(-)
- create mode 100644 libc/sysdeps/linux/common/posix_fallocate.c
- create mode 100644 libc/sysdeps/linux/common/posix_fallocate64.c
- create mode 100644 test/unistd/tst-posix_fallocate.c
-
-Index: git/include/fcntl.h
-===================================================================
---- git.orig/include/fcntl.h	2012-06-23 18:47:18.000000000 -0700
-+++ git/include/fcntl.h	2012-06-23 18:48:54.805911794 -0700
-@@ -218,9 +218,7 @@
- 
- #endif
- 
--#if 0 /* && defined __UCLIBC_HAS_ADVANCED_REALTIME__ */
--
--/* FIXME -- uClibc should probably implement these... */
-+#if defined __UCLIBC_HAS_ADVANCED_REALTIME__
- 
- /* Reserve storage for the data of the file associated with FD.
- 
-Index: git/libc/sysdeps/linux/common/Makefile.in
-===================================================================
---- git.orig/libc/sysdeps/linux/common/Makefile.in	2012-06-23 18:47:18.000000000 -0700
-+++ git/libc/sysdeps/linux/common/Makefile.in	2012-06-23 18:50:14.033915572 -0700
-@@ -81,7 +81,8 @@
- 	sched_get_priority_max.c sched_get_priority_min.c sched_getscheduler.c \
- 	sched_rr_get_interval.c sched_setparam.c sched_setscheduler.c sigqueue.c
- # clock_getcpuclockid|clock_nanosleep|mq_timedreceive|mq_timedsend|posix_fadvise|posix_fallocate|posix_madvise|posix_memalign|posix_mem_offset|posix_spawnattr_destroy|posix_spawnattr_init|posix_spawnattr_getflags|posix_spawnattr_setflags|posix_spawnattr_getpgroup|posix_spawnattr_setpgroup|posix_spawnattr_getschedparam|posix_spawnattr_setschedparam|posix_spawnattr_getschedpolicy|posix_spawnattr_setschedpolicy|posix_spawnattr_getsigdefault|posix_spawnattr_setsigdefault|posix_spawnattr_getsigmask|posix_spawnattr_setsigmask|posix_spawnattr_init|posix_spawnattr_setflags|posix_spawnattr_setpgroup|posix_spawnattr_setschedparam|posix_spawnattr_setschedpolicy|posix_spawnattr_setsigdefault|posix_spawnattr_setsigmask|posix_spawn_file_actions_addclose|posix_spawn_file_actions_addopen|posix_spawn_file_actions_adddup2|posix_spawn_file_actions_addopen|posix_spawn_file_actions_destroy|posix_spawn_file_actions_init|posix_spawn_file_actions_init|posix_spawn|posix_spawnp|posix_spawnp|posix_typed_mem_get_info|pthread_mutex_timedlock|sem_timedwait
--CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise64.c posix_fadvise.c posix_madvise.c
-+CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise64.c posix_fadvise.c posix_madvise.c \
-+	posix_fallocate.c posix_fallocate64.c
- CSRC-$(UCLIBC_SUSV4_LEGACY) += utime.c
- CSRC-$(UCLIBC_HAS_EPOLL) += epoll.c
- CSRC-$(UCLIBC_HAS_XATTR) += xattr.c
-Index: git/libc/sysdeps/linux/common/bits/kernel-features.h
-===================================================================
---- git.orig/libc/sysdeps/linux/common/bits/kernel-features.h	2012-06-23 18:47:18.000000000 -0700
-+++ git/libc/sysdeps/linux/common/bits/kernel-features.h	2012-06-23 18:48:54.805911794 -0700
-@@ -494,6 +494,14 @@
- # define __ASSUME_PRIVATE_FUTEX	1
- #endif
- 
-+/* Support for fallocate was added in 2.6.23,
-+   on s390 only after 2.6.23-rc1, on alpha only after 2.6.33-rc1.  */
-+#if __LINUX_KERNEL_VERSION >= 0x020617 \
-+    && (!defined __s390__ || __LINUX_KERNEL_VERSION >= 0x020618) \
-+    && (!defined __alpha__ || __LINUX_KERNEL_VERSION >= 0x020621)
-+# define __ASSUME_FALLOCATE 1
-+#endif
-+
- /* getcpu is a syscall for x86-64 since 3.1.  */
- #if defined __x86_64__ && __LINUX_KERNEL_VERSION >= 0x030100
- # define __ASSUME_GETCPU_SYSCALL        1
-Index: git/libc/sysdeps/linux/common/posix_fallocate.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libc/sysdeps/linux/common/posix_fallocate.c	2012-06-23 18:48:54.825911795 -0700
-@@ -0,0 +1,43 @@
-+/* vi: set sw=4 ts=4: */
-+/*
-+ * posix_fallocate() for uClibc
-+ * http://www.opengroup.org/onlinepubs/9699919799/functions/posix_fallocate.html
-+ *
-+ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
-+ *
-+ * Licensed under the LGPL v2.1 or later, see the file COPYING.LIB in this tarball.
-+ */
-+
-+#include <sys/syscall.h>
-+#include <fcntl.h>
-+#include <bits/kernel-features.h>
-+#include <stdint.h>
-+
-+#if defined __NR_fallocate
-+int posix_fallocate(int fd, __off_t offset, __off_t len)
-+{
-+	int ret;
-+
-+# if __WORDSIZE == 32
-+	uint32_t off_low = offset;
-+	uint32_t len_low = len;
-+	/* may assert that these >>31 are 0 */
-+	uint32_t zero = 0;
-+	INTERNAL_SYSCALL_DECL(err);
-+	ret = (int) (INTERNAL_SYSCALL(fallocate, err, 6, fd, 0,
-+		__LONG_LONG_PAIR (zero, off_low),
-+		__LONG_LONG_PAIR (zero, len_low)));
-+# elif __WORDSIZE == 64
-+	INTERNAL_SYSCALL_DECL(err);
-+	ret = (int) (INTERNAL_SYSCALL(fallocate, err, 4, fd, 0, offset, len));
-+# else
-+# error your machine is neither 32 bit or 64 bit ... it must be magical
-+#endif
-+    if (unlikely(INTERNAL_SYSCALL_ERROR_P (ret, err)))
-+      return INTERNAL_SYSCALL_ERRNO (ret, err);
-+    return 0;
-+}
-+# if defined __UCLIBC_HAS_LFS__ && __WORDSIZE == 64
-+strong_alias(posix_fallocate,posix_fallocate64)
-+# endif
-+#endif
-Index: git/libc/sysdeps/linux/common/posix_fallocate64.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libc/sysdeps/linux/common/posix_fallocate64.c	2012-06-23 18:48:54.825911795 -0700
-@@ -0,0 +1,39 @@
-+/* vi: set sw=4 ts=4: */
-+/*
-+ * posix_fallocate() for uClibc
-+ * http://www.opengroup.org/onlinepubs/9699919799/functions/posix_fallocate.html
-+ *
-+ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
-+ *
-+ * Licensed under the LGPL v2.1 or later, see the file COPYING.LIB in this tarball.
-+ */
-+
-+#include <sys/syscall.h>
-+#include <fcntl.h>
-+#include <bits/kernel-features.h>
-+#include <stdint.h>
-+
-+#if defined __NR_fallocate
-+
-+# if __WORDSIZE == 64
-+/* Can use normal posix_fallocate() */
-+# elif __WORDSIZE == 32
-+int posix_fallocate64(int fd, __off64_t offset, __off64_t len)
-+{
-+	int ret;
-+	uint32_t off_low = offset & 0xffffffff;
-+	uint32_t off_high = offset >> 32;
-+	uint32_t len_low = len & 0xffffffff;
-+	uint32_t len_high = len >> 32;
-+	INTERNAL_SYSCALL_DECL(err);
-+	ret = (int) (INTERNAL_SYSCALL(fallocate, err, 6, fd, 0,
-+		__LONG_LONG_PAIR (off_high, off_low),
-+		__LONG_LONG_PAIR (len_high, len_low)));
-+    if (unlikely(INTERNAL_SYSCALL_ERROR_P (ret, err)))
-+      return INTERNAL_SYSCALL_ERRNO (ret, err);
-+    return 0;
-+}
-+# else
-+# error your machine is neither 32 bit or 64 bit ... it must be magical
-+# endif
-+#endif
-Index: git/libc/sysdeps/linux/common/stubs.c
-===================================================================
---- git.orig/libc/sysdeps/linux/common/stubs.c	2012-06-23 18:47:18.000000000 -0700
-+++ git/libc/sysdeps/linux/common/stubs.c	2012-06-23 18:48:54.825911795 -0700
-@@ -253,6 +253,10 @@
- make_ret_stub(posix_fadvise64)
- #endif
- 
-+#if !defined __NR_fallocate && defined __UCLIBC_HAS_ADVANCED_REALTIME__
-+make_ret_stub(posix_fallocate)
-+#endif
-+
- #ifndef __NR_madvise
- make_ret_stub(posix_madvise)
- #endif
-Index: git/test/.gitignore
-===================================================================
---- git.orig/test/.gitignore	2012-06-23 18:47:18.000000000 -0700
-+++ git/test/.gitignore	2012-06-23 18:48:54.825911795 -0700
-@@ -316,6 +316,7 @@
- unistd/getopt
- unistd/getopt_long
- unistd/tstgetopt
-+unistd/tst-posix_fallocate
- unistd/tst-preadwrite
- unistd/tst-preadwrite64
- unistd/vfork
-Index: git/test/unistd/Makefile.in
-===================================================================
---- git.orig/test/unistd/Makefile.in	2012-06-23 18:47:18.000000000 -0700
-+++ git/test/unistd/Makefile.in	2012-06-23 18:48:54.829911795 -0700
-@@ -4,6 +4,9 @@
- ifeq ($(UCLIBC_HAS_LFS),)
- TESTS_DISABLED := tst-preadwrite64
- endif
-+ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),)
-+TESTS_DISABLED := tst-posix_fallocate
-+endif
- OPTS_getopt      := -abcXXX -9
- OPTS_getopt_long := --add XXX --delete YYY --verbose
- ifeq ($(UCLIBC_HAS_GNU_GETOPT),y)
-Index: git/test/unistd/tst-posix_fallocate.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/test/unistd/tst-posix_fallocate.c	2012-06-23 18:48:54.829911795 -0700
-@@ -0,0 +1,121 @@
-+#include <fcntl.h>
-+#include <sys/stat.h>
-+
-+static void do_prepare (void);
-+#define PREPARE(argc, argv) do_prepare ()
-+static int do_test (void);
-+#define TEST_FUNCTION do_test ()
-+#include <test-skeleton.c>
-+
-+static int fd;
-+#ifndef O_LARGEFILE
-+# error no O_LARGEFILE
-+#endif
-+static void
-+do_prepare (void)
-+{
-+  fd = create_temp_file ("tst-posix_fallocate.", NULL);
-+  if (fd == -1)
-+    {
-+      printf ("cannot create temporary file: %m\n");
-+      exit (1);
-+    }
-+}
-+
-+
-+static int
-+do_test (void)
-+{
-+  struct stat64 st;
-+
-+  if (fstat64 (fd, &st) != 0)
-+    {
-+      puts ("1st fstat failed");
-+      return 1;
-+    }
-+
-+  if (st.st_size != 0)
-+    {
-+      puts ("file not created with size 0");
-+      return 1;
-+    }
-+
-+  if (posix_fallocate (fd, 512, 768) != 0)
-+    {
-+      puts ("1st posix_fallocate call failed");
-+      return 1;
-+    }
-+
-+  if (fstat64 (fd, &st) != 0)
-+    {
-+      puts ("2nd fstat failed");
-+      return 1;
-+    }
-+
-+  if (st.st_size != 512 + 768)
-+    {
-+      printf ("file size after 1st posix_fallocate call is %llu, expected %u\n",
-+	      (unsigned long long int) st.st_size, 512u + 768u);
-+      return 1;
-+    }
-+
-+  if (posix_fallocate (fd, 0, 1024) != 0)
-+    {
-+      puts ("2nd posix_fallocate call failed");
-+      return 1;
-+    }
-+
-+  if (fstat64 (fd, &st) != 0)
-+    {
-+      puts ("3rd fstat failed");
-+      return 1;
-+    }
-+
-+  if (st.st_size != 512 + 768)
-+    {
-+      puts ("file size changed in 2nd posix_fallocate");
-+      return 1;
-+    }
-+
-+  if (posix_fallocate (fd, 2048, 64) != 0)
-+    {
-+      puts ("3rd posix_fallocate call failed");
-+      return 1;
-+    }
-+
-+  if (fstat64 (fd, &st) != 0)
-+    {
-+      puts ("4th fstat failed");
-+      return 1;
-+    }
-+
-+  if (st.st_size != 2048 + 64)
-+    {
-+      printf ("file size after 3rd posix_fallocate call is %llu, expected %u\n",
-+	      (unsigned long long int) st.st_size, 2048u + 64u);
-+      return 1;
-+    }
-+
-+  if (posix_fallocate64 (fd, 4097ULL, 4294967295ULL + 2ULL) != 0)
-+    {
-+      puts ("4th posix_fallocate call failed");
-+      return 1;
-+    }
-+
-+  if (fstat64 (fd, &st) != 0)
-+    {
-+      puts ("5th fstat failed");
-+      return 1;
-+    }
-+
-+  if (st.st_size != 4097ULL + 4294967295ULL + 2ULL)
-+    {
-+      printf ("file size after 4th posix_fallocate call is %llu, expected %u\n",
-+	      (unsigned long long int) st.st_size, 4097ULL + 4294967295ULL + 2ULL);
-+      return 1;
-+    }
-+
-+  close (fd);
-+
-+  return 0;
-+}
diff --git a/meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch b/meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch
deleted file mode 100644
index fe191fc..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From d20556adadea03bff0bba051172caf0314a35471 Mon Sep 17 00:00:00 2001
-From: Henning Heinold <heinold@inf.fu-berlin.de>
-Date: Sat, 4 Jun 2011 21:23:15 +0200
-Subject: [PATCH 2/2] libc: add non standard execvpe function
-
-
-Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
----
- include/unistd.h      |    6 ++++++
- libc/unistd/exec.c    |   38 +++++++++++++++++++++++++++++++++-----
- libc/unistd/execvpe.c |    7 +++++++
- 3 files changed, 46 insertions(+), 5 deletions(-)
- create mode 100644 libc/unistd/execvpe.c
-
-
-Upstream-Status: Pending
-
-diff --git a/include/unistd.h b/include/unistd.h
-index 9568790..070e4f2 100644
---- a/include/unistd.h
-+++ b/include/unistd.h
-@@ -557,6 +557,12 @@ extern int execvp (__const char *__file, char *__const __argv[])
-      __THROW __nonnull ((1));
- libc_hidden_proto(execvp)
- 
-+/* Execute FILE, searching in the `PATH' environment variable if it contains
-+   no slashes, with arguments ARGV and environment from a pointer */
-+extern int execvpe (__const char *__file, char *__const __argv[], char *__const __envp[])
-+     __THROW __nonnull ((1));
-+libc_hidden_proto(execvpe)
-+
- /* Execute FILE, searching in the `PATH' environment variable if
-    it contains no slashes, with all arguments after FILE until a
-    NULL pointer and environment from `environ'.  */
-diff --git a/libc/unistd/exec.c b/libc/unistd/exec.c
-index 7d24072..802a174 100644
---- a/libc/unistd/exec.c
-+++ b/libc/unistd/exec.c
-@@ -32,6 +32,8 @@
- /**********************************************************************/
- #define EXEC_FUNC_COMMON 0
- #define EXEC_FUNC_EXECVP 1
-+#define EXEC_FUNC_EXECVPE 2
-+
- #if defined(__ARCH_USE_MMU__)
- 
- /* We have an MMU, so use alloca() to grab space for buffers and arg lists. */
-@@ -58,6 +60,7 @@
-  *  execle(a) -> execve(-)
-  *  execv(-)  -> execve(-)
-  *  execvp(a) -> execve(-)
-+ *  execvpe(a) -> execve(-)
-  */
- 
- # define EXEC_ALLOC_SIZE(VAR)      /* nothing to do */
-@@ -219,15 +222,18 @@ libc_hidden_def(execlp)
- 
- #endif
- /**********************************************************************/
--#ifdef L_execvp
-+#if defined (L_execvp) || defined(L_execvpe)
- 
- 
- /* Use a default path that matches glibc behavior, since SUSv3 says
-  * this is implementation-defined.  The default is current working dir,
-  * /bin, and then /usr/bin. */
- static const char default_path[] = ":/bin:/usr/bin";
--
-+#if defined (L_execvp)
- int execvp(const char *path, char *const argv[])
-+#elif defined (L_execvpe)
-+int execvpe(const char *path, char *const argv[], char *const envp[])
-+#endif
- {
- 	char *buf = NULL;
- 	char *p;
-@@ -245,7 +251,11 @@ int execvp(const char *path, char *const argv[])
- 	}
- 
- 	if (strchr(path, '/')) {
-+#if defined (L_execvp)
- 		execve(path, argv, __environ);
-+#elif defined (L_execvpe)
-+		execve(path, argv, envp);
-+#endif
- 		if (errno == ENOEXEC) {
- 			char **nargv;
- 			EXEC_ALLOC_SIZE(size2) /* Do NOT add a semicolon! */
-@@ -254,11 +264,19 @@ int execvp(const char *path, char *const argv[])
- 			/* Need the dimension - 1.  We omit counting the trailing
- 			 * NULL but we actually omit the first entry. */
- 			for (n=0 ; argv[n] ; n++) {}
-+#if defined (L_execvp)
- 			nargv = (char **) EXEC_ALLOC((n+2) * sizeof(char *), size2, EXEC_FUNC_EXECVP);
-+#elif defined (L_execvpe)
-+			nargv = (char **) EXEC_ALLOC((n+2) * sizeof(char *), size2, EXEC_FUNC_EXECVPE);
-+#endif
- 			nargv[0] = argv[0];
- 			nargv[1] = (char *)path;
- 			memcpy(nargv+2, argv+1, n*sizeof(char *));
-+#if defined (L_execvp)
- 			execve("/bin/sh", nargv, __environ);
-+#elif defined (L_execvpe)
-+			execve("/bin/sh", nargv, envp);
-+#endif
- 			EXEC_FREE(nargv, size2);
- 		}
- 	} else {
-@@ -277,8 +295,11 @@ int execvp(const char *path, char *const argv[])
- 			return -1;
- 		}
- 		len = (FILENAME_MAX - 1) - plen;
--
-+#if defined (L_execvp)
- 		buf = EXEC_ALLOC(FILENAME_MAX, size, EXEC_FUNC_EXECVP);
-+#elif defined (L_execvpe)
-+		buf = EXEC_ALLOC(FILENAME_MAX, size, EXEC_FUNC_EXECVPE);
-+#endif
- 		{
- 			int seen_small = 0;
- 			s0 = buf + len;
-@@ -300,8 +321,11 @@ int execvp(const char *path, char *const argv[])
- 					s[plen-1] = '/';
- 				}
- 
-+#if defined (L_execvp)
- 				execve(s, argv, __environ);
--
-+#elif defined (L_execvpe)
-+				execve(s, argv, envp);
-+#endif
- 				seen_small = 1;
- 
- 				if (errno == ENOEXEC) {
-@@ -325,7 +349,11 @@ int execvp(const char *path, char *const argv[])
- 
- 	return -1;
- }
-+#if defined (L_execvp)
- libc_hidden_def(execvp)
--
-+#elif defined (L_execvpe)
-+libc_hidden_def(execvpe)
- #endif
-+
-+#endif /* #if defined (L_execvp) || defined(L_execvpe) */
- /**********************************************************************/
-diff --git a/libc/unistd/execvpe.c b/libc/unistd/execvpe.c
-new file mode 100644
-index 0000000..5c1ce06
---- /dev/null
-+++ b/libc/unistd/execvpe.c
-@@ -0,0 +1,7 @@
-+/* Copyright (C) 2011      Hennning Heinold <heinold@inf.fu-berlin.de>
-+ *
-+ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
-+ */
-+
-+#define L_execvpe
-+#include "exec.c"
--- 
-1.7.5.3
-
-- 
1.7.9.5



