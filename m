Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04970C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 23:39:57 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.34210.1750203587291330673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 16:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55HNdjaP026548
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 18:39:46 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/7] linux-yocto: Enable risc-v TUNE_FEATURES ISA selections ** DO NOT MERGE **
Date: Tue, 17 Jun 2025 18:39:39 -0500
Message-Id: <1750203584-32065-3-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 23:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218947

From: Mark Hatle <mark.hatle@amd.com>

*** THIS NEEDS TO BE RE-IMPLEMENTED AS KERNEL-CACHE/KMETA ***

Allow the risc-v TUNE_FEATURES to select specific ISA (kconfig) selections
in the kernel config via config fragments.

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

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/recipes-kernel/linux/files/risc-v-isa-c.cfg   |  1 +
 .../linux/files/risc-v-isa-clear.cfg               |  9 +++++++++
 meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg |  1 +
 .../linux/files/risc-v-isa-rv32i.cfg               |  2 ++
 .../linux/files/risc-v-isa-rv64i.cfg               |  2 ++
 meta/recipes-kernel/linux/files/risc-v-isa-v.cfg   |  1 +
 meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg |  1 +
 .../linux/files/risc-v-isa-zicbom.cfg              |  1 +
 meta/recipes-kernel/linux/linux-yocto.inc          | 14 ++++++++++++++
 9 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-c.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-clear.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-rv32i.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-rv64i.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-v.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg
 create mode 100644 meta/recipes-kernel/linux/files/risc-v-isa-zicbom.cfg

diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-c.cfg b/meta/recipes-kernel/linux/files/risc-v-isa-c.cfg
new file mode 100644
index 0000000000..1cb459f636
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-c.cfg
@@ -0,0 +1 @@
+CONFIG_RISCV_ISA_C=y
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-clear.cfg b/meta/recipes-kernel/linux/files/risc-v-isa-clear.cfg
new file mode 100644
index 0000000000..ba18d7b9b5
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-clear.cfg
@@ -0,0 +1,9 @@
+# CONFIG_ARCH_RV32I is not set
+# CONFIG_ARCH_RV64I is not set
+# CONFIG_FPU is not set
+# CONFIG_RISCV_ISA_C is not set
+# CONFIG_RISCV_ISA_V is not set
+# CONFIG_RISCV_ISA_ZBB is not set
+# CONFIG_RISCV_ISA_ZICBOM is not set
+# CONFIG_RISCV_ISA_ZICBOZ is not set
+# CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI is not set
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg b/meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg
new file mode 100644
index 0000000000..c099c8e81d
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-fpu.cfg
@@ -0,0 +1 @@
+CONFIG_FPU=y
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-rv32i.cfg b/meta/recipes-kernel/linux/files/risc-v-isa-rv32i.cfg
new file mode 100644
index 0000000000..4c6bac5138
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-rv32i.cfg
@@ -0,0 +1,2 @@
+CONFIG_ARCH_RV32I=y
+CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI=y
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-rv64i.cfg b/meta/recipes-kernel/linux/files/risc-v-isa-rv64i.cfg
new file mode 100644
index 0000000000..002b492e4c
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-rv64i.cfg
@@ -0,0 +1,2 @@
+CONFIG_ARCH_RV64I=y
+CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI=y
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-v.cfg b/meta/recipes-kernel/linux/files/risc-v-isa-v.cfg
new file mode 100644
index 0000000000..c29c97fc4a
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-v.cfg
@@ -0,0 +1 @@
+CONFIG_RISCV_ISA_V=y
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg b/meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg
new file mode 100644
index 0000000000..2b71b016f8
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-zbb.cfg
@@ -0,0 +1 @@
+CONFIG_RISCV_ISA_ZBB=y
diff --git a/meta/recipes-kernel/linux/files/risc-v-isa-zicbom.cfg b/meta/recipes-kernel/linux/files/risc-v-isa-zicbom.cfg
new file mode 100644
index 0000000000..96daf04b20
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/risc-v-isa-zicbom.cfg
@@ -0,0 +1 @@
+CONFIG_RISCV_ISA_ZICBOM=y
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 389329030d..cdf2583698 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -37,6 +37,20 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
 
+SRC_URI_RISCV = "\
+    file://risc-v-isa-clear.cfg \
+    ${@bb.utils.contains(    "TUNE_FEATURES", "rv 32 i m a", "file://risc-v-isa-rv32i.cfg", "", d)} \
+    ${@bb.utils.contains(    "TUNE_FEATURES", "rv 64 i m a", "file://risc-v-isa-rv64i.cfg", "", d)} \
+    ${@bb.utils.contains(    "TUNE_FEATURES", "f d",         "file://risc-v-isa-fpu.cfg",   "", d)} \
+    ${@bb.utils.contains(    "TUNE_FEATURES", "c",           "file://risc-v-isa-c.cfg",     "", d)} \
+    ${@bb.utils.contains(    "TUNE_FEATURES", "v",           "file://risc-v-isa-v.cfg",     "", d)} \
+    ${@bb.utils.contains_any("TUNE_FEATURES", "b zbb",       "file://risc-v-isa-zbb.cfg",   "", d)} \
+    ${@bb.utils.contains(    "TUNE_FEATURES", "zicbom",      "file://risc-v-isa-zicbom.cfg",   "", d)} \
+    "
+
+SRC_URI:append:riscv32 = "${SRC_URI_RISCV}"
+SRC_URI:append:riscv64 = "${SRC_URI_RISCV}"
+
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
 # and it can be specific to the machine or shared
-- 
2.34.1


