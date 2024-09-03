Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E79CD342E
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.18515.1725352398195464899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nQq6QGFv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352399; x=1756888399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FQ9p8BVKxHhejMptq9M2aPVPjzNX379doiVd1coxYac=;
  b=nQq6QGFvq4ipdXccc333GulUiWIxodc833EXRfY2sWQoGUgtmT67/tmR
   +SStP8g7xdcHPry6Au+P7RLJ6VxhDaM0FaMixpr4B0BDk7u5S2VnId56I
   8PkYI1P244nUqqBkQZpoUtrCsdzXoV8Vx9s7Ovt97fV4ZhdAWPaHJjr1d
   YGYb+piO7vZ3ypYV2rFcJ5PjtjxR4zkwcGXxWBvypbGVd8kPdEn+d606x
   fA6eZS8uohGhFQlbIXi0QDF65XzWoPRCEROcs6qJOQ5IFcvJdJTTLXxqU
   UNNwPc30lEoaSoNyB8zpSufNrDEl+XkfhdFspMW3jV2dnmEm5i1KgNsWK
   w==;
X-CSE-ConnectionGUID: /NmDppkOS06exnHdsFxU4g==
X-CSE-MsgGUID: ubKRuUJTQlOD1jEa6M+DRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="172545770"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="172545770"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:17 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 262F3CC142
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 70236BF3D5
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1013E20076D22
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A990A1A000C;
	Tue,  3 Sep 2024 16:33:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/22] nghttp2: upgrade 1.62.1 -> 1.63.0
Date: Tue,  3 Sep 2024 16:32:49 +0800
Message-Id: <1725352379-20334-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--3.583200-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z46cXaPycFZvTlIO7ZQZ976UureAvXLqmo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXKHajXg6/rO12sbxEL/lr+dB41yz5HLX5DsOK
	dbvYMiDpFoH413rmhyQM9YygMS/In8rWiR/zgls/qyz64OATqOzbgqPOeehKf+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204138

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.62.1.bb => nghttp2_1.63.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.62.1.bb => nghttp2_1.63.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb b/meta/recipes-support/nghttp2/nghttp2_1.63.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.62.1.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.63.0.bb
index 8ab6b17feb..43dbf722e9 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.63.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2345d4dc136fda28ce243e0bb21f2e7e8ef6293d62c799abbf6f633a6887af72"
+SRC_URI[sha256sum] = "4879c75dd32a74421b9857924449460b8341796c0613ba114ab2188e4622354b"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.34.1


