Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203CBC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 19:27:13 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.55103.1674156430824103355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 11:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eLWBhoh7;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: festevam@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id s66so2536520oib.7
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 11:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PrT2E8WZX0JSMIfdN0eHzvMGHpmbnPS/enMA43TL8Z4=;
        b=eLWBhoh7LCZu0r5GAsLboNkmtTRHoyixHFxhwysEePI4MNxDMz4GLdKKOQpyh1aer8
         gKR8TrBaQUTVlFx6wdrN/lLKg8707RHpk0KUTA2g5QDo6RBcL9frWIBc4TY8MpJ14bQO
         4OeJlAXQ5jkPunyS7Kb7KILuUb1CnMBVIDQcPERQKDzwawHY7ffPjXkAkgwWHxYG9byJ
         XC4CTDhAS03t/JmYSpyyq/dUM1eiX4du0rTMZSs20EB9f4OG+RRJmKq96bkYG3albciO
         loOng1hb1ZipB8mFDZ+AAOt5ByBz2iY134rMLUEGpXspiAgPPPKN/yYXkXUfmATqrM/H
         tGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrT2E8WZX0JSMIfdN0eHzvMGHpmbnPS/enMA43TL8Z4=;
        b=Wd6yzyrh6gTA8EBM5XFOs6QichpjIOPJ6idoYwdaPE4D9ZCdztFLSkLwdkvslaRxFh
         H5pCryKnQzxbuMPoQEt0DZ+gRzT9Uy+ybFgtETbDaCoNK1SARBJOO2Ai5WqXsRgtl8yz
         94RVJNp7XBfgoiCGY8CLJttO72h7nAggt7z6vKNYvyLpKBgG4lQxPcmA0SM146J8C/It
         e86w8JAkoqfgFWNfDdYkuFvDQIt3M7HpYhl5Pi6PAW24FmjVigVUGihx3YuYwPOSlmUk
         vAykh91I7crBG8DDRg4Rm4xoA910EtiwS3nOEUSFpA2Ny3q8z+VZUKc8TWfODgPprk4B
         gAHg==
X-Gm-Message-State: AFqh2kq6nDQFLyu6DZNzFwemlQadr8xe9dcIlgrm/RgkyPM48QVrygZy
	DT1pGIC+32kulpNXoMmcvm8RrNeuAGM=
X-Google-Smtp-Source: AMrXdXti1Sv+QAlv1sWuUPiYLfD0HN1dZrLRA5pQeASavIaSOCIjcolv+kHNP17NEdn8ymEaqT7G5Q==
X-Received: by 2002:aca:ac44:0:b0:369:36b3:3b0b with SMTP id v65-20020acaac44000000b0036936b33b0bmr5367329oie.59.1674156429731;
        Thu, 19 Jan 2023 11:27:09 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:315c:2ebe:462f:f892])
        by smtp.gmail.com with ESMTPSA id a18-20020a544e12000000b00363760f96dcsm17971305oiy.42.2023.01.19.11.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 11:27:08 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: otavio.salvador@ossystems.com.br,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4] u-boot: Upgrade to 2023.01
Date: Thu, 19 Jan 2023 16:26:59 -0300
Message-Id: <20230119192659.1252070-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 19:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176165

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2023.01.

Remove the two patches that are now upstream:

e67f34f778ba ("riscv: support building double-float modules")
1dde977518f1 ("riscv: Fix build against binutils 2.38")

And add a patch that fixes u-boot-tools build.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- Remove python3-setuptools-native from u-boot_2023.01.bb
as it has been included in u-boot-common.inc (Otavio).

 ...ols-only-add-VIDEO-to-build-bmp_logo.patch | 39 ++++++++++++++++
 ...1-riscv-fix-build-with-binutils-2.38.patch | 40 -----------------
 ...iscv32-Use-double-float-ABI-for-rv32.patch | 44 -------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 .../u-boot/u-boot-tools_2022.10.bb            |  3 --
 .../u-boot/u-boot-tools_2023.01.bb            |  4 ++
 meta/recipes-bsp/u-boot/u-boot_2022.10.bb     |  9 ----
 meta/recipes-bsp/u-boot/u-boot_2023.01.bb     |  5 +++
 8 files changed, 50 insertions(+), 98 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-riscv-fix-build-with-binutils-2.38.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2022.10.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2022.10.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2023.01.bb

