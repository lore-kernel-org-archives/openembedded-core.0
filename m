Return-Path: <andy.voltz@timesys.com>
Received: from exchange07.timesys.com (exchange07.timesys.com
	[209.114.137.116])
	by mail.openembedded.org (Postfix) with ESMTP id B34E762051
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 15:53:21 +0000 (UTC)
Received: from bob-linux.timesys.com (192.168.3.27) by exchange07.timesys.com
	(192.168.1.221) with Microsoft SMTP Server id 8.1.436.0;
	Wed, 5 Jun 2013 11:53:22 -0400
From: Andy Voltz <andy.voltz@timesys.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jun 2013 11:52:29 -0400
Message-ID: <1370447550-23693-2-git-send-email-andy.voltz@timesys.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1370447550-23693-1-git-send-email-andy.voltz@timesys.com>
References: <1370447550-23693-1-git-send-email-andy.voltz@timesys.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] tune-cortexa.inc: create a common include for cortex-a armv7a tuning
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
X-List-Received-Date: Wed, 05 Jun 2013 15:53:22 -0000
Content-Type: text/plain

The tuning files for the cortex-a* processors are mostly identical for
the A7,A8,A9,A15 processors. Rework these files to use a CORTEX_ID
variable to setup the tuning for each specific processor.

Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
---
 meta/conf/machine/include/arm/README         |    3 +++
 meta/conf/machine/include/tune-cortexa.inc   |   35 ++++++++++++++++++++++++++
 meta/conf/machine/include/tune-cortexa15.inc |   35 ++------------------------
 meta/conf/machine/include/tune-cortexa7.inc  |   35 ++------------------------
 meta/conf/machine/include/tune-cortexa8.inc  |   35 ++------------------------
 meta/conf/machine/include/tune-cortexa9.inc  |   35 ++------------------------
 6 files changed, 46 insertions(+), 132 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-cortexa.inc

diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/include/arm/README
index a1beb75..d8d7b64 100644
--- a/meta/conf/machine/include/arm/README
+++ b/meta/conf/machine/include/arm/README
@@ -38,3 +38,6 @@ the core arch-arm.inc file.
 
 ARMPKGSFX_FPU - This is the FPU specific suffix.  The suffix indicates 
 specific FPU optimizations.  'vfp' and 'neon' are both defined.
+
+CORTEX_ID - This is the cortex processor type, and is used to setup the
+proper tuning (-mtune=cortex-${CORTEX_ID}) in tune-cortexa.inc.
diff --git a/meta/conf/machine/include/tune-cortexa.inc b/meta/conf/machine/include/tune-cortexa.inc
new file mode 100644
index 0000000..987e4d9
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa.inc
@@ -0,0 +1,35 @@
+DEFAULTTUNE ?= "armv7a-neon"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortex${CORTEX_ID}", " -mcpu=cortex-${CORTEX_ID}", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortex${CORTEX_ID} cortex${CORTEX_ID}t cortex${CORTEX_ID}-neon cortex${CORTEX_ID}t-neon"
+ARMPKGARCH_tune-cortex${CORTEX_ID} = "cortex${CORTEX_ID}"
+ARMPKGARCH_tune-cortex${CORTEX_ID}t = "cortex${CORTEX_ID}"
+ARMPKGARCH_tune-cortex${CORTEX_ID}-neon = "cortex${CORTEX_ID}"
+ARMPKGARCH_tune-cortex${CORTEX_ID}t-neon = "cortex${CORTEX_ID}"
+TUNE_FEATURES_tune-cortex${CORTEX_ID} = "${TUNE_FEATURES_tune-armv7a} cortex${CORTEX_ID}"
+TUNE_FEATURES_tune-cortex${CORTEX_ID}t = "${TUNE_FEATURES_tune-armv7at} cortex${CORTEX_ID}"
+TUNE_FEATURES_tune-cortex${CORTEX_ID}-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortex${CORTEX_ID}"
+TUNE_FEATURES_tune-cortex${CORTEX_ID}t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortex${CORTEX_ID}"
+PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID} = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortex${CORTEX_ID}-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortex${CORTEX_ID}-vfp cortex${CORTEX_ID}t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortex${CORTEX_ID}-vfp cortex${CORTEX_ID}-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortex${CORTEX_ID}-vfp cortex${CORTEX_ID}-vfp-neon cortex${CORTEX_ID}t2-vfp cortex${CORTEX_ID}t2-vfp-neon"
+
+# VFP Tunes
+AVAILTUNES += "cortex${CORTEX_ID}hf cortex${CORTEX_ID}thf cortex${CORTEX_ID}hf-neon cortex${CORTEX_ID}thf-neon"
+ARMPKGARCH_tune-cortex${CORTEX_ID}hf = "cortex${CORTEX_ID}"
+ARMPKGARCH_tune-cortex${CORTEX_ID}thf = "cortex${CORTEX_ID}"
+ARMPKGARCH_tune-cortex${CORTEX_ID}hf-neon = "cortex${CORTEX_ID}"
+ARMPKGARCH_tune-cortex${CORTEX_ID}thf-neon = "cortex${CORTEX_ID}"
+TUNE_FEATURES_tune-cortex${CORTEX_ID}hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortex${CORTEX_ID}"
+TUNE_FEATURES_tune-cortex${CORTEX_ID}thf ?= "${TUNE_FEATURES_tune-armv7athf} cortex${CORTEX_ID}"
+TUNE_FEATURES_tune-cortex${CORTEX_ID}hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortex${CORTEX_ID}"
+TUNE_FEATURES_tune-cortex${CORTEX_ID}thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortex${CORTEX_ID}"
+PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortex${CORTEX_ID}hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortex${CORTEX_ID}hf-vfp cortex${CORTEX_ID}t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortex${CORTEX_ID}hf-vfp cortex${CORTEX_ID}hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortex${CORTEX_ID}thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortex${CORTEX_ID}hf-vfp cortex${CORTEX_ID}hf-vfp-neon cortex${CORTEX_ID}t2hf-vfp cortex${CORTEX_ID}t2hf-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 5529777..c89bacc 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -1,36 +1,5 @@
-DEFAULTTUNE ?= "armv7a-neon"
-
-require conf/machine/include/arm/arch-armv7a.inc
+CORTEX_ID = "a15"
 
 TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", " -mtune=cortex-a15", "", d)}"
