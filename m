Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id F0F7B60767
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 14:57:11 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id v187so37174291wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 06:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n7LOYj+Y3HyfQ5ZowKCGkOr8CXY4AbdsaoqojQsu+WY=;
	b=OfOlO5kwBQ0FuJ5usD9KPVYF5G7o8KCIUkX0nJpFjsiNFLMheI/gDT9Wmb7LQXV+mi
	J8BfRy4WLI1s1tS0usU2JJiMxL2PHePIl2c0nQ29KABuO3s0AVc9BbN9k9twU3B4dt4d
	g9gKZtiKgbTI/mENn4BaZC1Qu3Uih6kSahjINI4hDx4pLaoNHAfFeQ++9rGKfe5XCQRr
	1nXsKagO9N4NaaXPkEpTZ5fT1Pqaz28BtpDUcUZUFHimP3jUnd+m7yb2/fyVDGT3AXse
	J1BvNcGpiQHvJoCfDxkdeaT7iCVG2Jur6RUJjgpTljRq5c/uni0HHg0qk7DFAm9z4uRF
	ZZFw==
X-Received: by 10.194.185.6 with SMTP id ey6mr13664274wjc.42.1449759432184;
	Thu, 10 Dec 2015 06:57:12 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bv1sm4279645wjc.24.2015.12.10.06.57.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 06:57:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 15:58:53 +0100
Message-Id: <1449759533-8928-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754339.git.Martin.Jansa@gmail.com>
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
Subject: [PATCH][fido] feature-arm-thumb.inc: Fix ARMPKGSFX_THUMB value
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
X-List-Received-Date: Thu, 10 Dec 2015 14:57:12 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* my previous thumb related commit:
  commit 3e760031f91fb87c3e2f62b77a117eb41164f259
  Author: Martin Jansa <martin.jansa@gmail.com>
  Date:   Wed Feb 18 15:40:35 2015 +0100

    feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb
    suffix

  unfortunately removed conditional on "thumb" in TUNE_FEATURES, when
  setting ARMPKGSFX_THUMB

* in case we have MACHINE without "thumb" in TUNE_FEATURES and distro
  setting ARM_INSTRUCTION_SET to "thumb" we end with:
  ARM_INSTRUCTION_SET="thumb"
  ARM_THUMB_OPT="thumb"
  ARM_M_OPT="thumb"

  # TUNE_CCARGS correctly not adding -mthumb
  TUNE_CCARGS=" -march=armv7-a  -mthumb-interwork -mfloat-abi=softfp -mfpu=neon"

  # but ARMPKGSFX_THUMB and TUNE_PKGARCH including "t2":
  ARMPKGSFX_THUMB="t2"
  TUNE_PKGARCH="armv7at2-vfp-neon"

  # causing following error:
  Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (armv7at2-vfp-neon).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 9746c7b..5632171 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -33,7 +33,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}'
 OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb', '', d)}"
 
 # Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
-ARMPKGSFX_THUMB .= "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.getVar('ARM_M_OPT', True) == 'thumb' else ''}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT', True) == 'thumb' else ''}"
 
 # Whether to compile with code to allow interworking between the two
 # instruction sets. This allows thumb code to be executed on a primarily
-- 
2.6.3


