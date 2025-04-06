Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5BBC36002
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 18:10:43 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.29965.1743963034906184132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 11:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PmxF1EB7;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso2961347a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 11:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743963034; x=1744567834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/QWy9McG4tsQExmd/4XLPfqXwUXOR8YhkkmobLpvFM=;
        b=PmxF1EB7KcSY+Ml9xtbxfhzkwZZbYlb0+0dkFeFosmeFGnMX8UPfCCjDHo/8ZkCOzO
         hrKyoDAVlQzYMGq91kO8r0IKSRFIbUgAFeJJi4N3nEvXB2BOtwbhC19Essw/tetvgX8w
         PNQ34wlSsWFlgsBlWYfGppaC5dXf8Htf5uOhgbctyQXf6WfBJd2f9s0FqE+4jHwmPbZe
         MaLtk5OssmrMI/Ja6dPKwCDabbXxRr4Tp4blFoDavWry4e1jmsoRo0OaP7PTSBYXFFjV
         /H9ItJRIRkzrPkqIFj7btR/37GWY+0jM0Gd3SzR4SwjYcCO5nfJIUQzXKXs4T7K6hiXY
         3Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743963034; x=1744567834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/QWy9McG4tsQExmd/4XLPfqXwUXOR8YhkkmobLpvFM=;
        b=CbQ4ZKNJiTYKo34Wcjsipd4Wdhburiiz8p8nZjkTyzHabDWd0DdgeTan2TXJEGCmgU
         ZORjrWc+/1Qk9miBgiQRPI0wuYrCNF0bATja/EyWM+jzBX5Lw++vjE2g6LFKB54irkGo
         WPkUKuWkAotJO914fERUPSZxrcfeZR5oV4Eb5Xdx0ROYOx3gw3hkHVH9o2JGeWTrpeww
         DO9TdfkotSNoxnJGdGT+k3zhSnugFun4DItkrEnsXfqbJK2OfWTExWytmOkGhicdhogn
         ytO2tYieV6rPzgVQDPWpWhGHJ7FN/QJ927Y1IIGdXK6zWQ66jF0iK8cB82HbBOPdRNRP
         YyqQ==
X-Gm-Message-State: AOJu0YzdD82RDXJBTiZFU20JGhbilU2QLLSwWhSdg08b24IpFIXFl/Wx
	dPFwZOEJWJpZZmcQ8Ngv7zrDQ7Eg560Y06d5nNBa1jtgyxge6YmzfNWiOazZ
X-Gm-Gg: ASbGncsQ/jnbPws2Raa6p6G/gjsHEc1vH4Lq+2q+/l/IrY522XbQJ55k89DVv8foxea
	ImgVhC35lNZLy5JBkvV/BsX88paKbMovTX0JhPJpsw6PuKeeqH6oKRkhp1xokgyzJ/4rYq6AwdM
	X14faV4eL/YJHmHjpxH44TkJz1nOytRi0kBapagNZyI19f0LebibDEIQzGujyBVHp3JVQeGing+
	/4IkqwvaEFzc14xxduVEqNaGdeC7yn14CiCFzRy8/INIJk5wJMvRY2Zf1QfPHCXrEVwNQmagV0/
	ozZ9jSicsVsp6bx+G0TLz0ho2NdCHQ7P+uuI
X-Google-Smtp-Source: AGHT+IEyhTBH9X8KWk+n2zNE/NBbcTE46XGjOtyWio6m4rImIpZS7z0MSh2wSBE4OG0emoZXUhiYhw==
X-Received: by 2002:a17:90b:2f04:b0:2fe:a545:4c84 with SMTP id 98e67ed59e1d1-306a62108a0mr12256169a91.34.1743963033561;
        Sun, 06 Apr 2025 11:10:33 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787763a6sm66227955ad.241.2025.04.06.11.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 11:10:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] python3-maturin: Fix build on riscv32
Date: Sun,  6 Apr 2025 11:10:26 -0700
Message-ID: <20250406181028.2326927-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250406181028.2326927-1-raj.khem@gmail.com>
References: <20250406181028.2326927-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 18:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214389

There is a libc patch needed to fix rustix 0.38.x build
It is already submitted to libc upstream but until its applied
it needs to be patched

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Right fix is in libc not rustix, update the patch accordingly

 ...l-codes-on-riscv32gc-unknown-linux-g.patch | 36 +++++++++++++++++++
 .../python/python3-maturin_1.8.3.bb           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch

diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
new file mode 100644
index 00000000000..84e0b5d4f88
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
@@ -0,0 +1,36 @@
+From 7da2aecff6de042424b0e54b631bfcdbccdcfc89 Mon Sep 17 00:00:00 2001
+From: Dan Gohman <dev@sunfishcode.online>
+Date: Sun, 6 Apr 2025 05:22:49 -0700
+Subject: [PATCH] Define more ioctl codes on riscv32gc-unknown-linux-gnu
+
+Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` on
+riscv32gc-unknown-linux-gnu.
+
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/4382]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/linux_like/linux/arch/generic/mod.rs | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/unix/linux_like/linux/arch/generic/mod.rs b/src/unix/linux_like/linux/arch/generic/mod.rs
+index 10953fe..e9fd7fc 100644
+--- a/src/unix/linux_like/linux/arch/generic/mod.rs
++++ b/src/unix/linux_like/linux/arch/generic/mod.rs
+@@ -122,6 +122,7 @@ cfg_if! {
+         target_arch = "x86_64",
+         target_arch = "arm",
+         target_arch = "aarch64",
++        target_arch = "riscv32",
+         target_arch = "riscv64",
+         target_arch = "s390x",
+         target_arch = "csky",
+@@ -258,7 +259,8 @@ cfg_if! {
+     if #[cfg(any(
+         target_arch = "x86",
+         target_arch = "arm",
+-        target_arch = "csky"
++        target_arch = "csky",
++        target_arch = "riscv32"
+     ))] {
+         pub const FS_IOC_GETFLAGS: Ioctl = 0x80046601;
+         pub const FS_IOC_SETFLAGS: Ioctl = 0x40046602;
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

