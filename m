Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9618B6E682
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 15:30:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2SFUcVT021665
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 08:30:38 -0700
Received: from otp-ddragomi-d1.corp.ad.wrs.com (128.224.124.174) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 28 Mar 2016 08:30:37 -0700
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2016 18:29:29 +0300
Message-ID: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Mon, 28 Mar 2016 15:30:39 -0000
Content-Type: text/plain

ARMv8-A supports two main execution states:
  - AArch64 - The 64-bit execution state including exception model,
  memory model, programmers' model and instruction set support for
  that state
  - AArch32 - The 32-bit execution state including exception model,
   memory model, programmers' model and instruction set support for
   that state

This patch adds tunes for 32-bit and 64-bit armv8a platforms.

For AArch32 state, the default tune is aarch32 and include which
    include by default hard float, fp-armv8 floating-point, thumb
    and neon extensions.
    Depending on the features supported by the core, the user can
    select between little or big endian and may choose to enable
    crc and crypto extensions.

For AArch64 state, the default tune is aarch32 and include which
    include just the aarch64 feature.
    Depending on the features supported by the core, the user can
    select between little or big endian and may choose to enable
    crc and crypto extensions.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/conf/machine/include/arm/arch-arm64.inc       |  36 -------
 meta/conf/machine/include/arm/arch-armv8.inc       |   1 -
 meta/conf/machine/include/arm/arch-armv8a.inc      | 113 +++++++++++++++++++++
 .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
 meta/conf/machine/include/tune-thunderx.inc        |   2 +-
 meta/conf/machine/qemuarm64.conf                   |   2 +-
 6 files changed, 116 insertions(+), 39 deletions(-)
 delete mode 100644 meta/conf/machine/include/arm/arch-arm64.inc
 delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
