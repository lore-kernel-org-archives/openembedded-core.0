Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76564E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:02:06 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.24603.1733342518531605215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JidEgZrt;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fcdb53cca6so159029a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733342518; x=1733947318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBcN44TqbuAoaDPYPDYo6GlJAu1oLb7g1E+cPazeyls=;
        b=JidEgZrtbiDNXf1LDF4EWJxTLs0u6vi92uskWyUqN4JOjHzCJvBP5molcmt7dosMp1
         JuS07e+scLf3j4okSHdKrKEpXJk7/g9b8X3oQtMq2MjUqL+ew89bCKnm5l3qvZMAQ1cl
         BT/YHnPsy4anbUJn7RgluZfspHnPQyc1oSDvQHzuDz1ZMtqss+GfNH5H+PZnEpMs70B5
         UTc2Z/Sk3blE06bf/ESa5+0CXE7T2XwOzv/vSdLIVZtmv7rDoDvyMSzTyqM353mqyxt4
         duq2jOtLf6uRamRk3O9WQJ5xcOSGi61i083UbFdUJDIN5RFVYB9AnaBVzdtVbXnOrMl0
         IncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733342518; x=1733947318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBcN44TqbuAoaDPYPDYo6GlJAu1oLb7g1E+cPazeyls=;
        b=rsKSxxJn/ZiWRPh4epIlMVcxqozkzobVGPJ2mnBgzBcEC51v8TJrIxjH9n5LPFU98N
         BReOvToB5FK0k63fnQE2L6rqnPILCvEWD59Ly9XA80pSBNX8lxzelr49IbDo3/k/Se+V
         181VMZchC15+OwzinLf3XZnQklZMStny03FJ7CDplzJnGVBGmpB/ww4oiXaPWsnOCWX8
         bwteFWHtA2OgiPW7x4YpqtGwZxOiX1F4YRAy/4eLTRiXiG8x2yY4oxfPwLoy9ob599pQ
         QSSz8BqeZWfKuaKwIgqKxA6I/wYoNcGlcMhSNKY/CNTg26dgVZmYCJDDEPfrUPZB0oBE
         UPlQ==
X-Gm-Message-State: AOJu0YytJeQ2Y/+m+Y57R3TVBiUADEAxE746+41hvamdpYegktJ9sjTY
	z9Wk5S/EvCxZgxv6WZGZrXByKZnB6qBvzQpxcpAW3XZdzmQXhbE4iNauoLkn
X-Gm-Gg: ASbGncvEad3FkHtTM/n5MN8IMqzvb/cTUYdDWtHb3Cj1jc3DQf5n9aIlvZrN/3Zi+eW
	enLKpeYRX9c7kErOYxmhefMCndEPdDgDRm+5bX/b5Gi+POtf6hqWMaSJapPUy8LDtVBq6R2BLfO
	wddKWaF9zGbSsFH/Qe84XTtX6EUZN2uHDsJcYW6mRW4GvKoxIKMl0l8TO2bXdEZDbzJARC7psPP
	3uTTxY8hF4IWx5NyCtPbuYW+5juH0sjAErDKnpr4MuJgcPy2bZP
X-Google-Smtp-Source: AGHT+IFqgm0criVGHYt3xI1Evf9xcXuvMa3Osf9VpXVA0RIMTLRGHl1ziTmj4YEQIn0zufqYt9tSng==
X-Received: by 2002:a05:6a20:430d:b0:1db:ebf4:2cb8 with SMTP id adf61e73a8af0-1e1654132b6mr12724725637.38.1733342517428;
        Wed, 04 Dec 2024 12:01:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::9a42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254184943csm12749803b3a.191.2024.12.04.12.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:01:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] musl: Update riscv syscalls till 6.10 kernel
Date: Wed,  4 Dec 2024 12:01:53 -0800
Message-ID: <20241204200153.2360387-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204200153.2360387-1-raj.khem@gmail.com>
References: <20241204200153.2360387-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208327

