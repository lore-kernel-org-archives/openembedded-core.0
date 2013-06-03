Return-Path: <andy.voltz@timesys.com>
Received: from exchange07.timesys.com (exchange07.timesys.com
	[209.114.137.116])
	by mail.openembedded.org (Postfix) with ESMTP id C3302601AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 16:40:12 +0000 (UTC)
Received: from bob-linux.timesys.com (192.168.3.27) by exchange07.timesys.com
	(192.168.1.221) with Microsoft SMTP Server id 8.1.436.0;
	Mon, 3 Jun 2013 12:40:12 -0400
From: Andy Voltz <andy.voltz@timesys.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Jun 2013 12:40:17 -0400
Message-ID: <1370277617-26698-1-git-send-email-andy.voltz@timesys.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Andy Voltz <andy.voltz@timesys.com>
Subject: [PATCH] tune-cortexa5.inc: add tune file for cortex-a5, based on a7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jun 2013 16:40:13 -0000
Content-Type: text/plain

Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
---
 meta/conf/machine/include/tune-cortexa5.inc |   36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa5.inc

diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
new file mode 100644
index 0000000..139e65c
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -0,0 +1,36 @@
+DEFAULTTUNE ?= "armv7a-neon"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa5", " -mtune=cortex-a5", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
+ARMPKGARCH_tune-cortexa5 = "cortexa5"
+ARMPKGARCH_tune-cortexa5t = "cortexa5"
+ARMPKGARCH_tune-cortexa5-neon = "cortexa5"
+ARMPKGARCH_tune-cortexa5t-neon = "cortexa5"
+TUNE_FEATURES_tune-cortexa5 = "${TUNE_FEATURES_tune-armv7a} cortexa5"
+TUNE_FEATURES_tune-cortexa5t = "${TUNE_FEATURES_tune-armv7at} cortexa5"
+TUNE_FEATURES_tune-cortexa5-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa5"
+TUNE_FEATURES_tune-cortexa5t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa5"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa5-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa5-vfp cortexa5-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-vfp-neon cortexa5t2-vfp cortexa5t2-vfp-neon"
+
+# VFP Tunes
+AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon"
+ARMPKGARCH_tune-cortexa5hf = "cortexa5"
+ARMPKGARCH_tune-cortexa5thf = "cortexa5"
+ARMPKGARCH_tune-cortexa5hf-neon = "cortexa5"
+ARMPKGARCH_tune-cortexa5thf-neon = "cortexa5"
+TUNE_FEATURES_tune-cortexa5hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa5"
+TUNE_FEATURES_tune-cortexa5thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa5"
+TUNE_FEATURES_tune-cortexa5hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa5"
+TUNE_FEATURES_tune-cortexa5thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa5"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa5hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5t2hf-vfp cortexa5t2hf-vfp-neon"
-- 
1.7.9.5


