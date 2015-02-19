Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 30A8460556
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 15:00:46 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id x12so7703354wgg.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 07:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TPNbQIexdtbnRiAx4hPz5SH3kvYZjrs4UZi88LFv2SE=;
	b=iANEyADnAmdrrijuB2GCJ9KBHhnT4g0nP6OvG2hq57uVWTC5niHSNsgKgl2w1Apz6l
	34nHoQfRgT2zdPzCzkF3YdRwi1MDbRpzT2OK2/8cJeMLbVcui2TubfJpQBSYcC9+9MJz
	V4K5gklg5frd6iCq7K7zPNbxo7Zta2eICNyodMmu6efFzQQe4qijOuCOBu8aDUtJ2bhP
	gfjG1xUBBslmNkpZF+fHT8E7Kw04eaKHCEpKaN3vWJ22ryynGaYK7mAvNnzsaurCTaaP
	xXcrZKqqakKPg+z/PMWsZTH/O1H4PEHO4IqCc4esXKoe5roIdLnn6uNT/RoMEHv/TCtp
	q14w==
X-Received: by 10.180.108.178 with SMTP id hl18mr10661608wib.92.1424358047660; 
	Thu, 19 Feb 2015 07:00:47 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mb20sm29881644wic.18.2015.02.19.07.00.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Feb 2015 07:00:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:00:48 +0100
Message-Id: <1424358048-29342-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1424270435-8424-1-git-send-email-Martin.Jansa@gmail.com>
References: <1424270435-8424-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH] arch-armv7a.inc, tune-arm920t.inc: Fix PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Thu, 19 Feb 2015 15:00:51 -0000

* each DEFAULTTUNE with thumb enabled should list it's arm variants in
  PACKAGE_EXTRA_ARCHS, otherwise packages which force arm ISA won't be
  found in do_rootfs
* armv7athf-neon-vfpv4 was missing its own PACKAGE_ARCH and also the arm
  variant

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7a.inc | 2 +-
 meta/conf/machine/include/tune-arm920t.inc    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index f2c04a3..39f5e2b 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -42,7 +42,7 @@ PACKAGE_EXTRA_ARCHS_tune-armv7athf = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon armv7at2hf-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-vfp-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7athf-vfp-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-vfp-neon-vfpv4 armv7at2hf-vfp-neon-vfpv4"
 
 # Big Endian
 AVAILTUNES += "armv7ab armv7atb armv7ab-neon armv7atb-neon"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index 5cadcc7..0a2eae6 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -8,4 +8,4 @@ TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "arm920t", " -mtune=arm920
 AVAILTUNES += "arm920t"
 ARMPKGARCH_tune-arm920t = "arm920t"
 TUNE_FEATURES_tune-arm920t = "${TUNE_FEATURES_tune-armv4t} arm920t"
-PACKAGE_EXTRA_ARCHS_tune-arm920t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} arm920tt"
+PACKAGE_EXTRA_ARCHS_tune-arm920t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} arm920t arm920tt"
-- 
2.3.0


