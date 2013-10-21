Return-Path: <ulf@emagii.com>
Received: from smtprelay-b22.telenor.se (smtprelay-b22.telenor.se
	[195.54.99.213])
	by mail.openembedded.org (Postfix) with ESMTP id A869F6C70D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 09:00:14 +0000 (UTC)
Received: from ipb5.telenor.se (ipb5.telenor.se [195.54.127.168])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 5C54BEBB04
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 11:00:15 +0200 (CEST)
X-SENDER-IP: [83.227.59.84]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Anp7AGXsZFJT4ztUPGdsb2JhbABZgwYBAYhvoieNAYchgScXAwEBAQE4NYMCI09LCi2ICgG9ZY9cHYQTA5gJlS06
X-IronPort-AV: E=Sophos;i="4.93,537,1378850400"; d="scan'208";a="414666673"
Received: from c-543be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	hexagon.bredbandsbolaget.se) ([83.227.59.84])
	by ipb5.telenor.se with ESMTP; 21 Oct 2013 11:00:15 +0200
From: Ulf Samuelsson <ulf@emagii.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 10:59:57 +0200
Message-Id: <1382345997-28170-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH] Add tune for Cortex-A5 chips
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
X-List-Received-Date: Mon, 21 Oct 2013 09:00:14 -0000

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 meta/conf/machine/include/tune-cortexa5.inc |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa5.inc

diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
new file mode 100644
index 0000000..69c945e
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -0,0 +1,24 @@
+DEFAULTTUNE ?= "cortexa5thf"
+# TUNE_FEATURES     = "armv7a vfp callconvention-hard"
+# TARGET_FPU        = "vfp"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa5", "-mtune=cortex-a5", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa5 cortexa5t"
+TUNE_FEATURES_tune-cortexa5 = "${TUNE_FEATURES_tune-armv7a} cortexa5"
+TUNE_FEATURES_tune-cortexa5t = "${TUNE_FEATURES_tune-armv7at} cortexa5"
+
+PACKAGE_EXTRA_ARCHS_tune-cortexa5 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
+
+# VFP Tunes
+AVAILTUNES += "cortexa5hf cortexa5thf"
+TUNE_FEATURES_tune-cortexa5hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa5"
+TUNE_FEATURES_tune-cortexa5thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa5"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
+
-- 
1.7.9.5


