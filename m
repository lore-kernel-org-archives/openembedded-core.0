Return-Path: <adraszik@digisoft.tv>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 34FF660962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 13:14:32 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so64979227wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 06:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=OqBC4Ht/Z55m23sAfJeWYb0k69fi3iXlznSS8qpszg4=;
	b=mJ2g3SL2S7dfiZc21PuqOSX+lGfThpqLlFQywpkC5g1QC7/RjrC3L05KwwgAWP+//3
	e8xElvwsVmU8lW96VtXyiK4zjONYEU4bn5aEa3P6HKFYCUTmegIR1qh71J6NOxte+KCk
	NNXZwgh/pcowfQkRkNTjn2iP7jhe23i4qgQlTRCAHSxCXQpNurWFsjP7UVUFTUtx1KHC
	rMFZIeA5cytEFPZu0vbgG7SBuqGRkIhEK4C0wizqECussLUa3KfcvoUkaPn5Z0y8eU32
	toOmxN1b7kaKrVHEuBcJ6LsfP1tRz65cSkktABsxCSegRWfA8CuS7K5XWIBt4fhDamPH
	Mn4w==
X-Gm-Message-State: ALoCoQmZPjXoI17jNMzHwLxN7dVtTjYvRAMlNmRMZGLhq0tdfla16LPVIr7DW+k6hMWxMKs9XUBu
X-Received: by 10.180.12.148 with SMTP id y20mr6816462wib.80.1437743671976;
	Fri, 24 Jul 2015 06:14:31 -0700 (PDT)
Received: from bri0771.fritz.box (31-187-15-27.dynamic.upc.ie. [31.187.15.27])
	by smtp.gmail.com with ESMTPSA id
	wx9sm12628269wjb.6.2015.07.24.06.14.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jul 2015 06:14:31 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@digisoft.tv>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 14:14:30 +0100
Message-Id: <1437743670-27399-1-git-send-email-adraszik@digisoft.tv>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] arch-armv7a.inc, feature-arm-vfp.inc: add tunes for vfpv3 and vfpv3d16
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
X-List-Received-Date: Fri, 24 Jul 2015 13:14:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <git@andred.net>

This adds tunes for ARM's v3 Vector Floating Point unit for
16 and 32 bit implementation:
http://www.arm.com/products/processors/technologies/vector-floating-point.php

See also https://wiki.debian.org/ArmHardFloatPort/VfpComparison
for a nice comparison and why vfpv3d16 is useful.
---
 meta/conf/machine/include/arm/arch-armv7a.inc     | 56 +++++++++++++++++++++--
 meta/conf/machine/include/arm/feature-arm-vfp.inc |  8 ++++
 2 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 39f5e2b..d3b6f64 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -9,67 +9,115 @@ require conf/machine/include/arm/arch-armv6.inc
 require conf/machine/include/arm/feature-arm-neon.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv7a armv7at armv7a-neon armv7at-neon"
+AVAILTUNES += "armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16 armv7a-vfpv3 armv7at-vfpv3 armv7a-neon armv7at-neon"
 ARMPKGARCH_tune-armv7a ?= "armv7a"
 ARMPKGARCH_tune-armv7at ?= "armv7a"
+ARMPKGARCH_tune-armv7a-vfpv3d16 ?= "armv7a"
+ARMPKGARCH_tune-armv7at-vfpv3d16 ?= "armv7a"
+ARMPKGARCH_tune-armv7a-vfpv3 ?= "armv7a"
+ARMPKGARCH_tune-armv7at-vfpv3 ?= "armv7a"
 ARMPKGARCH_tune-armv7a-neon?= "armv7a"
 ARMPKGARCH_tune-armv7at-neon ?= "armv7a"
 TUNE_FEATURES_tune-armv7a ?= "arm armv7a vfp"
 TUNE_FEATURES_tune-armv7at ?= "${TUNE_FEATURES_tune-armv7a} thumb"