diff --git a/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch b/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
new file mode 100644
index 0000000000..1339092358
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
@@ -0,0 +1,39 @@
+From 5d663e105f5affbe1ba771a1124855bff748b829 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@denx.de>
+Date: Wed, 18 Jan 2023 22:15:04 -0300
+Subject: [PATCH] Revert "config: tools only: add VIDEO to build bmp_logo"
+
+This reverts commit 1cfba53ca46cade2dbf4e067afc8c19e72909a4b.
+
+Since commit 1cfba53ca46c ("config: tools only: add VIDEO to build
+bmp_logo") the build of tools-only_defconfig fails:
+
+| /bin/sh: line 1: tools/bmp_logo: No such file or directory
+
+This has been noticed in OpenEmbedded and Debian [1].
+
+Revert it for now.
+
+[1] https://lists.denx.de/pipermail/u-boot/2023-January/504758.html
+
+Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20230119012321.1103067-1-festevam@denx.de/]
+Signed-off-by: Fabio Estevam <festevam@denx.de>
+---
+ configs/tools-only_defconfig | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configs/tools-only_defconfig b/configs/tools-only_defconfig
+index 2197063112..fb75235e3d 100644
+--- a/configs/tools-only_defconfig
++++ b/configs/tools-only_defconfig
+@@ -29,7 +29,6 @@ CONFIG_DM_RTC=y
+ CONFIG_SOUND=y
+ CONFIG_SYSRESET=y
+ CONFIG_TIMER=y
+-CONFIG_VIDEO=y
+ # CONFIG_VIRTIO_MMIO is not set
+ # CONFIG_VIRTIO_PCI is not set
+ # CONFIG_VIRTIO_SANDBOX is not set
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/u-boot/files/0001-riscv-fix-build-with-binutils-2.38.patch b/meta/recipes-bsp/u-boot/files/0001-riscv-fix-build-with-binutils-2.38.patch
deleted file mode 100644
index 3598329b99..0000000000
--- a/meta/recipes-bsp/u-boot/files/0001-riscv-fix-build-with-binutils-2.38.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 26a7f6b1e4c5f715c03e59a623f0d620498b92cf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 13 Feb 2022 21:11:31 -0800
-Subject: [PATCH] riscv: fix build with binutils 2.38
-
-From version 2.38, binutils default to ISA spec version 20191213. This
-means that the csr read/write (csrr*/csrw*) instructions and fence.i
-instruction has separated from the `I` extension, become two standalone
-extensions: Zicsr and Zifencei.
-
-The fix is to specify those extensions explicitely in -march. However as
-older binutils version do not support this, we first need to detect
-that.
-
-Fixes
-arch/riscv/lib/cache.c: Assembler messages:
-arch/riscv/lib/cache.c:12: Error: unrecognized opcode `fence.i'
-
-Upstream-Status: Submitted []
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- arch/riscv/Makefile | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
---- a/arch/riscv/Makefile
-+++ b/arch/riscv/Makefile
-@@ -28,7 +28,12 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
- 	CMODEL = medany
- endif
- 
--ARCH_FLAGS = -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_F)$(ARCH_D)$(ARCH_C) -mabi=$(ABI) \
-+# Newer binutils versions default to ISA spec version 20191213 which moves some
-+# instructions from the I extension to the Zicsr and Zifencei extensions.
-+toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_F)$(ARCH_D)$(ARCH_C)_zicsr_zifencei)
-+zicsr_zifencei-$(toolchain-need-zicsr-zifencei) := _zicsr_zifencei
-+
-+ARCH_FLAGS = -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_F)$(ARCH_D)$(ARCH_C)$(zicsr_zifencei-y) -mabi=$(ABI) \
- 	     -mcmodel=$(CMODEL)
- 
- PLATFORM_CPPFLAGS	+= $(ARCH_FLAGS)
diff --git a/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch b/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
deleted file mode 100644
index 0bf1bef2c9..0000000000
--- a/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 66dfe0fa886f6289add06d1af8642ce2b5302852 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Feb 2021 16:40:12 -0800
-Subject: [PATCH] riscv32: Use double-float ABI for rv32
-
-So it can use libgcc built with OE toolchain
-Fixes
-error: "can't link hard-float modules with soft-float modules"
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Inappropriate [embedded specific]
----
- arch/riscv/Makefile | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
---- a/arch/riscv/Makefile
-+++ b/arch/riscv/Makefile
-@@ -5,11 +5,15 @@
- 
- ifeq ($(CONFIG_ARCH_RV64I),y)
- 	ARCH_BASE = rv64im
--	ABI = lp64
-+	ABI = lp64d
-+	ARCH_D = d
-+	ARCH_F = f
- endif
- ifeq ($(CONFIG_ARCH_RV32I),y)
- 	ARCH_BASE = rv32im
--	ABI = ilp32
-+	ABI = ilp32d
-+	ARCH_D = d
-+	ARCH_F = f
- endif
- ifeq ($(CONFIG_RISCV_ISA_A),y)
- 	ARCH_A = a
-@@ -24,7 +28,7 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
- 	CMODEL = medany
- endif
- 
--ARCH_FLAGS = -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_C) -mabi=$(ABI) \
-+ARCH_FLAGS = -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_F)$(ARCH_D)$(ARCH_C) -mabi=$(ABI) \
- 	     -mcmodel=$(CMODEL)
- 
- PLATFORM_CPPFLAGS	+= $(ARCH_FLAGS)
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 60c77cbec4..d72f6d3ba2 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -4,7 +4,7 @@ ARM, MIPS and several other processors, which can be installed in a boot \
 ROM and used to initialize and test the hardware or to download and run \
 application code."
 SECTION = "bootloaders"
-DEPENDS += "flex-native bison-native"
+DEPENDS += "flex-native bison-native python3-setuptools-native"
 
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "4debc57a3da6c3f4d3f89a637e99206f4cea0a96"
+SRCREV = "62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2022.10.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2022.10.bb
deleted file mode 100644
index ef386f76e6..0000000000
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2022.10.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require u-boot-common.inc
-require u-boot-tools.inc
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb
new file mode 100644
index 0000000000..3484b359ad
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb
@@ -0,0 +1,4 @@
+require u-boot-common.inc
+require u-boot-tools.inc
+
+SRC_URI += "file://0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.10.bb b/meta/recipes-bsp/u-boot/u-boot_2022.10.bb
deleted file mode 100644
index 1ae575790c..0000000000
--- a/meta/recipes-bsp/u-boot/u-boot_2022.10.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require u-boot-common.inc
-require u-boot.inc
-
-SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
-                   file://0001-riscv-fix-build-with-binutils-2.38.patch \
-                 "
-
-DEPENDS += "bc-native dtc-native python3-setuptools-native"
-
diff --git a/meta/recipes-bsp/u-boot/u-boot_2023.01.bb b/meta/recipes-bsp/u-boot/u-boot_2023.01.bb
new file mode 100644
index 0000000000..f75db4cf1e
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2023.01.bb
@@ -0,0 +1,5 @@
+require u-boot-common.inc
+require u-boot.inc
+
+DEPENDS += "bc-native dtc-native"
+
-- 
2.25.1


