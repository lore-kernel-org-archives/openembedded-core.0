Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJlcA-0000f3-Bo
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 15:37:22 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so3515519wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 06:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pq7XJoshXm+PHgIZaYxJe2sm5oIysw/bz1RgMSVBiMs=;
	b=vHkzF/YRHrFDUkigfrUljSEtsL+e9g7lNXWZhxp6mZkJKcYnG1oLerJ141Y4yCDkMK
	8vDAPttIjvZouX54hb70mtGEUAPK1dO7IxrH+zS0VdQK8bZ2aXo2jQtrE+6P3NXK2qaZ
	Z7Aj1C65p0fznynIqREuVKp/vmcHtRNAnXYkKhYH8YF9vRR989i5KGvAWodqZ0MgwgMZ
	ylChCLpsiD5HenGzxIZ8hqyPu8DnC5q5FIpsZt8njynUC7+4z1wxWs3RUClCxLBI2jRQ
	ph2ApIJ38+fj5nVECi3t7o9KyMTa1jInk/Gyuj/VoLJqWFy5zluXy4no82g4ohuPQ+SE
	Yu7g==
Received: by 10.180.24.4 with SMTP id q4mr38042795wif.19.1349357061642;
	Thu, 04 Oct 2012 06:24:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p4sm14653368wix.0.2012.10.04.06.24.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 06:24:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2012 15:23:39 +0200
Message-Id: <6e072a1b2b45ae260a883d35d7a8bb08008f035e.1349356755.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<cover.1349356755.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1349356755.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/7] arch-arm: define different ARMPKGARCH when different CCARGS are used
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
X-List-Received-Date: Thu, 04 Oct 2012 13:37:22 -0000

* without this tune-xscale and tune-arm926ejs were both creating
  packages in armv5te feed, but each with different -mtune, with
  OEBasicHash enabled it was causing each package to rebuild with new
  -mtune after MACHINE switch, but that doesn't make sense with output
  stored in the same armv5te feed

* this makes different feed for each -mtune, but more generic one to be
  selected with DEFAULTTUNE

* tune-iwmmxt and tune-ep9312 were already using this, just move it
  bellow AVAILTUNES and use ARMPKGARCH_tune-foo syntax

* tune-cortexr4 and tune-cortexm3 are using armv7r/armv7m as ARMPKGARCH
  because there isn't another tune to use the same -march

* Fixes [YOCTO #3219]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-arm1136jf-s.inc   | 1 +
 meta/conf/machine/include/tune-arm920t.inc       | 1 +
 meta/conf/machine/include/tune-arm926ejs.inc     | 2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc      | 1 +
 meta/conf/machine/include/tune-cortexa8.inc      | 6 ++++++
 meta/conf/machine/include/tune-cortexa9.inc      | 6 ++++++
 meta/conf/machine/include/tune-cortexm1.inc      | 1 +
 meta/conf/machine/include/tune-cortexm3.inc      | 2 +-
 meta/conf/machine/include/tune-cortexr4.inc      | 2 +-
 meta/conf/machine/include/tune-ep9312.inc        | 4 +---
 meta/conf/machine/include/tune-iwmmxt.inc        | 4 +---
 meta/conf/machine/include/tune-strongarm1100.inc | 1 +
 meta/conf/machine/include/tune-xscale.inc        | 2 ++
 13 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index 4f4a2eb..2efcedd 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -6,5 +6,6 @@ TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm1136jfs", "-mtune=arm1136jf-s", "", d)}"
 
 AVAILTUNES += "arm1136jfs"
+ARMPKGARCH_tune-arm1136jfs = "arm1136jfs"
 TUNE_FEATURES_tune-arm1136jfs = "${TUNE_FEATURES_tune-armv6} arm1136jfs"
 PACKAGE_EXTRA_ARCHS_tune-arm1136jfs = "${PACKAGE_EXTRA_ARCHS_tune-armv6}"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index b7584ab..459d978 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -6,6 +6,7 @@ TUNEVALID[arm920t] = "Enable arm920t specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm920t", "-mtune=arm920t", "", d)}"
 
 AVAILTUNES += "arm920t"
