Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033FEC433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 05:10:22 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.24368.1643260217446113039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 21:10:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=LTU9rZO7;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643260220; x=1674796220;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OFiTX+I9GHInUjVpVNjjVWJbL0o8RvmtIPRDMaUiNWw=;
  b=LTU9rZO7FaKrMUMAdA3+LM8G0uHK+xcMr8hstgBrE7rojqsm0FB1IXek
   xrSv9vxgBR88SQS0WtgyudM2HfWnhbbliX/5nIfNt+/KBKDZnriesyg6U
   90QO0zSH9qImr3cKXrPsfa5GJNiLq4zd6wdAUnhkmfupqMzeMcQlvGpks
   1347YUdK1ILris2DKFZBP3DEozBk6+k/twGKI/xKIe9ImzWoMMsNgoP0K
   Df5w6lEqaNnXiT6B/On/2c9d27hYaJbxOjs+afgwoF2edhdloYd5phGVn
   kbHy7cDZqVTwuUJre4J21N7fsPworXOeWn4vpfOaKTlJ6WgBdhotgZErn
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245590300"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="245590300"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="618208996"
Received: from huiyinkx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.134.201])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/17] tune-cortexa72: Enable the crc extension by
 default for cortexa72
Date: Thu, 27 Jan 2022 13:09:55 +0800
Message-Id: 
 <0e80b75064ba2662fdd80332ff3197cd5e3cd3c9.1643259953.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643259953.git.anuj.mittal@intel.com>
References: <cover.1643259953.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 05:10:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161005

From: Kevin Hao <kexin.hao@windriver.com>

The crc extension is optional for the ARMv8.0 but is mandatory for the
cortexa72, so there is no reason not to enable it for the cortexa72
tune. With this change, the cortexa72-crc seems redundant. But we
had better to keep it to be compatible with the BSP which already used
that tune.

(From OE-Core rev: ca50267ab568d2f688844cb7c6cd867ed34168db)

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Kevin: Convert to the old style override syntax]
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/machine/include/tune-cortexa72.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 7608a20c43..30480efd83 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -10,12 +10,12 @@ AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
 ARMPKGARCH_tune-cortexa72-crc         = "cortexa72"
 ARMPKGARCH_tune-cortexa72-crc-crypto  = "cortexa72"
-TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a} cortexa72"
-TUNE_FEATURES_tune-cortexa72-crc      = "${TUNE_FEATURES_tune-cortexa72} crc"
-TUNE_FEATURES_tune-cortexa72-crc-crypto   = "${TUNE_FEATURES_tune-cortexa72} crc crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS_tune-armv8} cortexa72"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72 cortexa72-crc"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
+TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa72"
+TUNE_FEATURES_tune-cortexa72-crc      = "${TUNE_FEATURES_tune-cortexa72}"
+TUNE_FEATURES_tune-cortexa72-crc-crypto   = "${TUNE_FEATURES_tune-cortexa72} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-crc} cortexa72"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crc-crypto"
 BASE_LIB_tune-cortexa72            = "lib64"
 BASE_LIB_tune-cortexa72-crc        = "lib64"
 BASE_LIB_tune-cortexa72-crc-crypto = "lib64"
-- 
2.34.1


