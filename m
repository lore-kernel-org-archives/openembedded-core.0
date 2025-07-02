Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B86FC83F0B
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 21:44:31 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.8318.1751492667376789178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 14:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 562LiP2w015441
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 16:44:26 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 5/6] linux-yocto/6.12: riscv: Enable TUNE_FEATURES based KERNEL_FEATURES
Date: Wed,  2 Jul 2025 16:44:23 -0500
Message-Id: <1751492664-12569-6-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 21:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219856

From: Mark Hatle <mark.hatle@amd.com>

Allow the risc-v TUNE_FEATURES to select specific ISA (kconfig) selections
in the kernel config via config fragments selected by KERNEL_FEATURES.

This allows the following items to be selected dynamically:

    CONFIG_ARCH_RV32I
    CONFIG_ARCH_RV64I
    CONFIG_FPU
    CONFIG_RISCV_ISA_C
    CONFIG_RISCV_ISA_V
    CONFIG_RISCV_ISA_ZBB
    CONFIG_RISCV_ISA_ZICBOM
    CONFIG_RISCV_ISA_ZICBOZ
    CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI

Note: Some ISA options, such as CONFIG_RISCV_ISA_C may be reenabled by other
options such as CONFIG_EFI.  This is properly reported by the configuration
tooling.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 389329030d..4d0a726bb6 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -37,6 +37,22 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
 
+KERNEL_FEATURES_RISCV = "\
+    arch/riscv/tunes/riscv-isa-clear.scc \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a', 'arch/riscv/tunes/riscv-isa-rv32i.scc',  '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a', 'arch/riscv/tunes/riscv-isa-rv64i.scc',  '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',         'arch/riscv/tunes/riscv-isa-fpu.scc',    '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',           'arch/riscv/tunes/riscv-isa-c.scc',      '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',           'arch/riscv/tunes/riscv-isa-v.scc',      '', d)} \
+    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',       'arch/riscv/tunes/riscv-isa-zba.scc',    '', d)} \
+    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',       'arch/riscv/tunes/riscv-isa-zbb.scc',    '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',         'arch/riscv/tunes/riscv-isa-zbc.scc',    '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',      'arch/riscv/tunes/riscv-isa-zicbom.scc', '', d)} \
+    "
+
+KERNEL_FEATURES:append:riscv32 = " ${KERNEL_FEATURES_RISCV}"
+KERNEL_FEATURES:append:riscv64 = " ${KERNEL_FEATURES_RISCV}"
+
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
 # and it can be specific to the machine or shared
-- 
2.34.1


