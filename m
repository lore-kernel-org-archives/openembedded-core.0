Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFT8B-0002or-Po
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 19:04:39 +0200
Received: by wgbdq11 with SMTP id dq11so3031926wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=eZYV4LFc0+15ojZy3fs6p5xd3CvOF5oyIHHHQGR3kN0=;
	b=R6wi3QnTKmk5XyF4BDTKpEvL1oWrt8Pv3XocBOE+szP/1ZCAY8WfnlpIkQfZs6964B
	nknGdQ8leCHX96xO1UD/sNiY1v/+7AWbzsQUsiMHhovENwq12LghfE/a49iRsbJN+b8A
	+RzCitgZg5hb7yXMGH/WaVOFoYPmPgioI5yOShMmL/DTU7FQNVcYZnCC0tCAnzl3k0Fx
	2lC+UO/8+58OMMuRfG+kiOrAe7f3mkZxBcEW2NELBTXRv0Pqr5X79HQep4dRLJPJZpw5
	gySfkAQOnezkzPi8vbQV+EvNzz2GpO0kpFmJYaygLthUVV0G8VgjJ5/J5eQYXwrfrstO
	7PJA==
Received: by 10.180.79.2 with SMTP id f2mr3932595wix.2.1348332714292;
	Sat, 22 Sep 2012 09:51:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm4508295wiz.4.2012.09.22.09.51.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 09:51:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 18:51:13 +0200
Message-Id: <665c47ce8876de5003296cd4f3b33d5c11a79eaa.1348330479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348330479.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348330479.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
Subject: [RFC 1/5] arch-arm: add ARMPKGSFX_CPU to TUNE_PKGARCH because we're using different TUNE_CCARGS
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
X-List-Received-Date: Sat, 22 Sep 2012 17:04:39 -0000

* without this tune-xscale and tune-arm926ejs were both creating
  packages in armv5te feed, but each with different -mtune, with
  OEBasicHash enabled it was causing each package to rebuild with new
  -mtune after MACHINE switch, but that doesn't make sense with output
  stored in the same armv5te feed

* this makes different feed for each -mtune/ARMPKGSFX_CPU

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/README         | 5 ++++-
 meta/conf/machine/include/arm/arch-arm.inc   | 4 +++-
 meta/conf/machine/include/tune-arm926ejs.inc | 4 ++--
 meta/conf/machine/include/tune-xscale.inc    | 5 +++--
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/include/arm/README
index a1beb75..7e52902 100644
--- a/meta/conf/machine/include/arm/README
+++ b/meta/conf/machine/include/arm/README
@@ -16,7 +16,7 @@ default.  The format must be of the form:
 <armversion>[t][e][hf][b][-vfp][-neon]
 
 TUNE_PKGARCH is defined as:
-${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}
+${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}${ARMPKGSFX_CPU}
 
 ARMPKGARCH - This is the core package arch component specified by each 
 tuning.  This is the primary identifier of a tuning.  Usual values are:
@@ -38,3 +38,6 @@ the core arch-arm.inc file.
 
 ARMPKGSFX_FPU - This is the FPU specific suffix.  The suffix indicates 
 specific FPU optimizations.  'vfp' and 'neon' are both defined.
+
+ARMPKGSFX_CPU - This is the CPU specific suffix.  The suffix indicates
+that specific CPU optimizations were used.
diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index da51044..6f22c94 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -4,12 +4,14 @@ TUNEVALID[bigendian] = "Enable big-endian mode."
 ARMPKGARCH ??= "arm"
 ARMPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "b", "", d)}"
 ARMPKGSFX_FPU ??= ""
+ARMPKGSFX_CPU ??= ""
+ARMPKGSFX_CPU[vardepvalue] = "${ARMPKGSFX_CPU}"
 ARMPKGSFX_DSP ??= ""
 ARMPKGSFX_EABI ??= ""
 ARMPKGSFX_THUMB ??= ""
 
 TUNE_ARCH = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "armeb", "arm", d)}"
-TUNE_PKGARCH = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
+TUNE_PKGARCH = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}${ARMPKGSFX_CPU}"
 
 ABIEXTENSION = "eabi"
 
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 7f2cc4e..c6e5289 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -1,4 +1,5 @@
 DEFAULTTUNE ?= "arm926ejs"
+ARMPKGSFX_CPU = "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-arm926ejs", "", d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
@@ -7,5 +8,4 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=arm92
 
 AVAILTUNES += "arm926ejs"
 TUNE_FEATURES_tune-arm926ejs = "${TUNE_FEATURES_tune-armv5te} arm926ejs"
-PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
-
+PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} armv5te-arm926ejs"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 80a3683..1f47c44 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -1,4 +1,5 @@
 DEFAULTTUNE ?= "xscale"
+ARMPKGSFX_CPU = "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-xscale", "", d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
@@ -7,11 +8,11 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale",
 
 AVAILTUNES += "xscale"
 TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
-PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
+PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} armv5te-xscale"
 
 AVAILTUNES += "xscale-be"
 TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-armv5teb} xscale bigendian"
-PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
+PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb} armv5teb-xscale"
 
 # webkit-gtk has alignment issues with double instructions on armv5 so
 # disable them here
-- 
1.7.12



