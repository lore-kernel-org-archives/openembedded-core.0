Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC75C52D73
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 06:23:55 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web11.53686.1723098228783679354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 23:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=NkJeil7q;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=657; q=dns/txt; s=iport;
  t=1723098228; x=1724307828;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RAZCdiu5Bo3loALvgXV+d+h2+myft1JK6JYAV7JvHCk=;
  b=NkJeil7qnDyCoOSZSJcVcTv31DVQ5oHUz1/z5wpptRxJkHWdgoex38vB
   RyI5/wskWT3QfTHWdjxPtI4Vh7r1emo/xyOGtLDt3YkcNpqyNv2CxQW/9
   3J9jKoryfptTwP5b+pfa44kWi0/Q2+SEHkfqAXCyolGS3Dxa+s1roMx/1
   8=;
X-CSE-ConnectionGUID: 57ko5JHrSyiEQ67rDnyDSg==
X-CSE-MsgGUID: L1rhK9myS/OXz8xRz+iCsg==
X-IronPort-AV: E=Sophos;i="6.09,272,1716249600"; 
   d="scan'208";a="334858822"
Received: from rcdn-core-11.cisco.com ([173.37.93.147])
  by alln-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 06:23:48 +0000
Received: from sjc-ads-10099.cisco.com (sjc-ads-10099.cisco.com [10.30.210.103])
	by rcdn-core-11.cisco.com (8.15.2/8.15.2) with ESMTPS id 4786NlSE026155
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 8 Aug 2024 06:23:47 GMT
Received: by sjc-ads-10099.cisco.com (Postfix, from userid 1847788)
	id 66AE4CC1282; Wed,  7 Aug 2024 23:23:47 -0700 (PDT)
From: Het Patel <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Het Patel <hetpat@cisco.com>
Subject: [PATCH] zlib: add vendor to CVE_PRODUCT to exclude false positives
Date: Wed,  7 Aug 2024 23:23:40 -0700
Message-Id: <20240808062340.1511175-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.210.103, sjc-ads-10099.cisco.com
X-Outbound-Node: rcdn-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 06:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203117

To avoid false positives (such as CVE-2023-6992, cloudflare:zlib), add a
CVE_PRODUCT to identify the vendor that has been used.

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/recipes-core/zlib/zlib_1.2.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.2.13.bb b/meta/recipes-core/zlib/zlib_1.2.13.bb
index ec977a3035..8f3814068a 100644
--- a/meta/recipes-core/zlib/zlib_1.2.13.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.13.bb
@@ -45,3 +45,6 @@ do_install_ptest() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# adding 'CVE_PRODUCT' to avoid false detection of CVEs
+CVE_PRODUCT = "zlib:zlib"

