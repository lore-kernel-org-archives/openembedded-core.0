Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5367CD98FA
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 11:20:58 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40380.1781868056696355913
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 04:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=W0IA/4Iz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202606191120536b15d85f2100020799-ktfvwb@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202606191120536b15d85f2100020799
        for <openembedded-core@lists.openembedded.org>;
        Fri, 19 Jun 2026 13:20:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=tZ7dm4Lb2cRRY3ZfPTZkW9O3BGLZKiZqVkdV++V1PAo=;
 b=W0IA/4IzUjz5eSPLNTADhwVTFvO0MfQ5z0qLSSlYFHl44mlFH7Asfla8jdoWA1rdQLIDzA
 SkL03dD0bhwxr3hHrMzVIL1uGi41QuURAhsrkpX7CgLdQwOs/qua/ZvNwN2ULsEKdYxgsOL3
 rSiRYs0GDjW04T3fIuwIWb6FgcdbZUULehPd8FL6Oyez3SuMU/+JuZB7fVqUyYtYqDHAAtC5
 F3uJ5mT7jUHWcDX5XZQCLm/ie1DvwWEN996PBWvtlSDlx3NLMCAfNGRAAxnMqRCywA72ghCR
 9jgBnfpDpnBJA9P1GDTXXT8/J6vtRp3WERNbkomVRquTemQ66T/NzMaw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/6] oe-selftest: fitimage: add machine-agnostic test-dtbs-as-ext recipe
Date: Fri, 19 Jun 2026 13:17:10 +0200
Message-ID: <20260619112046.125876-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260619112046.125876-1-adrian.freihofer@siemens.com>
References: <20260619112046.125876-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 11:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239161

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a minimal, fully standalone device-tree recipe for use by the
fitimage selftests.  The two source files have no kernel-source
dependencies, so the recipe builds on any OE-core machine without
requiring a BSP layer.

test-ext.dts   -- a tiny /dts-v1/ tree with a single aliases node and
                  an oe-selftest,test-ext compatible string.
test-overlay.dts -- a /plugin/ overlay referencing the root node.

COMPATIBLE_MACHINE = ".*" so the recipe is accepted on every target.

A test-ext-alias.dtb symlink is created in both do_install and
do_deploy (mirroring the alias pattern used by the external-DTB
fitimage tests) so that the configuration-node alias code path is
exercised.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-test/ext-dtb/files/test-ext.dts   | 17 +++++++++++++
 .../ext-dtb/files/test-overlay.dts            | 14 +++++++++++
 .../recipes-test/ext-dtb/test-dtbs-as-ext.bb  | 25 +++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 meta-selftest/recipes-test/ext-dtb/files/test-ext.dts
 create mode 100644 meta-selftest/recipes-test/ext-dtb/files/test-overlay.dts
 create mode 100644 meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb

diff --git a/meta-selftest/recipes-test/ext-dtb/files/test-ext.dts b/meta-selftest/recipes-test/ext-dtb/files/test-ext.dts
new file mode 100644
index 0000000000..53f2be0598
--- /dev/null
+++ b/meta-selftest/recipes-test/ext-dtb/files/test-ext.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Minimal standalone device tree for OE selftest external DTB testing.
+ * No kernel source dependencies required.
+ */
+/dts-v1/;
+
+/ {
+	model = "OE Selftest External DTB";
+	compatible = "oe-selftest,test-ext";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	aliases {
+		selftest = "/";
+	};
+};
diff --git a/meta-selftest/recipes-test/ext-dtb/files/test-overlay.dts b/meta-selftest/recipes-test/ext-dtb/files/test-overlay.dts
new file mode 100644
index 0000000000..d9d364ad3f
--- /dev/null
+++ b/meta-selftest/recipes-test/ext-dtb/files/test-overlay.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device tree overlay for OE selftest external DTB overlay testing.
+ * Intentionally self-contained with no kernel source dependencies.
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	oe-selftest-overlay {
+		compatible = "oe-selftest,test-overlay";
+		status = "okay";
+	};
+};
diff --git a/meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb b/meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb
new file mode 100644
index 0000000000..217ca36235
--- /dev/null
+++ b/meta-selftest/recipes-test/ext-dtb/test-dtbs-as-ext.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Standalone Devicetrees for OE selftest"
+DESCRIPTION = "Standalone DTB and DTBO files used for external DTB FIT image testing. \
+Intentionally self-contained with no kernel source dependencies so any OE-core \
+build can run the FIT image selftests without a BSP layer."
+SECTION = "kernel"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit devicetree
+
+COMPATIBLE_MACHINE = ".*"
+
+SRC_URI = "\
+    file://test-ext.dts \
+    file://test-overlay.dts \
+"
+
+# Sym-links are handled as extra configuration nodes in FIT images.
+do_install:append() {
+    ln -sf test-ext.dtb "${D}/boot/devicetree/test-ext-alias.dtb"
+}
+
+do_deploy:append() {
+    ln -sf test-ext.dtb "${DEPLOYDIR}/devicetree/test-ext-alias.dtb"
+}
-- 
2.54.0


