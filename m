Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74344C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:29:42 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.3188.1706812178635248554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RpgpAmWR;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6da202aa138so797460b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 10:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706812178; x=1707416978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6L9r+oq+xTvH1xbXM3A2bFHMzw2fMEBWYrfYR00Xz3w=;
        b=RpgpAmWR2zDK/sBsHB6JsNWuFE/qLSz7xiHcXTkmgtMGnOo6N+kA4d56+D8M5eNa1K
         M0LJgbeGl58Q0pPBcD+gSZjUgiD4kYkMIZG0X2Mbp8ICW2B7Jw+U9ke7pzRBykPLZPCG
         eV9PBDtkG/M0TuDx+j4REU+OHTebLtYWQIuljy6OJpqYdgp9ufMEfzhbh+gi1Y1HmDEF
         s2C2RGbJuzYYN/7apKCJCXg41b9ne/iKVVm4UoH0dnObfgXy9IiX3zFIIrPM+ZxWY65l
         1cHbA1R4B8f2spWgBMqeOH1cDH2wT1fUgdZSwMSNXNZMuV7cdp3bj0rgwocWT1yXM0oD
         tKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706812178; x=1707416978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6L9r+oq+xTvH1xbXM3A2bFHMzw2fMEBWYrfYR00Xz3w=;
        b=KxflGRWjQEjcitf2MxOah4vcOX+NnuAxk9Ne+28GOmsD18Sb/s/yUbFMorQ3oJYr4g
         UZ+sj4fK4w4W1WhdnGVa1YKiqES1h1sWSI5H2rvGiZrVrhcXR+W7hrAp+BgwB7/Reqy2
         kzAm5daWz2efsaiyYGnGSvNM+sOw+6Y6jTDYfvMgDfgtc5CbjHXSgbQOGSx5lewWvpAO
         sfGFPVce4k72Rlrx/y9JAFkfyOCH9KOAkTC9VCYARgYExFKJn8ffdyOmVwHeKG5rVVtX
         bIoI+51C5wURc4BuH5gFJpUanzB4q7C0vZJw+tU6HXGTuSOAvdP4mK768F+igKdc9Fs0
         yFXA==
X-Gm-Message-State: AOJu0Yy4pD7Z/29LS/W6+PdmtVGwlcU4yrpHUh/1+VEES2oN3AoR14FO
	cMgSXL+6IR0vBtVqzIaxHjxupW/l5GoNDyGydUG60B+8Ije1VIdxlt1lcou7OyI=
X-Google-Smtp-Source: AGHT+IHHCQWCpgsOkJAfUTxDdy3chWQzs6tGegChAGYmhjooYv7DKAs68uBSPdyngnzLshTUXt5aHA==
X-Received: by 2002:a62:cec5:0:b0:6de:3a3c:4d0d with SMTP id y188-20020a62cec5000000b006de3a3c4d0dmr5255724pfg.2.1706812177643;
        Thu, 01 Feb 2024 10:29:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e58e])
        by smtp.gmail.com with ESMTPSA id n25-20020aa78a59000000b006ddcfbe736esm49020pfa.97.2024.02.01.10.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 10:29:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] kexec-tools: Fix build with gas 2.42
Date: Thu,  1 Feb 2024 10:29:35 -0800
Message-ID: <20240201182935.457623-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194732

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...purgatory-fix-build-on-binutils-2.42.patch | 59 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.28.bb               |  3 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-tools-purgatory-fix-build-on-binutils-2.42.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-tools-purgatory-fix-build-on-binutils-2.42.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-tools-purgatory-fix-build-on-binutils-2.42.patch
new file mode 100644
index 00000000000..6104a29d711
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-tools-purgatory-fix-build-on-binutils-2.42.patch
@@ -0,0 +1,59 @@
+From 2cdbb12f4b101c7ecb3a4791819d9269d4f07c19 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Wed, 31 Jan 2024 10:05:08 +0000
+Subject: [PATCH] kexec-tools: purgatory: fix build on `binutils-2.42`
+
+`binutils-2.42` introduced stricter checks on what `.arch` can be used
+in 64-bit mode and started failing the build as:
+
+    $ as-2.42 --64 -o entry32-16-debug.o entry32-16-debug.s
+    purgatory/arch/i386/entry32-16-debug.S: Assembler messages:
+    purgatory/arch/i386/entry32-16-debug.S:28: Error: 64bit mode not supported on `i386'.
+
+The change moves `.code32` before `.arch 386` as suggested in
+https://sourceware.org/PR31319
+
+Upstream-Status: Submitted [https://lore.kernel.org/all/ZbopWV9qrxMME2hU@MiWiFi-R3L-srv/T/]
+Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
+Reviewed-by: Baoquan He <bhe@redhat.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ purgatory/arch/i386/entry32-16-debug.S | 2 +-
+ purgatory/arch/i386/entry32-16.S       | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/purgatory/arch/i386/entry32-16-debug.S b/purgatory/arch/i386/entry32-16-debug.S
+index 5167944..297d6f5 100644
+--- a/purgatory/arch/i386/entry32-16-debug.S
++++ b/purgatory/arch/i386/entry32-16-debug.S
+@@ -25,10 +25,10 @@
+ 	.globl entry16_debug_pre32
+ 	.globl entry16_debug_first32
+ 	.globl entry16_debug_old_first32
++	.code32
+ 	.arch i386
+ 	.balign 16
+ entry16_debug:
+-	.code32
+ 	/* Compute where I am running at (assumes esp valid) */
+ 	call	1f
+ 1:	popl	%ebx
+diff --git a/purgatory/arch/i386/entry32-16.S b/purgatory/arch/i386/entry32-16.S
+index c051aab..7a84565 100644
+--- a/purgatory/arch/i386/entry32-16.S
++++ b/purgatory/arch/i386/entry32-16.S
+@@ -20,10 +20,10 @@
+ #undef i386	
+ 	.text
+ 	.globl entry16, entry16_regs
++	.code32
+ 	.arch i386
+ 	.balign 16
+ entry16:
+-	.code32
+ 	/* Compute where I am running at (assumes esp valid) */
+ 	call	1f
+ 1:	popl	%ebx
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
index c2141e6716d..48bf8fbaffd 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
@@ -17,6 +17,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
            file://0005-Disable-PIE-during-link.patch \
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
+           file://0001-kexec-tools-purgatory-fix-build-on-binutils-2.42.patch \
            "
 
 SRC_URI[sha256sum] = "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
@@ -83,3 +84,5 @@ SECURITY_PIE_CFLAGS:remove = "-fPIE -pie"
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
 
 INSANE_SKIP:${PN} = "arch"
+
+TOOLCHAIN = "gcc"
-- 
2.43.0


