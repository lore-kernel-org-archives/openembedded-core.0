Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id DAB89731A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:25 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id c201so33879733wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=/91T3ypPxwsqYDoQrViLOwMZRge4iXGLEpy1nFn93hA=;
	b=N77FdBHknd2Z1n5RSsoPOkoP1TBna6tZybz9PoofvK2ob32OsBZQBlUkFvyKJfw9fC
	Nm4YB1qTUBU846tYmNYWdMy7qEdIToRSOIx5GmmXp0rwki8GizIj9j25rg9W4+vv6RUp
	xpdK5OBMtyzl9fHKFncUIGWqL1zzr2oqqVNO4WXreoC1PoDTG5a8MCy+szO6fqjrt7gg
	xFs6U1nSaQn5XRjAXEcUyDbwVipSE/WieqoijAi2aNevtkb5Sru38OMrWZVygGqsqFl7
	QGY7L54LYn4zS4AmoWXYBNJ+jffkKGx4q6Z4ZUCalx6tLonV18NM4HGVZpGVuFO6NsyC
	BU/Q==
X-Received: by 10.194.104.5 with SMTP id ga5mr13219616wjb.155.1449755246000;
	Thu, 10 Dec 2015 05:47:26 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	d2sm12522015wjy.16.2015.12.10.05.47.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:47 +0100
Message-Id: <ea8f349a89f068c3db85d9fe3d01309a463a0f7f.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 10/15] arch-armv7a.inc: add vfpv4 support also to softfp and big endiand tunes
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7a.inc | 28 ++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 79ca83e..0c6e755 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -9,7 +9,7 @@ require conf/machine/include/arm/arch-armv6.inc
 require conf/machine/include/arm/feature-arm-neon.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16 armv7a-vfpv3 armv7at-vfpv3 armv7a-neon armv7at-neon"
+AVAILTUNES += "armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16 armv7a-vfpv3 armv7at-vfpv3 armv7a-neon armv7at-neon armv7a-neon-vfpv4 armv7at-neon-vfpv4"
 ARMPKGARCH_tune-armv7a             ?= "armv7a"
 ARMPKGARCH_tune-armv7at            ?= "armv7a"
 ARMPKGARCH_tune-armv7a-vfpv3d16    ?= "armv7a"
@@ -18,6 +18,8 @@ ARMPKGARCH_tune-armv7a-vfpv3       ?= "armv7a"
 ARMPKGARCH_tune-armv7at-vfpv3      ?= "armv7a"
 ARMPKGARCH_tune-armv7a-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7at-neon       ?= "armv7a"
+ARMPKGARCH_tune-armv7a-neon-vfpv4  ?= "armv7a"
+ARMPKGARCH_tune-armv7at-neon-vfpv4 ?= "armv7a"
 TUNE_FEATURES_tune-armv7a             = "arm armv7a vfp"
 TUNE_FEATURES_tune-armv7at            = "${TUNE_FEATURES_tune-armv7a} thumb"
 TUNE_FEATURES_tune-armv7a-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a}  vfpv3d16"
@@ -26,6 +28,8 @@ TUNE_FEATURES_tune-armv7a-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3d16}
 TUNE_FEATURES_tune-armv7at-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3d16} vfpv3"
 TUNE_FEATURES_tune-armv7a-neon        = "${TUNE_FEATURES_tune-armv7a}  neon"
 TUNE_FEATURES_tune-armv7at-neon       = "${TUNE_FEATURES_tune-armv7at} neon"
+TUNE_FEATURES_tune-armv7a-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon}  vfpv4"
+TUNE_FEATURES_tune-armv7at-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon} vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7a             = "${PACKAGE_EXTRA_ARCHS_tune-armv6}  armv7a armv7a-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7at            = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7a armv7a-vfp armv7at2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-vfp-vfpv3d16"
@@ -34,6 +38,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7a
 PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} armv7a-vfp-vfpv3d16-vfpv3 armv7at2-vfp-vfpv3d16-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7a-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  armv7a-vfp-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} armv7a-vfp-neon-vfpv4 armv7at2-vfp-neon-vfpv4"
 
 # HF Tunes
 AVAILTUNES += "armv7ahf armv7athf armv7ahf-vfpv3d16 armv7athf-vfpv3d16 armv7ahf-vfpv3 armv7athf-vfpv3 armv7ahf-neon armv7athf-neon armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4"
@@ -55,8 +61,8 @@ TUNE_FEATURES_tune-armv7ahf-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3}
 TUNE_FEATURES_tune-armv7athf-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3}      callconvention-hard"
 TUNE_FEATURES_tune-armv7ahf-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        callconvention-hard"
 TUNE_FEATURES_tune-armv7athf-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       callconvention-hard"
-TUNE_FEATURES_tune-armv7ahf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon}      vfpv4"
-TUNE_FEATURES_tune-armv7athf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon}     vfpv4"
+TUNE_FEATURES_tune-armv7ahf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf}  armv7ahf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-vfp-vfpv3d16"
@@ -69,7 +75,7 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-vfp-neon-vfpv4 armv7at2hf-vfp-neon-vfpv4"
 
 # Big Endian
