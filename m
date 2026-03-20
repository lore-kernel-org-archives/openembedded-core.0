Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E219E1099B40
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 20:58:28 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23079.1774040305141213203
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 13:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DoRLIEcR;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6b0500e06so2688343eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 13:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774040304; x=1774645104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ybC8q7X15XhZY665TgpaNzii17wZ5IOGK6V2aFadY1E=;
        b=DoRLIEcRwQHNNpDPQRIHxNaIYtT/NRJn2jrpre95p76AjZTlEMh8ridv5M/IPPO1Lo
         YN4Ck2Od5sH4Iqt/PibWIs6UFtKY9kJk6qTnAgWaaakqZWKSXbv2ioBYsKnQNvVZu3St
         GtC+28MD6jcqU5pVck8yF+P/J+r9uUJmDjqxmvP8UobgoA0itTr+u8sESTy6ze+78RLE
         DViBh5wcJqUcc/Rhb8ISlfdOXaMFxxQ4ot7NbRl5mbCpGkXIXVI/OQQFhgPU/+/aQAQK
         PrPfMk+t/EBEy7Oy+6aerW5Kv7+7UuGfc6KkMz577RItw1ivCq37V6hhSL3ohOKcwJK/
         RI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774040304; x=1774645104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybC8q7X15XhZY665TgpaNzii17wZ5IOGK6V2aFadY1E=;
        b=ausZ2f4TxrJcGosYv3D26W1bjGULgg3wkJNI2z2oPup14z9Hee7vZMCas0sTohJAau
         Jl6u4qKsS5LGOIOiNwHrwi0DefN7gYytHY+tfKtV/jRkvenCXukMaMOpfEZrJC6+mPKg
         qjwBaYknJTXnHIfLzDZtGaJSCl/sXUnVUGA7h9Ex4Vo8+3Hb5ZpK+eUfZAGzvkVGo2Hu
         /1v1UIzsa68EYspscdnqlANdvS0v+aDe3ebq2l5PUqWUDZrlgrmGFHJQsoZPkWbjLtwW
         8esZADpkb+FUJZgLMLSEkDUrh/8Gd9b+6DGwJ/GY0IrHqh+rj4NilZ4JbnLuEObVha1Q
         w5SA==
X-Gm-Message-State: AOJu0YzVkYYFNcWToOVk7X0hT8uwCf1qhR00dQl3IMYX23QK3Pd/czE5
	QQxDc2twZJqrQZ6axODzUwBNv/AjQfQC1D3G1soqxmMJ3i7FtW3b24TIWZMCcHgk
X-Gm-Gg: ATEYQzymYfihIbSJvl3JSwM7woRzqzJaLykPsG0fAzxnsFlTAxsFm5kaED8nr3NfgWc
	pAapxvyeSqeYYA+ixo6BAnwfgui5V+aKQE/QBp5MxxMySwbUNeXZVFBh3NQWc9MGN+mRxLRKeWw
	07IPls+DyIakglOqxA0zLGiHbnjGOj7OBfydiUDOiNpcqHQEjkSn5Mhy83S0KosZqkZInGBcROI
	veLsXTVi+9vkqQu3sQ7V8qlf3Uk+uYSHnO1+g5OEg9KofJrSDO9mBHngdrrmWAeKgnGG6x4AmVd
	6Bd60zoITztsMW1O52YPXuWyPwXcyrxa1WG64IEbgSlgC5Y1HtxDgAIox4afz3GDdKKfJiJ0ibK
	Q4lx/ykrljE/9t8Zbnm2zAMiyk6Py3TsPTwSAK6OuiR/POyOnaF+d2LY3/ldZKLfCFR5aanGSDl
	HQA69HaVlI9vTP6r60abpZX4xyp+b3fzpJnbxkHC1/oTaQwXrPChdKG5b5tHbDrxv3Ogh/aSRQV
	YJY2Vd0Rggnri+NgyhmIHYNQJmj9YpV+Mqt2+7ViGSRW7ju1iUyGsB0LskI
X-Received: by 2002:a05:7300:bc84:b0:2ba:7617:eeb1 with SMTP id 5a478bee46e88-2c109626b62mr2037250eec.12.1774040304055;
        Fri, 20 Mar 2026 13:58:24 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c757sm4770270eec.18.2026.03.20.13.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 13:58:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] musl: Upgrade to 1.2.6
Date: Fri, 20 Mar 2026 13:58:20 -0700
Message-ID: <20260320205820.2457796-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 20:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233633

Drop upstreamed patch for riscv syscall wirings

brings following changes

