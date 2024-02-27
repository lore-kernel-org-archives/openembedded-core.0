Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31669C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 19:52:08 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.3778.1709063525818648595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 11:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0RRAieP;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dca160163dso24123275ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 11:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709063525; x=1709668325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=311vcP0aW5L0QvGVRLSNmd6ZUzSS6DcvVRku0fmNAUk=;
        b=U0RRAiePzW4eM4AMk0tMbqrR7+j8Keh6WfBwDBxUbkkEPvTMNl7th2/zcQZHwJpASn
         7n7v6U5KFv77vEOuchTdOGcmKImkmxGk4AnXQxVI0en1mRE4Jtx/tGLojOJPx0+tG431
         awoQTCk4scBycOi1kJLJjgPrtR4poDZ5fmsqDcZcJQPkHm8RMal7LzOy1Etu41N9ibA/
         aiNlfZN6C0GStn4R1+6yWyGcTlhPd8jXIoQxwTiT4L3s4HZu6AevykYB5wlWPmSIX7zl
         bXpsUz3QHXWu/DGHWUz3b0MDKL22BJTF4fiLoWz2HRH0DrIK6w8OpUX8ydHAYuNIUBTH
         r6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709063525; x=1709668325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=311vcP0aW5L0QvGVRLSNmd6ZUzSS6DcvVRku0fmNAUk=;
        b=ilhpu129Iy44uDMVI2xEQG4yoDwLaa0fzuPE7rguY4eLoSkZU2C+S4Zp7meZzZWwhT
         GPCWZVWbDBtKfuSIn+AYKqa6adpTOos1487cc8W7cvfvVaXV2FXVIljPcrA5ubP4LweB
         xM3MFidh+jM20jq8CeLkgzH1kv+pjKDF9+Ec+WVfLwB+QV/pzASWFJaz8425/Vfo+vUS
         /cPMz8GQH7cCSTnjV+IVquft9tDMBoqoAiWEuh+53AL0EHt22QO2V8VQFIq46wfeKFrv
         tLBCDNKi71GQ2aF3twIXE7beRtVRThbtMXLuRh+7QcyzB5otsFSr2gT6K463IceVKE4U
         XQ4Q==
X-Gm-Message-State: AOJu0YzjNSWygKUfew6Kkz+duThLXSm/GF/VKo9OSYi5SWZXYBFt60Hx
	XyxFPUstOnXJdpw363uGK5TzBGXGNOw2Wb0pjiUD5eHiGhAdBq6xlw5MKqcCt0k=
X-Google-Smtp-Source: AGHT+IGEthVKfloEsavkeckhAEY5plcWo/xpkii8ZuxiZeLAIPiDfEw1Y5fB8slewKzYjbpWPz3WTQ==
X-Received: by 2002:a17:902:dac7:b0:1dc:afd0:e278 with SMTP id q7-20020a170902dac700b001dcafd0e278mr5171976plx.49.1709063525030;
        Tue, 27 Feb 2024 11:52:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::95e0])
        by smtp.gmail.com with ESMTPSA id la3-20020a170902fa0300b001db5432449esm1913804plb.18.2024.02.27.11.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 11:52:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-maturin: Recognise riscv32 architecture
Date: Tue, 27 Feb 2024 11:52:02 -0800
Message-ID: <20240227195202.3887656-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 19:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196295

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-32-bit-RISC-V-support.patch      | 102 ++++++++++++++++++
 .../python/python3-maturin_1.4.0.bb           |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Add-32-bit-RISC-V-support.patch

diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Add-32-bit-RISC-V-support.patch b/meta/recipes-devtools/python/python3-maturin/0001-Add-32-bit-RISC-V-support.patch
new file mode 100644
index 00000000000..a0ef0c9e228
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0001-Add-32-bit-RISC-V-support.patch
@@ -0,0 +1,102 @@
+From a945706bd610c5400fc85a248d5e0c96ebd2e953 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Feb 2024 10:38:49 -0800
+Subject: [PATCH] Add 32-bit RISC-V support
+
+Tested with qemuriscv32 and it builds fine with all tests passed on a
+qemu machine.
+
+Upstream-Status: Submitted [https://github.com/PyO3/maturin/pull/1969]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/target.rs | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/target.rs b/src/target.rs
+index fbb93531..33fa9273 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -69,6 +69,7 @@ pub enum Arch {
+     X86_64,
+     S390X,
+     Wasm32,
++    Riscv32,
+     Riscv64,
+     Mips64el,
+     Mips64,
+@@ -91,6 +92,7 @@ impl fmt::Display for Arch {
+             Arch::X86_64 => write!(f, "x86_64"),
+             Arch::S390X => write!(f, "s390x"),
+             Arch::Wasm32 => write!(f, "wasm32"),
++            Arch::Riscv32 => write!(f, "riscv32"),
+             Arch::Riscv64 => write!(f, "riscv64"),
+             Arch::Mips64el => write!(f, "mips64el"),
+             Arch::Mips64 => write!(f, "mips64"),
+@@ -115,7 +117,7 @@ impl Arch {
+             Arch::Powerpc | Arch::Powerpc64Le | Arch::Powerpc64 => "powerpc",
+             Arch::X86 => "i386",
+             Arch::X86_64 => "amd64",
+-            Arch::Riscv64 => "riscv",
++            Arch::Riscv32 | Arch::Riscv64 => "riscv",
+             Arch::Mips64el | Arch::Mips64 | Arch::Mipsel | Arch::Mips => "mips",
+             // sparc64 is unsupported since FreeBSD 13.0
+             Arch::Sparc64 => "sparc64",
+@@ -139,6 +141,7 @@ fn get_supported_architectures(os: &Os) -> Vec<Arch> {
+             Arch::S390X,
+             Arch::X86,
+             Arch::X86_64,
++            Arch::Riscv32,
+             Arch::Riscv64,
+             Arch::Mips64el,
+             Arch::Mips64,
+@@ -158,6 +161,7 @@ fn get_supported_architectures(os: &Os) -> Vec<Arch> {
+             Arch::Powerpc64Le,
+             Arch::X86,
+             Arch::X86_64,
++            Arch::Riscv32,
+             Arch::Riscv64,
+             Arch::Mips64el,
+             Arch::Mipsel,
+@@ -171,6 +175,7 @@ fn get_supported_architectures(os: &Os) -> Vec<Arch> {
+             Arch::Powerpc,
+             Arch::Powerpc64,
+             Arch::Powerpc64Le,
++            Arch::Riscv32,
+             Arch::Riscv64,
+             Arch::Sparc64,
+         ],
+@@ -255,6 +260,7 @@ impl Target {
+             Architecture::Powerpc64le => Arch::Powerpc64Le,
+             Architecture::S390x => Arch::S390X,
+             Architecture::Wasm32 => Arch::Wasm32,
++            Architecture::Riscv32(_) => Arch::Riscv32,
+             Architecture::Riscv64(_) => Arch::Riscv64,
+             Architecture::Mips64(mips64_arch) => match mips64_arch {
+                 Mips64Architecture::Mips64el => Arch::Mips64el,
+@@ -343,6 +349,7 @@ impl Target {
+             Arch::X86_64 => "x86_64",
+             Arch::S390X => "s390x",
+             Arch::Wasm32 => "wasm32",
++            Arch::Riscv32 => "riscv32",
+             Arch::Riscv64 => "riscv64",
+             // It's kinda surprising that Python doesn't include the `el` suffix
+             Arch::Mips64el | Arch::Mips64 => "mips64",
+@@ -388,6 +395,7 @@ impl Target {
+             }
+             Arch::Armv6L
+             | Arch::Wasm32
++            | Arch::Riscv32
+             | Arch::Riscv64
+             | Arch::Mips64el
+             | Arch::Mips64
+@@ -418,6 +426,7 @@ impl Target {
+             | Arch::Wasm32
+             | Arch::Mipsel
+             | Arch::Mips
++            | Arch::Riscv32
+             | Arch::Powerpc => 32,
+         }
+     }
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb b/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
index 82e65abb24d..ed19ee647a0 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
+SRC_URI += "file://0001-Add-32-bit-RISC-V-support.patch"
 SRC_URI[sha256sum] = "ed12e1768094a7adeafc3a74ebdb8dc2201fa64c4e7e31f14cfc70378bf93790"
 
 S = "${WORKDIR}/maturin-${PV}"
-- 
2.44.0


