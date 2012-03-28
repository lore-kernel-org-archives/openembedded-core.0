Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SChif-0004T0-Jn
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 03:30:38 +0200
Received: by pbcum15 with SMTP id um15so936484pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 18:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7BcfWaxLcmGWn7cwbL+2jHGMu/3jHVQ/DgjUk984OCo=;
	b=t2B6BR8MP3bgP8aBtd4twJAujG09nWi4lcLCgVphjh3hLWLGn6mbq2JGxmvsc7o6cE
	rOqVMQyNnswHwaqpggskRyS19Ho/lYgrm09OHD0xWyutXnn+adT4JlLZGwAUPKc41yRC
	jHkIB2dR+erJ6KXTbYQEbZNtnhUO4Cp9bylb/40YU5OxKZEkRNwiL2V6njXcngxieW2p
	M9I8QJ8Nj6gNWI13Fm62QnmXDQr+TAjWwojYCK1f3nLrhxo665Ph3SJ86nUZeDk+pblk
	B7ahxwrZkM9ocGocglrc038fwti1ngmyqfv2TdDAlSoRbI+xSzEvovhrAAAAB7NxAJ+f
	QczQ==
Received: by 10.68.225.102 with SMTP id rj6mr18343471pbc.120.1332897695113;
	Tue, 27 Mar 2012 18:21:35 -0700 (PDT)
Received: from leto.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id s10sm1506209pbp.14.2012.03.27.18.21.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 18:21:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 18:21:25 -0700
Message-Id: <1332897685-4562-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.1
Subject: [PATCH] tune/armv7: Delete
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 01:30:38 -0000

armv7 is least common denominator of armv7-a
armv7-m and armv7-r and armv7-m does not support
ARM instructions but only thumb2 instruction set
which means armv7 when chosen will complain if
code is compiled in arm mode which is default
in OE if not specified other wise

if we chose this tuning errors like below pop up

error: target CPU does not support ARM mode

This tuning seems theoretical and base tune
for armv7 would be one of armv7-a,  armv7-m or
armv7-r

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7.inc |   56 --------------------------
 meta/conf/machine/include/tune-armv7.inc     |    2 -
 2 files changed, 0 insertions(+), 58 deletions(-)
 delete mode 100644 meta/conf/machine/include/arm/arch-armv7.inc
 delete mode 100644 meta/conf/machine/include/tune-armv7.inc

diff --git a/meta/conf/machine/include/arm/arch-armv7.inc b/meta/conf/machine/include/arm/arch-armv7.inc
deleted file mode 100644
index 33d9f0d..0000000
--- a/meta/conf/machine/include/arm/arch-armv7.inc
+++ /dev/null
@@ -1,56 +0,0 @@
-DEFAULTTUNE ?= "armv7"
-
-ARMPKGARCH ?= "armv7"
-
-TUNEVALID[armv7] = "Enable instructions for ARMv7"
-TUNE_CONFLICTS[armv7] = "armv4 armv5 armv6"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7", "-march=armv7", "", d)}"
-MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7", ":armv7", "" ,d)}"
-
-require conf/machine/include/arm/arch-armv6.inc
-require conf/machine/include/arm/feature-arm-neon.inc
-
-# Little Endian base configs
-AVAILTUNES += "armv7 armv7t armv7-neon armv7t-neon"
-TUNE_FEATURES_tune-armv7 ?= "armv7 vfp"
-TUNE_FEATURES_tune-armv7t ?= "armv7 vfp thumb"
-TUNE_FEATURES_tune-armv7-neon ?= "armv7 vfp neon"
-TUNE_FEATURES_tune-armv7t-neon ?= "armv7 vfp neon thumb"
-PACKAGE_EXTRA_ARCHS_tune-armv7 = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7t = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7-vfp armv7t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7-vfp-neon armv7at2-vfp-neon"
-
-# VFP Tunes
-AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon"
-TUNE_FEATURES_tune-armv7hf ?= "${TUNE_FEATURES_tune-armv7} callconvention-hard"
-TUNE_FEATURES_tune-armv7thf ?= "${TUNE_FEATURES_tune-armv7t} callconvention-hard"
-TUNE_FEATURES_tune-armv7hf-neon ?= "${TUNE_FEATURES_tune-armv7-neon} callconvention-hard"
-TUNE_FEATURES_tune-armv7thf-neon ?= "${TUNE_FEATURES_tune_armv7t-neon} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf} armv7hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7hf-vfp armv7t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7hf} armv7hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7thf} armv7hf-vfp-neon armv7at2hf-vfp-neon"
-
-# Big Endian
-AVAILTUNES += "armv7b armv7tb armv7b-neon armv7tb-neon"
-TUNE_FEATURES_tune-armv7b ?= "${TUNE_FEATURES_tune-armv7} bigendian"
-TUNE_FEATURES_tune-armv7tb ?= "${TUNE_FEATURES_tune-armv7t} bigendian"
-TUNE_FEATURES_tune-armv7b-neon ?= "${TUNE_FEATURES_tune-armv7-neon} bigendian"
-TUNE_FEATURES_tune-armv7tb-neon ?= "${TUNE_FEATURES_tune-armv7t-neon} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv7b = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7tb = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7b-vfp armv7t2b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7b-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7b-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7tb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7b-vfp-neon armv7at2b-vfp-neon"
-
-# Big Endian + VFP
-AVAILTUNES += "armv7hfb armv7thfb armv7hfb-neon armv7thfb-neon"
-TUNE_FEATURES_tune-armv7hfb ?= "${TUNE_FEATURES_tune-armv7b} callconvention-hard"
-TUNE_FEATURES_tune-armv7thfb ?= "${TUNE_FEATURES_tune-armv7tb} callconvention-hard"
-TUNE_FEATURES_tune-armv7hfb-neon ?= "${TUNE_FEATURES_tune-armv7b-neon} callconvention-hard"
-TUNE_FEATURES_tune-armv7thfb-neon ?= "${TUNE_FEATURES_tune_armv7tb-neon} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv7hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb} armv7hfb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7hfb-vfp armv7t2hfb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7hfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7hfb} armv7hfb-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7thfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7thfb} armv7hfb-vfp-neon armv7at2hfb-vfp-neon"
-
diff --git a/meta/conf/machine/include/tune-armv7.inc b/meta/conf/machine/include/tune-armv7.inc
deleted file mode 100644
index 664c24b..0000000
--- a/meta/conf/machine/include/tune-armv7.inc
+++ /dev/null
@@ -1,2 +0,0 @@
-require conf/machine/include/arm/arch-armv7.inc
-
-- 
1.7.9.1