* 9fa28ece release 1.2.6
* 1347154c vdso: add support for GNU hash tables
* 149d8729 getgr*: validate group member lists from nscd backend
* 19f9aeaa sys/mman.h: add MADV_COLLAPSE from linux v6.1
* 56df2e1f sys/mman.h: add MADV_DONTNEED_LOCKED from linux v6.0
* bb5693fa sys/mman.h: add MADV_POPULATE_(READ|WRITE) from linux v5.14
* 9355c443 loongarch64: add lsx and lasx regset definition
* b5146b83 loongarch64: add fpu and simd context to signal.h
* 38b00812 loongarch64: add new reloc types and NT_LOONGARCH_HW_* into elf.h
* b37d241d fenv: add missing C dummy functions for loongarch64 soft float
* 5c901bb3 update syscalls up to linux 6.19
* 4268281a getifaddr: fix typo ssl to sll
* 5c26c890 mallocng: prevent stray ';' at top-level
* 1b76ff07 s390x: shuffle register usage in __tls_get_offset to avoid r0 as address

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...for-r32-rv64-from-kernel-6.4-through.patch | 70 -------------------
 meta/recipes-core/musl/musl_git.bb            |  5 +-
 2 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-core/musl/musl/0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch

diff --git a/meta/recipes-core/musl/musl/0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch b/meta/recipes-core/musl/musl/0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch
deleted file mode 100644
index 78ba903ca6..0000000000
--- a/meta/recipes-core/musl/musl/0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 31dce8e958f5185e7fda653214da12bbc75f244e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 4 Dec 2024 11:16:43 -0800
-Subject: [PATCH] Update syscalls for r32/rv64 from kernel 6.4 through 6.10
-
-Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2024/12/04/3]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- arch/riscv32/bits/syscall.h.in | 11 +++++++++++
- arch/riscv64/bits/syscall.h.in | 11 +++++++++++
- 2 files changed, 22 insertions(+)
-
-diff --git a/arch/riscv32/bits/syscall.h.in b/arch/riscv32/bits/syscall.h.in
-index 9228d840..a54d9ffc 100644
---- a/arch/riscv32/bits/syscall.h.in
-+++ b/arch/riscv32/bits/syscall.h.in
-@@ -216,6 +216,7 @@
- #define __NR_perf_event_open 241
- #define __NR_accept4 242
- #define __NR_arch_specific_syscall 244
-+#define __NR_riscv_hwprobe 258
- #define __NR_prlimit64 261
- #define __NR_fanotify_init 262
- #define __NR_fanotify_mark 263
-@@ -295,6 +296,16 @@
- #define __NR_cachestat		451
- #define __NR_fchmodat2		452
- #define __NR_futex __NR_futex_time64
-+#define __NR_map_shadow_stack 453
-+#define __NR_futex_wake 454
-+#define __NR_futex_wait 455
-+#define __NR_futex_requeue 456
-+#define __NR_statmount 457
-+#define __NR_listmount 458
-+#define __NR_lsm_get_self_attr 459
-+#define __NR_lsm_list_modules 461
-+#define __NR_lsm_set_self_attr 460
-+#define __NR_mseal 462
- 
- #define __NR_sysriscv __NR_arch_specific_syscall
- #define __NR_riscv_flush_icache (__NR_sysriscv + 15)
-diff --git a/arch/riscv64/bits/syscall.h.in b/arch/riscv64/bits/syscall.h.in
-index e362bd0e..6991a89c 100644
---- a/arch/riscv64/bits/syscall.h.in
-+++ b/arch/riscv64/bits/syscall.h.in
-@@ -242,6 +242,7 @@
- #define __NR_accept4 242
- #define __NR_recvmmsg 243
- #define __NR_arch_specific_syscall 244
-+#define __NR_riscv_hwprobe 258
- #define __NR_wait4 260
- #define __NR_prlimit64 261
- #define __NR_fanotify_init 262
-@@ -304,6 +305,16 @@
- #define __NR_set_mempolicy_home_node	450
- #define __NR_cachestat		451
- #define __NR_fchmodat2		452
-+#define __NR_map_shadow_stack 453
-+#define __NR_futex_wake 454
-+#define __NR_futex_wait 455
-+#define __NR_futex_requeue 456
-+#define __NR_statmount 457
-+#define __NR_listmount 458
-+#define __NR_lsm_get_self_attr 459
-+#define __NR_lsm_list_modules 461
-+#define __NR_lsm_set_self_attr 460
-+#define __NR_mseal 462
- 
- #define __NR_sysriscv __NR_arch_specific_syscall
- #define __NR_riscv_flush_icache (__NR_sysriscv + 15)
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3f5fa37fba..3aec643c40 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,16 +4,15 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "0ccaf0572e9cccda2cced0f7ee659af4c1c6679a"
+SRCREV = "9fa28ece75d8a2191de7c5bb53bed224c5947417"
 
-BASEVER = "1.2.5"
+BASEVER = "1.2.6"
 
 PV = "${BASEVER}+git"
 
 SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
-           file://0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch \
           "
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"

