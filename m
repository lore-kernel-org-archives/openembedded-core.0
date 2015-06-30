Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 541527561C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 14:14:52 +0000 (UTC)
Received: by wicgi11 with SMTP id gi11so18121193wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7d7PEK4Ux1DOfuyvZoPY+Y1xwp2lE/jFd5yZm7fmZqY=;
	b=k8crstMPPAz08PpyJX7idLRtGBfOkev2hkpnGYAGgvf0cUoHlU7hDfnO51EgPIf319
	bw9c2RQJ/XbgkLmaAatnlMtV+tHCQ+fNUf5Qmh/sGyhZ7vtPtFkeZjm7BHIdwEbuVSuZ
	TJLVd2kP+G8Ajf+xaT0ixr2+HUMvgug3Oa8CdL8SlvLLHOnUwwT7UVnAvuT0nsoOh5Rg
	xIYmmXa60FXqXQSbceb9Lc776nTWLh9g0xxv5tzb69Q3XPPf1BkNEfKp3CDc8kLBtZWI
	xCOOjHHsEWU+x//KTtt/xHgtJsFoLXlACGn9Lwq/NfY5jkfIEkPc/zAFc3AJrRrVkVnz
	dMhQ==
X-Received: by 10.180.230.199 with SMTP id ta7mr12878403wic.1.1435673693602;
	Tue, 30 Jun 2015 07:14:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	df1sm17264074wib.12.2015.06.30.07.14.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jun 2015 07:14:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 16:15:00 +0200
Message-Id: <1435673700-10076-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [PATCH] feature-arm-thumb.inc: Fix ARMPKGSFX_THUMB value
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
X-List-Received-Date: Tue, 30 Jun 2015 14:14:59 -0000

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
2.4.4


