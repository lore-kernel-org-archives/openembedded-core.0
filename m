Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965FBC7115D
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 02:29:30 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.21721.1750040967880267271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 19:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55G2TQ69027430
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 21:29:27 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] u-boot: Dynamic RISC-V ISA configuration
Date: Sun, 15 Jun 2025 21:29:22 -0500
Message-Id: <1750040965-15015-4-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218757

From: Mark Hatle <mark.hatle@amd.com>

Allow the risc-v TUNE_FEATURES to select specific ISA (kconfig) selections
via config fragments.

This allows the following items to be selected dynamically:

    CONFIG_RISCV_ISA_C
    CONFIG_RISCV_ISA_F
    CONFIG_RISCV_ISA_D
    CONFIG_RISCV_ISA_ZBB
    CONFIG_RISCV_ISA_A
    CONFIG_RISCV_ISA_ZICBOM

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_a.cfg |  1 +
 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_c.cfg |  1 +
 .../u-boot/files/u-boot-riscv-isa_clear.cfg          |  6 ++++++
 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_d.cfg |  1 +
 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_f.cfg |  1 +
 .../u-boot/files/u-boot-riscv-isa_zbb.cfg            |  1 +
 .../u-boot/files/u-boot-riscv-isa_zicbom.cfg         |  1 +
 meta/recipes-bsp/u-boot/u-boot-common.inc            | 12 ++++++++++++
 8 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_a.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_c.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_clear.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_d.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_f.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zbb.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zicbom.cfg

diff --git a/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_a.cfg b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_a.cfg
new file mode 100644
index 0000000000..fc45b64480
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_a.cfg
@@ -0,0 +1 @@
+CONFIG_RISCV_ISA_A=y
diff --git a/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_c.cfg b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_c.cfg
new file mode 100644
index 0000000000..1cb459f636
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_c.cfg
@@ -0,0 +1 @@
+CONFIG_RISCV_ISA_C=y
diff --git a/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_clear.cfg b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_clear.cfg
new file mode 100644
index 0000000000..ce90da23ce
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_clear.cfg
@@ -0,0 +1,6 @@
+# CONFIG_RISCV_ISA_C is not set
+# CONFIG_RISCV_ISA_F is not set
+# CONFIG_RISCV_ISA_D is not set
+# CONFIG_RISCV_ISA_ZBB is not set
+# CONFIG_RISCV_ISA_A is not set
+# CONFIG_RISCV_ISA_ZICBOM is not set
diff --git a/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_d.cfg b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_d.cfg
new file mode 100644
index 0000000000..fd25fa4e89
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_d.cfg
@@ -0,0 +1 @@
+CONFIG_RISCV_ISA_D=y
diff --git a/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_f.cfg b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_f.cfg
new file mode 100644
index 0000000000..dfa9876f82
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_f.cfg
@@ -0,0 +1 @@
+CONFIG_RISCV_ISA_F=y
diff --git a/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zbb.cfg b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zbb.cfg
new file mode 100644
index 0000000000..2b71b016f8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zbb.cfg
@@ -0,0 +1 @@
+CONFIG_RISCV_ISA_ZBB=y
diff --git a/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zicbom.cfg b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zicbom.cfg
new file mode 100644
index 0000000000..96daf04b20
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/u-boot-riscv-isa_zicbom.cfg
@@ -0,0 +1 @@
+CONFIG_RISCV_ISA_ZICBOM=y
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index fd1eab5cdd..515f18ba9c 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,6 +16,18 @@ SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
+SRC_URI_RISCV = "\
+    file://u-boot-riscv-isa_clear.cfg \
+    ${@bb.utils.contains    ("TUNE_FEATURES", "a",      "file://u-boot-riscv-isa_a.cfg", "", d)} \
+    ${@bb.utils.contains    ("TUNE_FEATURES", "f",      "file://u-boot-riscv-isa_f.cfg", "", d)} \
+    ${@bb.utils.contains    ("TUNE_FEATURES", "d",      "file://u-boot-riscv-isa_d.cfg", "", d)} \
+    ${@bb.utils.contains_any("TUNE_FEATURES", "b zbb",  "file://u-boot-riscv-isa_zbb.cfg", "", d)} \
+    ${@bb.utils.contains    ("TUNE_FEATURES", "zicbom", "file://u-boot-riscv-isa_zicbom.cfg", "", d)} \
+    "
+
+SRC_URI:append:riscv32 = "${SRC_URI_RISCV}"
+SRC_URI:append:riscv64 = "${SRC_URI_RISCV}"
+
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
-- 
2.34.1


