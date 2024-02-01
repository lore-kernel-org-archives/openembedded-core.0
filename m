Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A5FC4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 22:28:54 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.9325.1706826532895641019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 14:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HjKDkbXa;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6de0ba30994so149629b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 14:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706826532; x=1707431332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i6ZiZ6LypXwcSswdjMfHNvmlsUxqAzg8FRz6F/SiUps=;
        b=HjKDkbXaaWe2yBXOFGf4o1A3dd6JGJByHtf9KeBwNGHdfqLTN8W0RnCg5ZHwS3zvvb
         BZA/+odYDpYqb2m66ViEia8Uwokw2U9k3GOHAxe/VLo/8l9f4fuquGO1BQBCVKi+WFX5
         t6N4rfHoIhdzQw/TiCENUzWj3ZWFaZCB7ChSAldRC+sdQagk1Qcr9pIcS4rJDBlMnxMC
         TTR71h3E1ykoF7gjVzKJxqYlBk5wL8UunYsOqxo0GITz9Iw9buyUWTfvk2etjb+CqNty
         37CM92mbfzfyaq2QfgMYjU7U6oBu1nxAGHl0SlO58bQlAAwocqjcgFmqSN8koayG9SkP
         qTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706826532; x=1707431332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6ZiZ6LypXwcSswdjMfHNvmlsUxqAzg8FRz6F/SiUps=;
        b=BPu3CfUu4yk5RHinS3iRwMhSZkd74wBqdg+wANLEI7XSYQF+hE+ZQPeZzFeXgSA1ds
         5XuBhLcmjK46olhl2hXBOzH1IaQ9p2IxqZ3FVLHFm45pGnSh3XqEMrdvaESpPb1El3p8
         nc5YpaU9tklhknauk9RvUmh/qL56FZTWhpEiVjfNcjCAv2VtByvysiu08qjVd6SjevH9
         9mD2xba+CdRrpbfSQgNG5CvzhguEfsh+ZTbQcPXqSHrYoI9An9/ymricvNJRIH3xy+I2
         SxeZ3sHH79iKIdHGUe2PJ0L+qXNSS7Whmin5s/hkG/iULiD6bbdptCrjvVCepgJgj9JS
         QsgA==
X-Gm-Message-State: AOJu0Ywl9TNv9zbTh2eaqkCIWi70vlTOwV7FFA4s+AoANGJo/Aj0X7AV
	ov4IO+J/zNdU4szLKz4cNhX0Wm18zq6TgZfEeWAVbgaw7ay2fnyeyWVdobauKCU=
X-Google-Smtp-Source: AGHT+IH84kJ8UeBW4l/VQHaHFhCmRPal9CW2jpaCNf5EPLMmegxAK8oXeWiaBcefLADwpP37T1IoHQ==
X-Received: by 2002:a05:6a00:3903:b0:6df:ee93:570 with SMTP id fh3-20020a056a00390300b006dfee930570mr499439pfb.6.1706826531633;
        Thu, 01 Feb 2024 14:28:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e58e])
        by smtp.gmail.com with ESMTPSA id jw30-20020a056a00929e00b006ddc3f5c39bsm243535pfb.165.2024.02.01.14.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 14:28:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] kexec-tools: Fix build with gas 2.42
Date: Thu,  1 Feb 2024 14:28:49 -0800
Message-ID: <20240201222849.873612-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 22:28:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194758

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop left-over debugging related setting for TOOLCHAIN var

 ...purgatory-fix-build-on-binutils-2.42.patch | 59 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.28.bb               |  1 +
 2 files changed, 60 insertions(+)
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
index c2141e6716d..4471cdf21e0 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
@@ -17,6 +17,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
            file://0005-Disable-PIE-during-link.patch \
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
+           file://0001-kexec-tools-purgatory-fix-build-on-binutils-2.42.patch \
            "
 
 SRC_URI[sha256sum] = "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
-- 
2.43.0