+ARMPKGARCH_tune-arm920t = "arm920t"
 TUNE_FEATURES_tune-arm920t = "${TUNE_FEATURES_tune-armv4t} arm920t"
 PACKAGE_EXTRA_ARCHS_tune-arm920t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t}"
 
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 7f2cc4e..0cfeb77 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -6,6 +6,6 @@ TUNEVALID[arm926ejs] = "Enable arm926ejs specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=arm926ej-s", "", d)}"
 
 AVAILTUNES += "arm926ejs"
+ARMPKGARCH_tune-arm926ejs = "arm926ejs"
 TUNE_FEATURES_tune-arm926ejs = "${TUNE_FEATURES_tune-armv5te} arm926ejs"
 PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
-
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index 0dc5c26..100242f 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -6,6 +6,7 @@ TUNEVALID[arm9tdmi] = "Enable arm9tdmi specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm9tdmi", "-mtune=arm9tdmi", "", d)}"
 
 AVAILTUNES += "arm9tdmi"
+ARMPKGARCH_tune-arm9tdmi = "arm9tdmi"
 TUNE_FEATURES_tune-arm9tdmi = "${TUNE_FEATURES_tune-armv4t} arm9tdmi"
 PACKAGE_EXTRA_ARCHS_tune-arm9tdmi = "${PACKAGE_EXTRA_ARCHS_tune-armv4t}"
 
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 9d79a58..29fbe89 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -7,6 +7,9 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", "-mtune=cortex
 
 # Little Endian base configs
 AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon"
+ARMPKGARCH_tune-cortexa8 = "cortexa8"
+ARMPKGARCH_tune-cortexa8t = "cortexa8t"
+ARMPKGARCH_tune-cortexa8-neon = "cortexa8-neon"
 TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
 TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
 TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
@@ -16,6 +19,9 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon
 
 # VFP Tunes
 AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon"
+ARMPKGARCH_tune-cortexa8hf = "cortexa8hf"
+ARMPKGARCH_tune-cortexa8thf = "cortexa8thf"
+ARMPKGARCH_tune-cortexa8hf-neon = "cortexa8hf-neon"
 TUNE_FEATURES_tune-cortexa8hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
 TUNE_FEATURES_tune-cortexa8thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa8"
 TUNE_FEATURES_tune-cortexa8hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index a8e27ca..e2f78d3 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -7,6 +7,9 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", "-mtune=cortex
 
 # Little Endian base configs
 AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon"
+ARMPKGARCH_tune-cortexa9 = "cortexa9"
+ARMPKGARCH_tune-cortexa9t = "cortexa9t"
+ARMPKGARCH_tune-cortexa9-neon = "cortexa9-neon"
 TUNE_FEATURES_tune-cortexa9 = "${TUNE_FEATURES_tune-armv7a} cortexa9"
 TUNE_FEATURES_tune-cortexa9t = "${TUNE_FEATURES_tune-armv7at} cortexa9"
 TUNE_FEATURES_tune-cortexa9-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa9"
@@ -16,6 +19,9 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon
 
 # VFP Tunes
 AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon"
+ARMPKGARCH_tune-cortexa9hf = "cortexa9hf"
+ARMPKGARCH_tune-cortexa9thf = "cortexa9thf"
+ARMPKGARCH_tune-cortexa9hf-neon = "cortexa9hf-neon"
 TUNE_FEATURES_tune-cortexa9hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa9"
 TUNE_FEATURES_tune-cortexa9thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa9"
 TUNE_FEATURES_tune-cortexa9hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa9"
diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
index 3eecd5b..ba3cbe9 100644
--- a/meta/conf/machine/include/tune-cortexm1.inc
+++ b/meta/conf/machine/include/tune-cortexm1.inc
@@ -6,6 +6,7 @@ TUNEVALID[cortexm1] = "Enable Cortex-M1 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexm1", "-mtune=cortex-m1", "", d)}"
 
 AVAILTUNES += "cortexm1"
