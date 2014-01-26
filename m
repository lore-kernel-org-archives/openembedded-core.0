Return-Path: <krirobo@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 32A406E15B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 09:04:12 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d17so1692330eek.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 01:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8BzrayEj+AnO8O3SGCgiiTKGOZPZOOedUwoHoqy5SPA=;
	b=QLV6YYaBDyHgC/Eu3DvDN9kb/FZLAblmwzIYBXJlGjJBIkcvZfako7eAS/XxV0tIMg
	zgvHeBKg8yW3ZIJcVKiBhA5UnqCHMw4bs+cY0hG45aVbocEePNFJKZK/kOEwKTGmb/E/
	AbIJc05vkRBL8jJfrPMyaL8QIkqckQLHN+PAi1kVyBrGvN/1YN3yWf7ORLF0+4x4289H
	PtWuY5fiFyGuEWyeBso4kl/HQUa7vvHEDbKWhyXFoCdpgrfrKcb4y84k9nMFiPJK4+Ut
	1hgW7XFRlLzFSG7q/iKTzHUJ+LWKeqf8vDjo3gX7T7rwxUhDkgb3qy/1ZkOBHr/fXYWw
	KHCg==
X-Received: by 10.14.225.195 with SMTP id z43mr20167363eep.19.1390727052508;
	Sun, 26 Jan 2014 01:04:12 -0800 (PST)
Received: from localhost.localdomain (94-227-60-9.access.telenet.be.
	[94.227.60.9])
	by mx.google.com with ESMTPSA id v7sm26658037eel.2.2014.01.26.01.04.11
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 Jan 2014 01:04:11 -0800 (PST)
From: Kristof Robot <krirobo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2014 10:03:56 +0100
Message-Id: <1390727036-13511-1-git-send-email-krirobo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] Add Cortex A7 support for NEONv2 & FPv4
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
X-List-Received-Date: Sun, 26 Jan 2014 09:04:12 -0000

[YOCTO #5710]

Add tuning options for Cortex-A7 with NEONv2 & FPv4:
- cortexa7hf-neon-vfpv4
- cortexa7thf-neon-vfpv4

Signed-off-by: Kristof Robot <krirobo@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7a.inc      | 8 +++++++-
 meta/conf/machine/include/arm/feature-arm-neon.inc | 4 ++--
 meta/conf/machine/include/arm/feature-arm-vfp.inc  | 3 +++
 meta/conf/machine/include/tune-cortexa7.inc        | 8 +++++++-
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index bf3eace..bb36c39 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -24,19 +24,25 @@ PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7a ar
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
 
 # VFP Tunes
-AVAILTUNES += "armv7ahf armv7athf armv7ahf-neon armv7athf-neon"
+AVAILTUNES += "armv7ahf armv7athf armv7ahf-neon armv7athf-neon armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4"
 ARMPKGARCH_tune-armv7ahf ?= "armv7a"
 ARMPKGARCH_tune-armv7athf ?= "armv7a"
 ARMPKGARCH_tune-armv7ahf-neon?= "armv7a"
 ARMPKGARCH_tune-armv7athf-neon ?= "armv7a"
+ARMPKGARCH_tune-armv7ahf-neon-vfpv4 ?= "armv7a"
+ARMPKGARCH_tune-armv7athf-neon-vfpv4 ?= "armv7a"
 TUNE_FEATURES_tune-armv7ahf ?= "${TUNE_FEATURES_tune-armv7a} callconvention-hard"
 TUNE_FEATURES_tune-armv7athf ?= "${TUNE_FEATURES_tune-armv7at} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahf-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
 TUNE_FEATURES_tune-armv7athf-neon ?= "${TUNE_FEATURES_tune-armv7at-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7ahf-neon} vfpv4"
+TUNE_FEATURES_tune-armv7athf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon} vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf} armv7ahf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon armv7at2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-vfp-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7athf-vfp-neon-vfpv4"
 
 # Big Endian
 AVAILTUNES += "armv7ab armv7atb armv7ab-neon armv7atb-neon"
diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/conf/machine/include/arm/feature-arm-neon.inc
index df4027e..e8b2b85 100644
--- a/meta/conf/machine/include/arm/feature-arm-neon.inc
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -1,3 +1,3 @@
 TUNEVALID[neon] = "Enable Neon SIMD accelerator unit."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "neon", " -mfpu=neon", "" ,d)}"
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "neon", "-neon", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "neon", bb.utils.contains("TUNE_FEATURES", "vfpv4", " -mfpu=neon-vfpv4", " -mfpu=neon", d), "" , d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "neon", "-neon", "", d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index dbc7e28..13927ff 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -1,6 +1,9 @@
 TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
 ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp", "" ,d)}"
 
+TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
+ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv4", "-vfpv4", "" ,d)}"
+
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
 ARMPKGSFX_EABI .= "${@bb.utils.contains("TUNE_FEATURES", [ "callconvention-hard", "vfp" ], "hf", "", d)}"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index f02f0a2..9d06910 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -21,16 +21,22 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon
 PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon"
 
 # VFP Tunes
-AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon"
+AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
 ARMPKGARCH_tune-cortexa7hf = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf = "cortexa7"
 ARMPKGARCH_tune-cortexa7hf-neon = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf-neon = "cortexa7"
+ARMPKGARCH_tune-cortexa7hf-neon-vfpv4 = "cortexa7"
+ARMPKGARCH_tune-cortexa7thf-neon-vfpv4 = "cortexa7"
 TUNE_FEATURES_tune-cortexa7hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa7"
 TUNE_FEATURES_tune-cortexa7thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa7"
 TUNE_FEATURES_tune-cortexa7hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa7"
 TUNE_FEATURES_tune-cortexa7thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa7"
+TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4} cortexa7"
+TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa7"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa7hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7hf-vfp-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon cortexa7hf-vfp-vfpv4-neon cortexa7t2hf-vfp-vfpv4-neon"
-- 
1.8.3.2


