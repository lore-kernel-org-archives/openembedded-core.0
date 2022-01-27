Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C01C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 05:10:23 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.24368.1643260217446113039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 21:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=BdqqOVH3;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643260222; x=1674796222;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lcfMMnMJzFemH6clKZahXDT4fl4yJkOjlJhXcq8RChA=;
  b=BdqqOVH3/E/xlqYOnxNrMBKUhCf2XY+1U3xdW16a5smYvSVX5GNl3nQj
   t+vwVz9HiWYDO0TGzjB0umre7mFC1BcXIjZARh7MvgEucaWDKJcYX7B8S
   b2nzLrsiKs1gI4MwpLYoNgc8XXoyBOV47TRiDrMM9vvMut8IHN9oj5B3L
   qFnVT/VWB5y3y5FHNGNVQetousNQncfw7Qp2D6YgUXoDj+xheMfPRfLDs
   RVLFB7l28kNb5uik/avZzpyciNGvvx1pL0OiLj9I+YMYWuP7mLtaXHxca
   vroR0kTdFeOGoIn0KDONFZ0DweShD0p2dBQcJtHEMNmGxU7ClfQ/sSmjE
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245590306"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="245590306"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="618209002"
Received: from huiyinkx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.134.201])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:20 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/17] tune-cortexa72: Drop the redundant
 cortexa72-crc tune
Date: Thu, 27 Jan 2022 13:09:56 +0800
Message-Id: 
 <ca4070f327068992de24b00810c019e0b118f6ab.1643259953.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643259953.git.anuj.mittal@intel.com>
References: <cover.1643259953.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 05:10:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161006

From: Kevin Hao <kexin.hao@windriver.com>

We have enabled the crc extension by default for cortexa72 in patch
("tune-cortexa72: Enable the crc extension by default for cortexa72"),
then the cortexa72-crc seems redundant. So drop it. We also rename the
cortexa72-crc-crypto to cortexa72-crypto. With these changes, it will
break the BSPs which used these two tunes, but it should be easy to fix.

(From OE-Core rev: 03cebdd7ef923a8ac5c8b7c12c7cefe7ca0158db)

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Kevin: Convert to the old style override syntax]
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/machine/include/tune-cortexa72.inc | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 30480efd83..efb71ee0a1 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -6,16 +6,12 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
+AVAILTUNES += "cortexa72 cortexa72-crypto"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
-ARMPKGARCH_tune-cortexa72-crc         = "cortexa72"
-ARMPKGARCH_tune-cortexa72-crc-crypto  = "cortexa72"
+ARMPKGARCH_tune-cortexa72-crypto      = "cortexa72"
 TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa72"
-TUNE_FEATURES_tune-cortexa72-crc      = "${TUNE_FEATURES_tune-cortexa72}"
-TUNE_FEATURES_tune-cortexa72-crc-crypto   = "${TUNE_FEATURES_tune-cortexa72} crypto"
+TUNE_FEATURES_tune-cortexa72-crypto   = "${TUNE_FEATURES_tune-cortexa72} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-crc} cortexa72"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crc-crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crypto"
 BASE_LIB_tune-cortexa72            = "lib64"
-BASE_LIB_tune-cortexa72-crc        = "lib64"
-BASE_LIB_tune-cortexa72-crc-crypto = "lib64"
+BASE_LIB_tune-cortexa72-crypto     = "lib64"
-- 
2.34.1


