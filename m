Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJlc0-0000Ua-4S
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 15:37:12 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so310231wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 06:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3af9ZIyk8grA72p3t6KImw+7wSObgVYhx4Fr5Ojh5Y0=;
	b=IkLbhXM5LIWpdt9W7LDtk1yNeUUC58VJhegFtjDnliawzEIQnB2cFHDqoOVtKDRjfc
	nzFoiuphQ+PF52hozMZM2SOUFBmPJn/vFMaX00wefjfX/ibGdwX+qj3AsfveB6EJHBta
	wXU0JoXaYkAFZ5EblU9OtkU4xB10rEmV9iTD4EEZPIO+dULPFR0lbfMyS3zdWeXK8E2U
	eUIobEYXNKETAYA+DhLLKK/J9p4DeBVuJAteXcrCGG8zDsPBT3dj3mN/5Tgaa0aNRsUP
	grMOMOIm97u0GPskzIItyBo2mz9CHzWiZAeB0XZVr6Mq1Lr87y1+/dZAJocgQ4wD2HyF
	xTaA==
Received: by 10.180.91.71 with SMTP id cc7mr13030509wib.2.1349357053436;
	Thu, 04 Oct 2012 06:24:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm319309wie.0.2012.10.04.06.24.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 06:24:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2012 15:23:38 +0200
Message-Id: <ee0eba2c5d76dffd368bbcbb8efad0d844d694d3.1349356755.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<cover.1349356755.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1349356755.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/7] arm/arch-arm*: define ARMPKGARCH_tune-* for default tunes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 13:37:12 -0000

* tune-foo is not valid override, for it to work I had to add
  ARMPKGARCH = "${ARMPKGARCH_tune-${DEFAULTTUNE}}"
  but that doesn't work without value defined for every supported
  DEFAULTTUNE value, otherwise it's expanded like this
  TUNE_PKGARCH (${ARMPKGARCH_tune-armv5te}te).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-arm.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv4.inc     |  6 ++++--
 meta/conf/machine/include/arm/arch-armv5-dsp.inc | 12 ++++++++++++
 meta/conf/machine/include/arm/arch-armv5.inc     | 14 ++++++++++++--
 meta/conf/machine/include/arm/arch-armv6.inc     | 10 ++++++++--
 meta/conf/machine/include/arm/arch-armv7a.inc    | 18 ++++++++++++++++--
 6 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index da51044..90b80c4 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -1,7 +1,7 @@
 
 TUNEVALID[bigendian] = "Enable big-endian mode."
 
-ARMPKGARCH ??= "arm"
+ARMPKGARCH = "${ARMPKGARCH_tune-${DEFAULTTUNE}}"
 ARMPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "b", "", d)}"
 ARMPKGSFX_FPU ??= ""
 ARMPKGSFX_DSP ??= ""
diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index cb747ac..07e8eec 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -1,7 +1,5 @@
 DEFAULTTUNE ?= "armv4"
 
-ARMPKGARCH ?= "armv4"
-
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}"
 TARGET_LD_KERNEL_ARCH += "${@bb.utils.contains("TUNE_FEATURES", "armv4", "--fix-v4bx", "", d)}"
@@ -12,6 +10,8 @@ require conf/machine/include/arm/feature-arm-thumb.inc
 
 # Little Endian
 AVAILTUNES += "armv4 armv4t"
+ARMPKGARCH_tune-armv4 ?= "armv4"
+ARMPKGARCH_tune-armv4t ?= "armv4"
 TUNE_FEATURES_tune-armv4 ?= "armv4"
 TUNE_FEATURES_tune-armv4t ?= "armv4 thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv4 = "arm armv4"
@@ -19,6 +19,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv4t = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4t"
 
 # Big Endian
 AVAILTUNES += "armv4b armv4tb"
+ARMPKGARCH_tune-armv4b ?= "armv4"
+ARMPKGARCH_tune-armv4tb ?= "armv4"
 TUNE_FEATURES_tune-armv4b ?= "${TUNE_FEATURES_tune-armv4} bigendian"
 TUNE_FEATURES_tune-armv4tb ?= "${TUNE_FEATURES_tune-armv4t} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv4b = "armeb armv4b"
diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
index 0f64562..0ae6411 100644
--- a/meta/conf/machine/include/arm/arch-armv5-dsp.inc
+++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
@@ -5,6 +5,8 @@ require conf/machine/include/arm/arch-armv5.inc
 
 # Little Endian
 AVAILTUNES += "armv5e armv5te"
+ARMPKGARCH_tune-armv5e ?= "armv5"
+ARMPKGARCH_tune-armv5te ?= "armv5"
 TUNE_FEATURES_tune-armv5e ?= "armv5 dsp"
 TUNE_FEATURES_tune-armv5te ?= "armv5 dsp thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv5e = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5e"
@@ -12,6 +14,10 @@ PACKAGE_EXTRA_ARCHS_tune-armv5te = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5e ar
 
 # Little Endian + VFP/DSP
 AVAILTUNES += "armv5e-vfp armv5te-vfp armv5ehf-vfp armv5tehf-vfp"
