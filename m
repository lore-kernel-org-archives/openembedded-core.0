Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 745B86010D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 18:37:10 +0000 (UTC)
Received: by wmww144 with SMTP id w144so209353608wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 10:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3Eo003PXY/ZzfGX/h27Go8AkXU2piBr8J+DmgiLUMnY=;
	b=ITEeb7zAu9P8FAfEcjsv/sjB6SyVAWW0qyzkTH/wzqUM4r1bR5Qt2u7KeU7avq4ulV
	NlAHnTZVtcMiCBIdXLYlcwGnayrhIXsv9boOWxEwYY/sufW6xhGbNbbg0VfsgKzwSMUr
	/Den+SZNE71myIlWM8aAvFtTaQ4lVX4hpVb//OMHZuXS3bxCSd5OeOqcTzdjSw86EvJl
	6FhsujN/5dkcb2ZrED5Lf+bXdWnHnJSTTDEu7cn5zVfpMu0KYkanwBCqu2XPqWBa3toU
	uyhoKf19V5+kP1md0Y1geO1+plC+ZSxQ+6hPUg2COZ3dLx0snrpoIkI4wcCo9Oq5zZHS
	/6mQ==
X-Received: by 10.194.116.167 with SMTP id jx7mr3532642wjb.105.1447871831257; 
	Wed, 18 Nov 2015 10:37:11 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 186sm4556556wmv.9.2015.11.18.10.37.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Nov 2015 10:37:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 19:37:18 +0100
Message-Id: <1447871842-30347-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447871842-30347-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447864860.1472.56.camel@pbcl.net>
	<1447871842-30347-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv3 2/6] cortexa{7,15,17}: add VFPv4 tunes
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
X-List-Received-Date: Wed, 18 Nov 2015 18:37:11 -0000

* it was added only to hf cortexa7 in:
  commit e97d152ca13556b41a236c1a4cfb11e77ff857d7
  Author: Kristof Robot <krirobo@gmail.com>
  Date:   Sun Jan 26 10:03:56 2014 +0100

      Add Cortex A7 support for NEONv2 & FPv4

* add it to softfp cortexa7 and both versions for cortexa15 and
  cortexa17 tunes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-cortexa15.inc | 18 +++++++++++++++---
 meta/conf/machine/include/tune-cortexa17.inc | 18 +++++++++++++++---
 meta/conf/machine/include/tune-cortexa7.inc  | 10 ++++++++--
 3 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 802161a..b2d7ce5 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -6,31 +6,43 @@ TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mtune=cortex-a15', '', d)}"
 
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
index e4d69a0..5b8710b 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -6,31 +6,43 @@ TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mtune=cortex-a17', '', d)}"
 
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
index fa4d722..b97fa00 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -6,21 +6,27 @@ TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mtune=cortex-a7', '', d)}"
 
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
2.6.3


