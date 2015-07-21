Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8A275874
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 01:47:33 +0000 (UTC)
Received: by igvi1 with SMTP id i1so90781422igv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 18:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=ghjLXy6j3ylFp96fU7y2E73TjUywnpPBBigX7MaRFbM=;
	b=f6CHa/doiIyzNNf5S8YF2CrG15d4HknKi+Owm7kOW0cMYj8ggB/zhfqvOoBoAYMmkD
	MBryX/vfihA7LRS+HfB2WTrt48B1MBc9Xhn1UtWXV0ve2JoBt+STDPCe4wpk9yTDIjFi
	W+3uENxC1uybU+pS2AlGdPlo0fcObmDtr+J1KcC/QDIfRQAdOQh2B+f8wtc+lgmlTqfl
	kMw9NTkTxa7nI0gqX3csMCciFjB6GZU6oYUYamclVGvMlq8ex17PAWNgoXFL992kXe1U
	5vzYA+sOulppe+w3LJQmlJC0OAYNIIXW+d/jZSs9MgjmQ7l5FCz1pYo6Ii8D1aHrLFfL
	Sq0A==
X-Received: by 10.107.12.104 with SMTP id w101mr37287173ioi.110.1437443253241; 
	Mon, 20 Jul 2015 18:47:33 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	g12sm14883768ioe.28.2015.07.20.18.47.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Jul 2015 18:47:32 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jul 2015 21:47:17 -0400
Message-Id: <1437443238-25424-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.5.0.rc2.13.g961abca
Subject: [PATCH] tune-cortexa17: add tunes for ARM Cortex-A17
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
X-List-Received-Date: Tue, 21 Jul 2015 01:47:33 -0000

http://www.arm.com/products/processors/cortex-a/cortex-a17-processor.php

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/conf/machine/include/tune-cortexa17.inc | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa17.inc

diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
new file mode 100644
index 0000000..bfc7126
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -0,0 +1,36 @@
+DEFAULTTUNE ?= "armv7a-neon"
+
+require conf/machine/include/arm/arch-armv7a.inc
+
+TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa17", " -mtune=cortex-a17", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon"
+ARMPKGARCH_tune-cortexa17 = "cortexa17"
+ARMPKGARCH_tune-cortexa17t = "cortexa17"
+ARMPKGARCH_tune-cortexa17-neon = "cortexa17"
+ARMPKGARCH_tune-cortexa17t-neon = "cortexa17"
+TUNE_FEATURES_tune-cortexa17 = "${TUNE_FEATURES_tune-armv7a} cortexa17"
+TUNE_FEATURES_tune-cortexa17t = "${TUNE_FEATURES_tune-armv7at} cortexa17"
+TUNE_FEATURES_tune-cortexa17-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa17"
+TUNE_FEATURES_tune-cortexa17t-neon = "${TUNE_FEATURES_tune-armv7at-neon} cortexa17"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa17-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa17-vfp cortexa17t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa17-vfp cortexa17-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa17-vfp cortexa17-vfp-neon cortexa17t2-vfp cortexa17t2-vfp-neon"
+
+# VFP Tunes
+AVAILTUNES += "cortexa17hf cortexa17thf cortexa17hf-neon cortexa17thf-neon"
+ARMPKGARCH_tune-cortexa17hf = "cortexa17"
+ARMPKGARCH_tune-cortexa17thf = "cortexa17"
+ARMPKGARCH_tune-cortexa17hf-neon = "cortexa17"
+ARMPKGARCH_tune-cortexa17thf-neon = "cortexa17"
+TUNE_FEATURES_tune-cortexa17hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa17"
+TUNE_FEATURES_tune-cortexa17thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa17"
+TUNE_FEATURES_tune-cortexa17hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa17"
+TUNE_FEATURES_tune-cortexa17thf-neon ?= "${TUNE_FEATURES_tune-armv7athf-neon} cortexa17"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa17hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa17hf-vfp cortexa17t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa17hf-vfp cortexa17hf-vfp-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa17hf-vfp cortexa17hf-vfp-neon cortexa17t2hf-vfp cortexa17t2hf-vfp-neon"
-- 
2.5.0.rc2.13.g961abca