-AVAILTUNES += "armv7ab armv7atb armv7ab-vfpv3d16 armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3 armv7ab-neon armv7atb-neon"
+AVAILTUNES += "armv7ab armv7atb armv7ab-vfpv3d16 armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3 armv7ab-neon armv7atb-neon armv7ab-neon-vfpv4 armv7atb-neon-vfpv4"
 ARMPKGARCH_tune-armv7ab             ?= "armv7a"
 ARMPKGARCH_tune-armv7atb            ?= "armv7a"
 ARMPKGARCH_tune-armv7ab-vfpv3d16    ?= "armv7a"
@@ -78,6 +84,8 @@ ARMPKGARCH_tune-armv7ab-vfpv3       ?= "armv7a"
 ARMPKGARCH_tune-armv7atb-vfpv3      ?= "armv7a"
 ARMPKGARCH_tune-armv7ab-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7atb-neon       ?= "armv7a"
+ARMPKGARCH_tune-armv7ab-neon-vfpv4  ?= "armv7a"
+ARMPKGARCH_tune-armv7atb-neon-vfpv4 ?= "armv7a"
 TUNE_FEATURES_tune-armv7ab             = "${TUNE_FEATURES_tune-armv7a}             bigendian"
 TUNE_FEATURES_tune-armv7atb            = "${TUNE_FEATURES_tune-armv7at}            bigendian"
 TUNE_FEATURES_tune-armv7ab-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a-vfpv3d16}    bigendian"
@@ -86,6 +94,8 @@ TUNE_FEATURES_tune-armv7ab-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3}
 TUNE_FEATURES_tune-armv7atb-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3}      bigendian"
 TUNE_FEATURES_tune-armv7ab-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        bigendian"
 TUNE_FEATURES_tune-armv7atb-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       bigendian"
+TUNE_FEATURES_tune-armv7ab-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  bigendian"
+TUNE_FEATURES_tune-armv7atb-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab             = "${PACKAGE_EXTRA_ARCHS_tune-armv6b}  armv7ab-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7ab-vfp armv7at2b-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-vfp-vfpv3d16"
@@ -94,9 +104,11 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16} armv7ab-vfp-vfpv3d16-vfpv3 armv7at2b-vfp-vfpv3d16-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfp-neon armv7at2b-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon}  armv7ab-vfp-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon} armv7ab-vfp-neon-vfpv4 armv7at2b-vfp-neon-vfpv4"
 
 # Big Endian + HF
-AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-vfpv3d16 armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3 armv7ahfb-neon armv7athfb-neon"
+AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-vfpv3d16 armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3 armv7ahfb-neon armv7athfb-neon armv7ahfb-neon-vfpv4 armv7athfb-neon-vfpv4"
 ARMPKGARCH_tune-armv7ahfb             ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb            ?= "armv7a"
 ARMPKGARCH_tune-armv7ahfb-vfpv3d16    ?= "armv7a"
@@ -105,6 +117,8 @@ ARMPKGARCH_tune-armv7ahfb-vfpv3       ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-vfpv3      ?= "armv7a"
 ARMPKGARCH_tune-armv7ahfb-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-neon       ?= "armv7a"
+ARMPKGARCH_tune-armv7ahfb-neon-vfpv4  ?= "armv7a"
+ARMPKGARCH_tune-armv7athfb-neon-vfpv4 ?= "armv7a"
 TUNE_FEATURES_tune-armv7ahfb             = "${TUNE_FEATURES_tune-armv7ahf}             bigendian"
 TUNE_FEATURES_tune-armv7athfb            = "${TUNE_FEATURES_tune-armv7athf}            bigendian"
 TUNE_FEATURES_tune-armv7ahfb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ahf-vfpv3d16}    bigendian"
@@ -113,6 +127,8 @@ TUNE_FEATURES_tune-armv7ahfb-vfpv3       = "${TUNE_FEATURES_tune-armv7ahf-vfpv3}
 TUNE_FEATURES_tune-armv7athfb-vfpv3      = "${TUNE_FEATURES_tune-armv7athf-vfpv3}      bigendian"
 TUNE_FEATURES_tune-armv7ahfb-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        bigendian"
 TUNE_FEATURES_tune-armv7athfb-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       bigendian"
+TUNE_FEATURES_tune-armv7ahfb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  bigendian"
+TUNE_FEATURES_tune-armv7athfb-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb}  armv7ahfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7ahfb-vfp armv7at2hfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-vfp-vfpv3d16"
@@ -121,3 +137,5 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-arm
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16} armv7ahfb-vfp-vfpv3d16-vfpv3 armv7at2hfb-vfp-vfpv3d16-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-neon armv7at2hfb-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon}  armv7ahfb-vfp-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon} armv7ahfb-vfp-neon-vfpv4 armv7at2hfb-vfp-neon-vfpv4"
-- 
2.6.3


