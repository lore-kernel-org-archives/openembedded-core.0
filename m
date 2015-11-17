Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id A1C726010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:58:14 +0000 (UTC)
Received: by wmww144 with SMTP id w144so150403696wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=AlBbGhAwDFlmgEEjr8bOVZWNYS1RY5c2yQnkw90hMtw=;
	b=L7wKPBT98FI11mpKus53nFM1CU+QOsdfbCtg1LEo1Tkz06Lidi52Yqkv4Y+sk5u2IY
	Z3B0Z0tm8YLTSXP7cUu7bljj+959405lacjhYsEYqOJ5PlxTKxzkqjeCMeNJ3hrGhKWJ
	4boiJiaiL8casU/oIHLCBPHiSW0klKW36o95DlZAJ4LuVuJ5Fn2eVqYUxm5BpCUZEWuw
	A96aYyBovCM8DhltQjrUge1+HJQsYWP76sftSopq3girPIN3Cwsi/sJHt+o72A0rKdM4
	5A9fpyYJsomuFDBGAMYX5BYynUQ3JOCrGYm6fvGiedjnUEDe723eYI9OC+eTED+Kt0pX
	vciw==
X-Received: by 10.28.131.84 with SMTP id f81mr2150749wmd.57.1447761494648;
	Tue, 17 Nov 2015 03:58:14 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hu2sm39551979wjb.21.2015.11.17.03.58.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:58:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:58:05 +0100
Message-Id: <dbf6f2cf8127fd318d76839947b0fb66ef2220e4.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 13/16] feature-arm-vfp.inc: add -mfpu=vfpv4 when vfpv4 is in TUNE_FEATURES
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
X-List-Received-Date: Tue, 17 Nov 2015 11:58:15 -0000

* allows to use vfpv4 without neon

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-neon.inc | 5 +++--
 meta/conf/machine/include/arm/feature-arm-vfp.inc  | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/conf/machine/include/arm/feature-arm-neon.inc
index e8b2b85..78b1dfb 100644
--- a/meta/conf/machine/include/arm/feature-arm-neon.inc
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -1,3 +1,4 @@
 TUNEVALID[neon] = "Enable Neon SIMD accelerator unit."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "neon", bb.utils.contains("TUNE_FEATURES", "vfpv4", " -mfpu=neon-vfpv4", " -mfpu=neon", d), "" , d)}"
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "neon", "-neon", "", d)}"
+# vfpv4 case is handled in feature-arm-vfp.inc
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', bb.utils.contains('TUNE_FEATURES', 'vfpv4', '', ' -mfpu=neon', d), '' , d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', '-neon', '', d)}"
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


