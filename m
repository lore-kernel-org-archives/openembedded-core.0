Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287AEC3ABC9
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 03:14:36 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.4826.1747278868751605170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 20:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IrYtTclb;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7418e182864so449218b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 20:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747278868; x=1747883668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxCH8YwVTfwqhnDNuxBWjfQxlysr1JfltQEmng9oS7c=;
        b=IrYtTclbg9+nTAK79Lhnb1SBeoRVqv41ktSyF/9/gk82gxEfQF2scyGbHyIAKP3MaX
         NPhsojJh1wei97dfpZUPxmzNSXzjijGPdHDhP/FfusRd5smc/9wPC773uj++eh4p1XVw
         3VSbzvTM+pRpIjXIFJBGCrGwPtTUBaEWIdc9YBmT7gSAhIOsaYFQfyuhgI2Na1n5fbJf
         ST7zOSFIi6Ju6Evm3g2mp47PEPmMMb50fZAJuzll4wMXh2iFml2mhWJJW79XfnnY3UWv
         tXUjfi23i25UyPrzseolnCVE0BjZEhmOCfYIKFoqeKmnNe8dtgYGuLy5qNm/IaSU7SoM
         rXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747278868; x=1747883668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxCH8YwVTfwqhnDNuxBWjfQxlysr1JfltQEmng9oS7c=;
        b=SdPn1KPWD/cR4Vocg80WjYlgNirVNXW5/+DwcNoWZhEBhHnAxJ+YyjYj9OYbWf6+xX
         lDACSk2tzWECa9NEeX6Z+TYdU7qTHJ8gG0YnDXGpt+C9EBfZsX/lH6S1o0dCFwrbXs0k
         n5CkYEEWAF55KzY8N+1ug+IeHW3G0ZvAGs8DOESvo54Vgs9Ip8qXHXzFOYxWuOhnP0xz
         fay6DubsiqxeSP6+RLNMwh658GVQ8c4v8bei4lurRg1BaD9z1XT540POwtqyNzqFdVGp
         IXDzSEyUzHazxhtr+diPoagAtXQJRGQvM0buzAD14Ad9QAEyfE3oFWyI5h83t07RgYDm
         d0eQ==
X-Gm-Message-State: AOJu0Yza2rjLAyHfSdGm1tujqrMGfxHqM3Awh/h4w2uTo8UPg1QBaHDi
	Y+Z72MP3fpbTwkWt0ZrG987/Q+YEPWhBQxDbu8LlHpP0L6PYqDsUPsyAHNHF
X-Gm-Gg: ASbGncumKcKVPHAz+YIfvbaf6jBUUHHEHjWx8nqm2Z1KB+IrDyov+ajPx92IH2estXG
	O0f04RXngGu7ZT+8NB7CZ2JLmvmEEow2kHJ9h15sRqXBGKMlahEBVAFdWwMw4xqH8zjOweL1/d2
	kGLwKgrNKj0AG1KHRT/kin3DX0kjp5cpqGX++s8BreQDk7AdGKI42Xgq7N1KV7ofR4bPgKuvCra
	AWMNMdWiZUzFXyywBDTXhzZ4Jg+OIMKPm+apJEaU6OyyVs3xV78qsafGQEq0bAuPLZ53K7nDU2P
	YHURLB50gAxEw4SvJsTajjdJ/1ZZbQSp3ZqK6DBYT4c=
X-Google-Smtp-Source: AGHT+IFqiAvFxXdX8fvFpDnjM1vyT29/DBMm/bTNWk+HMPw5dWVo00y9MnwCpvMQgkE3I/bX48U95g==
X-Received: by 2002:a05:6a20:6a0e:b0:1f5:87a0:60ed with SMTP id adf61e73a8af0-215ff11db1fmr8254694637.19.1747278867799;
        Wed, 14 May 2025 20:14:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234951024csm9698764a12.5.2025.05.14.20.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 20:14:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] opensbi: Pass CROSS_COMPILE and REPRODUCIBLE flags
Date: Wed, 14 May 2025 20:14:25 -0700
Message-ID: <20250515031425.3401414-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 03:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216566

When using clang pass LLVM=y to makefile so it can select needed bits
using clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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
index ed1a70d01a1..6dfaf41894f 100644
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
+EXTRA_OEMAKE += "REPRODUCIBLE=y CROSS_COMPILE=${HOST_SYS} PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_TEXT_START=${RISCV_SBI_FW_TEXT_START}"
+EXTRA_OEMAKE:append:toolchain-clang = " LLVM=y"
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_image(d)}"
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_fdt(d)}"

