Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1D37F731BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:26 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id c201so33880807wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=oSEgFXO0HwQMCKcMKYnmxRh8C8mKGZO+AjDPM34Zxck=;
	b=q0Z3/+/GJWEpO1+pCpDTGjo7LJpl6Np6rtZoBV2+DTw+F9KBQlxcTi44c0IrK8tBfv
	LS1zdXozXr3UWS4aJVd4eq7mvx+Mds4ODZUFz/0sKt3ls2wOF9LZTYrYO1/jjKoWNWTs
	SaJy+VyTmxuK6VDoBEJLbzG+sjenmXGarKywSIXU6tUVbxQkINtGcmB2FOt+vQF9AB/L
	anYzuHNcR4VimqHEzkQp5RohjRT/OEWBxPnHgxsyow+8MLE5lPmdChxDyMKA3EVfqn/i
	a3c3ZweHGdb9x4Axei87yS78LaVn4kS95vInqMOqM3QWCC4fjzCI37QJY39AC026SgbB
	s7MA==
X-Received: by 10.195.18.6 with SMTP id gi6mr14147986wjd.83.1449755247341;
	Thu, 10 Dec 2015 05:47:27 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bv1sm4011583wjc.24.2015.12.10.05.47.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:48 +0100
Message-Id: <1350437f19e20de76f98bcda866b2f0239ee7f9d.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 11/15] feature-arm-{neon, vfp}.inc: refactor and fix issues
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:27 -0000

* respect all 4 vfp options ('vfp', 'vfpv3d16', 'vfpv3', 'vfpv4') when
  setting -mfloat-abi and ARMPKGSFX_EABI, without this change it wasn't
  possible to use call-convention hard together with vfpv4
* move 'vfpv3d16', 'vfpv3', 'vfpv4' support from
  feature-arm-vfp.inc
  to
  feature-arm-neon.inc
  the main difference is that feature-arm-vfp.inc is included in
  arch-armv5.inc while feature-arm-neon.inc only in armv7*.inc, so
  these options should be added to TUNEVALID also only for armv7*
  MACHINEs.
* support vfpv4 with or without neon
  when both vfpv4 and neon are in TUNE_FEATURES we want to set only one
  -mfpu parameter and to neon-vfpv4
* prevent multiple appends to ARMPKGSFX_FPU, we don't want to include
  e.g. -vfp as well as -vfpv4 when both "vfp" and "vfpv4" are in
  TUNE_FEATURES
* add -mfpu=vfp for tunes with "vfp" in TUNE_FEATURES - before that we
  were only adding -vfp to ARMPKGSFX_FPU
* add TUNE_CCARGS_MFPU variable which is used to set -mfpu parameter as
  well as ARMPKGSFX_FPU suffix in TUNE_PKGARCH, all enabled values are
  appended to it based on TUNE_FEATURES and then the last one is used
  in the actual param and suffix
* this prevents multiple -mfpu options in TUNE_CCARGS

* !!!
  This means we need to change TUNE_PKGARCH and PACKAGE_EXTRA_ARCHS for
  vfpv4, vfpv3d16, vfpv3 tunes, because the -vfp* isn't prependend
  multiple times. If you're using one of these new DEFAULTTUNES (which
  were at least partially broken anyway) and depend on working binary
  package feed upgrade-path, then don't forget to migrate PR service
  database to new TUNE_PKGARCH.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7a.inc      | 64 +++++++++++-----------
 meta/conf/machine/include/arm/feature-arm-neon.inc | 19 ++++++-
 meta/conf/machine/include/arm/feature-arm-vfp.inc  | 22 +++-----
 meta/conf/machine/include/tune-cortexa15.inc       |  8 +--
 meta/conf/machine/include/tune-cortexa17.inc       |  8 +--
 meta/conf/machine/include/tune-cortexa5.inc        |  8 +--
 meta/conf/machine/include/tune-cortexa7.inc        | 12 ++--
 meta/conf/machine/include/tune-cortexa8.inc        |  8 +--
 meta/conf/machine/include/tune-cortexa9.inc        |  8 +--
 9 files changed, 84 insertions(+), 73 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 0c6e755..1f2e071 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -32,14 +32,14 @@ TUNE_FEATURES_tune-armv7a-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon}  vfpv
 TUNE_FEATURES_tune-armv7at-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon} vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7a             = "${PACKAGE_EXTRA_ARCHS_tune-armv6}  armv7a armv7a-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7at            = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7a armv7a-vfp armv7at2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-vfpv3d16 armv7at2-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16}  armv7a-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} armv7a-vfp-vfpv3d16-vfpv3 armv7at2-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7a-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7at-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  armv7a-vfp-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} armv7a-vfp-neon-vfpv4 armv7at2-vfp-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfpv3d16 armv7at2-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16}  armv7a-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} armv7a-vfpv3 armv7at2-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7a-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-neon armv7at2-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  armv7a-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} armv7a-neon-vfpv4 armv7at2-neon-vfpv4"
 
 # HF Tunes
 AVAILTUNES += "armv7ahf armv7athf armv7ahf-vfpv3d16 armv7athf-vfpv3d16 armv7ahf-vfpv3 armv7athf-vfpv3 armv7ahf-neon armv7athf-neon armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4"
