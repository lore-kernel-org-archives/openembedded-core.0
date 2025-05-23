Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9F0C5B547
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:42:29 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.44666.1747993340731260625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=OCJDdQI5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20250523094218c658eff17c4eef2b3e-ez5dat@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250523094218c658eff17c4eef2b3e
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 May 2025 11:42:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+V7L7UrkDSHNHV44YNopac1bfO1tz0SGJAn7/SYOXXg=;
 b=OCJDdQI55o/fFTlfokrkeJJuvL8OWxFDeYBU76MLUs6MtKatTie+VxBdvU7i92oRENsSeC
 vlC8IOT5VHSyIfJmvt/CbFtaZOeUCsxg03s2WkxXvack02/c/ejN+UZkcWUbChzm09X+kJjJ
 DhKCP6/zQvqX3ErgQo0UVyFptk9owcUk1XNGhxcg0tD7UvZxYQAWKRHjkRTx0gFf8ak/GpvD
 bWQEUBXsSHh55kxL1pOdZbzwAswjzBYdh62ZnoVaQ9KqdjGMn2xeO2fLazKQP/90vpvceuW7
 VJtEj0kvg5/+oe0c3w1iDHIKsUiZSI/j/F2Tsn+LXQ+X6yeLjcZ9DIxA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 01/17] oe-selftest: add new ext dtb recipe
Date: Fri, 23 May 2025 11:41:02 +0200
Message-ID: <20250523094152.727177-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250523094152.727177-1-adrian.freihofer@siemens.com>
References: <20250523094152.727177-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217191

From: Adrian Freihofer <adrian.freihofer@siemens.com>

There is no test coverage for the devicetree.bbclass class. Add a
minimalist recipe that uses this class.
This recipe compiles a devicetree overlay that does not include any
sources from the kernel build folder to keep it simple and also usable
for testing a kernel from the sstate-cache.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-test/ext-dtb/bborg-relay-00a2.bb  | 14 ++++++
 .../ext-dtb/files/BBORG_RELAY-00A2.dts        | 49 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta-selftest/recipes-test/ext-dtb/bborg-relay-00a2.bb
 create mode 100644 meta-selftest/recipes-test/ext-dtb/files/BBORG_RELAY-00A2.dts

diff --git a/meta-selftest/recipes-test/ext-dtb/bborg-relay-00a2.bb b/meta-selftest/recipes-test/ext-dtb/bborg-relay-00a2.bb
new file mode 100644
index 00000000000..dcd32320ada
--- /dev/null
+++ b/meta-selftest/recipes-test/ext-dtb/bborg-relay-00a2.bb
@@ -0,0 +1,14 @@
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6 "
+
+# Borrowed an example dts file from
+# https://raw.githubusercontent.com/beagleboard/linux/refs/heads/5.10/arch/arm/boot/dts/overlays/BBORG_RELAY-00A2.dts
+SRC_URI = "file://BBORG_RELAY-00A2.dts"
+
+# No need for compiling the kernel. The trivial dts file does not include something.
+KERNEL_INCLUDE = ""
+
+COMPATIBLE_MACHINE = "^beaglebone-yocto$"
+
+inherit devicetree
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
-- 
2.49.0


