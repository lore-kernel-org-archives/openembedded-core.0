Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9D06D76F8C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 20:16:27 +0000 (UTC)
Received: by qkbl190 with SMTP id l190so29984087qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 13:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gEJQhC3TkaJinRrqb9EI4hhotBBrWpD+BJkamPwD90M=;
	b=jf1AY+E+kHLFQWmCtJ/bfXyTFL97rfCnHiPblFSvKG+ZtWF3DBe4enDTyFcxJ+6DLH
	hFMx2EwY2hisbNX1tSOUcluzAMWB2708c3Z+dAI4lVjZM064IRx5lH5fy5w3efRj6E7x
	wB/dH12aaMn3iNGd77OtWb0SSGbzJ0V1l10rvVwGCoekLcG6urhVp8hK5CTLGfZjw1O2
	DAxon29X4tFeXO4KqaqZXF9yvqHnOgQhOY3f+QMvV6y3tiiQLya2NqWnGJ/vzGYUKKWV
	0jfXtV/gLUG1sViVCB6BbdY+G9PWrRa1waXwIwWTQaFptbwnEhMot8gGEqwD5nLhSyom
	SsEA==
X-Received: by 10.194.110.170 with SMTP id ib10mr39318747wjb.69.1445285787224; 
	Mon, 19 Oct 2015 13:16:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pb4sm42164215wjb.8.2015.10.19.13.16.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Oct 2015 13:16:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 22:16:17 +0200
Message-Id: <1445285777-10934-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <20151019201308.GA2872@jama>
References: <20151019201308.GA2872@jama>
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [RFC][WIP[[PATCHv2] feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi andARMPKGSFX_EABI
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
X-List-Received-Date: Mon, 19 Oct 2015 20:16:28 -0000

* without this change it wasn't possible to use call-convention hard
  together with vfpv4
* also use ' inside quoted values

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-vfp.inc | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 3dfbeac..75c05fb 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -1,17 +1,20 @@
 TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp", "" ,d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', '-vfp', '' ,d)}"
 
 TUNEVALID[vfpv3d16] = "Enable Vector Floating Point Version 3 with 16 registers (vfpv3-d16) unit."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16", " -mfpu=vfpv3-d16", "", d)}"
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16", "-vfpv3d16", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', ' -mfpu=vfpv3-d16', '', d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', '-vfpv3d16', '' ,d)}"
 
 TUNEVALID[vfpv3] = "Enable Vector Floating Point Version 3 with 32 registers (vfpv3) unit."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", " -mfpu=vfpv3", "", d)}"
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", "-vfpv3", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' -mfpu=vfpv3', '', d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', '-vfpv3', '' ,d)}"
 
 TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv4", "-vfpv4", "" ,d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', '-vfpv4', '' ,d)}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
-ARMPKGSFX_EABI .= "${@bb.utils.contains("TUNE_FEATURES", [ "callconvention-hard", "vfp" ], "hf", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains_any('TUNE_FEATURES', [ 'vfp', 'vfpv3d16', 'vfpv3', 'vfpv4' ], bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', ' -mfloat-abi=hard', ' -mfloat-abi=softfp', d), '' ,d)}"
+ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [ 'callconvention-hard', 'vfp' ], 'hf', '', d)}"
+ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [ 'callconvention-hard', 'vfpv3d16' ], 'hf', '', d)}"
+ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [ 'callconvention-hard', 'vfpv3' ], 'hf', '', d)}"
+ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [ 'callconvention-hard', 'vfpv4' ], 'hf', '', d)}"
-- 
2.6.1