@@ -65,14 +65,14 @@ TUNE_FEATURES_tune-armv7ahf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv
 TUNE_FEATURES_tune-armv7athf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf}  armv7ahf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7ahf-vfp armv7at2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-vfpv3d16 armv7at2hf-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16}  armv7ahf-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} armv7ahf-vfp-vfpv3d16-vfpv3 armv7at2hf-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon armv7at2hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  armv7ahf-vfp-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-vfp-neon-vfpv4 armv7at2hf-vfp-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfpv3d16 armv7at2hf-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16}  armv7ahf-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} armv7ahf-vfpv3 armv7at2hf-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7ahf-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-neon armv7at2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  armv7ahf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-neon-vfpv4 armv7at2hf-neon-vfpv4"
 
 # Big Endian
 AVAILTUNES += "armv7ab armv7atb armv7ab-vfpv3d16 armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3 armv7ab-neon armv7atb-neon armv7ab-neon-vfpv4 armv7atb-neon-vfpv4"
@@ -98,14 +98,14 @@ TUNE_FEATURES_tune-armv7ab-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4
 TUNE_FEATURES_tune-armv7atb-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab             = "${PACKAGE_EXTRA_ARCHS_tune-armv6b}  armv7ab-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7ab-vfp armv7at2b-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfp-vfpv3d16 armv7at2b-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16}  armv7ab-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16} armv7ab-vfp-vfpv3d16-vfpv3 armv7at2b-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfp-neon armv7at2b-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon}  armv7ab-vfp-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon} armv7ab-vfp-neon-vfpv4 armv7at2b-vfp-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfpv3d16 armv7at2b-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16}  armv7ab-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16} armv7ab-vfpv3 armv7at2b-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7ab-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-neon armv7at2b-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon}  armv7ab-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon} armv7ab-neon-vfpv4 armv7at2b-neon-vfpv4"
 
 # Big Endian + HF
 AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-vfpv3d16 armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3 armv7ahfb-neon armv7athfb-neon armv7ahfb-neon-vfpv4 armv7athfb-neon-vfpv4"
@@ -131,11 +131,11 @@ TUNE_FEATURES_tune-armv7ahfb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-v
 TUNE_FEATURES_tune-armv7athfb-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb}  armv7ahfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7ahfb-vfp armv7at2hfb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-vfpv3d16 armv7at2hfb-vfp-vfpv3d16"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16}  armv7ahfb-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16} armv7ahfb-vfp-vfpv3d16-vfpv3 armv7at2hfb-vfp-vfpv3d16-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-neon armv7at2hfb-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon}  armv7ahfb-vfp-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon} armv7ahfb-vfp-neon-vfpv4 armv7at2hfb-vfp-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfpv3d16 armv7at2hfb-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16}  armv7ahfb-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16} armv7ahfb-vfpv3 armv7at2hfb-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7ahfb-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-neon armv7at2hfb-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon}  armv7ahfb-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon} armv7ahfb-neon-vfpv4 armv7at2hfb-neon-vfpv4"
diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/conf/machine/include/arm/feature-arm-neon.inc
index e9351f9..50d9175 100644
--- a/meta/conf/machine/include/arm/feature-arm-neon.inc
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -1,3 +1,18 @@
+# GCC supports following options:
+# 'vfp', 'vfpv3', 'vfpv3-fp16', 'vfpv3-d16', 'vfpv3-d16-fp16', 'vfpv3xd', 'vfpv3xd-fp16', 'neon', 'neon-fp16', 'vfpv4', 'vfpv4-d16', 'fpv4-sp-d16', 'neon-vfpv4', 'fpv5-d16', 'fpv5-sp-d16', 'fp-armv8', 'neon-fp-armv8', and 'crypto-neon-fp-armv8'
+
+# Only some combinations are supported here.
+# 'vfp', -mfloat-abi parameter and 'hf' suffix is implemented in feature-arm-vfp.inc
+
 TUNEVALID[neon] = "Enable Neon SIMD accelerator unit."
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', bb.utils.contains('TUNE_FEATURES', 'vfpv4', ' -mfpu=neon-vfpv4', ' -mfpu=neon', d), '' , d)}"
-ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', '-neon', '', d)}"
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', ' neon', '', d)}"
+
+TUNEVALID[vfpv3d16] = "Enable Vector Floating Point Version 3 with 16 registers (vfpv3-d16) unit."
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', ' vfpv3d16', '', d)}"
+
+TUNEVALID[vfpv3] = "Enable Vector Floating Point Version 3 with 32 registers (vfpv3) unit."
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' vfpv3', '' , d)}"
+
+TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', ' vfpv4', '', d)}"
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv4', 'neon' ], ' neon-vfpv4', '', d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index e23d377..1b39488 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -1,17 +1,13 @@
-TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
-ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', '-vfp', '' ,d)}"
-
-TUNEVALID[vfpv3d16] = "Enable Vector Floating Point Version 3 with 16 registers (vfpv3-d16) unit."
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', ' -mfpu=vfpv3-d16', '', d)}"
-ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', '-vfpv3d16', '' ,d)}"
+# This is only for VFPv1 or VFPv2, other vfp* tunes are defined in
+# feature-arm-neon.inc, because they are available only for armv7*
+# and this .inc file is included from armv5
 
-TUNEVALID[vfpv3] = "Enable Vector Floating Point Version 3 with 32 registers (vfpv3) unit."
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' -mfpu=vfpv3', '', d)}"
-ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', '-vfpv3', '' ,d)}"
+TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vfp', '', d)}"
 
-TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
-ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', '-vfpv4', '' ,d)}"
+TUNE_CCARGS  .= "${@ (' -mfpu=%s ' % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
+ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', ' -mfloat-abi=hard', ' -mfloat-abi=softfp', d), '' ,d)}"
-ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [ 'callconvention-hard', 'vfp' ], 'hf', '', d)}"
+TUNE_CCARGS   .= "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', ' -mfloat-abi=hard', ' -mfloat-abi=softfp', d) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else '' }"
+ARMPKGSFX_EABI = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hf',                '',                    d) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else '' }"
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index b4a693d..7e597f3 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -17,8 +17,8 @@ TUNE_FEATURES_tune-cortexa15-neon        = "${TUNE_FEATURES_tune-armv7a-neon}
 TUNE_FEATURES_tune-cortexa15t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa15"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa15-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa15-vfp cortexa15-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa15-vfp cortexa15-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-neon cortexa15t2-vfp cortexa15t2-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon"
@@ -32,5 +32,5 @@ TUNE_FEATURES_tune-cortexa15hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon
 TUNE_FEATURES_tune-cortexa15thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa15"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa15hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa15hf-vfp cortexa15hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2hf-vfp cortexa15t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa15hf-vfp cortexa15hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-neon cortexa15t2hf-vfp cortexa15t2hf-neon"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index 69232d0..5cc4567 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -17,8 +17,8 @@ TUNE_FEATURES_tune-cortexa17-neon        = "${TUNE_FEATURES_tune-armv7a-neon}
 TUNE_FEATURES_tune-cortexa17t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa17"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa17-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa17-vfp cortexa17t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa17-vfp cortexa17-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa17-vfp cortexa17-vfp-neon cortexa17t2-vfp cortexa17t2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa17-vfp cortexa17-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa17-vfp cortexa17-neon cortexa17t2-vfp cortexa17t2-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa17hf cortexa17thf cortexa17hf-neon cortexa17thf-neon"