deleted file mode 100644
index 9440698..0000000
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-DEFAULTTUNE ?= "aarch64"
-
-require conf/machine/include/arm/arch-armv7a.inc
-
-TUNEVALID[aarch64] = "Enable instructions for aarch64"
-
-MACHINEOVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ':aarch64', '' ,d)}"
-
-# Little Endian base configs
-AVAILTUNES += "aarch64 aarch64_be"
-ARMPKGARCH_tune-aarch64 ?= "aarch64"
-ARMPKGARCH_tune-aarch64_be ?= "aarch64_be"
-TUNE_FEATURES_tune-aarch64 = "aarch64"
-TUNE_FEATURES_tune-aarch64_be = "${TUNE_FEATURES_tune-aarch64} bigendian"
-BASE_LIB_tune-aarch64 = "lib64"
-BASE_LIB_tune-aarch64_be = "lib64"
-
-PACKAGE_EXTRA_ARCHS_tune-aarch64 = "aarch64"
-PACKAGE_EXTRA_ARCHS_tune-aarch64_be = "aarch64_be"
-
-ARMPKGSFX_ENDIAN_64 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '_be', '', d)}"
-TUNE_ARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
-TUNE_PKGARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
-ABIEXTENSION_64 = ""
-TARGET_FPU_64 = ""
-
-# Duplicated from arch-arm.inc
-TUNE_ARCH_32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'armeb', 'arm', d)}"
-TUNE_PKGARCH_32 = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
-ABIEXTENSION_32 = "eabi"
-TARGET_FPU_32 = "${@d.getVar('TUNE_CCARGS_MFLOAT', True) or 'soft'}"
-
-TUNE_ARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}', '${TUNE_ARCH_32}' ,d)}"
-TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_PKGARCH_64}', '${TUNE_PKGARCH_32}' ,d)}"
-ABIEXTENSION = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${ABIEXTENSION_64}', '${ABIEXTENSION_32}' ,d)}"
-TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARGET_FPU_64}', '${TARGET_FPU_32}' ,d)}"
diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
deleted file mode 100644
index 5e832fa..0000000
--- a/meta/conf/machine/include/arm/arch-armv8.inc
+++ /dev/null
@@ -1 +0,0 @@
-require conf/machine/include/arm/arch-arm64.inc
diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
new file mode 100644
index 0000000..27135e1
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -0,0 +1,113 @@
+DEFAULTTUNE ?= "aarch64"
+
+TUNEVALID[aarch32] = "Enable instructions for 32bit state for ARMv8-a (aarch32)"
+TUNEVALID[aarch64] = "Enable instructions for 64bit state for ARMv8-a (aarch64)"
+TUNECONFLICTS[aarch32] = "armv4 armv5 armv6 armv7 armv7a armv7ve"
+
+TUNEVALID[crc] = "Enable CRC instructions for ARMv8-a"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '-crc', '', d)}"
+ARMPKGSFX_FPU_64 = "${@bb.utils.contains('TUNE_FEATURES', 'crc', '-crc', '', d)}"
+
+TUNEVALID[crypto] = "Enable ARMv8 crypto extension."
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '-crypto', '', d)}"
+ARMPKGSFX_FPU_64 .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '-crypto', '', d)}"
+
+TUNEVALID[fp-armv8] = "Enable ARMv8 Vector Floating Point unit."
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'fp-armv8', '-fp-armv8', '', d)}"
+
+require conf/machine/include/arm/arch-armv7ve.inc
+
+TUNE_CCARGS .= "${@bb.utils.contains_any('TUNE_FEATURES', [ 'aarch32', 'aarch64' ], bb.utils.contains('TUNE_FEATURES', 'crc', ' -march=armv8-a+crc', ' -march=armv8-a', d), '', d)}"
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'fp-armv8', ' fp-armv8', '', d)}"
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', [ 'fp-armv8', 'neon' ], ' neon-fp-armv8', '', d)}"
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', [ 'fp-armv8', 'neon', 'crypto' ], ' crypto-neon-fp-armv8', '', d)}"
+
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch32', 'aarch32:', '' ,d)}"
+MACHINEOVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ':aarch64', '' ,d)}"
+
+# Aarch64 Little Endian base configs
+AVAILTUNES += "aarch64 aarch64-crypto aarch64-crc aarch64-crc-crypto"
+ARMPKGARCH_tune-aarch64            ?= "aarch64"
+ARMPKGARCH_tune-aarch64-crypto     ?= "aarch64"
+ARMPKGARCH_tune-aarch64-crc        ?= "aarch64"
+ARMPKGARCH_tune-aarch64-crc-crypto ?= "aarch64"
+TUNE_FEATURES_tune-aarch64            = "aarch64"
+TUNE_FEATURES_tune-aarch64-crypto     = "${TUNE_FEATURES_tune-aarch64} crypto"
+TUNE_FEATURES_tune-aarch64-crc        = "${TUNE_FEATURES_tune-aarch64} crc"
+TUNE_FEATURES_tune-aarch64-crc-crypto = "${TUNE_FEATURES_tune-aarch64-crypto} crc"
+PACKAGE_EXTRA_ARCHS_tune-aarch64            = "aarch64"
+PACKAGE_EXTRA_ARCHS_tune-aarch64-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} aarch64-crypto"
+PACKAGE_EXTRA_ARCHS_tune-aarch64-crc        = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} aarch64-crc"
+PACKAGE_EXTRA_ARCHS_tune-aarch64-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-aarch64-crypto} aarch64-crc-crypto"
+BASE_LIB_tune-aarch64            = "lib64"
+BASE_LIB_tune-aarch64-crypto     = "lib64"
+BASE_LIB_tune-aarch64-crc        = "lib64"
+BASE_LIB_tune-aarch64-crc-crypto = "lib64"
+
+# Aarch64 Big Endian base configs
+AVAILTUNES += "aarch64_be aarch64_be-crypto aarch64_be-crc aarch64_be-crc-crypto"
+ARMPKGARCH_tune-aarch64_be            ?= "aarch64_be"
+ARMPKGARCH_tune-aarch64_be-crypto     ?= "aarch64_be"
+ARMPKGARCH_tune-aarch64_be-crc        ?= "aarch64_be"
+ARMPKGARCH_tune-aarch64_be-crc-crypto ?= "aarch64_be"
+TUNE_FEATURES_tune-aarch64_be            = "${TUNE_FEATURES_tune-aarch64}            bigendian"
+TUNE_FEATURES_tune-aarch64_be-crypto     = "${TUNE_FEATURES_tune-aarch64-crypto}     bigendian"
+TUNE_FEATURES_tune-aarch64_be-crc        = "${TUNE_FEATURES_tune-aarch64-crc}        bigendian"
+TUNE_FEATURES_tune-aarch64_be-crc-crypto = "${TUNE_FEATURES_tune-aarch64-crc-crypto} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-aarch64_be            = "aarch64_be"
+PACKAGE_EXTRA_ARCHS_tune-aarch64_be-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-aarch64_be} aarch64_be-crypto"
+PACKAGE_EXTRA_ARCHS_tune-aarch64_be-crc        = "${PACKAGE_EXTRA_ARCHS_tune-aarch64_be} aarch64_be-crc"
+PACKAGE_EXTRA_ARCHS_tune-aarch64_be-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-aarch64_be-crypto} aarch64_be-crc-crypto"
+BASE_LIB_tune-aarch64_be            = "lib64"
+BASE_LIB_tune-aarch64_be-crypto     = "lib64"
+BASE_LIB_tune-aarch64_be-crc        = "lib64"
+BASE_LIB_tune-aarch64_be-crc-crypto = "lib64"
+
+
+# Aarch32 Little Endian base configs
+AVAILTUNES += "aarch32 aarch32-crypto aarch32-crc aarch32-crc-crypto"
+ARMPKGARCH_tune-aarch32            ?= "aarch32"
+ARMPKGARCH_tune-aarch32-crypto     ?= "aarch32"
+ARMPKGARCH_tune-aarch32-crc        ?= "aarch32"
+ARMPKGARCH_tune-aarch32-crc-crypto ?= "aarch32"
+TUNE_FEATURES_tune-aarch32             = "arm aarch32 thumb neon fp-armv8 callconvention-hard"
+TUNE_FEATURES_tune-aarch32-crypto      = "${TUNE_FEATURES_tune-aarch32} crypto"
+TUNE_FEATURES_tune-aarch32-crc         = "${TUNE_FEATURES_tune-aarch32} crc"
+TUNE_FEATURES_tune-aarch32-crc-crypto  = "${TUNE_FEATURES_tune-aarch32-crypto} crc"
+PACKAGE_EXTRA_ARCHS_tune-aarch32            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} aarch32 aarch32hf aarch32t2hf aarch32hf-fp-armv8 aarch32t2hf-fp-armv8 aarch32hf-neon aarch32t2hf-neon aarch32hf-neon-fp-armv8 aarch32t2hf-neon-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-aarch32-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-aarch32} aarch32hf-crypto-neon-fp-armv8 aarch32t2hf-crypto-neon-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-aarch32-crc        = "${PACKAGE_EXTRA_ARCHS_tune-aarch32} aarch32hf-crc-neon-fp-armv8 aarch32t2hf-crc-neon-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-aarch32-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-aarch32-crypto} aarch32hf-crc-crypto-neon-fp-armv8 aarch32t2hf-crc-crypto-neon-fp-armv8"
+
+# Aarch32 Big Endian base configs
+AVAILTUNES += "aarch32b aarch32b-crypto aarch32b-crc aarch32b-crc-crypto"
+ARMPKGARCH_tune-aarch32b            ?= "aarch32"
+ARMPKGARCH_tune-aarch32b-crypto     ?= "aarch32"
+ARMPKGARCH_tune-aarch32b-crc        ?= "aarch32"
+ARMPKGARCH_tune-aarch32b-crc-crypto ?= "aarch32"
+TUNE_FEATURES_tune-aarch32b             = "${TUNE_FEATURES_tune-aarch32}            bigendian"
+TUNE_FEATURES_tune-aarch32b-crypto      = "${TUNE_FEATURES_tune-aarch32-crypto}     bigendian"
+TUNE_FEATURES_tune-aarch32b-crc         = "${TUNE_FEATURES_tune-aarch32-crc}        bigendian"
+TUNE_FEATURES_tune-aarch32b-crc-crypto  = "${TUNE_FEATURES_tune-aarch32-crc-crypto} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-aarch32b            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} aarch32b aarch32hfb aarch32t2hfb aarch32hfb-fp-armv8 aarch32t2hfb-fp-armv8 aarch32hfb-neon aarch32t2hfb-neon aarch32hfb-neon-fp-armv8 aarch32t2hfb-neon-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-aarch32b-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-aarch32b} aarch32hfb-crypto-neon-fp-armv8 aarch32t2hfb-crypto-neon-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-aarch32b-crc        = "${PACKAGE_EXTRA_ARCHS_tune-aarch32b} aarch32hfb-crc-neon-fp-armv8 aarch32t2hfb-crc-neon-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-aarch32b-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-aarch32b-crypto} aarch32hfb-crc-crypto-neon-fp-armv8 aarch32t2hfb-crc-crypto-neon-fp-armv8"
+
+
+ARMPKGSFX_ENDIAN_64 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '_be', '', d)}"
+TUNE_ARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
+TUNE_PKGARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}${ARMPKGSFX_FPU_64}"
+ABIEXTENSION_64 = ""
+TARGET_FPU_64 = ""
+
+# Duplicated from arch-arm.inc
+TUNE_ARCH_32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'armeb', 'arm', d)}"
+TUNE_PKGARCH_32 = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
+ABIEXTENSION_32 = "eabi"
+TARGET_FPU_32 = "${@d.getVar('TUNE_CCARGS_MFLOAT', True) or 'soft'}"
+
+TUNE_ARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}', '${TUNE_ARCH_32}' ,d)}"
+TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_PKGARCH_64}', '${TUNE_PKGARCH_32}' ,d)}"
+ABIEXTENSION = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${ABIEXTENSION_64}', '${ABIEXTENSION_32}' ,d)}"
+TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARGET_FPU_64}', '${TARGET_FPU_32}' ,d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 1faebf7..37bed4a 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -7,6 +7,7 @@ ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 't2', '', d
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 't2', '', d)}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 't2', '', d)}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 't2', '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch32', 't2', '', d)}"
 
 # If the device supports ARM, then respect ARM_THUMB_OPT (which can be "arm" or "thumb")
 # If the defice doesn't support ARM, then always set "thumb" even when
diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
index 3d43b0f..4d1247c 100644
--- a/meta/conf/machine/include/tune-thunderx.inc
+++ b/meta/conf/machine/include/tune-thunderx.inc
@@ -1,4 +1,4 @@
-require conf/machine/include/arm/arch-armv8.inc
+require conf/machine/include/arm/arch-armv8a.inc
 
 DEFAULTTUNE ?= "thunderx"
 AVAILTUNES += "thunderx thunderx_be"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index f59fb15..ff1ff64 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -2,7 +2,7 @@
 #@NAME: generic armv8 machine
 #@DESCRIPTION: Machine configuration for running a generic armv8
 
-require conf/machine/include/arm/arch-armv8.inc
+require conf/machine/include/arm/arch-armv8a.inc
 require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
-- 
1.9.1


