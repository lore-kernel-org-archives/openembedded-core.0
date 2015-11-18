Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4BCA360043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 18:37:16 +0000 (UTC)
Received: by wmww144 with SMTP id w144so84866694wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 10:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yChrag4Lx8E052uW/YvDbm8cgTG/vXoI+j9PTsXNatM=;
	b=BqVW3E98Ov0vwO7a5SHzeiOJMRUpAuNPhCo+bl06Z7A38MUNMOix2nlYYOfTEcnoX/
	VXraCtRyeQf1Z3L4uG7hiq9KekN/7kQg/D8zSBGkQsPrXpsYShnBVlsfU5kepAgbmYwy
	LJSC1IQNuL6hv17Y1lYc8NaAje0qJr4IOdwafIQzwrjK3M2g6BjOKa1fjdQJuItNrpaO
	cuGAJ64GM3KmC/QnYB+/RZk0wkzwoPhAlwshdtcXFzfj43iwWq4nrAuBFm9j1iAZGNKH
	O2T6Hx4FsL7bDtOzrZKRvqDoOmiIj3b+zDf0a7p90Qmv1MZlP0qGv5u2JvOk3GYYAH9C
	PYQQ==
X-Received: by 10.194.79.227 with SMTP id m3mr3590860wjx.123.1447871837303;
	Wed, 18 Nov 2015 10:37:17 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q141sm4555088wmg.3.2015.11.18.10.37.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Nov 2015 10:37:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 19:37:22 +0100
Message-Id: <1447871842-30347-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447871842-30347-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447864860.1472.56.camel@pbcl.net>
	<1447871842-30347-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv3 6/6] feature-arm-vfp.inc: add -mfpu=vfpv4 when vfpv4 is in TUNE_FEATURES
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
X-List-Received-Date: Wed, 18 Nov 2015 18:37:17 -0000

* allows to use vfpv4 without neon

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-neon.inc | 3 ++-
 meta/conf/machine/include/arm/feature-arm-vfp.inc  | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/conf/machine/include/arm/feature-arm-neon.inc
index e9351f9..78b1dfb 100644
--- a/meta/conf/machine/include/arm/feature-arm-neon.inc
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -1,3 +1,4 @@
 TUNEVALID[neon] = "Enable Neon SIMD accelerator unit."
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', bb.utils.contains('TUNE_FEATURES', 'vfpv4', ' -mfpu=neon-vfpv4', ' -mfpu=neon', d), '' , d)}"
+# vfpv4 case is handled in feature-arm-vfp.inc
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', bb.utils.contains('TUNE_FEATURES', 'vfpv4', '', ' -mfpu=neon', d), '' , d)}"
 ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', '-neon', '', d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 75c05fb..802a99a 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -10,6 +10,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' -mfpu=vfpv3', '
 ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', '-vfpv3', '' ,d)}"
 
 TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', bb.utils.contains('TUNE_FEATURES', 'neon', ' -mfpu=neon-vfpv4', ' -mfpu=vfpv4', d), '' , d)}"
 ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', '-vfpv4', '' ,d)}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
-- 
2.6.3