+TUNE_FEATURES_tune-armv7a-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7a} vfpv3d16"
+TUNE_FEATURES_tune-armv7at-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7at} vfpv3d16"
+TUNE_FEATURES_tune-armv7a-vfpv3 ?= "${TUNE_FEATURES_tune-armv7a-vfpv3d16} vfpv3"
+TUNE_FEATURES_tune-armv7at-vfpv3 ?= "${TUNE_FEATURES_tune-armv7at-vfpv3d16} vfpv3"
 TUNE_FEATURES_tune-armv7a-neon ?= "${TUNE_FEATURES_tune-armv7a} neon"
 TUNE_FEATURES_tune-armv7at-neon ?= "${TUNE_FEATURES_tune-armv7at} neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7a = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7a armv7a-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16} armv7a-vfp-vfpv3d16-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7a-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7a armv7a-vfp armv7at2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-vfpv3d16 armv7at2-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} armv7a-vfp-vfpv3d16-vfpv3 armv7at2-vfp-vfpv3d16-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
 
 # VFP Tunes
-AVAILTUNES += "armv7ahf armv7athf armv7ahf-neon armv7athf-neon armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4"
+AVAILTUNES += "armv7ahf armv7athf armv7ahf-vfpv3d16 armv7athf-vfpv3d16 armv7ahf-vfpv3 armv7athf-vfpv3 armv7ahf-neon armv7athf-neon armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4"
 ARMPKGARCH_tune-armv7ahf ?= "armv7a"
 ARMPKGARCH_tune-armv7athf ?= "armv7a"
+ARMPKGARCH_tune-armv7ahf-vfpv3d16 ?= "armv7a"
+ARMPKGARCH_tune-armv7athf-vfpv3d16 ?= "armv7a"
+ARMPKGARCH_tune-armv7ahf-vfpv3 ?= "armv7a"
+ARMPKGARCH_tune-armv7athf-vfpv3 ?= "armv7a"
 ARMPKGARCH_tune-armv7ahf-neon?= "armv7a"
 ARMPKGARCH_tune-armv7athf-neon ?= "armv7a"
 ARMPKGARCH_tune-armv7ahf-neon-vfpv4 ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-neon-vfpv4 ?= "armv7a"
 TUNE_FEATURES_tune-armv7ahf ?= "${TUNE_FEATURES_tune-armv7a} callconvention-hard"
 TUNE_FEATURES_tune-armv7athf ?= "${TUNE_FEATURES_tune-armv7at} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7a-vfpv3d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7at-vfpv3d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-vfpv3 ?= "${TUNE_FEATURES_tune-armv7a-vfpv3} callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-vfpv3 ?= "${TUNE_FEATURES_tune-armv7at-vfpv3} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahf-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
 TUNE_FEATURES_tune-armv7athf-neon ?= "${TUNE_FEATURES_tune-armv7at-neon} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7ahf-neon} vfpv4"
 TUNE_FEATURES_tune-armv7athf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon} vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf} armv7ahf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-vfpv3d16 armv7at2hf-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16} armv7ahf-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} armv7ahf-vfp-vfpv3d16-vfpv3 armv7at2hf-vfp-vfpv3d16-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon armv7at2hf-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-vfp-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-vfp-neon-vfpv4 armv7at2hf-vfp-neon-vfpv4"
 
 # Big Endian
-AVAILTUNES += "armv7ab armv7atb armv7ab-neon armv7atb-neon"
+AVAILTUNES += "armv7ab armv7atb armv7ab-vfpv3d16 armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3 armv7ab-neon armv7atb-neon"
 ARMPKGARCH_tune-armv7ab ?= "armv7a"
 ARMPKGARCH_tune-armv7atb ?= "armv7a"
