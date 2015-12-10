Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id EA52F7319A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:29 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id c201so33883210wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=QHS+07055nkQMlipSv/O33cyU4Rzzw1n92x0v8LzyJU=;
	b=Qh7dg+qA2dXQO6TV3L79t9G3lqoUFWF+Z6Q5Yg3+tW1J0ga2qnHMqMR/drA4B+ewFx
	LqqjIZb4IBthOPXG+qhBMYKkKQMuCR/JwWUYhMlGbB0aHdRHgB6mjMyjld0rYA4v4q54
	yIZuRAZ0Lpw6fy80sWp57LBh1NX0RKjY39BkVk75cZmT0mACXIMmAp6q6F1btPAfwJ+a
	YQuxfeQfFE9yFwdcq8/dc361KvY6EXL1+ENevoT9hgAV0iDXyeJUdhzJ1MVw2LSBqyxR
	DL59jYaEUshvexWRaGfQm0y0xn/rgOvcm9i0zMyyPa3DlY9FqjhQYNmFT/YKJmHaK5Bk
	2kGw==
X-Received: by 10.28.140.136 with SMTP id o130mr42212162wmd.78.1449755250597; 
	Thu, 10 Dec 2015 05:47:30 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	n127sm917907wmf.12.2015.12.10.05.47.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:50 +0100
Message-Id: <9c1c4ccefc2a644353c073f8bad208a05095af80.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 13/15] cortexa{7, 15, 17}: add VFPv4 tunes
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:30 -0000

* it was added only to hf cortexa7 in:
  commit e97d152ca13556b41a236c1a4cfb11e77ff857d7
  Author: Kristof Robot <krirobo@gmail.com>
  Date:   Sun Jan 26 10:03:56 2014 +0100

      Add Cortex A7 support for NEONv2 & FPv4

* add it to softfp cortexa7 and both versions for cortexa15 and
  cortexa17 tunes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-cortexa15.inc | 16 ++++++++++++++--
 meta/conf/machine/include/tune-cortexa17.inc | 16 ++++++++++++++--
 meta/conf/machine/include/tune-cortexa7.inc  |  8 +++++++-
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 7e597f3..8b34bb2 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -6,31 +6,43 @@ TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mtune=cortex-a15', '', d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
+AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon cortexa15-neon-vfpv4 cortexa15t-neon-vfpv4"
 ARMPKGARCH_tune-cortexa15             = "cortexa15"
 ARMPKGARCH_tune-cortexa15t            = "cortexa15"
 ARMPKGARCH_tune-cortexa15-neon        = "cortexa15"
 ARMPKGARCH_tune-cortexa15t-neon       = "cortexa15"
+ARMPKGARCH_tune-cortexa15-neon-vfpv4  = "cortexa15"
+ARMPKGARCH_tune-cortexa15t-neon-vfpv4 = "cortexa15"
 TUNE_FEATURES_tune-cortexa15             = "${TUNE_FEATURES_tune-armv7a}             cortexa15"
 TUNE_FEATURES_tune-cortexa15t            = "${TUNE_FEATURES_tune-armv7at}            cortexa15"
 TUNE_FEATURES_tune-cortexa15-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa15"
 TUNE_FEATURES_tune-cortexa15t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa15"
+TUNE_FEATURES_tune-cortexa15-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  cortexa15"
+TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa15"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa15-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa15-vfp cortexa15-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-neon cortexa15t2-vfp cortexa15t2-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4}  cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4 cortexa15t2-vfp cortexa15t2-neon cortexa15t2-neon-vfpv4"
 
 # HF Tunes
-AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon"
+AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon cortexa15hf-neon-vfpv4 cortexa15thf-neon-vfpv4"
 ARMPKGARCH_tune-cortexa15hf             = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf            = "cortexa15"
 ARMPKGARCH_tune-cortexa15hf-neon        = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf-neon       = "cortexa15"
+ARMPKGARCH_tune-cortexa15hf-neon-vfpv4  = "cortexa15"
+ARMPKGARCH_tune-cortexa15thf-neon-vfpv4 = "cortexa15"
 TUNE_FEATURES_tune-cortexa15hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa15"
 TUNE_FEATURES_tune-cortexa15thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa15"
 TUNE_FEATURES_tune-cortexa15hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa15"
 TUNE_FEATURES_tune-cortexa15thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  cortexa15"
+TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa15"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa15hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa15hf-vfp cortexa15hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-neon cortexa15t2hf-vfp cortexa15t2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4 cortexa15t2hf-vfp cortexa15t2hf-neon cortexa15t2hf-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index 5cc4567..9668e95 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -6,31 +6,43 @@ TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mtune=cortex-a17', '', d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon"
+AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon cortexa17-neon-vfpv4 cortexa17t-neon-vfpv4"
 ARMPKGARCH_tune-cortexa17             = "cortexa17"
 ARMPKGARCH_tune-cortexa17t            = "cortexa17"
 ARMPKGARCH_tune-cortexa17-neon        = "cortexa17"
 ARMPKGARCH_tune-cortexa17t-neon       = "cortexa17"
+ARMPKGARCH_tune-cortexa17-neon-vfpv4  = "cortexa17"
+ARMPKGARCH_tune-cortexa17t-neon-vfpv4 = "cortexa17"
 TUNE_FEATURES_tune-cortexa17             = "${TUNE_FEATURES_tune-armv7a}             cortexa17"
 TUNE_FEATURES_tune-cortexa17t            = "${TUNE_FEATURES_tune-armv7at}            cortexa17"
 TUNE_FEATURES_tune-cortexa17-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa17"
 TUNE_FEATURES_tune-cortexa17t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa17"
+TUNE_FEATURES_tune-cortexa17-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  cortexa17"
+TUNE_FEATURES_tune-cortexa17t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa17"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa17-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa17-vfp cortexa17t2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa17-vfp cortexa17-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa17-vfp cortexa17-neon cortexa17t2-vfp cortexa17t2-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4}  cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4 cortexa17t2-vfp cortexa17t2-neon cortexa17t2-neon-vfpv4"
 
 # HF Tunes
-AVAILTUNES += "cortexa17hf cortexa17thf cortexa17hf-neon cortexa17thf-neon"
+AVAILTUNES += "cortexa17hf cortexa17thf cortexa17hf-neon cortexa17thf-neon cortexa17hf-neon-vfpv4 cortexa17thf-neon-vfpv4"
 ARMPKGARCH_tune-cortexa17hf             = "cortexa17"
 ARMPKGARCH_tune-cortexa17thf            = "cortexa17"
 ARMPKGARCH_tune-cortexa17hf-neon        = "cortexa17"
 ARMPKGARCH_tune-cortexa17thf-neon       = "cortexa17"
+ARMPKGARCH_tune-cortexa17hf-neon-vfpv4  = "cortexa17"
+ARMPKGARCH_tune-cortexa17thf-neon-vfpv4 = "cortexa17"
 TUNE_FEATURES_tune-cortexa17hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa17"
 TUNE_FEATURES_tune-cortexa17thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa17"
 TUNE_FEATURES_tune-cortexa17hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa17"
 TUNE_FEATURES_tune-cortexa17thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa17"
+TUNE_FEATURES_tune-cortexa17hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  cortexa17"
+TUNE_FEATURES_tune-cortexa17thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa17"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa17hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa17hf-vfp cortexa17t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa17hf-vfp cortexa17hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa17hf-vfp cortexa17hf-neon cortexa17t2hf-vfp cortexa17t2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4 cortexa17t2hf-vfp cortexa17t2hf-neon cortexa17t2hf-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 133ce38..4fea36f 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -6,19 +6,25 @@ TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mtune=cortex-a7', '', d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon"
+AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon cortexa7-neon-vfpv4 cortexa7t-neon-vfpv4"
 ARMPKGARCH_tune-cortexa7             = "cortexa7"
 ARMPKGARCH_tune-cortexa7t            = "cortexa7"
 ARMPKGARCH_tune-cortexa7-neon        = "cortexa7"
 ARMPKGARCH_tune-cortexa7t-neon       = "cortexa7"
+ARMPKGARCH_tune-cortexa7-neon-vfpv4  = "cortexa7"
+ARMPKGARCH_tune-cortexa7t-neon-vfpv4 = "cortexa7"
 TUNE_FEATURES_tune-cortexa7             = "${TUNE_FEATURES_tune-armv7a}             cortexa7"
 TUNE_FEATURES_tune-cortexa7t            = "${TUNE_FEATURES_tune-armv7at}            cortexa7"
 TUNE_FEATURES_tune-cortexa7-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa7"
 TUNE_FEATURES_tune-cortexa7t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa7"
+TUNE_FEATURES_tune-cortexa7-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  cortexa7"
+TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa7"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa7-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa7-vfp cortexa7-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-neon cortexa7t2-vfp cortexa7t2-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4}  cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4 cortexa7t2-vfp cortexa7t2-neon cortexa7t2-neon-vfpv4"
 
 # HF Tunes
 AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
-- 
2.6.3