+ARMPKGARCH_tune-cortexm1 = "cortexm1"
 TUNE_FEATURES_tune-cortexm1 = "${TUNE_FEATURES_tune-armv7a} cortexm1"
 PACKAGE_EXTRA_ARCHS_tune-cortexm1 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
 
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index 20a3c65..72acdb5 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -1,5 +1,4 @@
 DEFAULTTUNE ?= "cortexm3"
-ARMPKGARCH ?= "armv7m"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
@@ -10,6 +9,7 @@ TUNEVALID[armv7m] = "Enable Cortex-M3 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7m", "-march=armv7-m", "", d)}"
 
 AVAILTUNES += "cortexm3"
+ARMPKGARCH_tune-cortexm3 = "armv7m"
 TUNE_FEATURES_tune-cortexm3 = "armv7m vfp cortexm3"
 PACKAGE_EXTRA_ARCHS_tune-cortexm3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7m-vfp"
 
diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index c8c2bfb..3f38b6c 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -1,5 +1,4 @@
 DEFAULTTUNE ?= "cortexr4"
-ARMPKGARCH ?= "armv7r"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
@@ -10,5 +9,6 @@ TUNEVALID[armv7r] = "Enable Cortex-R4 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7r", "-march=armv7-r", "", d)}"
 
 AVAILTUNES += "cortexr4"
+ARMPKGARCH_tune-cortexr4 = "armv7r"
 TUNE_FEATURES_tune-cortexr4 = "armv7r vfp cortexr4"
 PACKAGE_EXTRA_ARCHS_tune-cortexr4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r-vfp"
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index f10123f..09db6b4 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -1,5 +1,4 @@
 DEFAULTTUNE ?= "ep9312"
-ARMPKGARCH ?= "ep9312"
 
 require conf/machine/include/arm/arch-armv4.inc
 
@@ -7,7 +6,6 @@ TUNEVALID[ep9312] = "Enable Intel PXA27x specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ep9312", "-march=ep9312 -mtune=ep9312", "", d)}"
 
 AVAILTUNES += "ep9312"
+ARMPKGARCH_tune-ep9312 = "ep9312"
 TUNE_FEATURES_tune-ep9312 = "thumb ep9312"
 PACKAGE_EXTRA_ARCHS_tune-ep9312 = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} ep9312"
-
-
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index 14f5955..113d89f 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -2,7 +2,6 @@
 # Please use tune-xscale for PXA255/PXA26x based processors.
 
 DEFAULTTUNE ?= "iwmmxt"
-ARMPKGARCH ?= "iwmmxt"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
@@ -10,7 +9,6 @@ TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "iwmmxt", "-march=iwmmxt -mtune=iwmmxt", "", d)}"
 
 AVAILTUNES += "iwmmxt"
+ARMPKGARCH_tune-iwmmxt = "iwmmxt"
 TUNE_FEATURES_tune-iwmmxt = "thumb iwmmxt"
 PACKAGE_EXTRA_ARCHS_tune-iwmmxt = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} iwmmxt"
-
-
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index 66bab8e..3beaaed 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -6,6 +6,7 @@ TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "strongarm", "-mtune=strongarm1100", "", d)}"
 
 AVAILTUNES += "strongarm"
+ARMPKGARCH_tune-strongarm = "strongarm"
 TUNE_FEATURES_tune-strongarm = "${TUNE_FEATURES_tune-armv4} strongarm"
 PACKAGE_EXTRA_ARCHS_tune-strongarm = "${PACKAGE_EXTRA_ARCHS_tune-armv4}"
 
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 0d5d060..d9925eb 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -6,10 +6,12 @@ TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimization
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale", "", d)}"
 
 AVAILTUNES += "xscale"
+ARMPKGARCH_tune-xscale = "xscale"
 TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
 PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
 
 AVAILTUNES += "xscale-be"
+ARMPKGARCH_tune-xscale-be = "xscale-be"
 TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-armv5teb} xscale bigendian"
 PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
 
-- 
1.7.12