+ARMPKGARCH_tune-armv7ab-vfpv3d16 ?= "armv7a"
+ARMPKGARCH_tune-armv7atb-vfpv3d16 ?= "armv7a"
+ARMPKGARCH_tune-armv7ab-vfpv3 ?= "armv7a"
+ARMPKGARCH_tune-armv7atb-vfpv3 ?= "armv7a"
 ARMPKGARCH_tune-armv7ab-neon?= "armv7a"
 ARMPKGARCH_tune-armv7atb-neon ?= "armv7a"
 TUNE_FEATURES_tune-armv7ab ?= "${TUNE_FEATURES_tune-armv7a} bigendian"
 TUNE_FEATURES_tune-armv7atb ?= "${TUNE_FEATURES_tune-armv7at} bigendian"
+TUNE_FEATURES_tune-armv7ab-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7a-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7atb-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7at-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7ab-vfpv3 ?= "${TUNE_FEATURES_tune-armv7a-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7atb-vfpv3 ?= "${TUNE_FEATURES_tune-armv7at-vfpv3} bigendian"
 TUNE_FEATURES_tune-armv7ab-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} bigendian"
 TUNE_FEATURES_tune-armv7atb-neon ?= "${TUNE_FEATURES_tune-armv7at-neon} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab = "${PACKAGE_EXTRA_ARCHS_tune-armv6b} armv7ab-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7ab-vfp armv7at2b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-vfp-vfpv3d16 armv7at2b-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16} armv7ab-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16} armv7ab-vfp-vfpv3d16-vfpv3 armv7at2b-vfp-vfpv3d16-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfp-neon armv7at2b-vfp-neon"
 
 # Big Endian + VFP
-AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-neon armv7athfb-neon"
+AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-vfpv3d16 armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3 armv7ahfb-neon armv7athfb-neon"
 ARMPKGARCH_tune-armv7ahfb ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb ?= "armv7a"
+ARMPKGARCH_tune-armv7ahfb-vfpv3d16 ?= "armv7a"
+ARMPKGARCH_tune-armv7athfb-vfpv3d16 ?= "armv7a"
+ARMPKGARCH_tune-armv7ahfb-vfpv3 ?= "armv7a"
+ARMPKGARCH_tune-armv7athfb-vfpv3 ?= "armv7a"
 ARMPKGARCH_tune-armv7ahfb-neon?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-neon ?= "armv7a"
 TUNE_FEATURES_tune-armv7ahfb ?= "${TUNE_FEATURES_tune-armv7ahf} bigendian"
 TUNE_FEATURES_tune-armv7athfb ?= "${TUNE_FEATURES_tune-armv7athf} bigendian"
+TUNE_FEATURES_tune-armv7ahfb-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7ahf-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7athfb-vfpv3d16 ?= "${TUNE_FEATURES_tune-armv7athf-vfpv3d16} bigendian"
+TUNE_FEATURES_tune-armv7ahfb-vfpv3 ?= "${TUNE_FEATURES_tune-armv7ahf-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7athfb-vfpv3 ?= "${TUNE_FEATURES_tune-armv7athf-vfpv3} bigendian"
 TUNE_FEATURES_tune-armv7ahfb-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} bigendian"
 TUNE_FEATURES_tune-armv7athfb-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb} armv7ahfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7ahfb-vfp armv7at2hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-vfpv3d16 armv7at2hfb-vfp-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16} armv7ahfb-vfp-vfpv3d16-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16} armv7ahfb-vfp-vfpv3d16-vfpv3 armv7at2hfb-vfp-vfpv3d16-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-neon armv7at2hfb-vfp-neon"
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 13927ff..3dfbeac 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -1,6 +1,14 @@
 TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
 ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp", "" ,d)}"
 
+TUNEVALID[vfpv3d16] = "Enable Vector Floating Point Version 3 with 16 registers (vfpv3-d16) unit."
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16", " -mfpu=vfpv3-d16", "", d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16", "-vfpv3d16", "" ,d)}"
+
+TUNEVALID[vfpv3] = "Enable Vector Floating Point Version 3 with 32 registers (vfpv3) unit."
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", " -mfpu=vfpv3", "", d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", "-vfpv3", "" ,d)}"
+
 TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
 ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv4", "-vfpv4", "" ,d)}"
 
-- 
2.1.4