-
-# Little Endian base configs
-AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
-ARMPKGARCH_tune-cortexa15 = "cortexa15"
-ARMPKGARCH_tune-cortexa15t = "cortexa15"
-ARMPKGARCH_tune-cortexa15-neon = "cortexa15"
-ARMPKGARCH_tune-cortexa15t-neon = "cortexa15"
-TUNE_FEATURES_tune-cortexa15 = "${TUNE_FEATURES_tune-armv7a} cortexa15"
-TUNE_FEATURES_tune-cortexa15t = "${TUNE_FEATURES_tune-armv7at} cortexa15"
-TUNE_FEATURES_tune-cortexa15-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa15"
-TUNE_FEATURES_tune-cortexa15t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa15-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa15-vfp cortexa15-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
 
-# VFP Tunes
-AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon"
-ARMPKGARCH_tune-cortexa15hf = "cortexa15"
-ARMPKGARCH_tune-cortexa15thf = "cortexa15"
-ARMPKGARCH_tune-cortexa15hf-neon = "cortexa15"
-ARMPKGARCH_tune-cortexa15thf-neon = "cortexa15"
-TUNE_FEATURES_tune-cortexa15hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa15"
-TUNE_FEATURES_tune-cortexa15thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa15"
-TUNE_FEATURES_tune-cortexa15hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa15"
-TUNE_FEATURES_tune-cortexa15thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa15hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon"
+require conf/machine/include/tune-cortexa.inc
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index f02f0a2..c6bc457 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -1,36 +1,5 @@
-DEFAULTTUNE ?= "armv7a-neon"
-
-require conf/machine/include/arm/arch-armv7a.inc
+CORTEX_ID = "a7"
 
 TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa7", " -mtune=cortex-a7", "", d)}"
-
-# Little Endian base configs
-AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon"
-ARMPKGARCH_tune-cortexa7 = "cortexa7"
-ARMPKGARCH_tune-cortexa7t = "cortexa7"
-ARMPKGARCH_tune-cortexa7-neon = "cortexa7"
-ARMPKGARCH_tune-cortexa7t-neon = "cortexa7"
-TUNE_FEATURES_tune-cortexa7 = "${TUNE_FEATURES_tune-armv7a} cortexa7"
-TUNE_FEATURES_tune-cortexa7t = "${TUNE_FEATURES_tune-armv7at} cortexa7"
-TUNE_FEATURES_tune-cortexa7-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa7"
-TUNE_FEATURES_tune-cortexa7t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa7-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa7-vfp cortexa7-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon"
 
