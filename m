Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E434C433FE
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 01:37:38 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.59348.1640828257689416374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BU1bZsx025270
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1BU1bU86016107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:35 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Dec 2021 17:37:30 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 29 Dec 2021 17:37:30 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/5] valgrind: backport rseq work-around
Date: Wed, 29 Dec 2021 17:37:27 -0800
Message-ID: <20211230013730.129852-3-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211230013730.129852-1-Randy.MacLeod@windriver.com>
References: <20211230013730.129852-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 01:37:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160056

Using glibc-2.35-alpha, valgrind ptests mostly all fail with the error:
   WARNING: unhandled amd64-linux syscall: 334
   You may be able to write your own handler.
With this patch applied qemux86-64 ptest results were:
   TOTAL: 728
   PASSED: 709
   FAILED: 0
   SKIPPED: 19

This patch implements the Linux rseq syscall as ENOSYS while
a proper fix is being worked on as desribed in the patch
commit log.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...plement-linux-rseq-syscall-as-ENOSYS.patch | 198 ++++++++++++++++++
 .../valgrind/valgrind_3.18.1.bb               |   1 +
 2 files changed, 199 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Implement-linux-rseq-syscall-as-ENOSYS.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Implement-linux-rseq-syscall-as-ENOSYS.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Implement-linux-rseq-syscall-as-ENOSYS.patch
