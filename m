Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9223D72789
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 08:54:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBI8s5mG028347
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 00:54:05 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 18 Dec 2014 00:54:04 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 16:51:14 +0800
Message-ID: <ac1f0f1165f32e886f7c6ffa5ebe304416db1d95.1418885581.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418885577.git.kai.kang@windriver.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/19] aarch-arm64: Update tune files
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
X-List-Received-Date: Thu, 18 Dec 2014 08:54:05 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

arch-arm64 is the base tune file for aarch64.  Update this to allow the
system to work with both aarch32 and aarch64 (multilib).

arch-armv8 is for compatibility, it simply uses the base config for now.

feature-arm-thumb was updated, since aarch64 mode does NOT have thumb support.
We should only be processing warnings and additional arguments if thumb
support is enabled on the processor core.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc       | 36 ++++++++++++++++++++++
 meta/conf/machine/include/arm/arch-armv8.inc       | 21 +------------
 .../conf/machine/include/arm/feature-arm-thumb.inc | 10 ++++--
 3 files changed, 44 insertions(+), 23 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-arm64.inc

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
new file mode 100644
index 0000000..5376b87
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -0,0 +1,36 @@
+DEFAULTTUNE ?= "aarch64"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[aarch64] = "Enable instructions for aarch64"
+
+MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", ":aarch64", "" ,d)}"
+
+# Little Endian base configs
+AVAILTUNES += "aarch64 aarch64_be"
+ARMPKGARCH_tune-aarch64 ?= "aarch64"
+ARMPKGARCH_tune-aarch64_be ?= "aarch64_be"
+TUNE_FEATURES_tune-aarch64 ?= "aarch64"
+TUNE_FEATURES_tune-aarch64_be ?= "${TUNE_FEATURES_tune-aarch64} bigendian"
+BASE_LIB_tune-aarch64 = "lib64"
+BASE_LIB_tune-aarch64_be = "lib64"
+
+PACKAGE_EXTRA_ARCHS_tune-aarch64 = "aarch64"
+PACKAGE_EXTRA_ARCHS_tune-aarch64_be = "aarch64_be"
+
+ARMPKGSFX_ENDIAN_64 = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "_be", "", d)}"
+TUNE_ARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
+TUNE_PKGARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
+ABIEXTENSION_64 = ""
+TARGET_FPU_64 = ""
+
+# Duplicated from arch-arm.inc
+TUNE_ARCH_32 = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "armeb", "arm", d)}"
+TUNE_PKGARCH_32 = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
+ABIEXTENSION_32 = "eabi"
+TARGET_FPU_32 = "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or 'soft'}"
+
+TUNE_ARCH = "${@bb.utils.contains("TUNE_FEATURES", "aarch64", "${TUNE_ARCH_64}", "${TUNE_ARCH_32}" ,d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "aarch64", "${TUNE_PKGARCH_64}", "${TUNE_PKGARCH_32}" ,d)}"
+ABIEXTENSION = "${@bb.utils.contains("TUNE_FEATURES", "aarch64", "${ABIEXTENSION_64}", "${ABIEXTENSION_32}" ,d)}"
+TARGET_FPU = "${@bb.utils.contains("TUNE_FEATURES", "aarch64", "${TARGET_FPU_64}", "${TARGET_FPU_32}" ,d)}"
diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
index c86142a..5e832fa 100644
--- a/meta/conf/machine/include/arm/arch-armv8.inc
+++ b/meta/conf/machine/include/arm/arch-armv8.inc
@@ -1,20 +1 @@
-DEFAULTTUNE ?= "aarch64"
-
-ARMPKGARCH ?= "aarch64"
-
-TUNEVALID[aarch64] = "Enable instructions for aarch64"
-TUNEVALID[bigendian] = "Enable big-endian mode."
-TUNECONFLICTS[aarch64] = ""
-MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", ":aarch64", "" ,d)}"
-
-# Little Endian base configs
-AVAILTUNES += "aarch64 aarch64_be"
-TUNE_FEATURES_tune-aarch64 ?= "aarch64"
-TUNE_FEATURES_tune-aarch64_be ?= "${TUNE_FEATURES_tune-aarch64} bigendian"
-
-ARMPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "_be", "", d)}"
-
-TUNE_ARCH = "aarch64${ARMPKGSFX_ENDIAN}"
-TUNE_PKGARCH = "aarch64${ARMPKGSFX_ENDIAN}"
-
-PACKAGE_EXTRA_ARCHS = "aarch64${ARMPKGSFX_ENDIAN}"
+require conf/machine/include/arm/arch-arm64.inc
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index a94386f..8e6619d 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -18,6 +18,8 @@ ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 't2', '', d
 # some recipe explicitly sets ARM_INSTRUCTION_SET to "arm"
 ARM_M_OPT = "${@bb.utils.contains('TUNE_FEATURES', 'arm', '${ARM_THUMB_OPT}', 'thumb', d)}"
 python () {
+    if bb.utils.contains('TUNE_FEATURES', 'thumb', 'False', 'True', d):
+        return
     selected = d.getVar('ARM_INSTRUCTION_SET', True)
     if selected == None:
         return
@@ -37,8 +39,10 @@ ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_
 # arm system and vice versa. It is strongly recommended that DISTROs not
 # turn this off - the actual cost is very small.
 TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ' -mno-thumb-interwork', ' -mthumb-interwork', d)}"
-OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ':thumb-interwork', '', d)}"
+THUMB_TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ' -mno-thumb-interwork', ' -mthumb-interwork', d)}"
+THUMB_OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ':thumb-interwork', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' ${THUMB_TUNE_CCARGS}', '', d)}"
+OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' ${THUMB_OVERRIDES}', '', d)}"
 
 # what about armv7m devices which don't support -marm (e.g. Cortex-M3)?
-TARGET_CC_KERNEL_ARCH += "-mno-thumb-interwork -marm"
+TARGET_CC_KERNEL_ARCH += "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '-mno-thumb-interwork -marm', '', d)}"
-- 
1.9.1


