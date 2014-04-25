Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id F32F065DD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 16:40:27 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so2959173eei.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=6nPqSvEXgErinfXg7VqSg7nVhfpgMwvpX79mUJT4ZMw=;
	b=WdAWoQIDl+3V536Qmso5J1cVJaKeUIDX7zRrql8/TI19zZM+Gvt2MxcWHL7pyeGhrr
	4KmAPNnzY8HwpGeoLIKv3/MbeMOtTWbMbySjGvkgcK/NClW+IrwPzQhgqc/z50x0tajV
	OqpJWThC3JVqg50W4SnbzxlPAiRPYuVL1PXD5kt500/3f2IESRTsAtDe5pUzR0557dhs
	jxBUJk9KOmPBVhHt1XFdRe+ffaHCVryUVTT5ly20C3k1HrvXK0Tbv5EwiYhcUrTggf44
	WvgFjxMks9PS+UhykU9tzkwpScw5jWCz9iw3AyVCNWlKz5LrHbFiifezudrrApRQYXQR
	uDsQ==
X-Received: by 10.15.107.75 with SMTP id ca51mr1698921eeb.103.1398444028713;
	Fri, 25 Apr 2014 09:40:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h47sm26108634eey.13.2014.04.25.09.40.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 09:40:27 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2014 18:40:27 +0200
Message-Id: <113897aacc93fde97f4cec2c79b50ef21756451b.1398443925.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398443925.git.Martin.Jansa@gmail.com>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1398443925.git.Martin.Jansa@gmail.com>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] feature-arm-thumb.inc, arch-armv4.inc: Add "arm" to TUNE_FEATURES
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
X-List-Received-Date: Fri, 25 Apr 2014 16:40:28 -0000

* it will be inherited by most DEFAULTTUNEs, except few exceptions which
  support only thumb and not arm
* respect missing "arm" in TUNE_FEATURES in feature-arm-thumb.inc, so
  when recipe asks for "arm" and MACHINE supports only "thumb" ignore
  recipe and try to build with "thumb"
* show warning when overriding ARM_INSTRUCTION_SET set by recipe from tune
  config

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv4.inc       |  3 ++-
 meta/conf/machine/include/arm/arch-armv5.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |  2 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc | 29 +++++++++++++++++-----
 5 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index c33c816..52c07a8 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -1,5 +1,6 @@
 DEFAULTTUNE ?= "armv4"
 
+TUNEVALID[arm] = "Enable ARM instruction set"
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv4", " -march=armv4${ARMPKGSFX_THUMB}", "", d)}"
 # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
@@ -18,7 +19,7 @@ require conf/machine/include/arm/feature-arm-thumb.inc
 AVAILTUNES += "armv4 armv4t"
 ARMPKGARCH_tune-armv4 ?= "armv4"
 ARMPKGARCH_tune-armv4t ?= "armv4"
-TUNE_FEATURES_tune-armv4 ?= "armv4"
+TUNE_FEATURES_tune-armv4 ?= "arm armv4"
 TUNE_FEATURES_tune-armv4t ?= "${TUNE_FEATURES_tune-armv4} thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv4 = "arm armv4"
 PACKAGE_EXTRA_ARCHS_tune-armv4t = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4t"
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 9e8d1fa..5cceafa 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -14,7 +14,7 @@ require conf/machine/include/arm/feature-arm-vfp.inc
 AVAILTUNES += "armv5 armv5t"
 ARMPKGARCH_tune-armv5 ?= "armv5"
 ARMPKGARCH_tune-armv5t ?= "armv5"
-TUNE_FEATURES_tune-armv5 ?= "armv5"
+TUNE_FEATURES_tune-armv5 ?= "arm armv5"
 TUNE_FEATURES_tune-armv5t ?= "${TUNE_FEATURES_tune-armv5} thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv5 = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5"
 PACKAGE_EXTRA_ARCHS_tune-armv5t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5 armv5t"
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 0adf73f..4b0c5bf 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -15,7 +15,7 @@ ARMPKGARCH_tune-armv6 ?= "armv6"
 ARMPKGARCH_tune-armv6t ?= "armv6"
 ARMPKGARCH_tune-armv6hf ?= "armv6"
 ARMPKGARCH_tune-armv6thf ?= "armv6"
