Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD4CC369A1
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 07:26:36 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.6377.1744442784531163306
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Apr 2025 00:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f4QUS5xi;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7359aca7ef2so4002242b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 00:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744442784; x=1745047584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DJGhtmMNqWXknbLFNAhcsT5JzO2tV/kfwVdXkrfqh4M=;
        b=f4QUS5xiPpVD4fj3OHoUEUthFj+T380P2fA/PFoC8o9dTa6HV7IBMMeQmdBBtDdCbi
         9wJ/0Lb7iRmRVSA7bOAVFnLQ8ELQQeoZuBuapI0tLp56z45Xl8uGi0YLyNqQcTnClnql
         4aZzV8rWWKcTO3oR4LdbeXz+jkxlSd1HwXfdT/bijnhry4n/9ynHbDwuDFiK4Zms/YOH
         e2cd2Cm85itrSsbIhJk+SBdIrw6Q4ovO6tZAvMeA46e/tTHothOFCXBUnCWKknhkmXjH
         iAXcn3P921cfFRoxViyHbmC9Ug9HTepn+1w+Q6FuVUaFXSrA/GJNGVbZZala3SvuUoB6
         ApBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744442784; x=1745047584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJGhtmMNqWXknbLFNAhcsT5JzO2tV/kfwVdXkrfqh4M=;
        b=tdz++K79n2h1QUmJuNWGDxg9GWvfclJBqHJIhzNUHBl3AZUj3AOonKV/pR/UCu7ru3
         QxphPMAyMQrAmNYNlB3dyYe/ywUpUJn1qtbyXmJN9sBPNevuERHnV4gggifRM5AuYMnW
         OxeJ9M6mAVdjJJElCd1PE9djJ9pdtTpyWzkrCl3STAnzV9tC+pksuEcMlgrHZicFw2UP
         1f3/LIobUDhDq0556fNYtDP7UrRPkZx5hxq/eddmiy8UuciYqkXckfLiJPRmBmr7D+ow
         BiPgzuCbHcjoNHngqqh5Z9buuG7OZCDfKfYSQ40rzr3a7j1GxZWxnYUKw9YALjA4sBvC
         5hqw==
X-Gm-Message-State: AOJu0YxmcCZElatFGtEE6hPD5lNWRaTbommp/XmB5oBJMZgX+sChnzMF
	zEvehROBw6G7rTwioqb75Awi1b2JdnSmNcCZ9KUgwTJPvnpKWwUgEEM27pRW
X-Gm-Gg: ASbGnctqiDAHvxgdryaHkSA/+KqKEFKpHXn8Q5QuirPw9vxqVZsQsuICChHL3PAAUtD
	UEOjP6BeIDCZcn/rdRn/7zqGx/ezAdd/KL1XHLALfqajFlxWOQGLbeacSU0MBhbGVlYNo3Sva9b
	GpMgPSCNfzNTyn0X7ojsKsZjEXBUOx+eE3iPanHqEpKgoSrzOhQP0UemuFg3fL5J+8FpP0lfkWO
	I0nrDeSRIiewaHRvW65lP1hI36fMPTiezKKQ65OMFSFYI6jfZQXX4VJ07YDECy5dT7v+4i4LHNu
	WMcgoCX7gTUebxdIhjQvURsv577h/9n5
X-Google-Smtp-Source: AGHT+IGrmNxsGVc01SuOtPlbpn/mY+3DwzHwFnRoOdMEzcZSbrIy73pctUFRx7EmfUkV+eBujfyNcg==
X-Received: by 2002:a05:6a20:3956:b0:1f5:931d:ca6d with SMTP id adf61e73a8af0-2017978b2ecmr6947197637.1.1744442783463;
        Sat, 12 Apr 2025 00:26:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0cf219esm5995748a12.20.2025.04.12.00.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 00:26:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] python3-maturin: Backport a libc build fix for riscv32
