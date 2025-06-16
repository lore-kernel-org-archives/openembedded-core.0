Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEDAC71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 02:29:30 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.21723.1750040968342209186
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 19:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55G2TQ6C027430
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 21:29:27 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto.inc: State riscv required tune_features
Date: Sun, 15 Jun 2025 21:29:25 -0500
Message-Id: <1750040965-15015-7-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218760

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
 meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index cdf2583698..80db85fe89 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -51,6 +51,11 @@ SRC_URI_RISCV = "\
 SRC_URI:append:riscv32 = "${SRC_URI_RISCV}"
 SRC_URI:append:riscv64 = "${SRC_URI_RISCV}"
 
+inherit features_check
+
+REQUIRED_TUNE_FEATURES:riscv32 = "rv 32 i m a zicsr zifencei"
+REQUIRED_TUNE_FEATURES:riscv64 = "rv 64 i m a zicsr zifencei"
+
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
 # and it can be specific to the machine or shared
-- 
2.34.1


