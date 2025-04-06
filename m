Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B6EC3600C
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 07:32:30 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.20989.1743924745718562261
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 00:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ibzQVVNQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7376dd56eccso3624378b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743924745; x=1744529545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9D7yvliq4iGbff08JbgXBDkEUymo63WylHHKHOI60s=;
        b=ibzQVVNQoCUARYfib9G2eBzUN9JF1UVJUfCmimaI4Nj3AeFvj8/Dn33s8k1XD9zkIW
         Rd/8HxCpN+OmsbXg7O55K6GbwPmqjwPqRJvvw6y2C7BOGVaP76FbXxYQavPbELkbuHWn
         Urf3SuoUC+U+jv2Bpsw3U4DocRlbLsP5PhbLmEg/vnbnPDqaoUkKStBWGBo1a2JfzwIc
         XA9E/fEa7rD2HUkR0Wg8d+qWalGOXqinIxoHFqinMi6N4T3Sx92jx7ixf+GpsGD0zgW7
         9amalH7IYiPMS+P2iePRqWDJvG5G0PpHi5qKe/BKqLzMyxA20rCOMbF09ILBhH+D1axw
         SDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743924745; x=1744529545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9D7yvliq4iGbff08JbgXBDkEUymo63WylHHKHOI60s=;
        b=b+KRzx9dutymAES8Cq/9x3RlqYw/Z7vWSSm1zQKNcL5ongrt3gia5LP16oBnQOlOF3
         swW9+HLdd7U+v1MuJEvOO11sF/uKlpDpq6Jas7qzvno2fGGHqLzGRBywoFNBRDoyhmR1
         X9Tox2CfQ4E2kGCykQJeAZwY/2SzsDhJpMMHltYA6n1ERe0oOzavKFIF8WZf2vARmcVK
         a/SL2E2nKBka9D+KvSFEU2y0a6kQvQWnUscw8mZe+bvabgKnKR88s17Xk1wsUQT0t8Ue
         OAzUHJ5YNSFiXRHGhCdbmmMLutJSn15OKlqKgKfhPpjq/pe1vLhxFbBtGtKDTsJ+oKBl
         u09A==
X-Gm-Message-State: AOJu0Ywfe0qkv0JFdtbJSCH5xSicTRu3AhakZ01KTFvem1JppQCus/Ia
	TBzB8EkomdvLlo6AC8bZgKCbg9O0JJlkVw9+miQy6UBpLtoRh/NOG3GgpBOn
X-Gm-Gg: ASbGncuIdFEKE//eUhrcv3ayJK+GCgXw7hm/5p8hso++dccF2H7iqPZNMnuUUvnrLJK
	PtQ0zSKB0Iufs/ucDpoKfy4yj59HRKszeARhaV0YhByMyIgoW6dUMwpQlDtxNrEYrRShWR8t3Wx
	/Uhse5zoz1W+i7Gn8jW2AcdOLm6hZvm7ErpZybRiybgQhRuNIAFi3Z/MNVfqGdrl8V0oIOLElvZ
	iq1arIsWCe+2nQDrrDf6ZMHRkvueWAi6+BJHOIEjg8cJFMtnRKLFZC9IC/HefY5V3r0FaIit9W0
	j4yG+JvmiRZ50u0Tsa7UX2Go43USdDRkHTqh
X-Google-Smtp-Source: AGHT+IE/s1nmSwDn8GB4zY9fwntkwWjXL5bq//zBmGNd1WonXjJIiPpe3DNA+TfTwJWKc2DF6gApPA==
X-Received: by 2002:aa7:8893:0:b0:736:4704:d5da with SMTP id d2e1a72fcca58-739e7161560mr10114991b3a.22.1743924744569;
        Sun, 06 Apr 2025 00:32:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1ad5sm6451167b3a.12.2025.04.06.00.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 00:32:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-maturin: Fix build on riscv32
Date: Sun,  6 Apr 2025 00:32:13 -0700
Message-ID: <20250406073214.868510-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250406073214.868510-1-raj.khem@gmail.com>
References: <20250406073214.868510-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 07:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214377

There is a single rustix patch which needs to apply to different versions
of rustix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-cargo-build-on-riscv32.patch     | 70 +++++++++++++++++++
 .../python/python3-maturin_1.8.3.bb           |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Fix-cargo-build-on-riscv32.patch

diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Fix-cargo-build-on-riscv32.patch b/meta/recipes-devtools/python/python3-maturin/0001-Fix-cargo-build-on-riscv32.patch
new file mode 100644
index 00000000000..acfc5b771fb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0001-Fix-cargo-build-on-riscv32.patch
@@ -0,0 +1,70 @@
+From b85c7b406f017589eb959cd619ba442837ada470 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Apr 2025 00:29:22 -0700
+Subject: [PATCH] Fix rustix 0.38.42 build on riscv32
+
+Upstream-Status: Submitted [https://github.com/bytecodealliance/rustix/pull/1435]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/fs/ioctl.rs | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+--- a/src/fs/ioctl.rs
++++ b/src/fs/ioctl.rs
+@@ -11,6 +11,14 @@ use {
+ 
+ use bitflags::bitflags;
+ 
++/// The datatype used for the ioctl number
++#[cfg(any(target_os = "android", target_env = "musl"))]
++#[doc(hidden)]
++pub type ioctl_num_type = c::c_int;
++#[cfg(not(any(target_os = "android", target_env = "musl")))]
++#[doc(hidden)]
++pub type ioctl_num_type = c::c_ulong;
++
+ #[cfg(all(linux_kernel, not(any(target_arch = "sparc", target_arch = "sparc64"))))]
+ use crate::fd::{AsRawFd, BorrowedFd};
+ 
+@@ -79,7 +87,8 @@ unsafe impl ioctl::Ioctl for Ficlone<'_>
+     type Output = ();
+ 
+     const IS_MUTATING: bool = false;
+-    const OPCODE: ioctl::Opcode = ioctl::Opcode::old(c::FICLONE as ioctl::RawOpcode);
++    const OPCODE: ioctl::Opcode =
++        ioctl::Opcode::old(linux_raw_sys::ioctl::FICLONE as ioctl::RawOpcode);
+ 
+     fn as_ptr(&mut self) -> *mut c::c_void {
+         self.0.as_raw_fd() as *mut c::c_void
+@@ -138,7 +147,12 @@ bitflags! {
+ #[doc(alias = "FS_IOC_GETFLAGS")]
+ pub fn ioctl_getflags<Fd: AsFd>(fd: Fd) -> io::Result<IFlags> {
+     unsafe {
+-        #[cfg(target_pointer_width = "32")]
++        #[cfg(target_arch = "riscv32")]
++        let ctl = ioctl::Getter::<
++            ioctl::BadOpcode<{ linux_raw_sys::ioctl::FS_IOC32_GETFLAGS as ioctl_num_type }>,
++            u32,
++        >::new();
++        #[cfg(all(target_pointer_width = "32", not(target_arch = "riscv32")))]
+         let ctl = ioctl::Getter::<ioctl::BadOpcode<{ c::FS_IOC32_GETFLAGS }>, u32>::new();
+         #[cfg(target_pointer_width = "64")]
+         let ctl = ioctl::Getter::<ioctl::BadOpcode<{ c::FS_IOC_GETFLAGS }>, u32>::new();
+@@ -154,8 +168,15 @@ pub fn ioctl_getflags<Fd: AsFd>(fd: Fd)
+ #[inline]
+ #[doc(alias = "FS_IOC_SETFLAGS")]
+ pub fn ioctl_setflags<Fd: AsFd>(fd: Fd, flags: IFlags) -> io::Result<()> {
++    use crate::ioctl::Ioctl;
++
+     unsafe {
+-        #[cfg(target_pointer_width = "32")]
++        #[cfg(target_arch = "riscv32")]
++        let ctl = ioctl::Setter::<
++            ioctl::BadOpcode<{ linux_raw_sys::ioctl::FS_IOC32_SETFLAGS as ioctl_num_type }>,
++            u32,
++        >::new(flags.bits());
++        #[cfg(all(target_pointer_width = "32", not(target_arch = "riscv32")))]
+         let ctl =
+             ioctl::Setter::<ioctl::BadOpcode<{ c::FS_IOC32_SETFLAGS }>, u32>::new(flags.bits());
+ 
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
index 17c8fb7083b..19f8a058b71 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
+SRC_URI += "file://0001-Fix-cargo-build-on-riscv32.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/rustix-0.38.41"
 SRC_URI[sha256sum] = "304762f86fd53a8031b1bf006d12572a2aa0a5235485031113195cc0152e1e12"
 
 S = "${WORKDIR}/maturin-${PV}"

