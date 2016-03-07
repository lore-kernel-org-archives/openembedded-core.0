Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBA1731DF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 14:35:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u27EZTPJ028680
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 7 Mar 2016 06:35:29 -0800
Received: from otp-ddragomi-d1.corp.ad.wrs.com (128.224.124.174) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 7 Mar 2016 06:35:28 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Mar 2016 16:34:51 +0200
Message-ID: <1457361291-14009-2-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1457361291-14009-1-git-send-email-daniel.dragomir@windriver.com>
References: <1457361291-14009-1-git-send-email-daniel.dragomir@windriver.com>
MIME-Version: 1.0
Cc: otavio.salvador@ossystems.com.br
Subject: [PATCH][master] Add tune for 32-bit ARMv8-a
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
X-List-Received-Date: Mon, 07 Mar 2016 14:35:32 -0000
Content-Type: text/plain

This patch adds tunes for 32-bit armv8 platforms. The user can select
the vector floating-point instruction set: vfpv4 or fp-armv8
and the thumb, neon, crc and crypto extensions.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 meta/conf/machine/include/arm/arch-armv8a.inc      | 111 +++++++++++++++++++++
 .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
new file mode 100644
index 0000000..d4fb830
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -0,0 +1,111 @@
+DEFAULTTUNE ?= "armv8a"
+
+TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
+TUNECONFLICTS[armv8a] = "armv4 armv5 armv6 armv7 armv7a armv7ve"
+
+TUNEVALID[crc] = "Enable CRC instructions for ARMv8-a"
+ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "crc", "-crc", "", d)}"
+
+TUNEVALID[crypto] = "Enable ARMv8 crypto extension."
+ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "crypto", "-crypto", "", d)}"
+
+TUNEVALID[fp-armv8] = "Enable ARMv8 Vector Floating Point unit."
+ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fp-armv8", "-fp-armv8", "", d)}"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv8a", bb.utils.contains("TUNE_FEATURES", "crc", " -march=armv8-a+crc", " -march=armv8-a", d), "", d)}"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "fp-armv8", bb.utils.contains("TUNE_FEATURES", "neon", bb.utils.contains("TUNE_FEATURES", "crypto", " -mfpu=crypto-neon-fp-armv8", " -mfpu=neon-fp-armv8", d), " -mfpu=fp-armv8", d), "", d)}"
+
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv8a", "armv8a:", "" ,d)}"
+
+require conf/machine/include/arm/arch-armv7ve.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv8a armv8at armv8a-neon armv8at-neon armv8a-vfpv4 armv8at-vfpv4 armv8a-vfpv4-neon armv8at-vfpv4-neon armv8a-fp-armv8 armv8at-fp-armv8 armv8a-fp-armv8-neon armv8at-fp-armv8-neon armv8a-crypto-fp-armv8-neon armv8at-crypto-fp-armv8-neon"
+ARMPKGARCH_tune-armv8a                       ?= "armv8a"
+ARMPKGARCH_tune-armv8at                      ?= "armv8a"
+ARMPKGARCH_tune-armv8a-neon                  ?= "armv8a"
+ARMPKGARCH_tune-armv8at-neon                 ?= "armv8a"
+ARMPKGARCH_tune-armv8a-vfpv4                 ?= "armv8a"
+ARMPKGARCH_tune-armv8at-vfpv4                ?= "armv8a"
+ARMPKGARCH_tune-armv8a-vfpv4-neon            ?= "armv8a"
+ARMPKGARCH_tune-armv8at-vfpv4-neon           ?= "armv8a"
+ARMPKGARCH_tune-armv8a-fp-armv8              ?= "armv8a"
+ARMPKGARCH_tune-armv8at-fp-armv8             ?= "armv8a"
+ARMPKGARCH_tune-armv8a-fp-armv8-neon         ?= "armv8a"
+ARMPKGARCH_tune-armv8at-fp-armv8-neon        ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crypto-fp-armv8-neon  ?= "armv8a"
+ARMPKGARCH_tune-armv8at-crypto-fp-armv8-neon ?= "armv8a"
+TUNE_FEATURES_tune-armv8a                       = "arm armv8a vfp"
+TUNE_FEATURES_tune-armv8at                      = "${TUNE_FEATURES_tune-armv8a} thumb"
+TUNE_FEATURES_tune-armv8a-neon                  = "${TUNE_FEATURES_tune-armv8a} neon"
+TUNE_FEATURES_tune-armv8at-neon                 = "${TUNE_FEATURES_tune-armv8at} neon"
+TUNE_FEATURES_tune-armv8a-vfpv4                 = "${TUNE_FEATURES_tune-armv8a} vfpv4"
+TUNE_FEATURES_tune-armv8at-vfpv4                = "${TUNE_FEATURES_tune-armv8at} vfpv4"
+TUNE_FEATURES_tune-armv8a-vfpv4-neon            = "${TUNE_FEATURES_tune-armv8a-neon} vfpv4"
+TUNE_FEATURES_tune-armv8at-vfpv4-neon           = "${TUNE_FEATURES_tune-armv8at-neon} vfpv4"
+TUNE_FEATURES_tune-armv8a-fp-armv8              = "${TUNE_FEATURES_tune-armv8a} fp-armv8"
+TUNE_FEATURES_tune-armv8at-fp-armv8             = "${TUNE_FEATURES_tune-armv8at} fp-armv8"
+TUNE_FEATURES_tune-armv8a-fp-armv8-neon         = "${TUNE_FEATURES_tune-armv8a-neon} fp-armv8"
+TUNE_FEATURES_tune-armv8at-fp-armv8-neon        = "${TUNE_FEATURES_tune-armv8at-neon} fp-armv8"
+TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon  = "${TUNE_FEATURES_tune-armv8a-fp-armv8-neon} crypto"
+TUNE_FEATURES_tune-armv8at-crypto-fp-armv8-neon = "${TUNE_FEATURES_tune-armv8at-fp-armv8-neon} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8a                       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} armv8a armv8a-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv8at                      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet2} armv8a armv8a-vfp armv8at2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-neon                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-neon                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8at} armv8a-neon armv8at2-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-vfpv4                = "${PACKAGE_EXTRA_ARCHS_tune-armv8at} armv8a-vfpv4 armv8at2-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4-neon            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4} armv8a-neon armv8a-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-vfpv4-neon           = "${PACKAGE_EXTRA_ARCHS_tune-armv8at-vfpv4} armv8a-neon armv8at2-neon armv8a-neon-vfpv4 armv8at2-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8              = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-fp-armv8             = "${PACKAGE_EXTRA_ARCHS_tune-armv8at} armv8a-fp-armv8 armv8at2-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8} armv8a-neon armv8a-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-fp-armv8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv8at-fp-armv8} armv8a-neon armv8at2-neon armv8a-fp-armv8-neon armv8at2-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-fp-armv8-neon  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon} armv8a-crypto-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-crypto-fp-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8at-fp-armv8-neon} armv8a-crypto-fp-armv8-neon armv8at2-crypto-fp-armv8-neon"
+
+# CRC configs
+AVAILTUNES += "armv8a-crc armv8at-crc armv8a-crc-neon armv8at-crc-neon armv8a-crc-vfpv4 armv8at-crc-vfpv4 armv8a-crc-vfpv4-neon armv8at-crc-vfpv4-neon armv8a-crc-fp-armv8 armv8at-crc-fp-armv8 armv8a-crc-fp-armv8-neon armv8at-crc-fp-armv8-neon armv8a-crc-crypto-fp-armv8-neon armv8at-crc-crypto-fp-armv8-neon"
+ARMPKGARCH_tune-armv8a-crc                       ?= "armv8a"
+ARMPKGARCH_tune-armv8at-crc                      ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc-neon                  ?= "armv8a"
+ARMPKGARCH_tune-armv8at-crc-neon                 ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc-vfpv4                 ?= "armv8a"
+ARMPKGARCH_tune-armv8at-crc-vfpv4                ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc-vfpv4-neon            ?= "armv8a"
+ARMPKGARCH_tune-armv8at-crc-vfpv4-neon           ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc-fp-armv8              ?= "armv8a"
+ARMPKGARCH_tune-armv8at-crc-fp-armv8             ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc-fp-armv8-neon         ?= "armv8a"
+ARMPKGARCH_tune-armv8at-crc-fp-armv8-neon        ?= "armv8a"
+ARMPKGARCH_tune-armv8a-crc-crypto-fp-armv8-neon  ?= "armv8a"
+ARMPKGARCH_tune-armv8at-crc-crypto-fp-armv8-neon ?= "armv8a"
+TUNE_FEATURES_tune-armv8a-crc                       = "${TUNE_FEATURES_tune-armv8a}                       crc"
+TUNE_FEATURES_tune-armv8at-crc                      = "${TUNE_FEATURES_tune-armv8at}                      crc"
+TUNE_FEATURES_tune-armv8a-crc-neon                  = "${TUNE_FEATURES_tune-armv8a-neon}                  crc"
+TUNE_FEATURES_tune-armv8at-crc-neon                 = "${TUNE_FEATURES_tune-armv8at-neon}                 crc"
+TUNE_FEATURES_tune-armv8a-crc-vfpv4                 = "${TUNE_FEATURES_tune-armv8a-vfpv4}                 crc"
+TUNE_FEATURES_tune-armv8at-crc-vfpv4                = "${TUNE_FEATURES_tune-armv8at-vfpv4}                crc"
+TUNE_FEATURES_tune-armv8a-crc-vfpv4-neon            = "${TUNE_FEATURES_tune-armv8a-vfpv4-neon}            crc"
+TUNE_FEATURES_tune-armv8at-crc-vfpv4-neon           = "${TUNE_FEATURES_tune-armv8at-vfpv4-neon}           crc"
+TUNE_FEATURES_tune-armv8a-crc-fp-armv8              = "${TUNE_FEATURES_tune-armv8a-fp-armv8}              crc"
+TUNE_FEATURES_tune-armv8at-crc-fp-armv8             = "${TUNE_FEATURES_tune-armv8at-fp-armv8}             crc"
+TUNE_FEATURES_tune-armv8a-crc-fp-armv8-neon         = "${TUNE_FEATURES_tune-armv8a-fp-armv8-neon}         crc"
+TUNE_FEATURES_tune-armv8at-crc-fp-armv8-neon        = "${TUNE_FEATURES_tune-armv8at-fp-armv8-neon}        crc"
+TUNE_FEATURES_tune-armv8a-crc-crypto-fp-armv8-neon  = "${TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon}  crc"
+TUNE_FEATURES_tune-armv8at-crc-crypto-fp-armv8-neon = "${TUNE_FEATURES_tune-armv8at-crypto-fp-armv8-neon} crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc                       = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-crc                      = "${PACKAGE_EXTRA_ARCHS_tune-armv8at} armv8a-crc-vfp armv8at2-crc-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-neon} armv8a-crc-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-crc-neon                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8at-neon} armv8a-crc-neon armv8at2-crc-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4} armv8a-crc-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-crc-vfpv4                = "${PACKAGE_EXTRA_ARCHS_tune-armv8at-vfpv4} armv8a-crc-vfpv4 armv8at2-crc-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4-neon            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4-neon} armv8a-crc-neon armv8a-crc-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-crc-vfpv4-neon           = "${PACKAGE_EXTRA_ARCHS_tune-armv8at-vfpv4-neon} armv8a-crc-neon armv8at2-crc-neon armv8a-crc-vfpv4-neon armv8at2-crc-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8              = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8} armv8a-crc-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-crc-fp-armv8             = "${PACKAGE_EXTRA_ARCHS_tune-armv8at-fp-armv8} armv8a-crc-fp-armv8 armv8at2-crc-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon} armv8a-crc-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-crc-fp-armv8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv8at-fp-armv8-neon} armv8a-crc-fp-armv8-neon armv8at2-crc-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto-fp-armv8-neon  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-fp-armv8-neon} armv8a-crc-crypto-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-crc-crypto-fp-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8at-crypto-fp-armv8-neon} armv8a-crc-crypto-fp-armv8-neon armv8at2-crc-crypto-fp-armv8-neon"
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index dfb9d7e..94d269f 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -7,6 +7,7 @@ ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 't2', '', d
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 't2', '', d)}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 't2', '', d)}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 't2', '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 't2', '', d)}"
 
 # If the device supports ARM, then respect ARM_THUMB_OPT (which can be "arm" or "thumb")
 # If the defice doesn't support ARM, then always set "thumb" even when
-- 
1.9.1