-TUNE_FEATURES_tune-armv6-novfp ?= "armv6"
+TUNE_FEATURES_tune-armv6-novfp ?= "arm armv6"
 TUNE_FEATURES_tune-armv6t-novfp ?= "${TUNE_FEATURES_tune-armv6-novfp} thumb"
 TUNE_FEATURES_tune-armv6 ?= "${TUNE_FEATURES_tune-armv6-novfp} vfp"
 TUNE_FEATURES_tune-armv6t ?= "${TUNE_FEATURES_tune-armv6t-novfp} vfp"
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index bb36c39..f2c04a3 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -14,7 +14,7 @@ ARMPKGARCH_tune-armv7a ?= "armv7a"
 ARMPKGARCH_tune-armv7at ?= "armv7a"
 ARMPKGARCH_tune-armv7a-neon?= "armv7a"
 ARMPKGARCH_tune-armv7at-neon ?= "armv7a"
-TUNE_FEATURES_tune-armv7a ?= "armv7a vfp"
+TUNE_FEATURES_tune-armv7a ?= "arm armv7a vfp"
 TUNE_FEATURES_tune-armv7at ?= "${TUNE_FEATURES_tune-armv7a} thumb"
 TUNE_FEATURES_tune-armv7a-neon ?= "${TUNE_FEATURES_tune-armv7a} neon"
 TUNE_FEATURES_tune-armv7at-neon ?= "${TUNE_FEATURES_tune-armv7at} neon"
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index d58c4b4..8a38665 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -5,14 +5,30 @@
 # but requires more instructions (140% for 70% smaller code) so may be
 # slower.
 TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
-ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' ${ARM_THUMB_M_OPT}', '', d)}"
+ARM_THUMB_OPT = "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4',  't',  '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5',  't',  '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6',  't',  '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 't2', '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 't2', '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 't2', '', d)}"
+
+# If the device supports ARM, then respect ARM_THUMB_OPT (which can be "arm" or "thumb")
+# If the defice doesn't support ARM, then always set "thumb" even when
+# some recipe explicitly sets ARM_INSTRUCTION_SET to "arm"
+ARM_M_OPT = "${@bb.utils.contains('TUNE_FEATURES', 'arm', '${ARM_THUMB_OPT}', 'thumb', d)}"
+python () {
+    selected = d.getVar('ARM_INSTRUCTION_SET', True)
+    used = d.getVar('ARM_M_OPT', True)
+    if selected != used:
+        pn = d.getVar('PN', True)
+        bb.warn("Recipe '%s' selects ARM_INSTRUCTION_SET to be '%s', but tune configuration overrides it to '%s'" % (pn, selected, used))
+}
+
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
 OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb', '', d)}"
 
-ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', [ 'armv4', 'thumb' ], 't', '', d)}"
-ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5', 'thumb' ], 't', '', d)}"
-ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', [ 'armv6', 'thumb' ], 't', '', d)}"
-ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', [ 'armv7a', 'thumb' ], 't2', '', d)}"
+ARMPKGSFX_THUMB .= "${ARM_THUMB_SUFFIX}"
 
 # Whether to compile with code to allow interworking between the two
 # instruction sets. This allows thumb code to be executed on a primarily
@@ -22,4 +38,5 @@ TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ' -mno-thumb-interwork', ' -mthumb-interwork', d)}"
 OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'no-thumb-interwork', ':thumb-interwork', '', d)}"
 
+# what about armv7m devices which don't support -marm (e.g. Cortex-M3)?
 TARGET_CC_KERNEL_ARCH += "-mno-thumb-interwork -marm"
-- 
1.9.1


