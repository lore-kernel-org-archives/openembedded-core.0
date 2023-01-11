Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BAFC5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 18:07:12 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.31654.1673460422160557288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 10:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ioP7yHfS;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: festevam@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id h185so13383521oif.5
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 10:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oUg8hBuK/vxGatPjEpPWWRk58WP1S/J996Rk+8Z8kHo=;
        b=ioP7yHfSJnd1dNLUpjpxPIeeIjDCMAfYLMUplKMSwQvRD6U3rreA4nOVORxHHZMiMe
         4uR3A6cmjF1BZ5Xu8+Cr88uVlUX1smcZv6byYZfEbjwt9HInLbYRrkmIuijQaRju7bxg
         vRhT24a32xBUUnuvJN6rJtmWhct6L22fBrC4uQ6PewHN9pkrVxka6i9S1qnQnSMTBQmy
         NzglRwJaeAJjRG1rXofC0DPgKor9AmZIWbe2v0u8T3xLomJV4njqK7teEGaIfB+4af7H
         U7IBbktAnS4NRa9Xi4RE2MdVfK5Qwsh8sYMfy8hhLHGHK3FW6suzYGxfE9laz7Xw9K0i
         VplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUg8hBuK/vxGatPjEpPWWRk58WP1S/J996Rk+8Z8kHo=;
        b=nc5ycZR6HgbGD9UQN1hf2y7H1PRTIWEokbSNTZ0fzNcUhLaz3EFexuoNPkkPWVCAD1
         f5jdExWHso1nmfQoknv6fs63cSjCYpAUKU1rOwNyRtQXSEaPC1qSOwzHht5Gzjmev3kj
         ml2G6Hpimf+NSiX9N6xiDNi0iZyNdI4uzMJYNv4dBF71fa+D5Mal8mzu8KTRI3WO4buT
         9OLjDEK8ZZmmPeak/N3E4Cw5hKGn5J+ooui3rrkzhLUv3LuCs0ZDEvSnxxtNGR8eVSsq
         u4ykGuEH/DOGjoA3axqn8Gdtb0YxwO2LHaBRJmjcgLnSRqJcCs/X2ntQEiZAH1ih2nem
         aRfg==
X-Gm-Message-State: AFqh2kriiyVFoJy4z8oZkVGEQOqzIlqXDruzS7RcTUdRKQy964lPvwOq
	mpbGiOsGEZgM8Y1c0dpXPKU5vewTFZY=
X-Google-Smtp-Source: AMrXdXv3X71YevYBLYhtRhNgWDGgmuj8imZLTw+I5jd3+7Sw8nKQg8YnZAv2/FR+TDAfryrUR4JufQ==
X-Received: by 2002:a05:6808:682:b0:360:e20a:35e4 with SMTP id k2-20020a056808068200b00360e20a35e4mr31544243oig.5.1673460421122;
        Wed, 11 Jan 2023 10:07:01 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:6c77:e680:86e1:548e])
        by smtp.gmail.com with ESMTPSA id i16-20020a056808031000b00360bf540072sm6927733oie.0.2023.01.11.10.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 10:07:00 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: Upgrade to 2023.01
Date: Wed, 11 Jan 2023 15:06:54 -0300
Message-Id: <20230111180654.1710208-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175769

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2023.01.

Remove the two patches that are now upstream:

e67f34f778ba ("riscv: support building double-float modules")
1dde977518f1 ("riscv: Fix build against binutils 2.38")

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...1-riscv-fix-build-with-binutils-2.38.patch | 40 -----------------
 ...iscv32-Use-double-float-ABI-for-rv32.patch | 44 -------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 meta/recipes-bsp/u-boot/u-boot_2022.10.bb     |  9 ----
 meta/recipes-bsp/u-boot/u-boot_2023.01.bb     |  4 ++
 5 files changed, 5 insertions(+), 94 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-riscv-fix-build-with-binutils-2.38.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2022.10.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2023.01.bb

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
index 60c77cbec4..22adad80ff 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "4debc57a3da6c3f4d3f89a637e99206f4cea0a96"
+SRCREV = "62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
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
index 0000000000..2eef1e900e
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2023.01.bb
@@ -0,0 +1,4 @@
+require u-boot-common.inc
+require u-boot.inc
+
+DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.25.1


