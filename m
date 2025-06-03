Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47694C71132
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:24:36 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.6266.1748939069319010803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Z1mXnL7a;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-2025060308242701d222c798a771186b-tkwvbs@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2025060308242701d222c798a771186b
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Jun 2025 10:24:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6uipLiSdQytNZKiaIQpj+8GCBd6rtOcO3Rsn9NbwQ4k=;
 b=Z1mXnL7aUQs7yK7swx2m8AXRCMvxz/QFlk9D2Ooxhakvobas3ZNV07SbzzCUJ5sQtRjeCq
 S2e09Otj2/B/P32sqG4Wub5df8GfqQRNcIavqzlg+kerFBgYi5f2dHkS+LfeosL0xEH3Y8bn
 ocfIDAEl3fdYNvnXXaOsOtC/dYS8qnn5O9AO0koCsYoYIWYJjMcoj9DlsSOtCcpRHM2Wu/Hf
 weLnIiDt54NCInuIW9rKytNRQq9C7Ns758v16shvaZnP4IKhSLRVcaozdqq9zGYzKKMbgkpw
 1KNgiFLfXewPTWslZZu2rJ4u4zUDjEmaEIdBcOCt4ispR7PSO6fas62A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 02/20] oe-selftest: add new ext dtb recipe
Date: Tue,  3 Jun 2025 10:23:13 +0200
Message-ID: <20250603082419.409564-3-adrian.freihofer@siemens.com>
In-Reply-To: <20250603082419.409564-1-adrian.freihofer@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 08:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217764

From: Adrian Freihofer <adrian.freihofer@siemens.com>

There is no test coverage for the devicetree.bbclass class. Add a
minimalist recipe that uses this class.
This recipe compiles a devicetree overlay that does not include any
sources from the kernel build folder to keep it simple and also usable
for testing a kernel from the sstate-cache.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-test/ext-dtb/bbb-dtbs-as-ext.bb   | 29 +++++++++++
 .../ext-dtb/files/BBORG_RELAY-00A2.dts        | 49 +++++++++++++++++++
 .../ext-dtb/files/am335x-bonegreen-ext.dts    | 14 ++++++
 3 files changed, 92 insertions(+)
 create mode 100644 meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb
 create mode 100644 meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
 create mode 100644 meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts

diff --git a/meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb b/meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb
new file mode 100644
index 00000000000..5055d03e54a
--- /dev/null
+++ b/meta-selftest/recipes-test/ext-dtb/bbb-dtbs-as-ext.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Boeaglebone Devicetrees"
+DESCRIPTION = "Handle the dtc files of the beaglebone-yocto via devicetree.bbclass just for testing purpose"
+SECTION = "kernel"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit devicetree
+
+COMPATIBLE_MACHINE  = "^(beaglebone-yocto)$"
+
+# Take a copy of a small devicetree from the kernel's source directory for handling it externally
+# Borrowed an example DTB overlay from
+# https://raw.githubusercontent.com/beagleboard/linux/refs/heads/5.10/arch/arm/boot/dts/overlays/BBORG_RELAY-00A2.dts
+SRC_URI = "\
+    file://am335x-bonegreen-ext.dts \
+    file://BBORG_RELAY-00A2.dts \
+"
+
+# The am335x-bonegreen-ext.dts needs also the ti directories
+DT_INCLUDE:append = " ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/ti/omap"
+
+# Sym-links are handled as extra configuration nodes in FIT images.
+do_install:append() {
+    ln -sf am335x-bonegreen-ext.dtb "${D}/boot/devicetree/am335x-bonegreen-ext-alias.dtb"
+}
+
+do_deploy:append() {
+    ln -sf am335x-bonegreen-ext.dtb "${DEPLOYDIR}/devicetree/am335x-bonegreen-ext-alias.dtb"
+}
diff --git a/meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts b/meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
new file mode 100644
index 00000000000..9530fa50fe5
--- /dev/null
+++ b/meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2015 Robert Nelson <robertcnelson@gmail.com>
+ * Copyright (C) 2019 Amilcar Lucas <amilcar.lucas@iav.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/chosen} {
+	overlays {
+		BBORG_RELAY-00A2.kernel = __TIMESTAMP__;
+	};
+};
+
+&ocp {
+	P9_41_pinmux { pinctrl-0 = <&P9_41_gpio_pin>;};
+	P9_42_pinmux { pinctrl-0 = <&P9_42_gpio_pin>;};
+	P9_30_pinmux { pinctrl-0 = <&P9_30_gpio_pin>;};
+	P9_27_pinmux { pinctrl-0 = <&P9_27_gpio_pin>;};
+};
+
+// relay1
+&bone_led_P9_41 {
+	status = "okay";
+	label = "relay1";
+	default-state = "keep";
+};
+
+// relay2
+&bone_led_P9_42 {
+	status = "okay";
+	label = "relay2";
+	default-state = "keep";
+};
+
+// realy3
+&bone_led_P9_30 {
+	status = "okay";
+	label = "relay3";
+	default-state = "keep";
+};
+
+// realy4
+&bone_led_P9_27 {
+	status = "okay";
+	label = "relay4";
+	default-state = "keep";
+};
diff --git a/meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts b/meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts
new file mode 100644
index 00000000000..a0b39337a9a
--- /dev/null
+++ b/meta-selftest/recipes-test/ext-dtb/files/am335x-bonegreen-ext.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
+ */
+/dts-v1/;
+
+#include "am33xx.dtsi"
+#include "am335x-bone-common.dtsi"
+#include "am335x-bonegreen-common.dtsi"
+
+/ {
+	model = "TI AM335x BeagleBone Green External";
+	compatible = "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
+};
-- 
2.49.0


