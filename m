Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277BDC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 21:28:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.1.1747344494290701418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 14:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FO+Z8D9v;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e4d235811so18497545ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747344493; x=1747949293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQVAtP/1YLd89DJr/ee03vw+DDFVjDkd+B7XhmIN810=;
        b=FO+Z8D9vRw0AwqnDOE70nat8secnw+03x6u5aQ/WEjS7l1H/TXuT3h/rGAj94Jn6lM
         FGrt4ddvy2TEvCYm6LkfguGFlhUOtzmfaiP6j+zhRbAsadIWQN7Mhi92hrdkiYoWzOMs
         Nm8UIkzzBRFk9v4JxoMhjC1WIV39NPDM/LmGV0tv5iGIrJp9/9e4rj7GZtyhAJFWPzDH
         Ccj47uJtFEI5iauY1ykbxXfvHc0Kc+BpVNiLMcNMgNIuqhigx5kIoVkyHnzcEmPJ0y2c
         ykgOz1szYH2llWmMlwpxG4+K7TW4daicwHJGPJOKoa1RP2E1zwbMnVg6jaNdLjvo+hgc
         tTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747344493; x=1747949293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQVAtP/1YLd89DJr/ee03vw+DDFVjDkd+B7XhmIN810=;
        b=m6PI2MTNncBS2mh6qVNZJIfqbMlmZxemnJrpOZBmcehkuI307eWNJ121i5VRhJtW8k
         UVMI6H0krSS9rPW6B0Qon57Jh1FTPmecByVhKpi4A8VhPnqklwxHIgRkG/ZJf5KlZR12
         USMa4YyiRPAx97nDuNsxYOm1aca+vSp2hkiBY4+Rw56SFGxowpDFDDuYsm1VgERdJLjx
         doUK5p4ZxrC7QRzweDCkgHxlsH17+WF7oSjBGV5SPRDdleeNG9s/Xtm9iye5ZlRCvlPD
         3EF8+E5x2VCWvWDRWjnkV13iE1w83Ww3G+0A6Iky3YOu2aV+kmkbnEH96snrDOZkXpyt
         Dw0A==
X-Gm-Message-State: AOJu0Ywr1OqR92og9vLQ8AissyUZZW2boIBaBKRT5kVEHF43BRMvXwS0
	H4KqwUfLmgSCKXGnR7o0WlXD2wPjNxibP4KwMQdL8BHt+hD0nnnbFIimSyQw2vJ/
X-Gm-Gg: ASbGncvzLYdU3DCknyLLaz4nyxxqxy0u+phXjBUzuh5zSvz2ItX8rDPj0W+lmyG0V05
	zGOS906+Jetn62j65dymuP7NCye1gyAk/0TyridfeM/4mWxtBA/fYetBxxIW57pBWVuDroVJRl9
	mEGvS0DQapthxdgY35Ct0IUPt8zU8qMif4hHUHBnWJwdE6vfMKGdbEsPptEh5Agmw2n8NPtww6i
	f4vEmN6KUA1oWSK86HlwbFO4ZEesm+A29uylLLJQ0WByDpohCNWCeJuJQxRtCf6QHV6JuHGc3J4
	xdYl6PEfO60BG7JPG1m7gF9pXy4mDeDNC/waIXvgjVE=
X-Google-Smtp-Source: AGHT+IF1PIWIficMqFi9kXOSwRHE6CfhrqDI5huswsx99Zfd7yLW0b46nvddwH4U3rK7VaZ892ln0g==
X-Received: by 2002:a17:902:ea0d:b0:231:c9d1:962f with SMTP id d9443c01a7336-231d43c3e8amr13024745ad.29.1747344493310;
        Thu, 15 May 2025 14:28:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edb079sm2174115ad.253.2025.05.15.14.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 14:28:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] opensbi: Pass CROSS_COMPILE and REPRODUCIBLE flags
Date: Thu, 15 May 2025 14:28:10 -0700
Message-ID: <20250515212810.3948564-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 21:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216708

