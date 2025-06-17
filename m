Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C962C77B73
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 23:39:57 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.34211.1750203587725137647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 16:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55HNdjaT026548
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 18:39:47 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 6/7] kernel.bbclass: State riscv required tune_features for Linux
Date: Tue, 17 Jun 2025 18:39:43 -0500
Message-Id: <1750203584-32065-7-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 23:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218952

From: Mark Hatle <mark.hatle@amd.com>

Required:
   rv32ima_zicsr_zifencei
   rv64ima_zicsr_zifencei

See the arch/riscv/Makefile:

riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) := $(riscv-march-y)_zicsr_zifencei

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/classes-recipe/kernel.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 2d9943c8a0..eb03424dfc 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -4,10 +4,14 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit linux-kernel-base kernel-module-split
+inherit linux-kernel-base kernel-module-split features_check
 
 COMPATIBLE_HOST = ".*-linux"
 
+# Linux has a minimum ISA requires on riscv, see arch/riscv/Makefile
+REQUIRED_TUNE_FEATURES:riscv32 = "rv 32 i m a zicsr zifencei"
+REQUIRED_TUNE_FEATURES:riscv64 = "rv 64 i m a zicsr zifencei"
+
 KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
-- 
2.34.1


