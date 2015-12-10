Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD0B731B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:28 +0000 (UTC)
Received: by wmec201 with SMTP id c201so25529937wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=OTTBDsY6cJYlzlCCip7mOXTntpsWGz7dTfGiSCeKcn8=;
	b=cLNHLsGxuGr0lYt1c/1EZ9frUVgIZ3SZ6PLCbhgaTtF8uwlLvc1nIqPvMeYiXfSZws
	0oVIhU6zpOtPd2tWhnorGhPXaznijpMF1oSEtEFhPG4ySZTxM6tl8lK5m23GqrAQRGV4
	m9hFoNGnFRXHtbSRf9ylw3AIgAi6lRTS1XwGF9Q6nODIDAM3EybLpv5wb4WizUS1s+Km
	BxVDJKRK9wBbgROLahOpjfzmPaBv06BchGNq7/trjOcs0GXBBPI8ljUFUJTLjT7qE7DZ
	/9rpXOdPFY4jn6ytqrmzUyJMldzzWx6zMJKGwEdMTTEKk8lC0WL1I4mQcXKRrka9IKi4
	UiHw==
X-Received: by 10.194.7.69 with SMTP id h5mr12848665wja.117.1449755248836;
	Thu, 10 Dec 2015 05:47:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w6sm12537403wjy.31.2015.12.10.05.47.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:49 +0100
Message-Id: <f8842c0a2e8380da5f4be12f0465f1ab92daea9b.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 12/15] feature-arm-vfp.inc: Further simplify with TUNE_CCARGS_MFLOAT
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:28 -0000

* add TUNE_CCARGS_MFLOAT variable which is used to set -mfloat-abi
  parameter as well as ARMPKGSFX_EABI suffix in TUNE_PKGARCH and
  TARGET_FPU
* TARGET_FPU was using ARMPKGSFX_FPU, but in most cases we use it
  only to distinguish between hard and soft abi, not various -mfpu
  variants which can appear in ARMPKGSFX_FPU

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-arm.inc        | 3 +--
 meta/conf/machine/include/arm/arch-arm64.inc      | 2 +-
 meta/conf/machine/include/arm/feature-arm-vfp.inc | 5 +++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index 129fbfb..2e3127c 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -13,5 +13,4 @@ TUNE_PKGARCH = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}
 
 ABIEXTENSION = "eabi"
 
-TARGET_FPU = "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or 'soft'}"
-
+TARGET_FPU = "${@d.getVar('TUNE_CCARGS_MFLOAT', True) or 'soft'}"
diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index e098e7a..9440698 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -28,7 +28,7 @@ TARGET_FPU_64 = ""
 TUNE_ARCH_32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'armeb', 'arm', d)}"
 TUNE_PKGARCH_32 = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
 ABIEXTENSION_32 = "eabi"
-TARGET_FPU_32 = "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or 'soft'}"
+TARGET_FPU_32 = "${@d.getVar('TUNE_CCARGS_MFLOAT', True) or 'soft'}"
 
 TUNE_ARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}', '${TUNE_ARCH_32}' ,d)}"
 TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_PKGARCH_64}', '${TUNE_PKGARCH_32}' ,d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 1b39488..4247255 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -9,5 +9,6 @@ TUNE_CCARGS  .= "${@ (' -mfpu=%s ' % d.getVar('TUNE_CCARGS_MFPU', True).split()[
 ARMPKGSFX_FPU = "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else ''}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
-TUNE_CCARGS   .= "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', ' -mfloat-abi=hard', ' -mfloat-abi=softfp', d) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else '' }"
-ARMPKGSFX_EABI = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hf',                '',                    d) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else '' }"
+TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU', True) != '') else '' }"
+TUNE_CCARGS   .= "${@ ' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT', True) != '')     else ''}"
+ARMPKGSFX_EABI = "${@ 'hf'                                 if (d.getVar('TUNE_CCARGS_MFLOAT', True) == 'hard') else ''}"
-- 
2.6.3


