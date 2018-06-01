Return-Path: <ayaka@soulik.info>
X-Greylist: delayed 531 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Jun 2018 19:23:20 UTC
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id 3A12975056
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 19:23:20 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id 3A7E6100D34;
	Sat,  2 Jun 2018 04:15:00 +0900 (JST)
From: ayaka <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jun 2018 03:14:09 +0800
Message-Id: <20180601191410.4795-3-ayaka@soulik.info>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180601191410.4795-1-ayaka@soulik.info>
References: <20180601191410.4795-1-ayaka@soulik.info>
Subject: [PATCH 2/3] arch-armv8a.inc: add tune include for armv8
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
X-List-Received-Date: Fri, 01 Jun 2018 19:23:21 -0000

There are some addtional instructions apart from bare armv8,
also there is armv8.1, armv8.2.

Signed-off-by: ayaka <ayaka@soulik.info>
---
 meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
 meta/conf/machine/include/arm/arch-armv8a.inc | 49 +++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)
 delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
deleted file mode 100644
index 5e832fae6d..0000000000
--- a/meta/conf/machine/include/arm/arch-armv8.inc
+++ /dev/null
@@ -1 +0,0 @@
-require conf/machine/include/arm/arch-arm64.inc
diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
new file mode 100644
index 0000000000..43c2d456ab
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -0,0 +1,49 @@
+DEFAULTTUNE ?= "armv8ah"
+
+TUNEVALID[armv8] = "Enable instructions for ARMv8-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '' ,d)}"
+
+require conf/machine/include/arm/arch-arm64.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv8a armv8a-crc armv8a-simd armv8a-crypto armv8a-crc-simd armv8a-crc-simd-crypto"
+ARMPKGARCH_tune-armv8a                    ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc                ?= "armv8a"
+ARMPKGARCH_tune-armv8a-simd               ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crypto             ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc-simd           ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc-simd-crypto    ?= "armv8a"
+TUNE_FEATURES_tune-armv8a                 = "armv8a"
+TUNE_FEATURES_tune-armv8a-crc             = "${ARMPKGARCH_tune-armv8a} crc"
+TUNE_FEATURES_tune-armv8a-simd            = "${ARMPKGARCH_tune-armv8a} simd"
+TUNE_FEATURES_tune-armv8a-crypto          = "${ARMPKGARCH_tune-armv8a} crypto"
+TUNE_FEATURES_tune-armv8a-crc-simd        = "${TUNE_FEATURES_tune-armv8a-crc} simd"
+TUNE_FEATURES_tune-armv8a-crc-simd-crypto = "${TUNE_FEATURES_tune-armv8a-crc-simd} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8a                 = "aarch64 armv8a"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-simd            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} simd"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto          = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-simd        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} simd"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-simd-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-simd} crypto"
+
+# HF Tunes
+AVAILTUNES += "armv8ahf armv8ahf-crc armv8ahf-simd armv8ahf-crypto armv8ahf-crc-simd armv8ahf-crc-simd-crypto"
+ARMPKGARCH_tune-armv8ahf                    ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-crc                ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-simd               ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-crypto             ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-crc-simd           ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-crc-simd-crypto    ?= "armv8a"
+TUNE_FEATURES_tune-armv8ahf                 = "${TUNE_FEATURES_tune-armv8a} callconvention-hard"
+TUNE_FEATURES_tune-armv8ahf-crc             = "${TUNE_FEATURES_tune-armv8a-crc} callconvention-hard"
+TUNE_FEATURES_tune-armv8ahf-simd            = "${TUNE_FEATURES_tune-armv8a-crc-simd} callconvention-hard"
+TUNE_FEATURES_tune-armv8ahf-crypto          = "${TUNE_FEATURES_tune-armv8a-crypto} callconvention-hard"
+TUNE_FEATURES_tune-armv8ahf-crc-simd        = "${TUNE_FEATURES_tune-armv8a-crc-simd} callconvention-hard"
+TUNE_FEATURES_tune-armv8ahf-crc-simd-crypto = "${TUNE_FEATURES_tune-armv8a-crc-simd-crypto} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf                 = "armv8ahf"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc             = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf} crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-simd            = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf} simd"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crypto          = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-simd        = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc} simd"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-simd-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-simd} crypto"
-- 
2.14.3


