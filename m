Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D83C35274
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:27 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.5850.1651048825551050043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VV7qKodZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id kq17so1978996ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5kRmPIJ/rXLhNoZykHVI7qSWKW0ui4k6qzeNLHrvzlE=;
        b=VV7qKodZfJrEvXw6YTrccKT0Zwy1H7dmipmbQ2WrSbyx7ylmKW7OLkjm4Ot5KKFarh
         5U7Pe52Q4S4mz1xhtuW+wZ9S3DgywCeDShA2cO7d+MTxUoc6c5HU3aho1tFPG1/G1o2l
         eqdm+LOowQZnK2GDJ5JGl8aPTroyzfJI1Jbet7WwNRFoANxWuUCAzwP0EQH3yJ/xsWkf
         3cCpG7EDrYloFNnVrNjWBpf8AsvmKuOs9oeRXK4V/cv16GpIbVwJbyLQNsD7FT1hVM0v
         58L7hRMS93rlaYRad0X/0RZpuRPSN3PnPsG2KiHnzTnmhZwqzZsrh1TWosjoNOtetpgh
         OoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5kRmPIJ/rXLhNoZykHVI7qSWKW0ui4k6qzeNLHrvzlE=;
        b=Xrf7SDf7VWvkatvA03AROs6XsOzy2018D0KvkN91WtBFdaJuilEJInO2A4xNo8G7nk
         1m6XXrUsuBYlDmRXcN9UO5YcWe2dKxQzEJaE5aFMwIjMt17zzXQ5Q+D1HZvUjXj5fM4Q
         itFJx/pxI42ABl9ScTDBxK/vAVPTPc4yfH8XtPgEOmebnB0OgDE5+ENbThqqzUW3csUi
         qboNbxWpShERwmjWhlxlghCdCLFyqcH0LUoUBK3rIqOIDyaHM2HbsC5aBJKB4XCQfRyH
         t3Aut6eoX1BKevn1IatzY7yKQwSfqmFcO0r81IXQRKTew6jXt1cVJTFsQWQHM8HGC7D8
         O0jw==
X-Gm-Message-State: AOAM533FfcTKYnplIiJC6Qc21H5ec2w967Dh0ZBoGhKKhrrInOgXH6iv
	9AWMPsxKcT1C/yGWqQxOIaRu0v/uSQ4=
X-Google-Smtp-Source: 
 ABdhPJwKS06JwXWTs35Q93wBtgXF7RFhffQEnIb6xU7PzskrGWEqibO5Upm++yAf8riRdJAZtGQqfw==
X-Received: by 2002:a17:907:961b:b0:6ef:fd58:8629 with SMTP id
 gb27-20020a170907961b00b006effd588629mr24951751ejc.589.1651048823832;
        Wed, 27 Apr 2022 01:40:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/18] valgrind: update 3.18.1 -> 3.19.0
Date: Wed, 27 Apr 2022 10:40:04 +0200
Message-Id: <20220427084009.3406717-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164904

