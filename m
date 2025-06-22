Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABBE2C7EE30
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 13:37:51 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.26370.1750599470486126281
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 06:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WnvRhzy8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c3d06de3so3906984b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750599470; x=1751204270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbeqwlcRSDDCTMqJa4ri6h3WXrAGSnQsjWBl9yFpxro=;
        b=WnvRhzy8jiIO8NEFCR5OhcNRvTk0v34OLok87DwTRLlY01Ct+aGIqKKxYm4pBAgruB
         bqh5JzHdAaRq9qRtZir2ivShNO4dBHx4BZrC11FiW8t7huOqX8TsK9t/QEYE1L3HOKsd
         z2GirJ//ndtrqqcishPQRrB5ZBbpVi8Q0fzFzyq9i1qw53r+bXioNZ+vglFKklFJjCYp
         RLzm22szYSKTZvwfMpcpYZ/fsS8kWj0VgN8VKdhaArUty6Vm0P6F1ESQUFlZ2RO572up
         oZMw13sO+ZxLcBbkHu44v2G/d2FuZ0pDxVdzxy6BOhey5mpcVYJi178yVK8XpmOmGE5X
         18+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750599470; x=1751204270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbeqwlcRSDDCTMqJa4ri6h3WXrAGSnQsjWBl9yFpxro=;
        b=DgAPgj1wHncvOO6TXwyGnYYdgNKWsl+4wza0BRacNzlqL6c38IisPC4o/GoHyuORCq
         vuSArATi6DKN9zsEVrzR0bgQZ+W9Dj+ahxqa9qmPffKvRk9uYbQnlQt1imLtM/9xQssS
         vJzoo3YRjmu+ztCp3JGyntIt4P76G01JxjsR/s3MBLd1ctoYnqSx/9url1NdfBXtW8CJ
         TVWx/nkJHObNXjazRnV0qKj1+AS4RciU2XcUEBKH9jBkUtb3DXgsecHenLbRgC8kUdDa
         lBvn6rg81KVCTQSOq1TLAaDwN+QvIHmvrwsAZKAi8D+7mOQ+KNt1nyTXqV87HaIQkP6o
         VFTw==
X-Gm-Message-State: AOJu0YweeGB2E5cYw4ZwkLy/k8hI5e0UB1CAHtgu81md6yRNaXhKi91C
	pSm/e+3OuTIkaRSM3cXQ7rhhI4e+rCuBdFSlIKnQ/4LSbPVrdz0UcAz7ZnEEVigX7svuiI4heZz
	2a+8BDRw=
X-Gm-Gg: ASbGncsGy/TYwrcZap6wKBj5EM4IN+0nbTYf3H+vo77Gi+NDpokruoemz/IP9g95DoJ
	axBymKIgZjuSaSfWRNdEeWGnYJDu0tZVHsRwUmZykK8lcx6cgiCFTrraNLmRJZvP96w2c74W1yH
	ctGmFxiGMpqd8VREKoKYDIcL8KiDpQDH9o22NP2IN3UrOBI6K/qm1HSoDJF/rzZ30hg/KtF4mdJ
	uJvNZ5xkVI76G90a7KAh02TDkciEqfGt+QmH5JQ3DXce3aeAI0eSaOA1J9eYPh39OKyNDVhZiae
	imOtfkSESFl/USspg3KS+8OB6rL0UxzBBFsDFYVzXUqMxbqpCg6foQ==
X-Google-Smtp-Source: AGHT+IF2YTRtgcAOa1XKq/pmyQJ6wcpKsTyVT784L5JaIo81z7gHWbsqjtIAE/AvyzXq+f6WIaxlDQ==
X-Received: by 2002:a05:6a00:3c90:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-7490da07100mr13115729b3a.21.1750599469629;
        Sun, 22 Jun 2025 06:37:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6a72afsm5960189b3a.163.2025.06.22.06.37.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 06:37:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/4] glibc: stable 2.39 branch updates
