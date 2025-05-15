Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A813CC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 08:34:27 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.7916.1747298066393730831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 01:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M3H9VJUR;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b074d908e56so345492a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 01:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747298065; x=1747902865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h0DcqBYYYTS8j7FkNXoWQu0/DQXjPY9G+cRrpjeUFdw=;
        b=M3H9VJURhriLLFnipMiLOGB9FScs+TC0ZTnybJ5Nik0D2fw87zH1NsNTLb+QKvT9Dm
         47RDgayiuprqx7XZtyVjVumQG6W4co/c5FkC8KTTXMDEosdyB8eFPWCcJli8h3p+DIFr
         EHPZbpdYhQrjOf7c3nZ5PK4WkakeSX04OwgTenKdTe2cYt8cSXlTm5YtdRmFBU3Fx1V0
         bEJsMgjAsatZJQkajF9eNiBzluiQBYturyHOX3qX4E76YNiDV1xLp1Y4qJy0Qfa2iw+q
         2rF0RKXlFymj2j32OgzwEsW58rPvSfWwndhKUySmrp9ywP88VQ5X5LjjTmtL8BwgBfHj
         7fZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747298065; x=1747902865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0DcqBYYYTS8j7FkNXoWQu0/DQXjPY9G+cRrpjeUFdw=;
        b=bmtpOHUBhO/5n2OVdDUIY0bm/cNoL5l0JZNNCWV7/NpsrG/5bDANqPX5Nb4zx7qRCG
         evTNOOmp0Hi3WKWl1nMfgZbKmwoAK1PTlw14gnrS/oc1HZPIO6IxOp7/QgejgTabxt19
         +raQeNYEIXln7hNTGiuv0Gx4knnk+2Roxi/v2rMhSNQd1APj+O4u7jvykLfHMxOtpWoa
         gJeJWcs4X+nltySdxqzZUKyPzR6XOovFX5aZ7IWl9OgYhWVfraC814sMKxleb/pFB8Lj
         hyzru3GubxqYo95vOFJ3Gl3FteHj7MGRTqmYJbIa3Qh7u6ztalDSrYWrHxyURbxwPTSa
         MKnA==
X-Gm-Message-State: AOJu0Yy14iZ11spngp18QpVs+i7jB+0/xSAw2BpZhWWr+uFRpUFpzWMI
	qD5xE2vRSfghN31pi8xAr5/oF8ka0/5iWp18NCBl9xogrHulJx1V+Gc5qLTb
X-Gm-Gg: ASbGncv4IZ/aHUFp5QrjvTqmTmyRpPAMI09pFOTfv8GCXc+uXaGMAznv4Dl/hLq/W+T
	DQtdUeECMxvdjAvQH6DpXMm7JFFgrqma9vNgjUu1O5pX8i9wClMwzBDxXLYjhZpNeup7e9poT/4
	ImZOOBTPtieoU7jFfWZWizCFzsbWypszeYRcgqAC2eLiI4RuFdURcNd59pBYN4VzgBixr41A81L
	6fViX0J+vUSJIe7hl/+qKTxUgRgk521jiPjAADdjPti0Qx9SQbMtJbSONIma40HLOO9W2zZe+jC
	Np1QJnB5zmWD5vqsEUAYNUsQr2TSOkIN2gCT3PID5HWEhi0DqI8rqw==
X-Google-Smtp-Source: AGHT+IHe4SsgaAf2Lg1jXUmUltBJ0FIiPFsXHqEds5G+AbBNdUacVfcr13ccL5MZnNJXdnhwDW5lZQ==
X-Received: by 2002:a17:90a:d88c:b0:2ee:af31:a7bd with SMTP id 98e67ed59e1d1-30e5156789emr2370256a91.5.1747298065193;
        Thu, 15 May 2025 01:34:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e3347fdddsm2973800a91.33.2025.05.15.01.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:34:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] opensbi: Pass CROSS_COMPILE and REPRODUCIBLE flags
Date: Thu, 15 May 2025 01:34:22 -0700
Message-ID: <20250515083422.113413-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 08:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216572

When using clang pass LLVM=y to makefile so it can select needed bits
using clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: HOST_PREFIX instead of HOST_SYS is needed

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
index ed1a70d01a1..bfbd56b74e3 100644
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
+EXTRA_OEMAKE += "REPRODUCIBLE=y CROSS_COMPILE=${HOST_PREFIX} PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_TEXT_START=${RISCV_SBI_FW_TEXT_START}"
+EXTRA_OEMAKE:append:toolchain-clang = " LLVM=y"
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_image(d)}"
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_fdt(d)}"