+ARMPKGARCH_tune-armv5e-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5te-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5ehf-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5tehf-vfp ?= "armv5"
 TUNE_FEATURES_tune-armv5e-vfp ?= "armv5 vfp dsp"
 TUNE_FEATURES_tune-armv5te-vfp ?= "armv5 vfp dsp thumb"
 TUNE_FEATURES_tune-armv5ehf-vfp ?= "${TUNE_FEATURES_tune-armv5e-vfp} callconvention-hard"
@@ -23,6 +29,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vf
 
 # Big Endian
 AVAILTUNES += "armv5eb armv5teb"
+ARMPKGARCH_tune-armv5eb ?= "armv5"
+ARMPKGARCH_tune-armv5teb ?= "armv5"
 TUNE_FEATURES_tune-armv5eb ?= "${TUNE_FEATURES_tune-armv5e} bigendian"
 TUNE_FEATURES_tune-armv5teb ?= "${TUNE_FEATURES_tune-armv5te} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv5eb = "${PACKAGE_EXTRA_ARCHS_tune-armv5b} armv5eb"
@@ -30,6 +38,10 @@ PACKAGE_EXTRA_ARCHS_tune-armv5teb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tb} armv5eb
 
 # Big Endian + VFP/DSP
 AVAILTUNES += "armv5eb-vfp armv5teb-vfp armv5ehfb-vfp armv5tehfb-vfp"
+ARMPKGARCH_tune-armv5eb-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5teb-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5ehfb-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5tehfb-vfp ?= "armv5"
 TUNE_FEATURES_tune-armv5eb-vfp ?= "${TUNE_FEATURES_tune-armv5e-vfp} bigendian"
 TUNE_FEATURES_tune-armv5teb-vfp ?= "${TUNE_FEATURES_tune-armv5te-vfp} bigendian"
 TUNE_FEATURES_tune-armv5ehfb-vfp ?= "${TUNE_FEATURES_tune-armv5eb-vfp} callconvention-hard"
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 98780e5..5ed56bc 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -1,7 +1,5 @@
 DEFAULTTUNE ?= "armv5"
 
-ARMPKGARCH ?= "armv5"
-
 TUNEVALID[armv5] = "Enable instructions for ARMv5"
 TUNECONFLICTS[armv5] = "armv4"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}"
@@ -14,6 +12,8 @@ require conf/machine/include/arm/feature-arm-vfp.inc
 
 # Little Endian
 AVAILTUNES += "armv5 armv5t"
+ARMPKGARCH_tune-armv5 ?= "armv5"
+ARMPKGARCH_tune-armv5t ?= "armv5"
 TUNE_FEATURES_tune-armv5 ?= "armv5"
 TUNE_FEATURES_tune-armv5t ?= "armv5 thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv5 = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5"
@@ -21,6 +21,10 @@ PACKAGE_EXTRA_ARCHS_tune-armv5t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5 armv
 
 # Little Endian + VFP/DSP
 AVAILTUNES += "armv5-vfp armv5t-vfp armv5hf-vfp armv5thf-vfp"
+ARMPKGARCH_tune-armv5-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5t-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5hf-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5thf-vfp ?= "armv5"
 TUNE_FEATURES_tune-armv5-vfp ?= "armv5 vfp"
 TUNE_FEATURES_tune-armv5t-vfp ?= "armv5 vfp"
 TUNE_FEATURES_tune-armv5hf-vfp ?= "${TUNE_FEATURES_tune-armv5-vfp} callconvention-hard"
@@ -33,6 +37,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5thf-vf
 
 # Big Endian
 AVAILTUNES += "armv5b armv5tb"
+ARMPKGARCH_tune-armv5b ?= "armv5"
+ARMPKGARCH_tune-armv5tb ?= "armv5"
 TUNE_FEATURES_tune-armv5b ?= "${TUNE_FEATURES_tune-armv5} bigendian"
 TUNE_FEATURES_tune-armv5tb ?= "${TUNE_FEATURES_tune-armv5t} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv5b = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5b"
@@ -40,6 +46,10 @@ PACKAGE_EXTRA_ARCHS_tune-armv5tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5b ar
 
 # Big Endian + VFP/DSP
 AVAILTUNES += "armv5b-vfp armv5tb-vfp armv5hfb-vfp armv5thfb-vfp"
+ARMPKGARCH_tune-armv5b-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5tb-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5hfb-vfp ?= "armv5"
+ARMPKGARCH_tune-armv5thfb-vfp ?= "armv5"
 TUNE_FEATURES_tune-armv5b-vfp ?= "${TUNE_FEATURES_tune-armv5-vfp} bigendian"
 TUNE_FEATURES_tune-armv5tb-vfp ?= "${TUNE_FEATURES_tune-armv5t-vfp} bigendian"
 TUNE_FEATURES_tune-armv5hfb-vfp ?= "${TUNE_FEATURES_tune-armv5b-vfp} callconvention-hard"
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index f0fee93..451a008 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -1,7 +1,5 @@
 DEFAULTTUNE ?= "armv6"
 