Date: Sun, 22 Jun 2025 06:37:31 -0700
Message-ID: <c94b6686a1edcaa1bea1ff5e716df96da8e36b7c.1750599311.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750599311.git.steve@sakoman.com>
References: <cover.1750599311.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 13:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219177

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline 3463100f2d47f2897a24ba8023a5c7aaf2d26550..06a70769fd0b2e1f2a3085ad50ab620282bd77b3
06a70769fd ppc64le: Revert "powerpc: Optimized strcmp for power10" (CVE-2025-5702)
3875045da5 ppc64le: Revert "powerpc : Add optimized memchr for POWER10" (Bug 33059)
c6240a11f7 ppc64le: Revert "powerpc: Fix performance issues of strcmp power10" (CVE-2025-5702)
2caef2827f elf: Fix subprocess status handling for tst-dlopen-sgid (bug 32987)
9e25c0f445 x86_64: Fix typo in ifunc-impl-list.c.
ca99d55315 elf: Test case for bug 32976 (CVE-2025-4802)
71ddb11ccd support: Add support_record_failure_barrier
abdeb4b520 support: Use const char * argument in support_capture_subprogram_self_sgid
147bed0a71 elf: Keep using minimal malloc after early DTV resize (bug 32412)
4e5ee49a43 sysdeps/unix/sysv/linux/x86_64/Makefile: Add the end marker
37b30b6a68 sysdeps/x86_64/Makefile (tests): Add the end marker
9fe51d34bb sort-makefile-lines.py: Allow '_' in name and "^# name"
14ec225d85 libio: Correctly link tst-popen-fork against libpthread
1dcfb9479d libio: Fix a deadlock after fork in popen
e31ac9a639 libio: Sort test variables in Makefile
68f3f1a1d0 Linux: Switch back to assembly syscall wrapper for prctl (bug 29770)
d33d10642f nptl: PTHREAD_COND_INITIALIZER compatibility with pre-2.41 versions (bug 32786)
b1eb369aee nptl: Use all of g1_start and g_signals
ac5da3c0e4 nptl: rename __condvar_quiesce_and_switch_g1
2fdc0afd07 nptl: Fix indentation
582c99b2c0 nptl: Use a single loop in pthread_cond_wait instaed of a nested loop
fc2a25417d nptl: Remove g_refs from condition variables
6f5ba03968 nptl: Remove unnecessary quadruple check in pthread_cond_wait
d0da34ad30 nptl: Remove unnecessary catch-all-wake in condvar group switch
ea13a35e37 nptl: Update comments and indentation for new condvar implementation
2451ef5c4a pthreads NPTL: lost wakeup fix 2

test results:
            Before After  Diff
FAIL           207   207     0
PASS          4912  4915    +3
UNSUPPORTED    230   230     0
XFAIL           16    16     0
XPASS            4     4     0

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc                 | 2 +-
 ...dsize.h-Unify-the-header-between-arm-and-aarch64.patch | 1 +
 ...d-hardcoded-build-time-paths-in-the-output-binar.patch | 2 +-
 .../glibc/glibc/0023-qemu-stale-process.patch             | 8 ++++----
 meta/recipes-core/glibc/glibc_2.39.bb                     | 3 ++-
 5 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 040fc793b1..0130613936 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "3463100f2d47f2897a24ba8023a5c7aaf2d26550"
+SRCREV_glibc ?= "06a70769fd0b2e1f2a3085ad50ab620282bd77b3"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 9bdfa76318..411ca55d9f 100644
--- a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -14,6 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  sysdeps/aarch64/bits/wordsize.h | 11 +++++++++--
  sysdeps/arm/bits/wordsize.h     | 22 +---------------------
  2 files changed, 10 insertions(+), 23 deletions(-)
+ mode change 100644 => 120000 sysdeps/arm/bits/wordsize.h
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
 index 118e59172d..ff86359fe8 100644
diff --git a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
index b527ddffc8..9e27a51e41 100644
--- a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
+++ b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
@@ -17,7 +17,7 @@ diff --git a/support/Makefile b/support/Makefile
 index 362a51f882..56d2b37058 100644
 --- a/support/Makefile
 +++ b/support/Makefile
-@@ -228,9 +228,9 @@ libsupport-inhibit-o += .o
+@@ -229,9 +229,9 @@ libsupport-inhibit-o += .o
  endif
  
  CFLAGS-support_paths.c = \
diff --git a/meta/recipes-core/glibc/glibc/0023-qemu-stale-process.patch b/meta/recipes-core/glibc/glibc/0023-qemu-stale-process.patch
index c0a467fcec..7c44acb013 100644
--- a/meta/recipes-core/glibc/glibc/0023-qemu-stale-process.patch
+++ b/meta/recipes-core/glibc/glibc/0023-qemu-stale-process.patch
@@ -22,16 +22,16 @@ diff --git a/sysdeps/unix/sysv/linux/Makefile  b/sysdeps/unix/sysv/linux/Makefil
    tst-sigtimedwait \
    tst-sync_file_range \
    tst-sysconf-iov_max \
-@@ -233,6 +232,8 @@
+@@ -234,6 +233,8 @@ tests += \
    tst-timerfd \
    tst-ttyname-direct \
    tst-ttyname-namespace \
 +  # Skip this test to avoid stale qemu process
 +  # tst-scm_rights \
    # tests
-
+ 
  # process_madvise requires CAP_SYS_ADMIN.
-@@ -270,9 +271,10 @@
+@@ -271,9 +272,10 @@ tests-time64 += \
    tst-ntp_gettimex-time64 \
    tst-ppoll-time64 \
    tst-prctl-time64 \
@@ -41,5 +41,5 @@ diff --git a/sysdeps/unix/sysv/linux/Makefile  b/sysdeps/unix/sysv/linux/Makefil
 +  # Skip this test to avoid stale qemu process
 +  # tst-scm_rights-time64 \
    # tests-time64
-
+ 
  tests-clone-internal = \
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index e4e2a766d7..c87eb76f41 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -17,7 +17,8 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395 \
+    CVE-2025-4802 CVE-2025-5702"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"
-- 
2.43.0


