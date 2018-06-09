Return-Path: <ayaka@soulik.info>
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id 25A82748DA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 06:26:46 +0000 (UTC)
Received: from misaki.sumomo.pri (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPA id 7B2BF100CDA;
	Sat,  9 Jun 2018 15:27:16 +0900 (JST)
From: Randy Li <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2018 14:26:25 +0800
Message-Id: <20180609062628.32364-2-ayaka@soulik.info>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180609062628.32364-1-ayaka@soulik.info>
References: <20180609062628.32364-1-ayaka@soulik.info>
Subject: [PATCH v2 1/4] arch-armv8a.inc: add tune include for armv8
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
X-List-Received-Date: Sat, 09 Jun 2018 06:26:47 -0000

There are some addtional instructions apart from bare armv8,
also there is armv8.1, armv8.2.

Most the processor would support crc, except X-gene 1.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
 meta/conf/machine/include/arm/arch-armv8a.inc | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
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
index 0000000000..b8b9e44c54
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -0,0 +1,22 @@
+DEFAULTTUNE ?= "armv8a-crc"
+
+TUNEVALID[armv8] = "Enable instructions for ARMv8-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '' ,d)}"
+
+require conf/machine/include/arm/arch-arm64.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
+ARMPKGARCH_tune-armv8a                    ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc                ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crypto             ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc-crypto         ?= "armv8a"
+TUNE_FEATURES_tune-armv8a                  = "armv8a simd"
+TUNE_FEATURES_tune-armv8a-crc              = "${ARMPKGARCH_tune-armv8a} crc"
+TUNE_FEATURES_tune-armv8a-crypto           = "${TUNE_FEATURES_tune-armv8a} crypto"
+TUNE_FEATURES_tune-armv8a-crc-crypto       = "${TUNE_FEATURES_tune-armv8a-crc} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
-- 
2.14.3


