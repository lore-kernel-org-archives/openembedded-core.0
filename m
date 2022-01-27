Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FF5C433FE
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 05:10:20 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.24368.1643260217446113039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 21:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ni8UwpEt;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643260218; x=1674796218;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=j/PgWnyRnY5dFr2sZWx+cKZE5DVIpvYvFEh7hJv5EUw=;
  b=ni8UwpEtQWz7YvdrnOHLDpAsmQW9fjMCpMesPL8UV0Y/0PSsBKGkrg6z
   gAwetFxiPVOGmjfLjXSQCI/QmF5LMr02LMmzntw0BdzPzuCVL62oilz03
   RlJOkm0z5+xpYSBr8ueTS2VM59zn0bhmYQQHWyBys+v6fwTqCD+6pRs5D
   1M7RWxgd3DnYOmJpJ4y9vLg1IBo93sJj+GhvAkZXdJdKmFKlLrn3wmLTA
   g+YYL0LiwL9VptxQBGhG+HL8l6JSE5kve9krgqVP5M4uHUjtblDnQbSXT
   7JqWHSJuYJmiSPsV2V2MMwZFGTWkO5Vn/VWZqjnSDjE8/N2N6/W0WEmrC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245590286"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="245590286"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="618208991"
Received: from huiyinkx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.134.201])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:17 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/17] tune-cortexa72: remove crypto for the
 default cortex-a72
Date: Thu, 27 Jan 2022 13:09:54 +0800
Message-Id: 
 <ee249ca4d5020c16100e07ee1b5974237de29e29.1643259953.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643259953.git.anuj.mittal@intel.com>
References: <cover.1643259953.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 05:10:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161004

From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>

The cryptographic unit is optional for the Cortex-A72, but it was
included by default previously.  This breaks building systems that
lack this functionality when using tune-cortexa72.inc.

To correct this, add a crypto entry in the tune file.  Since CRC is
optional for ARMv8.0, do the same thing while we're at it.

For platforms that had been happily using tune-cortexa72.inc, a slight
degradation of performance will occur using the default.  To correct
this, simply add:
DEFAULTTUNE = "cortexa72-crc-crypto"

(From OE-Core rev: 2568d537087adb0b592aa250bf628a7b48c3a9d3)

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Signed-off-by: Jon Mason <jdmason@kudzu.us> (rewording commit message)
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Kevin: Convert to the old style override syntax]
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/machine/include/tune-cortexa72.inc | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index b3f68ab6e3..7608a20c43 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -6,8 +6,16 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa72"
+AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
-TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa72"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
-BASE_LIB_tune-cortexa72               = "lib64"
+ARMPKGARCH_tune-cortexa72-crc         = "cortexa72"
+ARMPKGARCH_tune-cortexa72-crc-crypto  = "cortexa72"
+TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a} cortexa72"
+TUNE_FEATURES_tune-cortexa72-crc      = "${TUNE_FEATURES_tune-cortexa72} crc"
+TUNE_FEATURES_tune-cortexa72-crc-crypto   = "${TUNE_FEATURES_tune-cortexa72} crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS_tune-armv8} cortexa72"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72 cortexa72-crc"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
+BASE_LIB_tune-cortexa72            = "lib64"
+BASE_LIB_tune-cortexa72-crc        = "lib64"
+BASE_LIB_tune-cortexa72-crc-crypto = "lib64"
-- 
2.34.1


