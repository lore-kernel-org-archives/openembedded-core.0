Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SF9q6-0001m7-Sh
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 21:56:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q33JlHfu019280
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 12:47:17 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Tue, 3 Apr 2012 12:47:16 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Apr 2012 14:47:05 -0500
Message-ID: <e624e8b98e39374dfe6141f703ae258243ca0496.1333481624.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1333481624.git.mark.hatle@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 5/7] conf/machine/include: Cleanup ARM tunings to match README
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
X-List-Received-Date: Tue, 03 Apr 2012 19:56:27 -0000
Content-Type: text/plain

Cleanup the ARM tunings to match the new tunings README file.

The ARM tunings define TUNE_PKGARCH in a way that only one main
arm architecture, i.e. armv6, may be defined at the same time.  We
may have to revise these settings in the future, as well as figure
out a way to better differentiate various optimize tunings in the
package arch.  (This was not done, to preserve existing behavior!)

Fix a number of minor issues w/ the armv5 tunings where DSP variants
were referenced but not defined.

Fix incorrect armv7 entries in armv7a.

Fix PACKAGE_EXTRA_ARCHS definitions inside of tune-cortexm3 and tune-cortexr4.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/machine/include/arm/README          |   40 +++++++++++++++++++++++++
 meta/conf/machine/include/arm/arch-arm.inc    |    2 +-
 meta/conf/machine/include/arm/arch-armv5.inc  |    2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc |    6 ++--
 meta/conf/machine/include/tune-cortexm3.inc   |    2 +-
 meta/conf/machine/include/tune-cortexr4.inc   |    2 +-
 6 files changed, 47 insertions(+), 7 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/README

diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/include/arm/README
new file mode 100644
index 0000000..a1beb75
--- /dev/null
+++ b/meta/conf/machine/include/arm/README
@@ -0,0 +1,40 @@
+2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
+ - Initial Revision
+
+The ARM architecture definitions are split among a number of files.
+The primary definitions for the variables are handled by the core
+arch-arm.inc file.
+
+TUNE_ARCH is set to either "arm" or "armeb" depending on the value
+of the existence of the "bigendian" feature in a given tune.
+
+A small set of ARM specific variables have been defined to allow 
+TUNE_PKGARCH to be automatically defined.  Optimized tunings must NOT 
+change the definiton of TUNE_PKGARCH.  TUNE_PKGACH_tune-<tune> will be 
+ignored.  The format of the package arch is enforced by the TUNE_PKGARCH
+default.  The format must be of the form:
+<armversion>[t][e][hf][b][-vfp][-neon]
+
+TUNE_PKGARCH is defined as:
+${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}
+
+ARMPKGARCH - This is the core package arch component specified by each 
+tuning.  This is the primary identifier of a tuning.  Usual values are:
+arm, armv4, armv5, armv6, armv7a, etc.
+
+ARMPKGSFX_THUMB - This is the thumb specific suffix.  Curently it is 
+defined in feature-arm-thumb.inc.
+
+ARMPKGSFX_DSP - This is the DSP specific suffix.  Currently this is set 
+to 'e' when on armv5 and the dsp feature is enabled.
+
+ARMPKGSFX_EABI - This is the eabi specific suffix.  There are currently 
+two defined ABIs specificed, standard EABI and Hard Float (VFP) EABI.  
+When the callconvention-hard is enabled, "hf" is specified, otherwise it 
+is blank.
+
+ARMPKGSFX_ENDIAN - This is the endian specific suffix.  It is defined in 
+the core arch-arm.inc file.
+
+ARMPKGSFX_FPU - This is the FPU specific suffix.  The suffix indicates 
+specific FPU optimizations.  'vfp' and 'neon' are both defined.
diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index 4ea8b2b..da51044 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -9,7 +9,7 @@ ARMPKGSFX_EABI ??= ""
 ARMPKGSFX_THUMB ??= ""
 
 TUNE_ARCH = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "armeb", "arm", d)}"
-TUNE_PKGARCH = "${@d.getVar('ARMPKGARCH', True)}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
+TUNE_PKGARCH = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
 
 ABIEXTENSION = "eabi"
 
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index fd3490f..4a75530 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -13,7 +13,7 @@ require conf/machine/include/arm/arch-armv4.inc
 require conf/machine/include/arm/feature-arm-vfp.inc
 
 # Little Endian
-AVAILTUNES += "armv5 armv5t armv5e armv5te"
+AVAILTUNES += "armv5 armv5t"
 TUNE_FEATURES_tune-armv5 ?= "armv5"
 TUNE_FEATURES_tune-armv5t ?= "armv5 thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv5 = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5"
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 2542f45..629960d 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -22,11 +22,11 @@ PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7a ar
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
 
 # VFP Tunes
-AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon"
+AVAILTUNES += "armv7ahf armv7athf armv7ahf-neon armv7athf-neon"
 TUNE_FEATURES_tune-armv7ahf ?= "${TUNE_FEATURES_tune-armv7a} callconvention-hard"
 TUNE_FEATURES_tune-armv7athf ?= "${TUNE_FEATURES_tune-armv7at} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahf-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
-TUNE_FEATURES_tune-armv7athf-neon ?= "${TUNE_FEATURES_tune_armv7at-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-neon ?= "${TUNE_FEATURES_tune-armv7at-neon} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf} armv7ahf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
@@ -48,7 +48,7 @@ AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-neon armv7athfb-neon"
 TUNE_FEATURES_tune-armv7ahfb ?= "${TUNE_FEATURES_tune-armv7ab} callconvention-hard"
 TUNE_FEATURES_tune-armv7athfb ?= "${TUNE_FEATURES_tune-armv7atb} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahfb-neon ?= "${TUNE_FEATURES_tune-armv7ab-neon} callconvention-hard"
-TUNE_FEATURES_tune-armv7athfb-neon ?= "${TUNE_FEATURES_tune_armv7atb-neon} callconvention-hard"
+TUNE_FEATURES_tune-armv7athfb-neon ?= "${TUNE_FEATURES_tune-armv7atb-neon} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb} armv7ahfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7ahfb-vfp armv7at2hfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfp-neon"
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index 85408eb..20a3c65 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -11,5 +11,5 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7m", "-march=armv7-m"
 
 AVAILTUNES += "cortexm3"
 TUNE_FEATURES_tune-cortexm3 = "armv7m vfp cortexm3"
-PACKAGE_EXTRA_ARCHS_tune-cortexm3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7m"
+PACKAGE_EXTRA_ARCHS_tune-cortexm3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7m-vfp"
 
diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index 8d2459f..d1fc607 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -11,4 +11,4 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7r", "-march=armv7-m"
 
 AVAILTUNES += "cortexr4"
 TUNE_FEATURES_tune-cortexr4 = "armv7r vfp cortexr4"
-PACKAGE_EXTRA_ARCHS_tune-cortexr4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r"
+PACKAGE_EXTRA_ARCHS_tune-cortexr4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r-vfp"
-- 
1.7.1



