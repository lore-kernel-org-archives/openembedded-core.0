Return-Path: <martin.jansa@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 345BD7702A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 20:29:19 +0000 (UTC)
Received: by qkbl190 with SMTP id l190so30640807qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 13:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R2AtsnHVmHnCeOVxsw8KDpGUHiHlZ/Fao8ZFGBYc674=;
	b=QAwwF8ZhqeoeajrHzi9jVA9B2UXGeZ/ZXpC/Hcl0R3oLrE2zKTmUUMbKKbJJqajGZG
	GwaWBYs+/RQEZ7p/KBTW8BG0K3mpaNYpctnqZ6nWwkVV0aszK7iAefO+PP8o/TWkQgiS
	VdtKotf+9BB3Z3Kj+jBcsrgBjb6VZrA6n7vnNi243XV7oqBk/MXxUe5WiUaOkh2oAxzt
	oDnS3AK5S1vw584x/n/e8XkRje1SAHMs1TCFD9nrilHxM91Vl1ixiZXyN9QBmOFzxgKz
	Vg1Gx5PjlmWVjDNX57OYYk3MVcPN6gi98G8DgJzS3W5Q9czzJ/imD2DDTsCJx+SJerZi
	LvcA==
X-Received: by 10.180.75.36 with SMTP id z4mr24354653wiv.68.1445286559347;
	Mon, 19 Oct 2015 13:29:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ry1sm42200346wjb.24.2015.10.19.13.29.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Oct 2015 13:29:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 22:29:23 +0200
Message-Id: <1445286563-11362-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <20151019201308.GA2872@jama>
References: <20151019201308.GA2872@jama>
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [RFC][WIP[[PATCH] feature-arm-vfp.inc: add -mfpu=vfpv4 when vfpv4 is in TUNE_FEATURES
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
X-List-Received-Date: Mon, 19 Oct 2015 20:29:21 -0000

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
2.6.1