Some packages e.g. ffmpeg have started using __NR_riscv_hwprobe
to detect Zba and Zbb at run-time.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...for-r32-rv64-from-kernel-6.4-through.patch | 70 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch

diff --git a/meta/recipes-core/musl/musl/0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch b/meta/recipes-core/musl/musl/0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch
new file mode 100644
index 00000000000..78ba903ca6a
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch
@@ -0,0 +1,70 @@
+From 31dce8e958f5185e7fda653214da12bbc75f244e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 4 Dec 2024 11:16:43 -0800
+Subject: [PATCH] Update syscalls for r32/rv64 from kernel 6.4 through 6.10
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2024/12/04/3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/riscv32/bits/syscall.h.in | 11 +++++++++++
+ arch/riscv64/bits/syscall.h.in | 11 +++++++++++
+ 2 files changed, 22 insertions(+)
+
+diff --git a/arch/riscv32/bits/syscall.h.in b/arch/riscv32/bits/syscall.h.in
+index 9228d840..a54d9ffc 100644
+--- a/arch/riscv32/bits/syscall.h.in
++++ b/arch/riscv32/bits/syscall.h.in
+@@ -216,6 +216,7 @@
+ #define __NR_perf_event_open 241
+ #define __NR_accept4 242
+ #define __NR_arch_specific_syscall 244
++#define __NR_riscv_hwprobe 258
+ #define __NR_prlimit64 261
+ #define __NR_fanotify_init 262
+ #define __NR_fanotify_mark 263
+@@ -295,6 +296,16 @@
+ #define __NR_cachestat		451
+ #define __NR_fchmodat2		452
+ #define __NR_futex __NR_futex_time64
++#define __NR_map_shadow_stack 453
++#define __NR_futex_wake 454
++#define __NR_futex_wait 455
++#define __NR_futex_requeue 456
++#define __NR_statmount 457
++#define __NR_listmount 458
++#define __NR_lsm_get_self_attr 459
++#define __NR_lsm_list_modules 461
++#define __NR_lsm_set_self_attr 460
++#define __NR_mseal 462
+ 
+ #define __NR_sysriscv __NR_arch_specific_syscall
+ #define __NR_riscv_flush_icache (__NR_sysriscv + 15)
+diff --git a/arch/riscv64/bits/syscall.h.in b/arch/riscv64/bits/syscall.h.in
+index e362bd0e..6991a89c 100644
+--- a/arch/riscv64/bits/syscall.h.in
++++ b/arch/riscv64/bits/syscall.h.in
+@@ -242,6 +242,7 @@
+ #define __NR_accept4 242
+ #define __NR_recvmmsg 243
+ #define __NR_arch_specific_syscall 244
++#define __NR_riscv_hwprobe 258
+ #define __NR_wait4 260
+ #define __NR_prlimit64 261
+ #define __NR_fanotify_init 262
+@@ -304,6 +305,16 @@
+ #define __NR_set_mempolicy_home_node	450
+ #define __NR_cachestat		451
+ #define __NR_fchmodat2		452
++#define __NR_map_shadow_stack 453
++#define __NR_futex_wake 454
++#define __NR_futex_wait 455
++#define __NR_futex_requeue 456
++#define __NR_statmount 457
++#define __NR_listmount 458
++#define __NR_lsm_get_self_attr 459
++#define __NR_lsm_list_modules 461
++#define __NR_lsm_set_self_attr 460
++#define __NR_mseal 462
+ 
+ #define __NR_sysriscv __NR_arch_specific_syscall
+ #define __NR_riscv_flush_icache (__NR_sysriscv + 15)
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 2ce16d041dd..9d33df49968 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -13,6 +13,7 @@ PV = "${BASEVER}+git"
 SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
+           file://0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-through.patch \
           "
 
 S = "${WORKDIR}/git"