new file mode 100644
index 0000000000..be1536980c
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Implement-linux-rseq-syscall-as-ENOSYS.patch
@@ -0,0 +1,198 @@
+From 1024237358f01009fe233cb1294f3b8211304eaa Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Fri, 10 Dec 2021 17:41:59 +0100
+Subject: [PATCH] Implement linux rseq syscall as ENOSYS
+
+This implements rseq for amd64, arm, arm64, ppc32, ppc64,
+s390x and x86 linux as ENOSYS (without warning).
+
+glibc will start using rseq to accelerate sched_getcpu, if
+available. This would cause a warning from valgrind every
+time a new thread is started.
+
+Real rseq (restartable sequences) support is pretty hard, so
+for now just explicitly return ENOSYS (just like we do for clone3).
+
+Upstream-Status: Backport [ 1024237358f01009fe233cb1294f3b8211304eaa ]
+
+https://sourceware.org/pipermail/libc-alpha/2021-December/133656.html
+---
+ coregrind/m_syswrap/syswrap-amd64-linux.c | 2 ++
+ coregrind/m_syswrap/syswrap-arm-linux.c   | 1 +
+ coregrind/m_syswrap/syswrap-arm64-linux.c | 3 ++-
+ coregrind/m_syswrap/syswrap-ppc32-linux.c | 2 ++
+ coregrind/m_syswrap/syswrap-ppc64-linux.c | 2 ++
+ coregrind/m_syswrap/syswrap-s390x-linux.c | 2 ++
+ coregrind/m_syswrap/syswrap-x86-linux.c   | 2 ++
+ include/vki/vki-scnums-arm-linux.h        | 1 +
+ include/vki/vki-scnums-arm64-linux.h      | 4 +++-
+ include/vki/vki-scnums-ppc32-linux.h      | 1 +
+ include/vki/vki-scnums-ppc64-linux.h      | 1 +
+ include/vki/vki-scnums-s390x-linux.h      | 5 ++++-
+ 12 files changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/coregrind/m_syswrap/syswrap-amd64-linux.c b/coregrind/m_syswrap/syswrap-amd64-linux.c
+index 5062324a1..18b25f80a 100644
+--- a/coregrind/m_syswrap/syswrap-amd64-linux.c
++++ b/coregrind/m_syswrap/syswrap-amd64-linux.c
+@@ -862,6 +862,8 @@ static SyscallTableEntry syscall_table[] = {
+ 
+    LINXY(__NR_statx,             sys_statx),             // 332
+ 
++   GENX_(__NR_rseq,              sys_ni_syscall),        // 334
++
+    LINX_(__NR_membarrier,        sys_membarrier),        // 324
+ 
+    LINX_(__NR_copy_file_range,   sys_copy_file_range),   // 326
+diff --git a/coregrind/m_syswrap/syswrap-arm-linux.c b/coregrind/m_syswrap/syswrap-arm-linux.c
+index 556dd844b..d583cef0c 100644
+--- a/coregrind/m_syswrap/syswrap-arm-linux.c
++++ b/coregrind/m_syswrap/syswrap-arm-linux.c
+@@ -1024,6 +1024,7 @@ static SyscallTableEntry syscall_main_table[] = {
+    LINX_(__NR_pwritev2,          sys_pwritev2),         // 393
+ 
+    LINXY(__NR_statx,             sys_statx),            // 397
++   GENX_(__NR_rseq,              sys_ni_syscall),       // 398
+ 
+    LINXY(__NR_clock_gettime64,   sys_clock_gettime64),  // 403
+    LINX_(__NR_clock_settime64,   sys_clock_settime64),  // 404
+diff --git a/coregrind/m_syswrap/syswrap-arm64-linux.c b/coregrind/m_syswrap/syswrap-arm64-linux.c
+index b87107727..2066a38ea 100644
+--- a/coregrind/m_syswrap/syswrap-arm64-linux.c
++++ b/coregrind/m_syswrap/syswrap-arm64-linux.c
+@@ -823,8 +823,9 @@ static SyscallTableEntry syscall_main_table[] = {
+    //   (__NR_pkey_mprotect,     sys_ni_syscall),        // 288
+    //   (__NR_pkey_alloc,        sys_ni_syscall),        // 289
+    //   (__NR_pkey_free,         sys_ni_syscall),        // 290
++   LINXY(__NR_statx,             sys_statx),             // 291
+ 
+-   LINXY(__NR_statx,             sys_statx),             // 397
++   GENX_(__NR_rseq,              sys_ni_syscall),        // 293
+ 
+    LINXY(__NR_io_uring_setup,    sys_io_uring_setup),    // 425
+    LINXY(__NR_io_uring_enter,    sys_io_uring_enter),    // 426
+diff --git a/coregrind/m_syswrap/syswrap-ppc32-linux.c b/coregrind/m_syswrap/syswrap-ppc32-linux.c
+index 6263ab845..637b2504e 100644
+--- a/coregrind/m_syswrap/syswrap-ppc32-linux.c
++++ b/coregrind/m_syswrap/syswrap-ppc32-linux.c
+@@ -1028,6 +1028,8 @@ static SyscallTableEntry syscall_table[] = {
+ 
+    LINXY(__NR_statx,             sys_statx),            // 383
+ 
++   GENX_(__NR_rseq,              sys_ni_syscall),       // 387
++
+    LINXY(__NR_clock_gettime64,   sys_clock_gettime64),  // 403
+    LINX_(__NR_clock_settime64,   sys_clock_settime64),  // 404
+ 
+diff --git a/coregrind/m_syswrap/syswrap-ppc64-linux.c b/coregrind/m_syswrap/syswrap-ppc64-linux.c
+index a26b41c32..93956d3cc 100644
+--- a/coregrind/m_syswrap/syswrap-ppc64-linux.c
++++ b/coregrind/m_syswrap/syswrap-ppc64-linux.c
+@@ -1019,6 +1019,8 @@ static SyscallTableEntry syscall_table[] = {
+ 
+    LINXY(__NR_statx,             sys_statx),            // 383
+ 
++   GENX_(__NR_rseq,              sys_ni_syscall),       // 387
++
+    LINXY(__NR_io_uring_setup,    sys_io_uring_setup),    // 425
+    LINXY(__NR_io_uring_enter,    sys_io_uring_enter),    // 426
+    LINXY(__NR_io_uring_register, sys_io_uring_register), // 427
+diff --git a/coregrind/m_syswrap/syswrap-s390x-linux.c b/coregrind/m_syswrap/syswrap-s390x-linux.c
+index 5c9209859..73f9684c4 100644
+--- a/coregrind/m_syswrap/syswrap-s390x-linux.c
++++ b/coregrind/m_syswrap/syswrap-s390x-linux.c
+@@ -860,6 +860,8 @@ static SyscallTableEntry syscall_table[] = {
+ 
+    LINXY(__NR_statx, sys_statx),                                      // 379
+ 
++   GENX_(__NR_rseq, sys_ni_syscall),                                  // 381
++
+    LINXY(__NR_io_uring_setup, sys_io_uring_setup),                    // 425
+    LINXY(__NR_io_uring_enter, sys_io_uring_enter),                    // 426
+    LINXY(__NR_io_uring_register, sys_io_uring_register),              // 427
+diff --git a/coregrind/m_syswrap/syswrap-x86-linux.c b/coregrind/m_syswrap/syswrap-x86-linux.c
+index 1d8f45d33..8662ff501 100644
+--- a/coregrind/m_syswrap/syswrap-x86-linux.c
++++ b/coregrind/m_syswrap/syswrap-x86-linux.c
+@@ -1619,6 +1619,8 @@ static SyscallTableEntry syscall_table[] = {
+    /* Explicitly not supported on i386 yet. */
+    GENX_(__NR_arch_prctl,        sys_ni_syscall),       // 384
+ 
++   GENX_(__NR_rseq,              sys_ni_syscall),       // 386
++
+    LINXY(__NR_clock_gettime64,   sys_clock_gettime64),  // 403
+    LINX_(__NR_clock_settime64,   sys_clock_settime64),  // 404
+ 
+diff --git a/include/vki/vki-scnums-arm-linux.h b/include/vki/vki-scnums-arm-linux.h
+index ff560e19d..485db8b26 100644
+--- a/include/vki/vki-scnums-arm-linux.h
++++ b/include/vki/vki-scnums-arm-linux.h
+@@ -432,6 +432,7 @@
+ #define __NR_pkey_alloc                 395
+ #define __NR_pkey_free                  396
+ #define __NR_statx                      397
++#define __NR_rseq                       398
+ 
+ 
+ 
+diff --git a/include/vki/vki-scnums-arm64-linux.h b/include/vki/vki-scnums-arm64-linux.h
+index 9aa3b2b5f..acdfb39c6 100644
+--- a/include/vki/vki-scnums-arm64-linux.h
++++ b/include/vki/vki-scnums-arm64-linux.h
+@@ -323,9 +323,11 @@
+ #define __NR_pkey_alloc 289
+ #define __NR_pkey_free 290
+ #define __NR_statx 291
++#define __NR_io_pgetevents 291
++#define __NR_rseq 293
+ 
+ #undef __NR_syscalls
+-#define __NR_syscalls 292
++#define __NR_syscalls 294
+ 
+ ///*
+ // * All syscalls below here should go away really,
+diff --git a/include/vki/vki-scnums-ppc32-linux.h b/include/vki/vki-scnums-ppc32-linux.h
+index 6987ad941..08fa77df0 100644
+--- a/include/vki/vki-scnums-ppc32-linux.h
++++ b/include/vki/vki-scnums-ppc32-linux.h
+@@ -415,6 +415,7 @@
+ #define __NR_pkey_alloc		384
+ #define __NR_pkey_free		385
+ #define __NR_pkey_mprotect	386
++#define __NR_rseq		387
+ 
+ #endif /* __VKI_SCNUMS_PPC32_LINUX_H */
+ 
+diff --git a/include/vki/vki-scnums-ppc64-linux.h b/include/vki/vki-scnums-ppc64-linux.h
+index 6827964fd..a76fa6d32 100644
+--- a/include/vki/vki-scnums-ppc64-linux.h
++++ b/include/vki/vki-scnums-ppc64-linux.h
+@@ -407,6 +407,7 @@
+ #define __NR_pkey_alloc		384
+ #define __NR_pkey_free		385
+ #define __NR_pkey_mprotect	386
++#define __NR_rseq		387
+ 
+ #endif /* __VKI_SCNUMS_PPC64_LINUX_H */
+ 
+diff --git a/include/vki/vki-scnums-s390x-linux.h b/include/vki/vki-scnums-s390x-linux.h
+index 6487e20c9..869c04584 100644
+--- a/include/vki/vki-scnums-s390x-linux.h
++++ b/include/vki/vki-scnums-s390x-linux.h
+@@ -342,8 +342,11 @@
+ #define __NR_s390_guarded_storage	378
+ #define __NR_statx			379
+ #define __NR_s390_sthyi			380
++#define __NR_kexec_file_load		381
++#define __NR_io_pgetevents		382
++#define __NR_rseq			383
+ 
+-#define NR_syscalls 381
++#define NR_syscalls 384
+ 
+ /* 
+  * There are some system calls that are not present on 64 bit, some
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
index d8f82a4100..7837034f92 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://s390x_vec_op_t.patch \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
+           file://0001-Implement-linux-rseq-syscall-as-ENOSYS.patch \
            "
 SRC_URI[sha256sum] = "00859aa13a772eddf7822225f4b46ee0d39afbe071d32778da4d99984081f7f5"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.31.1


