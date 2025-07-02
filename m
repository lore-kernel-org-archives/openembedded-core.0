Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE49C83F04
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 21:44:31 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.8361.1751492667147071152
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 14:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 562LiP2u015441
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 16:44:26 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/6] kernel.bbclass: State riscv required tune_features for Linux
Date: Wed,  2 Jul 2025 16:44:21 -0500
Message-Id: <1751492664-12569-4-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 21:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219853

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


