Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.20])
	by mail.openembedded.org (Postfix) with ESMTP id BECCC60745
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 12:10:54 +0000 (UTC)
Received: from localhost.localdomain (111-250-155-21.dynamic.hinet.net
	[111.250.155.21])
	by msfrf2629.sfr.fr (SMTP Server) with ESMTP id 21AC31C000425;
	Sun, 20 Nov 2016 13:10:56 +0100 (CET)
Received: from localhost.localdomain (111-250-155-21.dynamic.hinet.net
	[111.250.155.21])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2629.sfr.fr (SMTP Server) with ESMTPSA;
	Sun, 20 Nov 2016 13:10:54 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Nov 2016 20:10:23 +0800
Message-Id: <1479643823-11675-4-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479643823-11675-1-git-send-email-herve.jourdain@neuf.fr>
References: <1479643823-11675-1-git-send-email-herve.jourdain@neuf.fr>
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [PATCH v3 3/3] Add a tune file for cortexa53, valid for 32 bits and 64 bits
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
X-List-Received-Date: Sun, 20 Nov 2016 12:10:55 -0000

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
---
 meta/conf/machine/include/tune-cortexa53.inc | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa53.inc

diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
new file mode 100644
index 0000000..1d2947f
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -0,0 +1,43 @@
+DEFAULTTUNE ?= "cortexa53-32"
+
+require conf/machine/include/arm/arch-armv8.inc
+
+TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53 ', '',d)}"
+
+# Extra tune selections
+AVAILTUNES += "cortexa53-32"
+ARMPKGARCH_tune-cortexa53-32 ?= "cortexa53"
+TUNE_FEATURES_tune-cortexa53-32 = "${TUNE_FEATURES_tune-armv8-neon-crc} cortexa53"
+BASE_LIB_tune-cortexa53-32 = "lib"
+TUNE_PKGARCH_tune-cortexa53-32 = "cortexa53-32"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53-32 = "${PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crc} cortexa53-32 cortexa53-neon-fp-armv8"
+
+AVAILTUNES += "cortexa53crypto-32"
+ARMPKGARCH_tune-cortexa53crypto-32 ?= "cortexa53"
+TUNE_FEATURES_tune-cortexa53crypto-32 = "${TUNE_FEATURES_tune-armv8-neon-crypto-crc} cortexa53"
+BASE_LIB_tune-cortexa53crypto-32 = "lib"
+TUNE_PKGARCH_tune-cortexa53crypto-32 = "cortexa53crypto-32"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53crypto-32 = "${PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crypto-crc} cortexa53-32 cortexa53-crypto-neon-fp-armv8"
+
+AVAILTUNES += "cortexa53hf-32"
+ARMPKGARCH_tune-cortexa53hf-32 ?= "cortexa53"
+TUNE_FEATURES_tune-cortexa53hf-32 = "${TUNE_FEATURES_tune-armv8hf-neon-crc} cortexa53"
+BASE_LIB_tune-cortexa53hf-32 = "lib"
+TUNE_PKGARCH_tune-cortexa53hf-32 = "cortexa53hf-32"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53hf-32 = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crc} cortexa53hf-32 cortexa53hf-neon-fp-armv8"
+
+AVAILTUNES += "cortexa53hfcrypto-32"
+ARMPKGARCH_tune-cortexa53hfcrypto-32 ?= "cortexa53"
+TUNE_FEATURES_tune-cortexa53hfcrypto-32 = "${TUNE_FEATURES_tune-armv8hf-neon-crypto-crc} cortexa53"
+BASE_LIB_tune-cortexa53hfcrypto-32 = "lib"
+TUNE_PKGARCH_tune-cortexa53hfcrypto-32 = "cortexa53hfcrypto-32"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53hfcrypto-32 = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crypto-crc} cortexa53hf-32 cortexa53hf-crypto-neon-fp-armv8"
+
+AVAILTUNES += "cortexa53-64"
+ARMPKGARCH_tune-cortexa53-64 ?= "cortexa53"
+TUNE_FEATURES_tune-cortexa53-64 = "${TUNE_FEATURES_tune-aarch64} cortexa53"
+BASE_LIB_tune-cortexa53-64 = "lib64"
+TUNE_PKGARCH_tune-cortexa53-64 = "cortexa53-64"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53-64 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa53-64"
+
-- 
2.7.4