@@ -32,5 +32,5 @@ TUNE_FEATURES_tune-cortexa17hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon
 TUNE_FEATURES_tune-cortexa17thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa17"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa17hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa17thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa17hf-vfp cortexa17t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa17hf-vfp cortexa17hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa17hf-vfp cortexa17hf-vfp-neon cortexa17t2hf-vfp cortexa17t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa17hf-vfp cortexa17hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa17hf-vfp cortexa17hf-neon cortexa17t2hf-vfp cortexa17t2hf-neon"
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index b649641..0d82854 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -17,8 +17,8 @@ TUNE_FEATURES_tune-cortexa5-neon        = "${TUNE_FEATURES_tune-armv7a-neon}
 TUNE_FEATURES_tune-cortexa5t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa5"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa5-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa5-vfp cortexa5-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-vfp-neon cortexa5t2-vfp cortexa5t2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa5-vfp cortexa5-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-neon cortexa5t2-vfp cortexa5t2-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon"
@@ -32,5 +32,5 @@ TUNE_FEATURES_tune-cortexa5hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}
 TUNE_FEATURES_tune-cortexa5thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa5"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa5hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa5thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa5hf-vfp cortexa5hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp cortexa5hf-vfp-neon cortexa5t2hf-vfp cortexa5t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa5hf-vfp cortexa5hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp cortexa5hf-neon cortexa5t2hf-vfp cortexa5t2hf-neon"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 23f2ff6..133ce38 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -17,8 +17,8 @@ TUNE_FEATURES_tune-cortexa7-neon        = "${TUNE_FEATURES_tune-armv7a-neon}
 TUNE_FEATURES_tune-cortexa7t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa7"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa7-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa7-vfp cortexa7-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-vfp-neon cortexa7t2-vfp cortexa7t2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa7-vfp cortexa7-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-neon cortexa7t2-vfp cortexa7t2-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
@@ -36,7 +36,7 @@ TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-
 TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa7"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa7hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa7hf-vfp cortexa7hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7hf-vfp-vfpv4-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-vfp-neon cortexa7hf-vfp-vfpv4-neon cortexa7t2hf-vfp cortexa7t2hf-vfp-neon cortexa7t2hf-vfp-vfpv4-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa7hf-vfp cortexa7hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-neon cortexa7t2hf-vfp cortexa7t2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon cortexa7t2hf-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 71706e4..1daaf83 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -17,8 +17,8 @@ TUNE_FEATURES_tune-cortexa8-neon        = "${TUNE_FEATURES_tune-armv7a-neon}
 TUNE_FEATURES_tune-cortexa8t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa8"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa8-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa8-vfp cortexa8-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-vfp-neon cortexa8t2-vfp cortexa8t2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa8-vfp cortexa8-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-neon cortexa8t2-vfp cortexa8t2-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon cortexa8thf-neon"
@@ -32,5 +32,5 @@ TUNE_FEATURES_tune-cortexa8hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}
 TUNE_FEATURES_tune-cortexa8thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa8"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa8hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa8hf-vfp cortexa8hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon cortexa8t2hf-vfp cortexa8t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa8hf-vfp cortexa8hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp cortexa8hf-neon cortexa8t2hf-vfp cortexa8t2hf-neon"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index ddd6f77..29e6651 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -17,8 +17,8 @@ TUNE_FEATURES_tune-cortexa9-neon        = "${TUNE_FEATURES_tune-armv7a-neon}
 TUNE_FEATURES_tune-cortexa9t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa9"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa9-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa9-vfp cortexa9-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-vfp-neon cortexa9t2-vfp cortexa9t2-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa9-vfp cortexa9-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-neon cortexa9t2-vfp cortexa9t2-neon"
 
 # HF Tunes
 AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon cortexa9thf-neon"
@@ -32,5 +32,5 @@ TUNE_FEATURES_tune-cortexa9hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}
 TUNE_FEATURES_tune-cortexa9thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa9"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa9hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa9hf-vfp cortexa9hf-vfp-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-vfp-neon cortexa9t2hf-vfp cortexa9t2hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa9hf-vfp cortexa9hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-neon cortexa9t2hf-vfp cortexa9t2hf-neon"
-- 
2.6.3


