Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5107C5B552
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 07:57:33 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.44070.1748851049099604008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 00:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=bAMm0Gkd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20250602075726190d5f81b08726549a-vpzkux@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250602075726190d5f81b08726549a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 02 Jun 2025 09:57:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6uipLiSdQytNZKiaIQpj+8GCBd6rtOcO3Rsn9NbwQ4k=;
 b=bAMm0GkdaXHekJl8N6e7VuNsSlrzgpgR5ZAveJqJb8lt+NaKhx3WVeXFvfTxTHhgExMITT
 Gchj8infGs9WmXNUvvbOG+PPCTc7Gn6To2M9KKlC/KotgldXOdmEafCzLnuES4kup6ZlbN8X
 Z2JRGu0SMAefwudGyWIwHUMgCe5JSgoXgyyNXeqN2GZQd1/CiAM7CkwaMlSiQbeHV/pGGwHZ
 vWmpf7XeuvfD6Leq1jivlRcsjeJxuVeLvcnDdMcrIwAQjgKA9Nv0GAsVN9x0F0bTJcR2+v2D
 AI+iFi+ygLljltBczvQ2BZ5RBGmzxfSAb+ZlDGotYjqJg7mNCH0jsofw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v6 02/21] oe-selftest: add new ext dtb recipe
Date: Mon,  2 Jun 2025 09:56:12 +0200
Message-ID: <20250602075714.32122-3-adrian.freihofer@siemens.com>
In-Reply-To: <20250602075714.32122-1-adrian.freihofer@siemens.com>
References: <20250602075714.32122-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 07:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217688

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


