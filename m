Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B4BC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 18:44:22 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.32696.1673462655611233428
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 10:44:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XHhVX5mw;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: festevam@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-150debe2b7cso16568698fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 10:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RrXedFYXuYj8SkOlQuoSsZeCtWftTn8OF9MfRrDI50w=;
        b=XHhVX5mw++M+aKLcXvLMVH2NOpK8wLKkgNYh5yHcjr9mDJ5AQ0HBGhBoVW3YB6OweD
         ERb90aUQRiCM/r/a1VM8S77EWyEUyxpq4seHe3bNu6FCTJi8dpVQoDPqnIeCMzLCRHmu
         WdNIvsm26p5xvyc3WgunEwqcDHuOO895GKJQGcJrAPMxicFJcvKsBisaqsKa6gaMgJSF
         PobpaiSKvlBCt5r4UTSwMEEZR2DoXr8xmvivCI5fcldCqZ09NvO4zemgGxEy8maF+fWD
         06RaPntNlPlC2qDVoPhd4JkQYZZlTAVXHUBjz1J3jLIyfH3T1sEpHPM01wtbz/HnInol
         4EeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrXedFYXuYj8SkOlQuoSsZeCtWftTn8OF9MfRrDI50w=;
        b=oHEpimaLcnlUUGVX9x5y9LTCaaWZblwJYMg4qxPKaukMGnUnT2wbDY8ipf+zTjY57N
         GRmiO2R5aYnKbzcEDvOrjip6l9roYyXn37W+X9+H5FRE+eS+f7iF2J5BJrtGbmZddaQA
         Lq/CErMuQtQtuaQh0Kmf1s90k9FxCiJ0uDlF06I0nj4kxs6zUGHD6QLizm+Pg8WJxZ5v
         D+GuD0j3TsoMwJXTdJGpw4dHC1Sqvfl0uy4jQW1h0nPrVdu/zr4V0I+puvVqbAp/zGim
         ST1YQ+sI4eNWnBfZF6/DtL7I5ApUUg6ApCq98jt5VS78jPd7X07vxPafIKgn4zlbNh5s
         WdoQ==
X-Gm-Message-State: AFqh2kpqAZ28b1f2/A2ENBQdY8z6xx0eRtfmVoAN+WxeNmcOdXBaj7Bi
	0FIZV3HXLqKusGpFBnTvtBRHVfyCm7c=
X-Google-Smtp-Source: AMrXdXuBFEMOwsdaruzEUaYeS6qjpNjp03Qb2w8L1QbR6uo15hU4HfFBdDG8nIPEF/Pqp4jwruZPnA==
X-Received: by 2002:a05:6871:4084:b0:151:89b:a657 with SMTP id kz4-20020a056871408400b00151089ba657mr2039653oab.19.1673462654618;
        Wed, 11 Jan 2023 10:44:14 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:6c77:e680:86e1:548e])
        by smtp.gmail.com with ESMTPSA id k8-20020a056870d0c800b0015b64f8ff2bsm5028566oaa.52.2023.01.11.10.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 10:44:14 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] u-boot: Upgrade to 2023.01
Date: Wed, 11 Jan 2023 15:44:04 -0300
Message-Id: <20230111184405.1717298-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175770

Upgrade to U-Boot 2023.01.

Remove the two patches that are now upstream:

e67f34f778ba ("riscv: support building double-float modules")
1dde977518f1 ("riscv: Fix build against binutils 2.38")

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Rename u-boot-tools_2022.10.bb to u-boot-tools_2023.01.bb

 ...1-riscv-fix-build-with-binutils-2.38.patch | 40 -----------------
 ...iscv32-Use-double-float-ABI-for-rv32.patch | 44 -------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 ...ols_2022.10.bb => u-boot-tools_2023.01.bb} |  0
 meta/recipes-bsp/u-boot/u-boot_2022.10.bb     |  9 ----
 meta/recipes-bsp/u-boot/u-boot_2023.01.bb     |  4 ++
 6 files changed, 5 insertions(+), 94 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-riscv-fix-build-with-binutils-2.38.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2022.10.bb => u-boot-tools_2023.01.bb} (100%)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2022.10.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2023.01.bb

diff --git a/meta/recipes-bsp/u-boot/files/0001-riscv-fix-build-with-binutils-2.38.patch b/meta/recipes-bsp/u-boot/files/0001-riscv-fix-build-with-binutils-2.38.patch
deleted file mode 100644
index 3598329b99d9..000000000000
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
index 0bf1bef2c99c..000000000000
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
index 60c77cbec4c6..22adad80ff2c 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "4debc57a3da6c3f4d3f89a637e99206f4cea0a96"
+SRCREV = "62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2022.10.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2022.10.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2023.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.10.bb b/meta/recipes-bsp/u-boot/u-boot_2022.10.bb
deleted file mode 100644
index 1ae575790c01..000000000000
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
index 000000000000..2eef1e900eb3
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2023.01.bb
@@ -0,0 +1,4 @@
+require u-boot-common.inc
+require u-boot.inc
+
+DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.25.1