-# VFP Tunes
-AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon"
-ARMPKGARCH_tune-cortexa7hf = "cortexa7"
-ARMPKGARCH_tune-cortexa7thf = "cortexa7"
-ARMPKGARCH_tune-cortexa7hf-neon = "cortexa7"
-ARMPKGARCH_tune-cortexa7thf-neon = "cortexa7"
-TUNE_FEATURES_tune-cortexa7hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa7"
-TUNE_FEATURES_tune-cortexa7thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa7"
-TUNE_FEATURES_tune-cortexa7hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa7"
-TUNE_FEATURES_tune-cortexa7thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa7hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon"
+require conf/machine/include/tune-cortexa.inc
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 771537f..c1a3325 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -1,36 +1,5 @@
-DEFAULTTUNE ?= "armv7a-neon"
-
-require conf/machine/include/arm/arch-armv7a.inc
+CORTEX_ID = "a8"
 
 TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", " -mtune=cortex-a8", "", d)}"
-
-# Little Endian base configs
-AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
-ARMPKGARCH_tune-cortexa8 = "cortexa8"
-ARMPKGARCH_tune-cortexa8t = "cortexa8"
-ARMPKGARCH_tune-cortexa8-neon = "cortexa8"
-ARMPKGARCH_tune-cortexa8t-neon = "cortexa8"
-TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
-TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
-TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
-TUNE_FEATURES_tune-cortexa8t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa8"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa8-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa8-vfp cortexa8-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-vfp-neon cortexa8t2-vfp cortexa8t2-vfp-neon"
 
-# VFP Tunes
-AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon cortexa8thf-neon"
-ARMPKGARCH_tune-cortexa8hf = "cortexa8"
-ARMPKGARCH_tune-cortexa8thf = "cortexa8"
-ARMPKGARCH_tune-cortexa8hf-neon = "cortexa8"
-ARMPKGARCH_tune-cortexa8thf-neon = "cortexa8"
-TUNE_FEATURES_tune-cortexa8hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
-TUNE_FEATURES_tune-cortexa8thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa8"
-TUNE_FEATURES_tune-cortexa8hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
-TUNE_FEATURES_tune-cortexa8thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa8"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa8hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon cortexa8t2hf-vfp cortexa8t2hf-vfp-neon"
+require conf/machine/include/tune-cortexa.inc
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 700394b..9b16761 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -1,36 +1,5 @@
-DEFAULTTUNE ?= "armv7a-neon"
-
-require conf/machine/include/arm/arch-armv7a.inc
+CORTEX_ID = "a9"
 
 TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", " -mtune=cortex-a9", "", d)}"
-
-# Little Endian base configs
-AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
-ARMPKGARCH_tune-cortexa9 = "cortexa9"
-ARMPKGARCH_tune-cortexa9t = "cortexa9"
-ARMPKGARCH_tune-cortexa9-neon = "cortexa9"
-ARMPKGARCH_tune-cortexa9t-neon = "cortexa9"
-TUNE_FEATURES_tune-cortexa9 = "${TUNE_FEATURES_tune-armv7a} cortexa9"
-TUNE_FEATURES_tune-cortexa9t = "${TUNE_FEATURES_tune-armv7at} cortexa9"
-TUNE_FEATURES_tune-cortexa9-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa9"
-TUNE_FEATURES_tune-cortexa9t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa9"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa9-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa9-vfp cortexa9-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-vfp-neon cortexa9t2-vfp cortexa9t2-vfp-neon"
 
-# VFP Tunes
-AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon cortexa9thf-neon"
-ARMPKGARCH_tune-cortexa9hf = "cortexa9"
-ARMPKGARCH_tune-cortexa9thf = "cortexa9"
-ARMPKGARCH_tune-cortexa9hf-neon = "cortexa9"
-ARMPKGARCH_tune-cortexa9thf-neon = "cortexa9"
-TUNE_FEATURES_tune-cortexa9hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa9"
-TUNE_FEATURES_tune-cortexa9thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa9"
-TUNE_FEATURES_tune-cortexa9hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa9"
-TUNE_FEATURES_tune-cortexa9thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa9"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa9hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon cortexa9t2hf-vfp cortexa9t2hf-vfp-neon"
+require conf/machine/include/tune-cortexa.inc
-- 
1.7.9.5


