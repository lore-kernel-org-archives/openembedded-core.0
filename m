Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <victor.quicksilver@gmail.com>) id 1RdSHQ-0000kG-Of
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 20:56:48 +0100
Received: by wibhq7 with SMTP id hq7so2180592wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 11:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=bcAbPQJrnv38V3IJqywgn85XFrZAYZWFqsGTEsyosPU=;
	b=f0uKWuK+95b4Qlgl5mgb/KGyKUyyx1dwy8XY7IhNyvH+9+2J9A8KFUztT5KDrycivb
	zcnIk67NtYWRHvwrpDpoM82hBrYCwQCz9L1k4EsQRPygE8u5mJxACoJAQLz3spxDG0y9
	7kC2OEXBerA30bRLWLXmL2MHjLKV0fyVMgUNo=
Received: by 10.180.106.165 with SMTP id gv5mr16894645wib.18.1324496983598;
	Wed, 21 Dec 2011 11:49:43 -0800 (PST)
Received: from localhost.localdomain
	(246.Red-79-154-51.dynamicIP.rima-tde.net. [79.154.51.246])
	by mx.google.com with ESMTPS id fq7sm6974854wbb.1.2011.12.21.11.49.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 11:49:42 -0800 (PST)
From: vquicksilver <victor.quicksilver@gmail.com>
To: openembedded-core@lists.openembedded.org, philb@gnu.org, GNUtoo@no-log.org
Date: Wed, 21 Dec 2011 20:48:14 +0100
Message-Id: <1324496894-29239-1-git-send-email-victor.quicksilver@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <1318534968.3158.2.camel@lenovo.internal.reciva.com>
References: <1318534968.3158.2.camel@lenovo.internal.reciva.com>
Subject: Re: [PATCH] conf: machine: includes: add armv6-novfp support
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
X-List-Received-Date: Wed, 21 Dec 2011 19:56:48 -0000

This work was made by Victor Enriquez and then modified by
Denis Carikli who was helped by Mark Hatle comments( who is
fray on #yocto channel on Freenode ).

The changes are for adding support to armv6-novfp, forbuilding
binaries for armv6 machines without vfp, for examplethe htcdream.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: vquicksilver <victor.quicksilver@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv6.inc      |   31 +++++++++++++--------
 meta/conf/machine/include/arm/feature-arm-vfp.inc |    4 ++-
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index da8274e..3396c69 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -1,33 +1,40 @@
 DEFAULTTUNE ?= "armv6"
 
-ARMPKGARCH ?= "armv6"
+ARMPKGARCH := "armv6"
 
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNE_CONFLICTS[armv6] = "armv4 armv5"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv6", "-march=armv6", "", d)}"
-MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv6", ":armv6", "" ,d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 # Little Endian
-AVAILTUNES += "armv6 armv6t armv6hf armv6thf"
+AVAILTUNES += "armv6-novfp armv6 armv6t armv6t-novfp armv6hf armv6thf"
+TUNE_FEATURES_tune-armv6-novfp ?= "armv6"
 TUNE_FEATURES_tune-armv6 ?= "armv6 vfp"
+TUNE_FEATURES_tune-armv6t-novfp ?= "armv6 thumb"
 TUNE_FEATURES_tune-armv6t ?= "armv6 vfp thumb"
 TUNE_FEATURES_tune-armv6hf ?= "${TUNE_FEATURES_tune-armv6} callconvention-hard"
 TUNE_FEATURES_tune-armv6thf ?= "${TUNE_FEATURES_tune-armv6t} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6t = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6-vfp armv6t-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6hf = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp} armv6hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6thf = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp} armv6hf-vfp armv6thf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5e} armv6-novfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp} armv6-novfp armv6"
+PACKAGE_EXTRA_ARCHS_tune-armv6t-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5e} armv6-novfp armv6t-novfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6t = "${PACKAGE_EXTRA_ARCHS_tune-armv5te-vfp} armv6-novfp armv6t-novfp armv6-vfp armv6t"
+PACKAGE_EXTRA_ARCHS_tune-armv6hf = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehf-vfp} armv6hf"
+PACKAGE_EXTRA_ARCHS_tune-armv6thf = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehf-vfp} armv6hf-vfp armv6thf"
 
 # Big Endian
-AVAILTUNES += "armv6b armv6tb armv6hfb armv6thfb"
+AVAILTUNES += "armv6b-novfp armv6b armv6tb-novfp armv6tb armv6hfb armv6thfb"
+TUNE_FEATURES_tune-armv6b-novfp ?= "${TUNE_FEATURES_tune-armv6-novfp} bigendian"
 TUNE_FEATURES_tune-armv6b ?= "${TUNE_FEATURES_tune-armv6} bigendian"
+TUNE_FEATURES_tune-armv6tb-novfp ?= "${TUNE_FEATURES_tune-armv6t-novfp} bigendian"
 TUNE_FEATURES_tune-armv6tb ?= "${TUNE_FEATURES_tune-armv6t} bigendian"
 TUNE_FEATURES_tune-armv6hfb ?= "${TUNE_FEATURES_tune-armv6b} callconvention-hard"
 TUNE_FEATURES_tune-armv6thfb ?= "${TUNE_FEATURES_tune-armv6tb} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp} armv6b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b-vfp armv6tb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp} armv6hfb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv6thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6b-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb} armv6b-novfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6b = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb-vfp} armv6b"
+PACKAGE_EXTRA_ARCHS_tune-armv6tb-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5eb} armv6b-novfp armv6tb-novfp"
+PACKAGE_EXTRA_ARCHS_tune-armv6tb = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb-vfp} armv6b-novfp armv6tb-novfp armv6b-vfp armv6tb"
+PACKAGE_EXTRA_ARCHS_tune-armv6hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5ehfb-vfp} armv6hfb"
+PACKAGE_EXTRA_ARCHS_tune-armv6thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv5tehfb-vfp} armv6hfb-vfp armv6thfb"
 
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 29a925c..78f453c 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -1,5 +1,7 @@
 TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp", "" ,d)}"
+TUNE_ARM_VFP = "${@bb.utils.contains("ARMPKGARCH", "armv6", "", "vfp" ,d)}"
+TUNE_ARM_NOVFP = "${@bb.utils.contains("ARMPKGARCH", "armv6", "-novfp", "" ,d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "${TUNE_ARM_VFP}", "${TUNE_ARM_NOVFP}" ,d)}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}"
-- 
1.7.8



