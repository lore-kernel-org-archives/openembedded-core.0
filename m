Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3276471AF4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 12:50:54 +0000 (UTC)
Received: from localhost.localdomain (111-250-155-21.dynamic.hinet.net
	[111.250.155.21])
	by msfrf2635.sfr.fr (SMTP Server) with ESMTP id 872381C0034E7;
	Sat, 19 Nov 2016 13:50:55 +0100 (CET)
Received: from localhost.localdomain (111-250-155-21.dynamic.hinet.net
	[111.250.155.21])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2635.sfr.fr (SMTP Server) with ESMTPSA;
	Sat, 19 Nov 2016 13:50:54 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Nov 2016 20:50:33 +0800
Message-Id: <1479559833-128256-2-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479559833-128256-1-git-send-email-herve.jourdain@neuf.fr>
References: <1479559833-128256-1-git-send-email-herve.jourdain@neuf.fr>
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [PATCH v2 1/1] Add a tune file for cortexa53, valid for 32 bits and 64 bits
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
X-List-Received-Date: Sat, 19 Nov 2016 12:50:54 -0000

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
---
 meta/conf/machine/include/tune-cortexa53.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa53.inc

diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
new file mode 100644
index 0000000..ff5edb6
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -0,0 +1,22 @@
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
+TUNE_FEATURES_tune-cortexa53-32 = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} cortexa53"
+BASE_LIB_tune-cortexa53-32 = "lib"
+TUNE_PKGARCH_tune-cortexa53-32 = "cortexa53-32"
+PACKAGE_EXTRA_ARCHS_tune-cortexa53-32 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa53-32 cortexa53-neon-vfpv4"
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


