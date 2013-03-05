Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1UCjVT-00006q-WF
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 05:29:49 +0100
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJ6005UW3LD1TX2@vms173001.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 21:12:55 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 516DC2001F; Mon,
	04 Mar 2013 22:12:49 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 04 Mar 2013 22:12:33 -0500
Message-id: <1362453154-3207-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/2] tune-cortexa15: add tunes for ARM Cortex-A15
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 04:29:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

http://www.arm.com/products/processors/cortex-a/cortex-a15.php

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/conf/machine/include/tune-cortexa15.inc | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa15.inc

diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
new file mode 100644
index 0000000..a9a8d0d
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -0,0 +1,36 @@
+DEFAULTTUNE ?= "armv7a-neon"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", "-mtune=cortex-a15", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
+ARMPKGARCH_tune-cortexa15 = "cortexa15"
+ARMPKGARCH_tune-cortexa15t = "cortexa15"
+ARMPKGARCH_tune-cortexa15-neon = "cortexa15"
+ARMPKGARCH_tune-cortexa15t-neon = "cortexa15"
+TUNE_FEATURES_tune-cortexa15 = "${TUNE_FEATURES_tune-armv7a} cortexa15"
+TUNE_FEATURES_tune-cortexa15t = "${TUNE_FEATURES_tune-armv7at} cortexa15"
+TUNE_FEATURES_tune-cortexa15-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa15-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa15-vfp cortexa15-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
+
+# VFP Tunes
+AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon"
+ARMPKGARCH_tune-cortexa15hf = "cortexa15"
+ARMPKGARCH_tune-cortexa15thf = "cortexa15"
+ARMPKGARCH_tune-cortexa15hf-neon = "cortexa15"
+ARMPKGARCH_tune-cortexa15thf-neon = "cortexa15"
+TUNE_FEATURES_tune-cortexa15hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa15"
+TUNE_FEATURES_tune-cortexa15thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15thf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa15hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2-vfp cortexa15t2hf-vfp-neon"
-- 
1.8.1.5



