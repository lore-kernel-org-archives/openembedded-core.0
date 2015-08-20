Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9B484737F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:56:09 +0000 (UTC)
Received: by lbbsx3 with SMTP id sx3so26743623lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=tIsQgApIeGbfz4T4SQRgvek6Z54mB5xp/qqxMnEiT1I=;
	b=uIkJufEq8yKnxTTNzWlZcgP0P6bx9RnyFVI1oxi0pJWFjL79pG7/Zhm7tB7DaK9anx
	kaJVEOfyL+lIzLYsVDRutJO4pqIUyhORGFAsU05wAyfGoRTV9aY+9vLAZ1l718v3h+wt
	1GjP9Bn/hJtq3FJk1OUfFMVd4Ulm6tpfwk2Z618EKMG4F0WeJ2HW7hy4RKOVLE5ZJRXH
	IRkqASh5yiHk551ta0fydH4bLmSdDkE0Ce6gJ3M4bvbo2Ud9sdT8I++f6cj3LzNsvZog
	1qhe5rVSd4YoHxG3VD8lfCRaB/j1wztL8lhkLWlzsD/rRoXZ5eBa5TLQ8KLhZMstNDNe
	HerQ==
X-Received: by 10.152.10.71 with SMTP id g7mr3439275lab.61.1440086168826;
	Thu, 20 Aug 2015 08:56:08 -0700 (PDT)
Received: from umbar.auriga.ru (cl-1614.mbx-01.si.sixxs.net.
	[2001:15c0:65ff:64d::2])
	by smtp.gmail.com with ESMTPSA id y1sm1338070lad.25.2015.08.20.08.56.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Aug 2015 08:56:08 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 18:56:03 +0300
Message-Id: <1440086164-21146-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 1/2] tune-octeon.inc: correct packaging suffix
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
X-List-Received-Date: Thu, 20 Aug 2015 15:56:15 -0000

Octeon II/III binaries can contain instructions that are not compatible
with MIPS64 processors. Thus Octeon II/III packages should go to
separate directories. Set MIPSPKGSFX_VARIANT_tune-* to Octeon-specific
values and update PACKAGE_EXTRA_ARCHS_tune-* accordingly.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/conf/machine/include/tune-octeon.inc | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/tune-octeon.inc b/meta/conf/machine/include/tune-octeon.inc
index f80f970..fdd48b5 100644
--- a/meta/conf/machine/include/tune-octeon.inc
+++ b/meta/conf/machine/include/tune-octeon.inc
@@ -6,12 +6,13 @@ AVAILTUNES += "octeon2 octeon2_64 octeon3 octeon3_64"
 
 TUNEVALID[octeon2] = "Enable optimization related to octeon2 support"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "octeon2", " -march=octeon2 ", "",d)}"
+
 TUNE_FEATURES_tune-octeon2 = "${TUNE_FEATURES_tune-mips64-n32} octeon2"
-MIPSPKGSFX_VARIANT_tune-octeon2 = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-octeon2 = "mips64-n32 octeon2 octeon2_64-n32"
+MIPSPKGSFX_VARIANT_tune-octeon2 = "octeon2"
+PACKAGE_EXTRA_ARCHS_tune-octeon2 = "mips64-n32 octeon2-n32"
 
 TUNE_FEATURES_tune-octeon2_64 = "${TUNE_FEATURES_tune-mips64} octeon2"
-MIPSPKGSFX_VARIANT_tune-octeon2_64 = "${TUNE_ARCH}"
+MIPSPKGSFX_VARIANT_tune-octeon2_64 = "octeon2_64"
 PACKAGE_EXTRA_ARCHS_tune-octeon2_64 = "mips64 octeon2_64"
 
 
@@ -19,9 +20,9 @@ TUNEVALID[octeon3] = "Enable optimization related to octeon3 support"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "octeon3", " -march=octeon3 ", "",d)}"
 
 TUNE_FEATURES_tune-octeon3 = "${TUNE_FEATURES_tune-mips64-n32} octeon3"
-MIPSPKGSFX_VARIANT_tune-octeon3 = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-octeon3 = "mips64-n32 octeon3 octeon3_64-n32"
+MIPSPKGSFX_VARIANT_tune-octeon3 = "octeon3"
+PACKAGE_EXTRA_ARCHS_tune-octeon3 = "mips64-n32 octeon3-n32"
 
 TUNE_FEATURES_tune-octeon3_64 = "${TUNE_FEATURES_tune-mips64} octeon3"
-MIPSPKGSFX_VARIANT_tune-octeon3_64 = "${TUNE_ARCH}"
+MIPSPKGSFX_VARIANT_tune-octeon3_64 = "octeon3_64"
 PACKAGE_EXTRA_ARCHS_tune-octeon3_64 = "mips64 octeon3_64"
-- 
2.5.0


