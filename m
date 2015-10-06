Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id EE49476660
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 13:36:53 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so165900601wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=T1Tsi96whw8H0l4CMsf090hiAl56FTowKeXfab7zcoM=;
	b=Or0PNhE6GsqS7wLehyLO/VzFQY6Se+Y7CFpmTXDVxVXKaHXcPPs+fIDhTEbDYC4Yh1
	pcFbB4oD0wr1zH2y7JAILaKzQlfPN7Cc4cIqvvmIVVQ8nI2gt2uAxHWn4UUxr4NvHOWU
	GyZh29fir8PwbMWhJcnDdoRjdfPAkN6v1HYuPG55wFGvYsyCodK4wQy0EqkoHfXAneGB
	TLlZl87Azj22P4B04gzc7EwBXCQL3KT21u2Z/5ryLJk8URFNw+O5DiArOv6teVRDDDz+
	G2WC3ayrx8gum40YpN6+8LZx9b1VYi46DVMJwe8sk6BJviw2stxfYaX8Mhw9SEVWTG5+
	y4kg==
X-Received: by 10.194.103.194 with SMTP id fy2mr35302294wjb.10.1444138613710; 
	Tue, 06 Oct 2015 06:36:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w1sm32636289wjz.37.2015.10.06.06.36.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 06:36:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Oct 2015 15:36:55 +0200
Message-Id: <1444138615-5618-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
Subject: [RFC][PATCH] cortexa{7,15,17}: add VFPv4 tunes
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
X-List-Received-Date: Tue, 06 Oct 2015 13:36:57 -0000

* it was added only to hf cortexa7 in:
  commit e97d152ca13556b41a236c1a4cfb11e77ff857d7
  Author: Kristof Robot <krirobo@gmail.com>
  Date:   Sun Jan 26 10:03:56 2014 +0100

      Add Cortex A7 support for NEONv2 & FPv4

* add it to softfp cortexa7 and both versions for cortexa15 and
  cortexa17 tunes
* we should also update Cortex-A7 and Cortex-A15, to use -march=armv7ve,
  but the problem is that oe-core has gcc-4.[89] and gcc-5.2 and gcc-4.8
  doesn't support it yet, maybe we should do this change after gcc-4.8
  is removed, for details see:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57907

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-cortexa15.inc | 18 +++++++++++++++---
 meta/conf/machine/include/tune-cortexa17.inc | 18 +++++++++++++++---
 meta/conf/machine/include/tune-cortexa7.inc  | 10 ++++++++--
 3 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 5529777..9f8ca2a 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -6,31 +6,43 @@ TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", " -mtune=cortex-a15", "", d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
+AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon cortexa15-neon-vfpv4 cortexa15t-neon-vfpv4"
 ARMPKGARCH_tune-cortexa15 = "cortexa15"
 ARMPKGARCH_tune-cortexa15t = "cortexa15"
 ARMPKGARCH_tune-cortexa15-neon = "cortexa15"
 ARMPKGARCH_tune-cortexa15t-neon = "cortexa15"
+ARMPKGARCH_tune-cortexa15-neon-vfpv4 = "cortexa15"
+ARMPKGARCH_tune-cortexa15t-neon-vfpv4 = "cortexa15"
 TUNE_FEATURES_tune-cortexa15 = "${TUNE_FEATURES_tune-armv7a} cortexa15"
 TUNE_FEATURES_tune-cortexa15t = "${TUNE_FEATURES_tune-armv7at} cortexa15"
 TUNE_FEATURES_tune-cortexa15-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa15"
 TUNE_FEATURES_tune-cortexa15t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4} cortexa15"
+TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa15"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa15-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa15-vfp cortexa15-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4} cortexa15-vfp cortexa15-vfp-neon cortexa15-vfp-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon cortexa15-vfp-vfpv4-neon cortexa15t2-vfp-vfpv4-neon"
 
-# VFP Tunes
-AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon"
+# HF Tunes
+AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon cortexa15hf-neon-vfpv4 cortexa15thf-neon-vfpv4"
 ARMPKGARCH_tune-cortexa15hf = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf = "cortexa15"
 ARMPKGARCH_tune-cortexa15hf-neon = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf-neon = "cortexa15"
+ARMPKGARCH_tune-cortexa15hf-neon-vfpv4 = "cortexa15"
+ARMPKGARCH_tune-cortexa15thf-neon-vfpv4 = "cortexa15"
 TUNE_FEATURES_tune-cortexa15hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa15"
 TUNE_FEATURES_tune-cortexa15thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa15"
 TUNE_FEATURES_tune-cortexa15hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
 TUNE_FEATURES_tune-cortexa15thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4} cortexa15"
+TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa15"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa15hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15hf-vfp-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon cortexa15hf-vfp-vfpv4-neon cortexa15t2hf-vfp-vfpv4-neon"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index bfc7126..4d92baf 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -6,31 +6,43 @@ TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa17", " -mtune=cortex-a17", "", d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon"
+AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon cortexa17-neon-vfpv4 cortexa17t-neon-vfpv4"
 ARMPKGARCH_tune-cortexa17 = "cortexa17"
 ARMPKGARCH_tune-cortexa17t = "cortexa17"
 ARMPKGARCH_tune-cortexa17-neon = "cortexa17"
 ARMPKGARCH_tune-cortexa17t-neon = "cortexa17"
+ARMPKGARCH_tune-cortexa17-neon-vfpv4 = "cortexa17"
+ARMPKGARCH_tune-cortexa17t-neon-vfpv4 = "cortexa17"
 TUNE_FEATURES_tune-cortexa17 = "${TUNE_FEATURES_tune-armv7a} cortexa17"
 TUNE_FEATURES_tune-cortexa17t = "${TUNE_FEATURES_tune-armv7at} cortexa17"
 TUNE_FEATURES_tune-cortexa17-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa17"
 TUNE_FEATURES_tune-cortexa17t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa17"
+TUNE_FEATURES_tune-cortexa17-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4} cortexa17"
+TUNE_FEATURES_tune-cortexa17t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa17"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa17-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa17-vfp cortexa17t2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa17-vfp cortexa17-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa17-vfp cortexa17-vfp-neon cortexa17t2-vfp cortexa17t2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4} cortexa17-vfp cortexa17-vfp-neon cortexa17-vfp-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa17-vfp cortexa17-vfp-neon cortexa17t2-vfp cortexa17t2-vfp-neon cortexa17-vfp-vfpv4-neon cortexa17t2-vfp-vfpv4-neon"
 
-# VFP Tunes
-AVAILTUNES += "cortexa17hf cortexa17thf cortexa17hf-neon cortexa17thf-neon"
+# HF Tunes
+AVAILTUNES += "cortexa17hf cortexa17thf cortexa17hf-neon cortexa17thf-neon cortexa17hf-neon-vfpv4 cortexa17thf-neon-vfpv4"
 ARMPKGARCH_tune-cortexa17hf = "cortexa17"
 ARMPKGARCH_tune-cortexa17thf = "cortexa17"
 ARMPKGARCH_tune-cortexa17hf-neon = "cortexa17"
 ARMPKGARCH_tune-cortexa17thf-neon = "cortexa17"
+ARMPKGARCH_tune-cortexa17hf-neon-vfpv4 = "cortexa17"
+ARMPKGARCH_tune-cortexa17thf-neon-vfpv4 = "cortexa17"
 TUNE_FEATURES_tune-cortexa17hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa17"
 TUNE_FEATURES_tune-cortexa17thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa17"
 TUNE_FEATURES_tune-cortexa17hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa17"
 TUNE_FEATURES_tune-cortexa17thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa17"
+TUNE_FEATURES_tune-cortexa17hf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4} cortexa17"
+TUNE_FEATURES_tune-cortexa17thf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa17"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa17hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa17hf-vfp cortexa17t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa17hf-vfp cortexa17hf-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa17hf-vfp cortexa17hf-vfp-neon cortexa17t2hf-vfp cortexa17t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4} cortexa17hf-vfp cortexa17hf-vfp-neon cortexa17hf-vfp-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa17hf-vfp cortexa17hf-vfp-neon cortexa17t2hf-vfp cortexa17t2hf-vfp-neon cortexa17hf-vfp-vfpv4-neon cortexa17t2hf-vfp-vfpv4-neon"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 9d06910..3648ffd 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -6,21 +6,27 @@ TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa7", " -mtune=cortex-a7", "", d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon"
+AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon cortexa7-neon-vfpv4 cortexa7t-neon-vfpv4"
 ARMPKGARCH_tune-cortexa7 = "cortexa7"
 ARMPKGARCH_tune-cortexa7t = "cortexa7"
 ARMPKGARCH_tune-cortexa7-neon = "cortexa7"
 ARMPKGARCH_tune-cortexa7t-neon = "cortexa7"
+ARMPKGARCH_tune-cortexa7-neon-vfpv4 = "cortexa7"
+ARMPKGARCH_tune-cortexa7t-neon-vfpv4 = "cortexa7"
 TUNE_FEATURES_tune-cortexa7 = "${TUNE_FEATURES_tune-armv7a} cortexa7"
 TUNE_FEATURES_tune-cortexa7t = "${TUNE_FEATURES_tune-armv7at} cortexa7"
 TUNE_FEATURES_tune-cortexa7-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa7"
 TUNE_FEATURES_tune-cortexa7t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa7"
+TUNE_FEATURES_tune-cortexa7-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4} cortexa7"
+TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa7"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa7-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa7-vfp cortexa7-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4} cortexa7-vfp cortexa7-vfp-neon cortexa7-vfp-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon cortexa7-vfp-vfpv4-neon cortexa7t2-vfp-vfpv4-neon"
 
-# VFP Tunes
+# HF Tunes
 AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
 ARMPKGARCH_tune-cortexa7hf = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf = "cortexa7"
-- 
2.6.0