Date: Sat, 12 Apr 2025 00:26:19 -0700
Message-ID: <20250412072619.1831014-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 07:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214772

There is a libc patch needed to fix rustix 0.38.x build
It is already fixed in latest libc upstream, backport it
here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Right fix is in libc not rustix, update the patch accordingly
v3: Use the final fix applied to rust libc upstream for the backport

 ...l-codes-on-riscv32gc-unknown-linux-g.patch | 110 ++++++++++++++++++
 .../python/python3-maturin_1.8.3.bb           |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch

diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
new file mode 100644
index 00000000000..aceefa7967e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
@@ -0,0 +1,110 @@
+From 4b439b0953573e0383da7e092b1f516ba21f3398 Mon Sep 17 00:00:00 2001
+From: Dan Gohman <dev@sunfishcode.online>
+Date: Sun, 6 Apr 2025 05:22:49 -0700
+Subject: [PATCH] Define Linux ioctl codes on more architectures.
+
+Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` using
+`_IOR` and `_IOW` so that they're automatically supported on all
+architectures, including riscv32gc-unknown-linux-gnu.
+
+Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/4382/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/linux_like/linux/arch/generic/mod.rs | 75 ++++---------------
+ 1 file changed, 15 insertions(+), 60 deletions(-)
+
+--- a/src/unix/linux_like/linux/arch/generic/mod.rs
++++ b/src/unix/linux_like/linux/arch/generic/mod.rs
+@@ -1,5 +1,5 @@
+ use crate::prelude::*;
+-use crate::Ioctl;
++use crate::{Ioctl, _IOR, _IOW};
+ 
+ s! {
+     pub struct termios2 {
+@@ -116,21 +116,8 @@ cfg_if! {
+ // pub const SO_PREFER_BUSY_POLL: c_int = 69;
+ // pub const SO_BUSY_POLL_BUDGET: c_int = 70;
+ 
+-cfg_if! {
+-    if #[cfg(any(
+-        target_arch = "x86",
+-        target_arch = "x86_64",
+-        target_arch = "arm",
+-        target_arch = "aarch64",
+-        target_arch = "riscv64",
+-        target_arch = "s390x",
+-        target_arch = "csky",
+-        target_arch = "loongarch64"
+-    ))] {
+-        pub const FICLONE: c_ulong = 0x40049409;
+-        pub const FICLONERANGE: c_ulong = 0x4020940D;
+-    }
+-}
++pub const FICLONE: Ioctl = _IOW::<c_int>(0x94, 9) as Ioctl;
++pub const FICLONERANGE: Ioctl = _IOW::<crate::file_clone_range>(0x94, 13) as Ioctl;
+ 
+ // Defined in unix/linux_like/mod.rs
+ // pub const SCM_TIMESTAMP: c_int = SO_TIMESTAMP;
+@@ -248,49 +235,18 @@ pub const TUNGETVNETBE: Ioctl = 0x800454
+ pub const TUNSETSTEERINGEBPF: Ioctl = 0x800454e0;
+ pub const TUNSETFILTEREBPF: Ioctl = 0x800454e1;
+ 
+-cfg_if! {
+-    // Those type are constructed using the _IOC macro
+-    // DD-SS_SSSS_SSSS_SSSS-TTTT_TTTT-NNNN_NNNN
+-    // where D stands for direction (either None (00), Read (01) or Write (11))
+-    // where S stands for size (int, long, struct...)
+-    // where T stands for type ('f','v','X'...)
+-    // where N stands for NR (NumbeR)
+-    if #[cfg(any(
+-        target_arch = "x86",
+-        target_arch = "arm",
+-        target_arch = "csky"
+-    ))] {
+-        pub const FS_IOC_GETFLAGS: Ioctl = 0x80046601;
+-        pub const FS_IOC_SETFLAGS: Ioctl = 0x40046602;
+-        pub const FS_IOC_GETVERSION: Ioctl = 0x80047601;
+-        pub const FS_IOC_SETVERSION: Ioctl = 0x40047602;
+-        pub const FS_IOC32_GETFLAGS: Ioctl = 0x80046601;
+-        pub const FS_IOC32_SETFLAGS: Ioctl = 0x40046602;
+-        pub const FS_IOC32_GETVERSION: Ioctl = 0x80047601;
+-        pub const FS_IOC32_SETVERSION: Ioctl = 0x40047602;
+-        pub const TUNATTACHFILTER: Ioctl = 0x400854d5;
+-        pub const TUNDETACHFILTER: Ioctl = 0x400854d6;
+-        pub const TUNGETFILTER: Ioctl = 0x800854db;
+-    } else if #[cfg(any(
+-        target_arch = "x86_64",
+-        target_arch = "riscv64",
+-        target_arch = "aarch64",
+-        target_arch = "s390x",
+-        target_arch = "loongarch64"
+-    ))] {
+-        pub const FS_IOC_GETFLAGS: Ioctl = 0x80086601;
+-        pub const FS_IOC_SETFLAGS: Ioctl = 0x40086602;
+-        pub const FS_IOC_GETVERSION: Ioctl = 0x80087601;
+-        pub const FS_IOC_SETVERSION: Ioctl = 0x40087602;
+-        pub const FS_IOC32_GETFLAGS: Ioctl = 0x80046601;
+-        pub const FS_IOC32_SETFLAGS: Ioctl = 0x40046602;
+-        pub const FS_IOC32_GETVERSION: Ioctl = 0x80047601;
+-        pub const FS_IOC32_SETVERSION: Ioctl = 0x40047602;
+-        pub const TUNATTACHFILTER: Ioctl = 0x401054d5;
+-        pub const TUNDETACHFILTER: Ioctl = 0x401054d6;
+-        pub const TUNGETFILTER: Ioctl = 0x801054db;
+-    }
+-}
++pub const FS_IOC_GETFLAGS: Ioctl = _IOR::<c_long>('f' as u32, 1) as Ioctl;
++pub const FS_IOC_SETFLAGS: Ioctl = _IOW::<c_long>('f' as u32, 2) as Ioctl;
++pub const FS_IOC_GETVERSION: Ioctl = _IOR::<c_long>('v' as u32, 1) as Ioctl;
++pub const FS_IOC_SETVERSION: Ioctl = _IOW::<c_long>('v' as u32, 2) as Ioctl;
++pub const FS_IOC32_GETFLAGS: Ioctl = _IOR::<c_int>('f' as u32, 1) as Ioctl;
++pub const FS_IOC32_SETFLAGS: Ioctl = _IOW::<c_int>('f' as u32, 2) as Ioctl;
++pub const FS_IOC32_GETVERSION: Ioctl = _IOR::<c_int>('v' as u32, 1) as Ioctl;
++pub const FS_IOC32_SETVERSION: Ioctl = _IOW::<c_int>('v' as u32, 2) as Ioctl;
++
++pub const TUNATTACHFILTER: Ioctl = _IOW::<crate::sock_fprog>('T' as u32, 213) as Ioctl;
++pub const TUNDETACHFILTER: Ioctl = _IOW::<crate::sock_fprog>('T' as u32, 214) as Ioctl;
++pub const TUNGETFILTER: Ioctl = _IOR::<crate::sock_fprog>('T' as u32, 219) as Ioctl;
+ 
+ cfg_if! {
+     if #[cfg(any(target_arch = "arm", target_arch = "s390x"))] {
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
index 17c8fb7083b..3ec4d0c103b 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
+SRC_URI += "file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/libc-0.2.167"
 SRC_URI[sha256sum] = "304762f86fd53a8031b1bf006d12572a2aa0a5235485031113195cc0152e1e12"
 
 S = "${WORKDIR}/maturin-${PV}"

