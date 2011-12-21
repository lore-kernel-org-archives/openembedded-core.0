Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <victor.quicksilver@gmail.com>) id 1RdUZo-0005bJ-9o
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 23:23:56 +0100
Received: by wibhq7 with SMTP id hq7so2249945wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 14:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=rCpr+O213UJUTI0bdZEymdY01yCpk/76E/ZsbEcCr6c=;
	b=js+YS5BbvyubAoB3+W/+JzCZtuIJeH425/AAdW3rUwK3Woyw4cGg3Oie6pH4cZR/a/
	ne1SNZONpE7rj0xf9IUnZAMCbC4EloeL4WGqDqluzVE7KZnBFCkR3JbDkGxEzZBS+ZDn
	+7CVpWNWVH/M/X+kChWUbvR7PhPjwTqTLEOTw=
Received: by 10.180.19.138 with SMTP id f10mr22659650wie.3.1324505810844;
	Wed, 21 Dec 2011 14:16:50 -0800 (PST)
Received: from localhost.localdomain
	(246.Red-79-154-51.dynamicIP.rima-tde.net. [79.154.51.246])
	by mx.google.com with ESMTPS id b5sm7365596wbh.4.2011.12.21.14.16.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 14:16:49 -0800 (PST)
From: =?UTF-8?q?V=C3=ADctor=20Enr=C3=ADquez?= <victor.quicksilver@gmail.com>
To: openembedded-core@lists.openembedded.org, philb@gnu.org, GNUtoo@no-log.org
Date: Wed, 21 Dec 2011 23:16:02 +0100
Message-Id: <1324505762-30279-1-git-send-email-victor.quicksilver@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <1318534968.3158.2.camel@lenovo.internal.reciva.com>
References: <1318534968.3158.2.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] conf: machine: includes: add armv6-novfp support
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
X-List-Received-Date: Wed, 21 Dec 2011 22:23:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This work was made by Victor Enriquez and then modified by Denis Carikli who was helped by Mark Hatle comments (who is fray on 
#yocto channel on Freenode).

The changes are for adding support to armv6-novfp, for building binaries for armv6 machines without vfp, for example the htc 
dream.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Víctor Enríquez <victor.quicksilver@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv6.inc      |   28 +++++++++++++-------
 meta/conf/machine/include/arm/feature-arm-vfp.inc |    4 ++-
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index da8274e..f9c112e 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -10,24 +10,32 @@ MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv6", ":armv6", ""
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



