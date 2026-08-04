Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B934C55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:05:34 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9675.1785816330347015718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oCSyA7De;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785816333; x=1817352333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MS1YqnA/wvZLRYVrvsVE1Jr75paNi5rwV6q9Ino+dSQ=;
  b=oCSyA7Deq2o7MGEYSE95AbxSxVbvZmEfMdUGO/ZA/+sWkhTWqkZRWXhP
   StieYSYUcvuNJ67QX7pX/sbvLQp7DaSot5iuG7HiL8UOzPdan3AqjP3B/
   R15h/LZaqaiTXrSQlf3cgExb9krsQEvxe9Erld3svsSYI19E6pIU//zRW
   y2u+1QwVyzkq1+AWbsDthWxZxZ/zYFgHq9OfLwyq/cjk2lZwswChwbtdp
   i7MnSbEin6dLt+Ok4pzfUK1KjZXNB0o7c2mG7skiKFitM4vHcjmBJPMT3
   EaGcH6TSFEhuFGPHD2N014XxGSlT26hNe2XE2QqQzRLzf4+ktq9LRtYIt
   A==;
X-CSE-ConnectionGUID: qAI5qEdlRPCrAQgEPHT7hg==
X-CSE-MsgGUID: VwwadmLeQZ6iXrPqOif6MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="247770467"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="247770467"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 13:05:31 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 94A1842A33C
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:28 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 460261C1C24D
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5F5D018005FA;
	Tue,  4 Aug 2026 04:05:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 7/8] taglib: upgrade 2.3 -> 2.3.1
Date: Tue,  4 Aug 2026 12:05:07 +0800
Message-ID: <20260804040509.1454-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804040509.1454-1-wangmy@fujitsu.com>
References: <20260804040509.1454-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242683

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * Matroska: Fix crash when seek head is invalid or missing.
 * Matroska: Check element length, support unknown size length, skip invalid
   elements.
 * Matroska: Allow Chapters without a ChapterUID.
 * Fix data length indicator check for compressed ID3v2 frames.
 * MP4: Use 'LongLong' instead of 'UInt' for 'cnID' atom to support large
   catalog IDs.
 * MP4: Fix destructor and assignment operator for 'MP4::Chapter'.
 * MP4: Let 'hasiXMLData()', 'hasBEXTData()' track on-disk state rather than
   in-memory state.
 * MP4: Support NI STEM atoms with 64-bit length.
 * MP4: Enlarge limit number of MP4 atoms at top level.
 * MP4: Avoid excessive sample allocations with invalid 'stsc' for QT chapters.
 * XM: Correctly save XM tracker files with samples.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/taglib/{taglib_2.3.bb => taglib_2.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.3.bb => taglib_2.3.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.3.bb b/meta/recipes-support/taglib/taglib_2.3.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.3.bb
rename to meta/recipes-support/taglib/taglib_2.3.1.bb
index 26839cdbdb..0852295650 100644
--- a/meta/recipes-support/taglib/taglib_2.3.bb
+++ b/meta/recipes-support/taglib/taglib_2.3.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "7349f6fd942418bc7009ebe743eb7c9d055f02921ec56fa436ec25007c47fd38"
+SRC_URI[sha256sum] = "a19d90e6fd41d09a0281ec0fe762d51491d7a6ccffc923c4f7868c5e647ca230"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.43.0


