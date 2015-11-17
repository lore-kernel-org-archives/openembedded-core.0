Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 136C6606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:58:12 +0000 (UTC)
Received: by wmec201 with SMTP id c201so223565380wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=jUsozryzzdE2m+0dp1CTEkMxknLy+ecH10+Kqss8btY=;
	b=M3A4jbqILV3z/ngwtVVClEIeMSmUIUEpD/63hBH/SgLkGuSJqGHWzI3PhOThTgKTP+
	YIr/NyUfDFG9/C5kVszsNnw3gzfH79ArO6dTsAiRhg31q+gIuQ5e11iN1N0zOJJu8Ry+
	mDRwhKa1C5oOGieOCCR/PIimUHDB8aWpdBHWzit+8C5SIQbVYnwqa3kEb1reDwSETMzQ
	O0trQhpU+E8IwqZk37UZLzQA8X3t3BgAFBm/aPa0Jt96QIwu/xjVxKoFc+LePU8+2Wao
	xqSwfOhd7P+qMjcHruwfXk78EvWuBWZnFrk5MlAQN2xfgTpYN1H/0n1mRVTCdt/bGLPD
	hjhg==
X-Received: by 10.28.22.67 with SMTP id 64mr2148596wmw.61.1447761493066;
	Tue, 17 Nov 2015 03:58:13 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	k133sm15851531wmg.18.2015.11.17.03.58.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:58:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:58:04 +0100
Message-Id: <d077573772d921ef2b26426ad0c434e02dcb1124.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 12/16] feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi and ARMPKGSFX_EABI
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
X-List-Received-Date: Tue, 17 Nov 2015 11:58:13 -0000

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
2.6.3