-ARMPKGARCH ?= "armv6"
-
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNECONFLICTS[armv6] = "armv4 armv5"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv6", "-march=armv6", "", d)}"
@@ -11,6 +9,10 @@ require conf/machine/include/arm/arch-armv5-dsp.inc
 
 # Little Endian
 AVAILTUNES += "armv6 armv6t armv6hf armv6thf"
+ARMPKGARCH_tune-armv6 ?= "armv6"
+ARMPKGARCH_tune-armv6t ?= "armv6"
+ARMPKGARCH_tune-armv6hf ?= "armv6"
+ARMPKGARCH_tune-armv6thf ?= "armv6"
 TUNE_FEATURES_tune-armv6 ?= "armv6 vfp"
 TUNE_FEATURES_tune-armv6t ?= "armv6 vfp thumb"
 TUNE_FEATURES_tune-armv6hf ?= "${TUNE_FEATURES_tune-armv6} callconvention-hard"
@@ -22,6 +24,10 @@ PACKAGE_EXTRA_ARCHS_tune-armv6thf = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp} a
 
 # Big Endian
 AVAILTUNES += "armv6b armv6tb armv6hfb armv6thfb"
+ARMPKGARCH_tune-armv6b ?= "armv6"
+ARMPKGARCH_tune-armv6tb ?= "armv6"
+ARMPKGARCH_tune-armv6hfb ?= "armv6"
+ARMPKGARCH_tune-armv6thfb ?= "armv6"
 TUNE_FEATURES_tune-armv6b ?= "${TUNE_FEATURES_tune-armv6} bigendian"
 TUNE_FEATURES_tune-armv6tb ?= "${TUNE_FEATURES_tune-armv6t} bigendian"
 TUNE_FEATURES_tune-armv6hfb ?= "${TUNE_FEATURES_tune-armv6b} callconvention-hard"
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 8d6ec25..d4a1d02 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -1,7 +1,5 @@
 DEFAULTTUNE ?= "armv7a"
 
-ARMPKGARCH ?= "armv7a"
-
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a", "", d)}"
@@ -12,6 +10,10 @@ require conf/machine/include/arm/feature-arm-neon.inc
 
 # Little Endian base configs
 AVAILTUNES += "armv7a armv7at armv7a-neon armv7at-neon"
+ARMPKGARCH_tune-armv7a ?= "armv7a"
+ARMPKGARCH_tune-armv7at ?= "armv7a"
+ARMPKGARCH_tune-armv7a-neon?= "armv7a"
+ARMPKGARCH_tune-armv7at-neon ?= "armv7a"
 TUNE_FEATURES_tune-armv7a ?= "armv7a vfp"
 TUNE_FEATURES_tune-armv7at ?= "armv7a vfp thumb"
 TUNE_FEATURES_tune-armv7a-neon ?= "armv7a vfp neon"
@@ -23,6 +25,10 @@ PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} arm
 
 # VFP Tunes
 AVAILTUNES += "armv7ahf armv7athf armv7ahf-neon armv7athf-neon"
+ARMPKGARCH_tune-armv7ahf ?= "armv7a"
+ARMPKGARCH_tune-armv7athf ?= "armv7a"
+ARMPKGARCH_tune-armv7ahf-neon?= "armv7a"
+ARMPKGARCH_tune-armv7athf-neon ?= "armv7a"
 TUNE_FEATURES_tune-armv7ahf ?= "${TUNE_FEATURES_tune-armv7a} callconvention-hard"
 TUNE_FEATURES_tune-armv7athf ?= "${TUNE_FEATURES_tune-armv7at} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahf-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
@@ -34,6 +40,10 @@ PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}
 
 # Big Endian
 AVAILTUNES += "armv7ab armv7atb armv7ab-neon armv7atb-neon"
+ARMPKGARCH_tune-armv7ab ?= "armv7a"
+ARMPKGARCH_tune-armv7atb ?= "armv7a"
+ARMPKGARCH_tune-armv7ab-neon?= "armv7a"
+ARMPKGARCH_tune-armv7atb-neon ?= "armv7a"
 TUNE_FEATURES_tune-armv7ab ?= "${TUNE_FEATURES_tune-armv7a} bigendian"
 TUNE_FEATURES_tune-armv7atb ?= "${TUNE_FEATURES_tune-armv7at} bigendian"
 TUNE_FEATURES_tune-armv7ab-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} bigendian"
@@ -45,6 +55,10 @@ PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} ar
 
 # Big Endian + VFP
 AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-neon armv7athfb-neon"
+ARMPKGARCH_tune-armv7ahfb ?= "armv7a"
+ARMPKGARCH_tune-armv7athfb ?= "armv7a"
+ARMPKGARCH_tune-armv7ahfb-neon?= "armv7a"
+ARMPKGARCH_tune-armv7athfb-neon ?= "armv7a"
 TUNE_FEATURES_tune-armv7ahfb ?= "${TUNE_FEATURES_tune-armv7ab} callconvention-hard"
 TUNE_FEATURES_tune-armv7athfb ?= "${TUNE_FEATURES_tune-armv7atb} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahfb-neon ?= "${TUNE_FEATURES_tune-armv7ab-neon} callconvention-hard"
-- 
1.7.12



