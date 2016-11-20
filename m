Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.20])
	by mail.openembedded.org (Postfix) with ESMTP id 86ACA60745
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 12:10:51 +0000 (UTC)
Received: from localhost.localdomain (111-250-155-21.dynamic.hinet.net
	[111.250.155.21])
	by msfrf2629.sfr.fr (SMTP Server) with ESMTP id DCC281C000425;
	Sun, 20 Nov 2016 13:10:52 +0100 (CET)
Received: from localhost.localdomain (111-250-155-21.dynamic.hinet.net
	[111.250.155.21])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2629.sfr.fr (SMTP Server) with ESMTPSA;
	Sun, 20 Nov 2016 13:10:51 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Nov 2016 20:10:22 +0800
Message-Id: <1479643823-11675-3-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479643823-11675-1-git-send-email-herve.jourdain@neuf.fr>
References: <1479643823-11675-1-git-send-email-herve.jourdain@neuf.fr>
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [PATCH v3 2/3] arch-armv8.inc: add support for 32bits armv8 options
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
X-List-Received-Date: Sun, 20 Nov 2016 12:10:51 -0000

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
---
 meta/conf/machine/include/arm/arch-armv8.inc | 60 ++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
index 5e832fa..8c96efc 100644
--- a/meta/conf/machine/include/arm/arch-armv8.inc
+++ b/meta/conf/machine/include/arm/arch-armv8.inc
@@ -1 +1,61 @@
 require conf/machine/include/arm/arch-arm64.inc
+
+TUNEVALID[armv8] = "Enable instructions for ARMv8"
+TUNECONFLICTS[armv8] = "armv4 armv5 armv6 armv7 armv7a armv7ve"
+
+TUNE_CCARGS .= \
+"${@' -march=armv8-a+crypto+crc' if bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'cryptov8', 'crcv8' ], True, False, d) else\
+' -march=armv8-a+crypto' if bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'cryptov8' ], True, False, d) else\
+' -march=armv8-a+crc' if bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'crcv8' ], True, False, d) else \
+bb.utils.contains('TUNE_FEATURES', 'armv8', ' -march=armv8-a', '', d)}"
+
+TUNE_CCARGS_MFPU .= \
+"${@' crypto-neon-fp-armv8' if bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'neon', 'cryptov8' ], True, False, d) else \
+' neon-fp-armv8' if bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'neon' ], True, False, d) else \
+bb.utils.contains('TUNE_FEATURES', [ 'armv8' ], ' fp-armv8', '', d)}"
+
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8', 'armv8:', '' ,d)}"
+
+AVAILTUNES += "armv8 armv8-crypto armv8-crc armv8-crypto-crc"
+TUNE_FEATURES_tune-armv8 = "armv8"
+TUNE_FEATURES_tune-armv8-crypto = "${TUNE_FEATURES_tune-armv8} cryptov8"
+TUNE_FEATURES_tune-armv8-crc = "${TUNE_FEATURES_tune-armv8} crcv8"
+TUNE_FEATURES_tune-armv8-crypto-crc = "${TUNE_FEATURES_tune-armv8} cryptov8 crcv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8 = "armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8} armv8-crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8} armv8-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8-crypto-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8} armv8-crypto-crc"
+
+AVAILTUNES += "armv8-neon armv8-neon-crypto armv8-neon-crc armv8-neon-crypto-crc"
+TUNE_FEATURES_tune-armv8-neon = "${TUNE_FEATURES_tune-armv8} neon"
+TUNE_FEATURES_tune-armv8-neon-crypto = "${TUNE_FEATURES_tune-armv8-crypto} neon"
+TUNE_FEATURES_tune-armv8-neon-crc = "${TUNE_FEATURES_tune-armv8-crc} neon"
+TUNE_FEATURES_tune-armv8-neon-crypto-crc = "${TUNE_FEATURES_tune-armv8-crypto-crc} neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8} armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-crypto} armv8-neon-crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8-crc} armv8-neon-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crypto-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8-crypto-crc} armv8-neon-crypto-crc"
+
+AVAILTUNES += "armv8hf armv8hf-crypto armv8hf-crc armv8hf-crypto-crc"
+TUNE_FEATURES_tune-armv8hf = "${TUNE_FEATURES_tune-armv8} callconvention-hard"
+TUNE_FEATURES_tune-armv8hf-crypto = "${TUNE_FEATURES_tune-armv8-crypto} callconvention-hard"
+TUNE_FEATURES_tune-armv8hf-crc = "${TUNE_FEATURES_tune-armv8-crc} callconvention-hard"
+TUNE_FEATURES_tune-armv8hf-crypto-crc = "${TUNE_FEATURES_tune-armv8-crypto-crc} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv8hf = "armv8hf"
+PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf} armv8hf-crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8hf-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf} armv8hf-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf} armv8hf-crypto-crc"
+
+AVAILTUNES += "armv8hf-neon armv8hf-neon-crypto armv8hf-neon-crc armv8hf-neon-crypto-crc"
+TUNE_FEATURES_tune-armv8hf-neon = "${TUNE_FEATURES_tune-armv8hf} neon"
+TUNE_FEATURES_tune-armv8hf-neon-crypto = "${TUNE_FEATURES_tune-armv8hf-crypto} neon"
+TUNE_FEATURES_tune-armv8hf-neon-crc = "${TUNE_FEATURES_tune-armv8hf-crc} neon"
+TUNE_FEATURES_tune-armv8hf-neon-crypto-crc = "${TUNE_FEATURES_tune-armv8hf-crypto-crc} neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf} armv8hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto} armv8hf-neon-crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf-crc} armv8hf-neon-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crypto-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto-crc} armv8hf-neon-crypto-crc"
+
+TUNEVALID[cryptov8] = "Enable armv8 crypto extensions"
+TUNEVALID[crcv8] = "Enable armv8 crc extensions"
+
-- 
2.7.4


