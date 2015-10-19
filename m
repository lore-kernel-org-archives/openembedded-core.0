Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 82A4977035
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 18:03:30 +0000 (UTC)
Received: by lbcao8 with SMTP id ao8so149928492lbc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 11:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9SqgXN/RYuSFQQMojNFrSiDyRCJRKr6JN28qpbFwVwM=;
	b=LHL9RdK2rYaJKh9OJAzrHFDqjYPDZbOMgk+EsZB7h4G6BV+SyQtuhO9UIwC575gBNb
	v3cKAcb0ENGLsZ7swYj8XiyXh++2n+gRo5GvYWt1fGRab2rEcEq3zEFUEJe2e4lKztOf
	FtzLosN0E2i197CHmraqITyyT+6Aqz3gOUXU7XIeDAsbtSR9piirCMTs1kxLdrrucrfG
	XINsUpCDxE+cppX1MHnZ2pN4L4s77Y9+yrlh9PsD5f5uTyG4SgLCYUtIaRwOmMaEucHc
	r5N80YgO9BsUg6Wshg1/ukcuI4zEbWZKpu+vqledAlkrClxNwz0RdwQs0en+pNHOl2iJ
	qg4w==
X-Received: by 10.194.21.163 with SMTP id w3mr34967738wje.70.1445277808806;
	Mon, 19 Oct 2015 11:03:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hk5sm41548907wjb.6.2015.10.19.11.03.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Oct 2015 11:03:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 20:03:32 +0200
Message-Id: <1445277812-3941-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1444138615-5618-1-git-send-email-Martin.Jansa@gmail.com>
References: <1444138615-5618-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [RFC][WIP[[PATCH] feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi andARMPKGSFX_EABI
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
X-List-Received-Date: Mon, 19 Oct 2015 18:03:34 -0000

* without this change it wasn't possible to use call-convention hard
  together with vfpv4
* also use ' inside quoted values

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-vfp.inc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 13927ff..440950a 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -1,9 +1,10 @@
 TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp", "" ,d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', '-vfp', '' ,d)}"
 
 TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv4", "-vfpv4", "" ,d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', '-vfpv4', '' ,d)}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
-ARMPKGSFX_EABI .= "${@bb.utils.contains("TUNE_FEATURES", [ "callconvention-hard", "vfp" ], "hf", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains_any('TUNE_FEATURES', [ 'vfp', 'vfpv4' ], bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', ' -mfloat-abi=hard', ' -mfloat-abi=softfp', d), '' ,d)}"
+ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [ 'callconvention-hard', 'vfp' ], 'hf', '', d)}"
+ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [ 'callconvention-hard', 'vfpv4' ], 'hf', '', d)}"
-- 
2.6.1


