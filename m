Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCD5C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 23:37:45 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.3165.1644881864341800103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 15:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ElGmnGZK;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d17so3769929pfl.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 15:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gPVbYezTIgnerU8m4xPyGdhJEKia4Ul7oUlInUKOdb0=;
        b=ElGmnGZKsZ2Va9yJqhUsrorZXTwU0r1e9oM2Y2WiXp2NOlfosg6SHFYDLR7qoAHV5X
         S7LNmkVOkIQ/zN19R+hq9OJDLNP50KKlusjc5ez+YykCrqOO+etgW9H2e+nPVCbHtHxG
         AQleA6OPV7xIChghbZKWALziMEgYIULRlQLkvKw95cwpY7jWrwCcsHJuA011kZ6VQnGd
         DfnDv8aQQoFxZz9fzbK0n+OqOX2Cqtjg9h7q3t1g6IxrwwqVmZAocDmUa9xkWAYtYuxS
         NIaS04FvpDhQfM40rHrmiCt8G089KF/2RW9e/4D+Rjb/rWj5q/n2dZ434dBr8Ac60+yM
         Agyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gPVbYezTIgnerU8m4xPyGdhJEKia4Ul7oUlInUKOdb0=;
        b=JrZRQL6g9ffzdl9tH8d95R4Z+usf3QkOAT+xxUwbBsx3DxChfW7ePx91v5z0D0r9s5
         AahngrtQfrzSF6Rmf9wM9B1bRe3/TcZdtybRNsT+w9S2t1OhNVIejfYDNyfRb9xRJ6Fs
         UW3BS71CA9/Cv7Z83/RZVe2yCiLilGIWZeBeSvMEnis+0Mu3oj+r5brcgIIMkaiKB/TT
         fO+eLHSUSYZ/NbL0qLHqeI8x4Ji4LHIR9f9Vx2DcLXXpdMp5jCJvZ/BEUG05FzQMqwSi
         QpYEz/5yfj4aJfUOGcmvT2iLha/Keu9+f1vJX9npohCnEdIAoAnLa8/+NJOhYp5n5sqp
         Xnvg==
X-Gm-Message-State: AOAM5330xXhOaZ8iS0IsYxd1O7Q851b3FRxRCftFBmGS2svSX9mLD9wI
	EoEjbZXSH1Cg5a2hgJYqO8mDV1AQ9QdOSg==
X-Google-Smtp-Source: 
 ABdhPJx8P3UlVX9nwNiGLtbzMiLBIKuwNW4CZHSTWGktQDE+KdQBKRzOk8Qizw5keqnuXkEld5t7BA==
X-Received: by 2002:aa7:8e08:: with SMTP id c8mr1292166pfr.61.1644881863499;
        Mon, 14 Feb 2022 15:37:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 k9sm38939368pfc.157.2022.02.14.15.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 15:37:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] u-boot: Fix RISCV build with binutils 2.38
Date: Mon, 14 Feb 2022 15:37:39 -0800
Message-Id: <20220214233739.3219186-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214233739.3219186-1-raj.khem@gmail.com>
References: <20220214233739.3219186-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 23:37:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161734

Ensure right ABI and march is used which matches OE core settings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-riscv-fix-build-with-binutils-2.38.patch | 40 +++++++++++++++++++
 ...iscv32-Use-double-float-ABI-for-rv32.patch | 16 ++++----
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  4 +-
 3 files changed, 52 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-riscv-fix-build-with-binutils-2.38.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-riscv-fix-build-with-binutils-2.38.patch b/meta/recipes-bsp/u-boot/files/0001-riscv-fix-build-with-binutils-2.38.patch
new file mode 100644
index 00000000000..3598329b99d
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-riscv-fix-build-with-binutils-2.38.patch
@@ -0,0 +1,40 @@
+From 26a7f6b1e4c5f715c03e59a623f0d620498b92cf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 13 Feb 2022 21:11:31 -0800
+Subject: [PATCH] riscv: fix build with binutils 2.38
+
+From version 2.38, binutils default to ISA spec version 20191213. This
+means that the csr read/write (csrr*/csrw*) instructions and fence.i
+instruction has separated from the `I` extension, become two standalone
+extensions: Zicsr and Zifencei.
+
+The fix is to specify those extensions explicitely in -march. However as
+older binutils version do not support this, we first need to detect
+that.
+
+Fixes
+arch/riscv/lib/cache.c: Assembler messages:
+arch/riscv/lib/cache.c:12: Error: unrecognized opcode `fence.i'
+
+Upstream-Status: Submitted []
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arch/riscv/Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+--- a/arch/riscv/Makefile
++++ b/arch/riscv/Makefile
+@@ -28,7 +28,12 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
+ 	CMODEL = medany
+ endif
+ 
+-ARCH_FLAGS = -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_F)$(ARCH_D)$(ARCH_C) -mabi=$(ABI) \
++# Newer binutils versions default to ISA spec version 20191213 which moves some
++# instructions from the I extension to the Zicsr and Zifencei extensions.
++toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_F)$(ARCH_D)$(ARCH_C)_zicsr_zifencei)
++zicsr_zifencei-$(toolchain-need-zicsr-zifencei) := _zicsr_zifencei
++
++ARCH_FLAGS = -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_F)$(ARCH_D)$(ARCH_C)$(zicsr_zifencei-y) -mabi=$(ABI) \
+ 	     -mcmodel=$(CMODEL)
+ 
+ PLATFORM_CPPFLAGS	+= $(ARCH_FLAGS)
diff --git a/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch b/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
index 0ed3de4914e..0bf1bef2c99 100644
--- a/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
+++ b/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
@@ -13,11 +13,16 @@ Upstream-Status: Inappropriate [embedded specific]
  arch/riscv/Makefile | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
-diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
-index 0b80eb8d86..7324946f48 100644
 --- a/arch/riscv/Makefile
 +++ b/arch/riscv/Makefile
-@@ -9,7 +9,9 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
+@@ -5,11 +5,15 @@
+ 
+ ifeq ($(CONFIG_ARCH_RV64I),y)
+ 	ARCH_BASE = rv64im
+-	ABI = lp64
++	ABI = lp64d
++	ARCH_D = d
++	ARCH_F = f
  endif
  ifeq ($(CONFIG_ARCH_RV32I),y)
  	ARCH_BASE = rv32im
@@ -28,7 +33,7 @@ index 0b80eb8d86..7324946f48 100644
  endif
  ifeq ($(CONFIG_RISCV_ISA_A),y)
  	ARCH_A = a
-@@ -24,7 +26,7 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
+@@ -24,7 +28,7 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
  	CMODEL = medany
  endif
  
@@ -37,6 +42,3 @@ index 0b80eb8d86..7324946f48 100644
  	     -mcmodel=$(CMODEL)
  
  PLATFORM_CPPFLAGS	+= $(ARCH_FLAGS)
--- 
-2.30.0
-
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index 617827ff083..0d2464d74bd 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -1,7 +1,9 @@
 require u-boot-common.inc
 require u-boot.inc
 
-SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch"
+SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
+                   file://0001-riscv-fix-build-with-binutils-2.38.patch \
+                 "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
 
-- 
2.35.1