Dropped patches are either backports, were merged upstream,
or upstream fixed the issue differently.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...Fix-drd-tests-shared_timed_mutex.cpp.patch |  26 +++
 ...against-__GLIBC_PREREQ-for-musl-libc.patch |  36 ----
 ...plement-linux-rseq-syscall-as-ENOSYS.patch | 198 ------------------
 ...ster.c-Limit-rawmemchr-test-to-glibc.patch |  35 ----
 .../0004-Fix-out-of-tree-builds.patch         | 176 ----------------
 ...wrap.c-Fake-__GLIBC_PREREQ-with-musl.patch |  28 ---
 ...{valgrind_3.18.1.bb => valgrind_3.19.0.bb} |  14 +-
 7 files changed, 33 insertions(+), 480 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Fix-drd-tests-shared_timed_mutex.cpp.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Implement-linux-rseq-syscall-as-ENOSYS.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.18.1.bb => valgrind_3.19.0.bb} (95%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-drd-tests-shared_timed_mutex.cpp.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Fix-drd-tests-shared_timed_mutex.cpp.patch
new file mode 100644
index 0000000000..738bf87c92
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Fix-drd-tests-shared_timed_mutex.cpp.patch
@@ -0,0 +1,26 @@
+From 900b3f9b0765488f0e1f457ff5d5d1e3efe897de Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 27 Apr 2022 10:01:22 +0200
+Subject: [PATCH] Fix drd/tests/shared_timed_mutex.cpp
+
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=453055]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ drd/tests/shared_timed_mutex.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drd/tests/shared_timed_mutex.cpp b/drd/tests/shared_timed_mutex.cpp
+index 9741169..dfd97a4 100644
+--- a/drd/tests/shared_timed_mutex.cpp
++++ b/drd/tests/shared_timed_mutex.cpp
+@@ -43,6 +43,7 @@ void g()
+         if (test_mutex.try_lock_shared_until(then))
+         {
+             test_mutex.unlock_shared();
++            break;
+         }
+     }
+     if (i == 3)
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
deleted file mode 100644
index 81ab29f3be..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1b5b6f827ac1153a41fc93e78bf34ccdf5720b9b Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Fri, 19 Oct 2018 10:31:12 -0400
-Subject: [PATCH] Guard against __GLIBC_PREREQ for musl libc
-
-Upstream-Status: Submitted https://bugs.kde.org/show_bug.cgi?id=400162
-
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
----
- memcheck/tests/linux/sys-statx.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/memcheck/tests/linux/sys-statx.c b/memcheck/tests/linux/sys-statx.c
-index fe9f9ba45..473c2cd7f 100644
---- a/memcheck/tests/linux/sys-statx.c
-+++ b/memcheck/tests/linux/sys-statx.c
-@@ -7,11 +7,16 @@
- #include <assert.h>
- #include <string.h>
- #include <sys/syscall.h>
-+
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
- #if __GLIBC_PREREQ(2,28)
- /* struct statx provided in sys/stat.h */
- #else
- #include <linux/stat.h>
- #endif
-+#else
-+#include <linux/stat.h>
-+#endif
- #include <errno.h>
- 
- int check_stat2;
--- 
-2.17.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Implement-linux-rseq-syscall-as-ENOSYS.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Implement-linux-rseq-syscall-as-ENOSYS.patch
deleted file mode 100644
index be1536980c..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Implement-linux-rseq-syscall-as-ENOSYS.patch
+++ /dev/null
@@ -1,198 +0,0 @@
-From 1024237358f01009fe233cb1294f3b8211304eaa Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Fri, 10 Dec 2021 17:41:59 +0100
-Subject: [PATCH] Implement linux rseq syscall as ENOSYS
-
-This implements rseq for amd64, arm, arm64, ppc32, ppc64,
-s390x and x86 linux as ENOSYS (without warning).
-
-glibc will start using rseq to accelerate sched_getcpu, if
-available. This would cause a warning from valgrind every
-time a new thread is started.
-
-Real rseq (restartable sequences) support is pretty hard, so
-for now just explicitly return ENOSYS (just like we do for clone3).
-
-Upstream-Status: Backport [ 1024237358f01009fe233cb1294f3b8211304eaa ]
-
-https://sourceware.org/pipermail/libc-alpha/2021-December/133656.html
----
- coregrind/m_syswrap/syswrap-amd64-linux.c | 2 ++
- coregrind/m_syswrap/syswrap-arm-linux.c   | 1 +
- coregrind/m_syswrap/syswrap-arm64-linux.c | 3 ++-
- coregrind/m_syswrap/syswrap-ppc32-linux.c | 2 ++
- coregrind/m_syswrap/syswrap-ppc64-linux.c | 2 ++
- coregrind/m_syswrap/syswrap-s390x-linux.c | 2 ++
- coregrind/m_syswrap/syswrap-x86-linux.c   | 2 ++
- include/vki/vki-scnums-arm-linux.h        | 1 +
- include/vki/vki-scnums-arm64-linux.h      | 4 +++-
- include/vki/vki-scnums-ppc32-linux.h      | 1 +
- include/vki/vki-scnums-ppc64-linux.h      | 1 +
- include/vki/vki-scnums-s390x-linux.h      | 5 ++++-
- 12 files changed, 23 insertions(+), 3 deletions(-)
-
-diff --git a/coregrind/m_syswrap/syswrap-amd64-linux.c b/coregrind/m_syswrap/syswrap-amd64-linux.c
-index 5062324a1..18b25f80a 100644
---- a/coregrind/m_syswrap/syswrap-amd64-linux.c
-+++ b/coregrind/m_syswrap/syswrap-amd64-linux.c
-@@ -862,6 +862,8 @@ static SyscallTableEntry syscall_table[] = {
- 
-    LINXY(__NR_statx,             sys_statx),             // 332
- 
-+   GENX_(__NR_rseq,              sys_ni_syscall),        // 334
-+
-    LINX_(__NR_membarrier,        sys_membarrier),        // 324
- 
-    LINX_(__NR_copy_file_range,   sys_copy_file_range),   // 326
-diff --git a/coregrind/m_syswrap/syswrap-arm-linux.c b/coregrind/m_syswrap/syswrap-arm-linux.c
-index 556dd844b..d583cef0c 100644
---- a/coregrind/m_syswrap/syswrap-arm-linux.c
-+++ b/coregrind/m_syswrap/syswrap-arm-linux.c
-@@ -1024,6 +1024,7 @@ static SyscallTableEntry syscall_main_table[] = {
-    LINX_(__NR_pwritev2,          sys_pwritev2),         // 393
- 
-    LINXY(__NR_statx,             sys_statx),            // 397
-+   GENX_(__NR_rseq,              sys_ni_syscall),       // 398
- 
-    LINXY(__NR_clock_gettime64,   sys_clock_gettime64),  // 403
-    LINX_(__NR_clock_settime64,   sys_clock_settime64),  // 404
-diff --git a/coregrind/m_syswrap/syswrap-arm64-linux.c b/coregrind/m_syswrap/syswrap-arm64-linux.c
-index b87107727..2066a38ea 100644
---- a/coregrind/m_syswrap/syswrap-arm64-linux.c
-+++ b/coregrind/m_syswrap/syswrap-arm64-linux.c
-@@ -823,8 +823,9 @@ static SyscallTableEntry syscall_main_table[] = {
-    //   (__NR_pkey_mprotect,     sys_ni_syscall),        // 288
-    //   (__NR_pkey_alloc,        sys_ni_syscall),        // 289
-    //   (__NR_pkey_free,         sys_ni_syscall),        // 290
-+   LINXY(__NR_statx,             sys_statx),             // 291
- 
--   LINXY(__NR_statx,             sys_statx),             // 397
-+   GENX_(__NR_rseq,              sys_ni_syscall),        // 293
- 
-    LINXY(__NR_io_uring_setup,    sys_io_uring_setup),    // 425
-    LINXY(__NR_io_uring_enter,    sys_io_uring_enter),    // 426
-diff --git a/coregrind/m_syswrap/syswrap-ppc32-linux.c b/coregrind/m_syswrap/syswrap-ppc32-linux.c
-index 6263ab845..637b2504e 100644
---- a/coregrind/m_syswrap/syswrap-ppc32-linux.c
-+++ b/coregrind/m_syswrap/syswrap-ppc32-linux.c
-@@ -1028,6 +1028,8 @@ static SyscallTableEntry syscall_table[] = {
- 
-    LINXY(__NR_statx,             sys_statx),            // 383
- 
-+   GENX_(__NR_rseq,              sys_ni_syscall),       // 387
-+
-    LINXY(__NR_clock_gettime64,   sys_clock_gettime64),  // 403
-    LINX_(__NR_clock_settime64,   sys_clock_settime64),  // 404
- 
-diff --git a/coregrind/m_syswrap/syswrap-ppc64-linux.c b/coregrind/m_syswrap/syswrap-ppc64-linux.c
-index a26b41c32..93956d3cc 100644
---- a/coregrind/m_syswrap/syswrap-ppc64-linux.c
-+++ b/coregrind/m_syswrap/syswrap-ppc64-linux.c
-@@ -1019,6 +1019,8 @@ static SyscallTableEntry syscall_table[] = {
- 
-    LINXY(__NR_statx,             sys_statx),            // 383
- 
-+   GENX_(__NR_rseq,              sys_ni_syscall),       // 387
-+
-    LINXY(__NR_io_uring_setup,    sys_io_uring_setup),    // 425
-    LINXY(__NR_io_uring_enter,    sys_io_uring_enter),    // 426
-    LINXY(__NR_io_uring_register, sys_io_uring_register), // 427
-diff --git a/coregrind/m_syswrap/syswrap-s390x-linux.c b/coregrind/m_syswrap/syswrap-s390x-linux.c
-index 5c9209859..73f9684c4 100644
---- a/coregrind/m_syswrap/syswrap-s390x-linux.c
-+++ b/coregrind/m_syswrap/syswrap-s390x-linux.c
-@@ -860,6 +860,8 @@ static SyscallTableEntry syscall_table[] = {
- 
-    LINXY(__NR_statx, sys_statx),                                      // 379
- 
-+   GENX_(__NR_rseq, sys_ni_syscall),                                  // 381
-+
-    LINXY(__NR_io_uring_setup, sys_io_uring_setup),                    // 425
-    LINXY(__NR_io_uring_enter, sys_io_uring_enter),                    // 426
-    LINXY(__NR_io_uring_register, sys_io_uring_register),              // 427
-diff --git a/coregrind/m_syswrap/syswrap-x86-linux.c b/coregrind/m_syswrap/syswrap-x86-linux.c
-index 1d8f45d33..8662ff501 100644
---- a/coregrind/m_syswrap/syswrap-x86-linux.c
-+++ b/coregrind/m_syswrap/syswrap-x86-linux.c
-@@ -1619,6 +1619,8 @@ static SyscallTableEntry syscall_table[] = {
-    /* Explicitly not supported on i386 yet. */
-    GENX_(__NR_arch_prctl,        sys_ni_syscall),       // 384
- 
-+   GENX_(__NR_rseq,              sys_ni_syscall),       // 386
-+
-    LINXY(__NR_clock_gettime64,   sys_clock_gettime64),  // 403
-    LINX_(__NR_clock_settime64,   sys_clock_settime64),  // 404
- 
-diff --git a/include/vki/vki-scnums-arm-linux.h b/include/vki/vki-scnums-arm-linux.h
-index ff560e19d..485db8b26 100644
---- a/include/vki/vki-scnums-arm-linux.h
-+++ b/include/vki/vki-scnums-arm-linux.h
-@@ -432,6 +432,7 @@
- #define __NR_pkey_alloc                 395
- #define __NR_pkey_free                  396
- #define __NR_statx                      397
-+#define __NR_rseq                       398
- 
- 
- 
-diff --git a/include/vki/vki-scnums-arm64-linux.h b/include/vki/vki-scnums-arm64-linux.h
-index 9aa3b2b5f..acdfb39c6 100644
---- a/include/vki/vki-scnums-arm64-linux.h
-+++ b/include/vki/vki-scnums-arm64-linux.h
-@@ -323,9 +323,11 @@
- #define __NR_pkey_alloc 289
- #define __NR_pkey_free 290
- #define __NR_statx 291
-+#define __NR_io_pgetevents 291
-+#define __NR_rseq 293
- 
- #undef __NR_syscalls
--#define __NR_syscalls 292
-+#define __NR_syscalls 294
- 
- ///*
- // * All syscalls below here should go away really,
-diff --git a/include/vki/vki-scnums-ppc32-linux.h b/include/vki/vki-scnums-ppc32-linux.h
-index 6987ad941..08fa77df0 100644
---- a/include/vki/vki-scnums-ppc32-linux.h
-+++ b/include/vki/vki-scnums-ppc32-linux.h
-@@ -415,6 +415,7 @@
- #define __NR_pkey_alloc		384
- #define __NR_pkey_free		385
- #define __NR_pkey_mprotect	386
-+#define __NR_rseq		387
- 
- #endif /* __VKI_SCNUMS_PPC32_LINUX_H */
- 
-diff --git a/include/vki/vki-scnums-ppc64-linux.h b/include/vki/vki-scnums-ppc64-linux.h
-index 6827964fd..a76fa6d32 100644
---- a/include/vki/vki-scnums-ppc64-linux.h
-+++ b/include/vki/vki-scnums-ppc64-linux.h
-@@ -407,6 +407,7 @@
- #define __NR_pkey_alloc		384
- #define __NR_pkey_free		385
- #define __NR_pkey_mprotect	386
-+#define __NR_rseq		387
- 
- #endif /* __VKI_SCNUMS_PPC64_LINUX_H */
- 
-diff --git a/include/vki/vki-scnums-s390x-linux.h b/include/vki/vki-scnums-s390x-linux.h
-index 6487e20c9..869c04584 100644
---- a/include/vki/vki-scnums-s390x-linux.h
-+++ b/include/vki/vki-scnums-s390x-linux.h
-@@ -342,8 +342,11 @@
- #define __NR_s390_guarded_storage	378
- #define __NR_statx			379
- #define __NR_s390_sthyi			380
-+#define __NR_kexec_file_load		381
-+#define __NR_io_pgetevents		382
-+#define __NR_rseq			383
- 
--#define NR_syscalls 381
-+#define NR_syscalls 384
- 
- /* 
-  * There are some system calls that are not present on 64 bit, some
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch b/meta/recipes-devtools/valgrind/valgrind/0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch
deleted file mode 100644
index 8f771ed0bd..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 568224da7e647d00abf14a7160997689d9745c89 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 10 Jun 2017 00:39:07 -0700
-Subject: [PATCH] str_tester.c: Limit rawmemchr() test to glibc
-
-rawmemchr() is a GNU extention therefore mark it so
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- memcheck/tests/str_tester.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/memcheck/tests/str_tester.c b/memcheck/tests/str_tester.c
-index 7c2ff1e..8b82ced 100644
---- a/memcheck/tests/str_tester.c
-+++ b/memcheck/tests/str_tester.c
-@@ -504,7 +504,7 @@ test_strchrnul (void)
- #endif
- 
- // DDD: better done by testing for the function.
--#if !defined(__APPLE__) && !defined(__sun) && !defined(__FreeBSD__)
-+#if !defined(__APPLE__) && !defined(__sun) && !defined(__FreeBSD__) && defined(__GLIBC__)
- static void
- test_rawmemchr (void)
- {
-@@ -1451,7 +1451,7 @@ main (void)
-   test_strchrnul ();
- # endif
- 
--# if !defined(__APPLE__) && !defined(__sun) && !defined(__FreeBSD__)
-+# if !defined(__APPLE__) && !defined(__sun) && !defined(__FreeBSD__) && defined(__GLIBC__)
-   /* rawmemchr.  */
-   test_rawmemchr ();
- # endif
diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
deleted file mode 100644
index 9a25b67961..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From 59e3190e9121c5439d54298b083b44c5c3794a7f Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Tue, 16 Oct 2018 21:01:04 -0400
-Subject: [PATCH] Fix out of tree builds.
-
-The paths to these files need to be fully specified in
-the out of tree build case. glibc-2.X.supp is a generated file so the
-full path
-is deliberately not specified in that case.
-
-RP 2013/03/23
-
-Patch refreshed for valgrind-3.14.0.
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=445211]
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
-
----
- configure.ac | 62 ++++++++++++++++++++++++++--------------------------
- 1 file changed, 31 insertions(+), 31 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b851798..d360896 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -447,50 +447,50 @@ case "${host_os}" in
- 	     9.*)
- 		  AC_MSG_RESULT([Darwin 9.x (${kernel}) / Mac OS X 10.5 Leopard])
- 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_5, [Darwin / Mac OS X version])
--		  DEFAULT_SUPP="darwin9.supp ${DEFAULT_SUPP}"
--		  DEFAULT_SUPP="darwin9-drd.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin9.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin9-drd.supp ${DEFAULT_SUPP}"
- 		  ;;
- 	     10.*)
- 		  AC_MSG_RESULT([Darwin 10.x (${kernel}) / Mac OS X 10.6 Snow Leopard])
- 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_6, [Darwin / Mac OS X version])
--		  DEFAULT_SUPP="darwin10.supp ${DEFAULT_SUPP}"
--		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin10.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
- 		  ;;
- 	     11.*)
- 		  AC_MSG_RESULT([Darwin 11.x (${kernel}) / Mac OS X 10.7 Lion])
- 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_7, [Darwin / Mac OS X version])
--		  DEFAULT_SUPP="darwin11.supp ${DEFAULT_SUPP}"
--		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin11.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
- 		  ;;
- 	     12.*)
- 		  AC_MSG_RESULT([Darwin 12.x (${kernel}) / Mac OS X 10.8 Mountain Lion])
- 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_8, [Darwin / Mac OS X version])
--		  DEFAULT_SUPP="darwin12.supp ${DEFAULT_SUPP}"
--		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin12.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
- 		  ;;
- 	     13.*)
- 		  AC_MSG_RESULT([Darwin 13.x (${kernel}) / Mac OS X 10.9 Mavericks])
- 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_9, [Darwin / Mac OS X version])
--		  DEFAULT_SUPP="darwin13.supp ${DEFAULT_SUPP}"
--		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin13.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
- 		  ;;
- 	     14.*)
- 		  AC_MSG_RESULT([Darwin 14.x (${kernel}) / Mac OS X 10.10 Yosemite])
- 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_10, [Darwin / Mac OS X version])
--		  DEFAULT_SUPP="darwin14.supp ${DEFAULT_SUPP}"
--		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin14.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
- 		  ;;
- 	     15.*)
- 		  AC_MSG_RESULT([Darwin 15.x (${kernel}) / Mac OS X 10.11 El Capitan])
- 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_11, [Darwin / Mac OS X version])
--		  DEFAULT_SUPP="darwin15.supp ${DEFAULT_SUPP}"
--		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin15.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
- 		  ;;
- 	     16.*)
- 		  AC_MSG_RESULT([Darwin 16.x (${kernel}) / macOS 10.12 Sierra])
- 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_12, [Darwin / Mac OS X version])
--		  DEFAULT_SUPP="darwin16.supp ${DEFAULT_SUPP}"
--		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin16.supp ${DEFAULT_SUPP}"
-+                  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
- 		  ;;
- 	     17.*)
- 		  AC_MSG_RESULT([Darwin 17.x (${kernel}) / macOS 10.13 High Sierra])
-@@ -515,7 +515,7 @@ case "${host_os}" in
-                  DEFAULT_SUPP="solaris12.supp ${DEFAULT_SUPP}"
-                  ;;
-              *)
--                 DEFAULT_SUPP="solaris11.supp ${DEFAULT_SUPP}"
-+                 DEFAULT_SUPP="$srcdir/solaris11.supp ${DEFAULT_SUPP}"
-                  ;;
- 	esac
-         ;;
-@@ -523,7 +523,7 @@ case "${host_os}" in
-      solaris2.12*)
-         AC_MSG_RESULT([ok (${host_os})])
-         VGCONF_OS="solaris"
--        DEFAULT_SUPP="solaris12.supp ${DEFAULT_SUPP}"
-+        DEFAULT_SUPP="$srcdir/solaris12.supp ${DEFAULT_SUPP}"
-         ;;
- 
-      *) 
-@@ -1237,15 +1237,15 @@ AC_MSG_CHECKING([the glibc version])
- case "${GLIBC_VERSION}" in
-      2.2)
- 	AC_MSG_RESULT(${GLIBC_VERSION} family)
--	DEFAULT_SUPP="glibc-2.2.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.2-LinuxThreads-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+        DEFAULT_SUPP="$srcdir/glibc-2.2.supp ${DEFAULT_SUPP}"
-+        DEFAULT_SUPP="$srcdir/glibc-2.2-LinuxThreads-helgrind.supp ${DEFAULT_SUPP}"
-+        DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.[[3-6]])
- 	AC_MSG_RESULT(${GLIBC_VERSION} family)
--	DEFAULT_SUPP="glibc-${GLIBC_VERSION}.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+        DEFAULT_SUPP="$srcdir/glibc-${GLIBC_VERSION}.supp ${DEFAULT_SUPP}"
-+        DEFAULT_SUPP="$srcdir/glibc-2.X-helgrind.supp ${DEFAULT_SUPP}"
-+        DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.[[7-9]])
- 	AC_MSG_RESULT(${GLIBC_VERSION} family)
-@@ -1258,8 +1258,8 @@ case "${GLIBC_VERSION}" in
- 	AC_DEFINE([GLIBC_MANDATORY_STRLEN_REDIRECT], 1,
- 		  [Define to 1 if strlen() has been optimized heavily (amd64 glibc >= 2.10)])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+        DEFAULT_SUPP="$srcdir/glibc-2.X-helgrind.supp ${DEFAULT_SUPP}"
-+        DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      2.*)
- 	AC_MSG_RESULT(${GLIBC_VERSION} family)
-@@ -1268,8 +1268,8 @@ case "${GLIBC_VERSION}" in
- 	AC_DEFINE([GLIBC_MANDATORY_INDEX_AND_STRLEN_REDIRECT], 1,
- 		  [Define to 1 if index() and strlen() have been optimized heavily (x86 glibc >= 2.12)])
- 	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-helgrind.supp ${DEFAULT_SUPP}"
--	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+        DEFAULT_SUPP="$srcdir/glibc-2.X-helgrind.supp ${DEFAULT_SUPP}"
-+        DEFAULT_SUPP="$srcdir/glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-      darwin)
- 	AC_MSG_RESULT(Darwin)
-@@ -1284,7 +1284,7 @@ case "${GLIBC_VERSION}" in
-      bionic)
- 	AC_MSG_RESULT(Bionic)
- 	AC_DEFINE([BIONIC_LIBC], 1, [Define to 1 if you're using Bionic])
--	DEFAULT_SUPP="bionic.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="$srcdir/bionic.supp ${DEFAULT_SUPP}"
- 	;;
-      solaris)
- 	AC_MSG_RESULT(Solaris)
-@@ -1313,8 +1313,8 @@ if test "$VGCONF_OS" != "solaris"; then
-     # attempt to detect whether such libraries are installed on the
-     # build machine (or even if any X facilities are present); just
-     # add the suppressions antidisirregardless.
--    DEFAULT_SUPP="xfree-4.supp ${DEFAULT_SUPP}"
--    DEFAULT_SUPP="xfree-3.supp ${DEFAULT_SUPP}"
-+    DEFAULT_SUPP="$srcdir/xfree-4.supp ${DEFAULT_SUPP}"
-+    DEFAULT_SUPP="$srcdir/xfree-3.supp ${DEFAULT_SUPP}"
- fi
- 
- 
diff --git a/meta/recipes-devtools/valgrind/valgrind/0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch
deleted file mode 100644
index 02241781d9..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ace5fe19b3f13039d5d6bd5d99d54c20ea79e09c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 10 Jun 2017 01:07:59 -0700
-Subject: [PATCH] tc20_verifywrap.c: Fake __GLIBC_PREREQ with musl
-
-similar to sun
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- helgrind/tests/tc20_verifywrap.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/helgrind/tests/tc20_verifywrap.c b/helgrind/tests/tc20_verifywrap.c
-index ae97bde..db2eb70 100644
---- a/helgrind/tests/tc20_verifywrap.c
-+++ b/helgrind/tests/tc20_verifywrap.c
-@@ -20,7 +20,7 @@
- 
- #if !defined(__APPLE__) && !defined(__FreeBSD__)
- 
--#if defined(__sun__)
-+#if defined(__sun__) || (defined(__linux__) && !defined(__GLIBC__))
- /* Fake __GLIBC_PREREQ on Solaris. Pretend glibc >= 2.4. */
- # define __GLIBC_PREREQ
- #else
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.19.0.bb
similarity index 95%
rename from meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.19.0.bb
index 0c297ad6b9..6e3234be6b 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.19.0.bb
@@ -19,22 +19,18 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://remove-for-aarch64 \
            file://remove-for-all \
            file://taskset_nondeterministic_tests \
-           file://0004-Fix-out-of-tree-builds.patch \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
            file://avoid-neon-for-targets-which-don-t-support-it.patch \
            file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch \
            file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch \
-           file://0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch \
            file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch \
            file://0002-context-APIs-are-not-available-on-musl.patch \
            file://0003-correct-include-directive-path-for-config.h.patch \
-           file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
            file://0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch \
            file://0002-memcheck-x86-Define-__THROW-if-not-defined.patch \
            file://0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch \
            file://0001-fix-opcode-not-supported-on-mips32-linux.patch \
-           file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
            file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
            file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
            file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
@@ -42,10 +38,10 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://s390x_vec_op_t.patch \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
-           file://0001-Implement-linux-rseq-syscall-as-ENOSYS.patch \
            file://0001-docs-Disable-manual-validation.patch \
+           file://0001-Fix-drd-tests-shared_timed_mutex.cpp.patch \
            "
-SRC_URI[sha256sum] = "00859aa13a772eddf7822225f4b46ee0d39afbe071d32778da4d99984081f7f5"
+SRC_URI[sha256sum] = "dd5e34486f1a483ff7be7300cc16b4d6b24690987877c3278d797534d6738f02"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
@@ -145,9 +141,10 @@ SKIP_FILEDEPS:${PN}-ptest = '1'
 INSANE_SKIP:${PN}-ptest = "debug-deps"
 
 do_compile_ptest() {
-    oe_runmake check
+    oe_runmake ${PARALLEL_MAKE} check
 }
 
+
 do_install_ptest() {
     chmod +x ${B}/tests/vg_regtest
 
@@ -237,6 +234,9 @@ do_install_ptest() {
     # This is known failure see https://bugs.kde.org/show_bug.cgi?id=435732
     rm ${D}${PTEST_PATH}/memcheck/tests/leak_cpp_interior.vgtest
 
+    # https://bugs.kde.org/show_bug.cgi?id=445743
+    rm ${D}${PTEST_PATH}/drd/tests/pth_mutex_signal
+
     # As the binary isn't stripped or debug-splitted, the source file isn't fetched
     # via dwarfsrcfiles either, so it needs to be installed manually.
     mkdir -p ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
-- 
2.30.2