When using clang pass LLVM=y to makefile so it can select needed bits
using clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: HOST_PREFIX instead of HOST_SYS is needed
v3: Pass ldflags from env via EFLAGS

 ...lag-for-reprodubility-compiler-flags.patch | 49 +++++++++++++++++++
 meta/recipes-bsp/opensbi/opensbi_1.6.bb       |  8 +--
 2 files changed, 54 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-bsp/opensbi/opensbi/0001-Makefile-Add-flag-for-reprodubility-compiler-flags.patch

diff --git a/meta/recipes-bsp/opensbi/opensbi/0001-Makefile-Add-flag-for-reprodubility-compiler-flags.patch b/meta/recipes-bsp/opensbi/opensbi/0001-Makefile-Add-flag-for-reprodubility-compiler-flags.patch
new file mode 100644
index 00000000000..e650476f50f
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/opensbi/0001-Makefile-Add-flag-for-reprodubility-compiler-flags.patch
@@ -0,0 +1,49 @@
+From f4c440219f42d74bd3d6688132ea876f3f51e601 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 May 2025 19:50:24 -0700
+Subject: [PATCH] Makefile: Add flag for reprodubility compiler flags
+
+Provides mechanism to remove absolute paths from binaries using
+-ffile-prefix-map
+
+It will help distros (e.g. yocto based ones ) which want to ship
+the .elf files but need to scrub absolute paths in objects
+
+Upstream-Status: Submitted [https://lists.infradead.org/pipermail/opensbi/2025-May/008458.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index e90836c7..22d4ecff 100644
+--- a/Makefile
++++ b/Makefile
+@@ -174,6 +174,11 @@ else
+ USE_LD_FLAG	=	-fuse-ld=bfd
+ endif
+ 
++REPRODUCIBLE ?= n
++ifeq ($(REPRODUCIBLE),y)
++REPRODUCIBLE_FLAGS		+=	-ffile-prefix-map=$(src_dir)=
++endif
++
+ # Check whether the linker supports creating PIEs
+ OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
+ 
+@@ -362,6 +367,7 @@ GENFLAGS	+=	$(firmware-genflags-y)
+ 
+ CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections
+ CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
++CFLAGS		+=	$(REPRODUCIBLE_FLAGS)
+ # Optionally supported flags
+ ifeq ($(CC_SUPPORT_VECTOR),y)
+ CFLAGS		+=	-DOPENSBI_CC_SUPPORT_VECTOR
+@@ -387,6 +393,7 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
+ ASFLAGS		=	-g -Wall -nostdlib
+ ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
+ ASFLAGS		+=	-fPIE
++ASFLAGS		+=	$(REPRODUCIBLE_FLAGS)
+ # Optionally supported flags
+ ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
+ ASFLAGS		+=	-mno-save-restore
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.6.bb b/meta/recipes-bsp/opensbi/opensbi_1.6.bb
index ed1a70d01a1..c9dfcfbe4f1 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.6.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.6.bb
@@ -9,8 +9,9 @@ require opensbi-payloads.inc
 inherit deploy
 
 SRCREV = "bd613dd92113f683052acfb23d9dc8ba60029e0a"
-SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
-
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https \
+           file://0001-Makefile-Add-flag-for-reprodubility-compiler-flags.patch \
+"
 S = "${WORKDIR}/git"
 
 TARGET_DBGSRC_DIR = "/share/opensbi/*/generic/firmware/"
@@ -18,7 +19,8 @@ TARGET_DBGSRC_DIR = "/share/opensbi/*/generic/firmware/"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 RISCV_SBI_FW_TEXT_START ??= "0x80000000"
-EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_TEXT_START=${RISCV_SBI_FW_TEXT_START}"
+EXTRA_OEMAKE += "REPRODUCIBLE=y CROSS_COMPILE=${HOST_PREFIX} ELFFLAGS="${LDFLAGS}" PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_TEXT_START=${RISCV_SBI_FW_TEXT_START}"
+EXTRA_OEMAKE:append:toolchain-clang = " LLVM=y"
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_image(d)}"
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_fdt(d)}"

