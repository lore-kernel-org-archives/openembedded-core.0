Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 000ED6FF04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 17:59:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2BHxftA002810
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Mar 2016 09:59:42 -0800 (PST)
Received: from otp-ddragomi-d1.corp.ad.wrs.com (128.224.124.174) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 11 Mar 2016 09:59:40 -0800
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Mar 2016 19:58:52 +0200
Message-ID: <1457719132-2239-2-git-send-email-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1457719132-2239-1-git-send-email-daniel.dragomir@windriver.com>
References: <1457719132-2239-1-git-send-email-daniel.dragomir@windriver.com>
MIME-Version: 1.0
Cc: otavio.salvador@ossystems.com.br
Subject: [PATCHv2][master] arch-armv8a.inc: Add tune for 32-bit ARMv8a
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
X-List-Received-Date: Fri, 11 Mar 2016 17:59:43 -0000
Content-Type: text/plain

This patch adds tunes for 32-bit armv8a platforms. The user can select
little or big endian, hard or soft float, the vector floating-point
instruction set: vfpv4 or fp-armv8 and the thumb, neon, crc and crypto
extensions.

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 meta/conf/machine/include/arm/arch-armv8a.inc      | 382 +++++++++++++++++++++
 .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
 2 files changed, 383 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
new file mode 100644
index 0000000..6544f50
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -0,0 +1,382 @@
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
+TUNE_FEATURES_tune-armv8a                       = "arm armv8a"
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
+PACKAGE_EXTRA_ARCHS_tune-armv8a                       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} armv8a"
+PACKAGE_EXTRA_ARCHS_tune-armv8at                      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv8a"
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
+PACKAGE_EXTRA_ARCHS_tune-armv8a-crc                       = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8at-crc                      = "${PACKAGE_EXTRA_ARCHS_tune-armv8at} armv8a-crc armv8at2-crc"
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
+
+# HF configs
+AVAILTUNES += "armv8ahf armv8athf armv8ahf-neon armv8athf-neon armv8ahf-vfpv4 armv8athf-vfpv4 armv8ahf-vfpv4-neon armv8athf-vfpv4-neon armv8ahf-fp-armv8 armv8athf-fp-armv8 armv8ahf-fp-armv8-neon armv8athf-fp-armv8-neon armv8ahf-crypto-fp-armv8-neon armv8athf-crypto-fp-armv8-neon"
+ARMPKGARCH_tune-armv8ahf                       ?= "armv8a"
+ARMPKGARCH_tune-armv8athf                      ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-neon                  ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-neon                 ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-vfpv4                 ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-vfpv4                ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-vfpv4-neon            ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-vfpv4-neon           ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-fp-armv8              ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-fp-armv8             ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-fp-armv8-neon         ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-fp-armv8-neon        ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-crypto-fp-armv8-neon  ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-crypto-fp-armv8-neon ?= "armv8a"
+TUNE_FEATURES_tune-armv8ahf                       = "${TUNE_FEATURES_tune-armv8a}                       callconvention-hard"
+TUNE_FEATURES_tune-armv8athf                      = "${TUNE_FEATURES_tune-armv8at}                      callconvention-hard"
+TUNE_FEATURES_tune-armv8ahf-neon                  = "${TUNE_FEATURES_tune-armv8a-neon}                  callconvention-hard"
+TUNE_FEATURES_tune-armv8athf-neon                 = "${TUNE_FEATURES_tune-armv8at-neon}                 callconvention-hard"
+TUNE_FEATURES_tune-armv8ahf-vfpv4                 = "${TUNE_FEATURES_tune-armv8a-vfpv4}                 callconvention-hard"
+TUNE_FEATURES_tune-armv8athf-vfpv4                = "${TUNE_FEATURES_tune-armv8at-vfpv4}                callconvention-hard"
+TUNE_FEATURES_tune-armv8ahf-vfpv4-neon            = "${TUNE_FEATURES_tune-armv8a-vfpv4-neon}            callconvention-hard"
+TUNE_FEATURES_tune-armv8athf-vfpv4-neon           = "${TUNE_FEATURES_tune-armv8at-vfpv4-neon}           callconvention-hard"
+TUNE_FEATURES_tune-armv8ahf-fp-armv8              = "${TUNE_FEATURES_tune-armv8a-fp-armv8}              callconvention-hard"
+TUNE_FEATURES_tune-armv8athf-fp-armv8             = "${TUNE_FEATURES_tune-armv8at-fp-armv8}             callconvention-hard"
+TUNE_FEATURES_tune-armv8ahf-fp-armv8-neon         = "${TUNE_FEATURES_tune-armv8a-fp-armv8-neon}         callconvention-hard"
+TUNE_FEATURES_tune-armv8athf-fp-armv8-neon        = "${TUNE_FEATURES_tune-armv8at-fp-armv8-neon}        callconvention-hard"
+TUNE_FEATURES_tune-armv8ahf-crypto-fp-armv8-neon  = "${TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon}  callconvention-hard"
+TUNE_FEATURES_tune-armv8athf-crypto-fp-armv8-neon = "${TUNE_FEATURES_tune-armv8at-crypto-fp-armv8-neon} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf                       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} armv8a armv8ahf"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf                      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv8a armv8ahf armv8at2hf"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-neon                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf} armv8ahf-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-neon                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf} armv8ahf-neon armv8at2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-vfpv4                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf} armv8ahf-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-vfpv4                = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf} armv8ahf-vfpv4 armv8at2hf-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-vfpv4-neon            = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-vfpv4} armv8ahf-neon armv8ahf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-vfpv4-neon           = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf-vfpv4} armv8ahf-neon armv8at2hf-neon armv8ahf-neon-vfpv4 armv8at2hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-fp-armv8              = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf} armv8ahf-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-fp-armv8             = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf} armv8ahf-fp-armv8 armv8at2hf-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-fp-armv8-neon         = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-fp-armv8} armv8ahf-neon armv8ahf-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-fp-armv8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf-fp-armv8} armv8ahf-neon armv8at2hf-neon armv8ahf-fp-armv8-neon armv8at2hf-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crypto-fp-armv8-neon  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-fp-armv8-neon} armv8ahf-crypto-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-crypto-fp-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf-fp-armv8-neon} armv8ahf-crypto-fp-armv8-neon armv8at2hf-crypto-fp-armv8-neon"
+
+# HF + CRC
+AVAILTUNES += "armv8ahf-crc armv8athf-crc armv8ahf-crc-neon armv8athf-crc-neon armv8ahf-crc-vfpv4 armv8athf-crc-vfpv4 armv8ahf-crc-vfpv4-neon armv8athf-crc-vfpv4-neon armv8ahf-crc-fp-armv8 armv8athf-crc-fp-armv8 armv8ahf-crc-fp-armv8-neon armv8athf-crc-fp-armv8-neon armv8ahf-crc-crypto-fp-armv8-neon armv8athf-crc-crypto-fp-armv8-neon"
+ARMPKGARCH_tune-armv8ahf-crc                       ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-crc                      ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-crc-neon                  ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-crc-neon                 ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-crc-vfpv4                 ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-crc-vfpv4                ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-crc-vfpv4-neon            ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-crc-vfpv4-neon           ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-crc-fp-armv8              ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-crc-fp-armv8             ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-crc-fp-armv8-neon         ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-crc-fp-armv8-neon        ?= "armv8a"
+ARMPKGARCH_tune-armv8ahf-crc-crypto-fp-armv8-neon  ?= "armv8a"
+ARMPKGARCH_tune-armv8athf-crc-crypto-fp-armv8-neon ?= "armv8a"
+TUNE_FEATURES_tune-armv8ahf-crc                       = "${TUNE_FEATURES_tune-armv8ahf}                       crc"
+TUNE_FEATURES_tune-armv8athf-crc                      = "${TUNE_FEATURES_tune-armv8athf}                      crc"
+TUNE_FEATURES_tune-armv8ahf-crc-neon                  = "${TUNE_FEATURES_tune-armv8ahf-neon}                  crc"
+TUNE_FEATURES_tune-armv8athf-crc-neon                 = "${TUNE_FEATURES_tune-armv8athf-neon}                 crc"
+TUNE_FEATURES_tune-armv8ahf-crc-vfpv4                 = "${TUNE_FEATURES_tune-armv8ahf-vfpv4}                 crc"
+TUNE_FEATURES_tune-armv8athf-crc-vfpv4                = "${TUNE_FEATURES_tune-armv8athf-vfpv4}                crc"
+TUNE_FEATURES_tune-armv8ahf-crc-vfpv4-neon            = "${TUNE_FEATURES_tune-armv8ahf-vfpv4-neon}            crc"
+TUNE_FEATURES_tune-armv8athf-crc-vfpv4-neon           = "${TUNE_FEATURES_tune-armv8athf-vfpv4-neon}           crc"
+TUNE_FEATURES_tune-armv8ahf-crc-fp-armv8              = "${TUNE_FEATURES_tune-armv8ahf-fp-armv8}              crc"
+TUNE_FEATURES_tune-armv8athf-crc-fp-armv8             = "${TUNE_FEATURES_tune-armv8athf-fp-armv8}             crc"
+TUNE_FEATURES_tune-armv8ahf-crc-fp-armv8-neon         = "${TUNE_FEATURES_tune-armv8ahf-fp-armv8-neon}         crc"
+TUNE_FEATURES_tune-armv8athf-crc-fp-armv8-neon        = "${TUNE_FEATURES_tune-armv8athf-fp-armv8-neon}        crc"
+TUNE_FEATURES_tune-armv8ahf-crc-crypto-fp-armv8-neon  = "${TUNE_FEATURES_tune-armv8ahf-crypto-fp-armv8-neon}  crc"
+TUNE_FEATURES_tune-armv8athf-crc-crypto-fp-armv8-neon = "${TUNE_FEATURES_tune-armv8athf-crypto-fp-armv8-neon} crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc                       = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf} armv8ahf-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc                      = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf} armv8ahf-crc armv8at2hf-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-neon                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-neon} armv8ahf-crc-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc-neon                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf-neon} armv8ahf-crc-neon armv8at2hf-crc-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-vfpv4                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-vfpv4} armv8ahf-crc-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc-vfpv4                = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf-vfpv4} armv8ahf-crc-vfpv4 armv8at2hf-crc-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-vfpv4-neon            = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-vfpv4-neon} armv8ahf-crc-neon armv8ahf-crc-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc-vfpv4-neon           = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf-vfpv4-neon} armv8ahf-crc-neon armv8at2hf-crc-neon armv8ahf-crc-vfpv4-neon armv8at2hf-crc-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-fp-armv8              = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-fp-armv8} armv8ahf-crc-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc-fp-armv8             = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf-fp-armv8} armv8ahf-crc-fp-armv8 armv8at2hf-crc-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-fp-armv8-neon         = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-fp-armv8-neon} armv8ahf-crc-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc-fp-armv8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf-fp-armv8-neon} armv8ahf-crc-fp-armv8-neon armv8at2hf-crc-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-crypto-fp-armv8-neon  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crypto-fp-armv8-neon} armv8ahf-crc-crypto-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc-crypto-fp-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8athf-crypto-fp-armv8-neon} armv8ahf-crc-crypto-fp-armv8-neon armv8at2hf-crc-crypto-fp-armv8-neon"
+
+
+# Big Endian
+AVAILTUNES += "armv8ab armv8atb armv8ab-neon armv8atb-neon armv8ab-vfpv4 armv8atb-vfpv4 armv8ab-vfpv4-neon armv8atb-vfpv4-neon armv8ab-fp-armv8 armv8atb-fp-armv8 armv8ab-fp-armv8-neon armv8atb-fp-armv8-neon armv8ab-crypto-fp-armv8-neon armv8atb-crypto-fp-armv8-neon"
+ARMPKGARCH_tune-armv8ab                       ?= "armv8a"
+ARMPKGARCH_tune-armv8atb                      ?= "armv8a"
+ARMPKGARCH_tune-armv8ab-neon                  ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-neon                 ?= "armv8a"
+ARMPKGARCH_tune-armv8ab-vfpv4                 ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-vfpv4                ?= "armv8a"
+ARMPKGARCH_tune-armv8ab-vfpv4-neon            ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-vfpv4-neon           ?= "armv8a"
+ARMPKGARCH_tune-armv8ab-fp-armv8              ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-fp-armv8             ?= "armv8a"
+ARMPKGARCH_tune-armv8ab-fp-armv8-neon         ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-fp-armv8-neon        ?= "armv8a"
+ARMPKGARCH_tune-armv8ab-crypto-fp-armv8-neon  ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-crypto-fp-armv8-neon ?= "armv8a"
+TUNE_FEATURES_tune-armv8ab                       = "${TUNE_FEATURES_tune-armv8a}                       bigendian"
+TUNE_FEATURES_tune-armv8atb                      = "${TUNE_FEATURES_tune-armv8at}                      bigendian"
+TUNE_FEATURES_tune-armv8ab-neon                  = "${TUNE_FEATURES_tune-armv8a-neon}                  bigendian"
+TUNE_FEATURES_tune-armv8atb-neon                 = "${TUNE_FEATURES_tune-armv8at-neon}                 bigendian"
+TUNE_FEATURES_tune-armv8ab-vfpv4                 = "${TUNE_FEATURES_tune-armv8a-vfpv4}                 bigendian"
+TUNE_FEATURES_tune-armv8atb-vfpv4                = "${TUNE_FEATURES_tune-armv8at-vfpv4}                bigendian"
+TUNE_FEATURES_tune-armv8ab-vfpv4-neon            = "${TUNE_FEATURES_tune-armv8a-vfpv4-neon}            bigendian"
+TUNE_FEATURES_tune-armv8atb-vfpv4-neon           = "${TUNE_FEATURES_tune-armv8at-vfpv4-neon}           bigendian"
+TUNE_FEATURES_tune-armv8ab-fp-armv8              = "${TUNE_FEATURES_tune-armv8a-fp-armv8}              bigendian"
+TUNE_FEATURES_tune-armv8atb-fp-armv8             = "${TUNE_FEATURES_tune-armv8at-fp-armv8}             bigendian"
+TUNE_FEATURES_tune-armv8ab-fp-armv8-neon         = "${TUNE_FEATURES_tune-armv8a-fp-armv8-neon}         bigendian"
+TUNE_FEATURES_tune-armv8atb-fp-armv8-neon        = "${TUNE_FEATURES_tune-armv8at-fp-armv8-neon}        bigendian"
+TUNE_FEATURES_tune-armv8ab-crypto-fp-armv8-neon  = "${TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon}  bigendian"
+TUNE_FEATURES_tune-armv8atb-crypto-fp-armv8-neon = "${TUNE_FEATURES_tune-armv8at-crypto-fp-armv8-neon} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab                       = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb} armv8ab"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb                      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv8ab"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-neon                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab} armv8ab-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-neon                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb} armv8ab-neon armv8at2b-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-vfpv4                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab} armv8ab-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-vfpv4                = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb} armv8ab-vfpv4 armv8at2b-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-vfpv4-neon            = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab-vfpv4} armv8ab-neon armv8ab-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-vfpv4-neon           = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb-vfpv4} armv8ab-neon armv8at2b-neon armv8ab-neon-vfpv4 armv8at2b-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-fp-armv8              = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab} armv8ab-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-fp-armv8             = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb} armv8ab-fp-armv8 armv8at2b-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-fp-armv8-neon         = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab-fp-armv8} armv8ab-neon armv8ab-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-fp-armv8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb-fp-armv8} armv8ab-neon armv8at2b-neon armv8ab-fp-armv8-neon armv8at2b-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-crypto-fp-armv8-neon  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab-fp-armv8-neon} armv8ab-crypto-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-crypto-fp-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb-fp-armv8-neon} armv8ab-crypto-fp-armv8-neon armv8at2b-crypto-fp-armv8-neon"
+
+# Big Endian + CRC
+AVAILTUNES += "armv8ab-crc armv8atb-crc armv8ab-crc-neon armv8atb-crc-neon armv8ab-crc-vfpv4 armv8atb-crc-vfpv4 armv8ab-crc-vfpv4-neon armv8atb-crc-vfpv4-neon armv8ab-crc-fp-armv8 armv8atb-crc-fp-armv8 armv8ab-crc-fp-armv8-neon armv8atb-crc-fp-armv8-neon armv8ab-crc-crypto-fp-armv8-neon armv8atb-crc-crypto-fp-armv8-neon"
+ARMPKGARCH_tune-armv8ab-crc                       ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-crc                      ?= "armv8a"
+ARMPKGARCH_tune-armv8ab-crc-neon                  ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-crc-neon                 ?= "armv8a"
+ARMPKGARCH_tune-armv8ab-crc-vfpv4                 ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-crc-vfpv4                ?= "armv8a"
+ARMPKGARCH_tune-armv8ab-crc-vfpv4-neon            ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-crc-vfpv4-neon           ?= "armv8a"
+ARMPKGARCH_tune-armv8ab-crc-fp-armv8              ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-crc-fp-armv8             ?= "armv8a"
+ARMPKGARCH_tune-armv8ab-crc-fp-armv8-neon         ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-crc-fp-armv8-neon        ?= "armv8a"
+ARMPKGARCH_tune-armv8ab-crc-crypto-fp-armv8-neon  ?= "armv8a"
+ARMPKGARCH_tune-armv8atb-crc-crypto-fp-armv8-neon ?= "armv8a"
+TUNE_FEATURES_tune-armv8ab-crc                       = "${TUNE_FEATURES_tune-armv8ab}                       crc"
+TUNE_FEATURES_tune-armv8atb-crc                      = "${TUNE_FEATURES_tune-armv8atb}                      crc"
+TUNE_FEATURES_tune-armv8ab-crc-neon                  = "${TUNE_FEATURES_tune-armv8ab-neon}                  crc"
+TUNE_FEATURES_tune-armv8atb-crc-neon                 = "${TUNE_FEATURES_tune-armv8atb-neon}                 crc"
+TUNE_FEATURES_tune-armv8ab-crc-vfpv4                 = "${TUNE_FEATURES_tune-armv8ab-vfpv4}                 crc"
+TUNE_FEATURES_tune-armv8atb-crc-vfpv4                = "${TUNE_FEATURES_tune-armv8atb-vfpv4}                crc"
+TUNE_FEATURES_tune-armv8ab-crc-vfpv4-neon            = "${TUNE_FEATURES_tune-armv8ab-vfpv4-neon}            crc"
+TUNE_FEATURES_tune-armv8atb-crc-vfpv4-neon           = "${TUNE_FEATURES_tune-armv8atb-vfpv4-neon}           crc"
+TUNE_FEATURES_tune-armv8ab-crc-fp-armv8              = "${TUNE_FEATURES_tune-armv8ab-fp-armv8}              crc"
+TUNE_FEATURES_tune-armv8atb-crc-fp-armv8             = "${TUNE_FEATURES_tune-armv8atb-fp-armv8}             crc"
+TUNE_FEATURES_tune-armv8ab-crc-fp-armv8-neon         = "${TUNE_FEATURES_tune-armv8ab-fp-armv8-neon}         crc"
+TUNE_FEATURES_tune-armv8atb-crc-fp-armv8-neon        = "${TUNE_FEATURES_tune-armv8atb-fp-armv8-neon}        crc"
+TUNE_FEATURES_tune-armv8ab-crc-crypto-fp-armv8-neon  = "${TUNE_FEATURES_tune-armv8ab-crypto-fp-armv8-neon}  crc"
+TUNE_FEATURES_tune-armv8atb-crc-crypto-fp-armv8-neon = "${TUNE_FEATURES_tune-armv8atb-crypto-fp-armv8-neon} crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc                       = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab} armv8ab-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc                      = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb} armv8ab-crc armv8at2b-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc-neon                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab-neon} armv8ab-crc-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc-neon                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb-neon} armv8ab-crc-neon armv8at2b-crc-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc-vfpv4                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab-vfpv4} armv8ab-crc-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc-vfpv4                = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb-vfpv4} armv8ab-crc-vfpv4 armv8at2b-crc-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc-vfpv4-neon            = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab-vfpv4-neon} armv8ab-crc-neon armv8ab-crc-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc-vfpv4-neon           = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb-vfpv4-neon} armv8ab-crc-neon armv8at2b-crc-neon armv8ab-crc-vfpv4-neon armv8at2b-crc-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc-fp-armv8              = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab-fp-armv8} armv8ab-crc-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc-fp-armv8             = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb-fp-armv8} armv8ab-crc-fp-armv8 armv8at2b-crc-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc-fp-armv8-neon         = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab-fp-armv8-neon} armv8ab-crc-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc-fp-armv8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb-fp-armv8-neon} armv8ab-crc-fp-armv8-neon armv8at2b-crc-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc-crypto-fp-armv8-neon  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ab-crypto-fp-armv8-neon} armv8ab-crc-crypto-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc-crypto-fp-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8atb-crypto-fp-armv8-neon} armv8ab-crc-crypto-fp-armv8-neon armv8at2b-crc-crypto-fp-armv8-neon"
+
+# Big Endian + HF
+AVAILTUNES += "armv8ahfb armv8athfb armv8ahfb-neon armv8athfb-neon armv8ahfb-vfpv4 armv8athfb-vfpv4 armv8ahfb-vfpv4-neon armv8athfb-vfpv4-neon armv8ahfb-fp-armv8 armv8athfb-fp-armv8 armv8ahfb-fp-armv8-neon armv8athfb-fp-armv8-neon armv8ahfb-crypto-fp-armv8-neon armv8athfb-crypto-fp-armv8-neon"
+ARMPKGARCH_tune-armv8ahfb                       ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb                      ?= "armv8a"
+ARMPKGARCH_tune-armv8ahfb-neon                  ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-neon                 ?= "armv8a"
+ARMPKGARCH_tune-armv8ahfb-vfpv4                 ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-vfpv4                ?= "armv8a"
+ARMPKGARCH_tune-armv8ahfb-vfpv4-neon            ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-vfpv4-neon           ?= "armv8a"
+ARMPKGARCH_tune-armv8ahfb-fp-armv8              ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-fp-armv8             ?= "armv8a"
+ARMPKGARCH_tune-armv8ahfb-fp-armv8-neon         ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-fp-armv8-neon        ?= "armv8a"
+ARMPKGARCH_tune-armv8ahfb-crypto-fp-armv8-neon  ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-crypto-fp-armv8-neon ?= "armv8a"
+TUNE_FEATURES_tune-armv8ahfb                       = "${TUNE_FEATURES_tune-armv8ab}                       callconvention-hard"
+TUNE_FEATURES_tune-armv8athfb                      = "${TUNE_FEATURES_tune-armv8atb}                      callconvention-hard"
+TUNE_FEATURES_tune-armv8ahfb-neon                  = "${TUNE_FEATURES_tune-armv8ab-neon}                  callconvention-hard"
+TUNE_FEATURES_tune-armv8athfb-neon                 = "${TUNE_FEATURES_tune-armv8atb-neon}                 callconvention-hard"
+TUNE_FEATURES_tune-armv8ahfb-vfpv4                 = "${TUNE_FEATURES_tune-armv8ab-vfpv4}                 callconvention-hard"
+TUNE_FEATURES_tune-armv8athfb-vfpv4                = "${TUNE_FEATURES_tune-armv8atb-vfpv4}                callconvention-hard"
+TUNE_FEATURES_tune-armv8ahfb-vfpv4-neon            = "${TUNE_FEATURES_tune-armv8ab-vfpv4-neon}            callconvention-hard"
+TUNE_FEATURES_tune-armv8athfb-vfpv4-neon           = "${TUNE_FEATURES_tune-armv8atb-vfpv4-neon}           callconvention-hard"
+TUNE_FEATURES_tune-armv8ahfb-fp-armv8              = "${TUNE_FEATURES_tune-armv8ab-fp-armv8}              callconvention-hard"
+TUNE_FEATURES_tune-armv8athfb-fp-armv8             = "${TUNE_FEATURES_tune-armv8atb-fp-armv8}             callconvention-hard"
+TUNE_FEATURES_tune-armv8ahfb-fp-armv8-neon         = "${TUNE_FEATURES_tune-armv8ab-fp-armv8-neon}         callconvention-hard"
+TUNE_FEATURES_tune-armv8athfb-fp-armv8-neon        = "${TUNE_FEATURES_tune-armv8atb-fp-armv8-neon}        callconvention-hard"
+TUNE_FEATURES_tune-armv8ahfb-crypto-fp-armv8-neon  = "${TUNE_FEATURES_tune-armv8ab-crypto-fp-armv8-neon}  callconvention-hard"
+TUNE_FEATURES_tune-armv8athfb-crypto-fp-armv8-neon = "${TUNE_FEATURES_tune-armv8atb-crypto-fp-armv8-neon} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb                       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb} armv8ab armv8ahfb"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb                      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv8ab armv8ahfb armv8at2hfb"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-neon                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb} armv8ahfb-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-neon                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb} armv8ahfb-neon armv8at2hfb-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-vfpv4                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb} armv8ahfb-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-vfpv4                = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb} armv8ahfb-vfpv4 armv8at2hfb-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-vfpv4-neon            = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-vfpv4} armv8ahfb-neon armv8ahfb-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-vfpv4-neon           = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-vfpv4} armv8ahfb-neon armv8at2hfb-neon armv8ahfb-neon-vfpv4 armv8at2hfb-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-fp-armv8              = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb} armv8ahfb-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-fp-armv8             = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb} armv8ahfb-fp-armv8 armv8at2hfb-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-fp-armv8-neon         = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-fp-armv8} armv8ahfb-neon armv8ahfb-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-fp-armv8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-fp-armv8} armv8ahfb-neon armv8at2hfb-neon armv8ahfb-fp-armv8-neon armv8at2hfb-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crypto-fp-armv8-neon  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-fp-armv8-neon} armv8ahfb-crypto-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crypto-fp-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-fp-armv8-neon} armv8ahfb-crypto-fp-armv8-neon armv8at2hfb-crypto-fp-armv8-neon"
+
+# Big Endian + HF + CRC
+AVAILTUNES += "armv8ahfb-crc armv8athfb-crc armv8ahfb-crc-neon armv8athfb-crc-neon armv8ahfb-crc-vfpv4 armv8athfb-crc-vfpv4 armv8ahfb-crc-vfpv4-neon armv8athfb-crc-vfpv4-neon armv8ahfb-crc-fp-armv8 armv8athfb-crc-fp-armv8 armv8ahfb-crc-fp-armv8-neon armv8athfb-crc-fp-armv8-neon armv8ahfb-crc-crypto-fp-armv8-neon armv8athfb-crc-crypto-fp-armv8-neon"
+ARMPKGARCH_tune-armv8ahfb-crc                       ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-crc                      ?= "armv8a"
+ARMPKGARCH_tune-armv8ahfb-crc-neon                  ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-crc-neon                 ?= "armv8a"
+ARMPKGARCH_tune-armv8ahfb-crc-vfpv4                 ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-crc-vfpv4                ?= "armv8a"
+ARMPKGARCH_tune-armv8ahfb-crc-vfpv4-neon            ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-crc-vfpv4-neon           ?= "armv8a"
+ARMPKGARCH_tune-armv8ahfb-crc-fp-armv8              ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-crc-fp-armv8             ?= "armv8a"
+ARMPKGARCH_tune-armv8ahfb-crc-fp-armv8-neon         ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-crc-fp-armv8-neon        ?= "armv8a"
+ARMPKGARCH_tune-armv8ahfb-crc-crypto-fp-armv8-neon  ?= "armv8a"
+ARMPKGARCH_tune-armv8athfb-crc-crypto-fp-armv8-neon ?= "armv8a"
+TUNE_FEATURES_tune-armv8ahfb-crc                       = "${TUNE_FEATURES_tune-armv8ahfb}                       crc"
+TUNE_FEATURES_tune-armv8athfb-crc                      = "${TUNE_FEATURES_tune-armv8athfb}                      crc"
+TUNE_FEATURES_tune-armv8ahfb-crc-neon                  = "${TUNE_FEATURES_tune-armv8ahfb-neon}                  crc"
+TUNE_FEATURES_tune-armv8athfb-crc-neon                 = "${TUNE_FEATURES_tune-armv8athfb-neon}                 crc"
+TUNE_FEATURES_tune-armv8ahfb-crc-vfpv4                 = "${TUNE_FEATURES_tune-armv8ahfb-vfpv4}                 crc"
+TUNE_FEATURES_tune-armv8athfb-crc-vfpv4                = "${TUNE_FEATURES_tune-armv8athfb-vfpv4}                crc"
+TUNE_FEATURES_tune-armv8ahfb-crc-vfpv4-neon            = "${TUNE_FEATURES_tune-armv8ahfb-vfpv4-neon}            crc"
+TUNE_FEATURES_tune-armv8athfb-crc-vfpv4-neon           = "${TUNE_FEATURES_tune-armv8athfb-vfpv4-neon}           crc"
+TUNE_FEATURES_tune-armv8ahfb-crc-fp-armv8              = "${TUNE_FEATURES_tune-armv8ahfb-fp-armv8}              crc"
+TUNE_FEATURES_tune-armv8athfb-crc-fp-armv8             = "${TUNE_FEATURES_tune-armv8athfb-fp-armv8}             crc"
+TUNE_FEATURES_tune-armv8ahfb-crc-fp-armv8-neon         = "${TUNE_FEATURES_tune-armv8ahfb-fp-armv8-neon}         crc"
+TUNE_FEATURES_tune-armv8athfb-crc-fp-armv8-neon        = "${TUNE_FEATURES_tune-armv8athfb-fp-armv8-neon}        crc"
+TUNE_FEATURES_tune-armv8ahfb-crc-crypto-fp-armv8-neon  = "${TUNE_FEATURES_tune-armv8ahfb-crypto-fp-armv8-neon}  crc"
+TUNE_FEATURES_tune-armv8athfb-crc-crypto-fp-armv8-neon = "${TUNE_FEATURES_tune-armv8athfb-crypto-fp-armv8-neon} crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc                       = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb} armv8ahfb-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc                      = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb} armv8ahfb-crc armv8at2hfb-crc"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc-neon                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-neon} armv8ahfb-crc-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc-neon                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-neon} armv8ahfb-crc-neon armv8at2hfb-crc-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc-vfpv4                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-vfpv4} armv8ahfb-crc-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc-vfpv4                = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-vfpv4} armv8ahfb-crc-vfpv4 armv8at2hfb-crc-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc-vfpv4-neon            = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-vfpv4-neon} armv8ahfb-crc-neon armv8ahfb-crc-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc-vfpv4-neon           = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-vfpv4-neon} armv8ahfb-crc-neon armv8at2hfb-crc-neon armv8ahfb-crc-vfpv4-neon armv8at2hfb-crc-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc-fp-armv8              = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-fp-armv8} armv8ahfb-crc-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc-fp-armv8             = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-fp-armv8} armv8ahfb-crc-fp-armv8 armv8at2hfb-crc-fp-armv8"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc-fp-armv8-neon         = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-fp-armv8-neon} armv8ahfb-crc-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc-fp-armv8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-fp-armv8-neon} armv8ahfb-crc-fp-armv8-neon armv8at2hfb-crc-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc-crypto-fp-armv8-neon  = "${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crypto-fp-armv8-neon} armv8ahfb-crc-crypto-fp-armv8-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc-crypto-fp-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crypto-fp-armv8-neon} armv8ahfb-crc-crypto-fp-armv8-neon armv8at2hfb-crc-crypto-fp-armv8-neon"
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 1faebf7..36bb510 100644
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


