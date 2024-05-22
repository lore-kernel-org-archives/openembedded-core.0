Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A307C27C6F
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:01 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.5647.1716369340851411025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UK1C5GkJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369340; x=1747905340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=p4rTnXBVDJREk9NSw5FN8BxVHAoLTowbMdduDvQ9F4E=;
  b=UK1C5GkJV0+Fs2XK4Xnd0wC7eC6jG3L/5ADZmtJPhqPkd4NxTd+UKqF2
   iqCQsql1DKYNPaqH65l1zJa94XwffLtS5J+5z0gy5fJ5oxxhPRm0dIIoB
   iME0FrHv3lk4fBXdwbA9xCiS6fBxRihRJbIcnExIraKv2ZaUGXLbg0N2L
   IzZS74fC4E6G2JXDLMnTgsJ4YmfwOhYcycN1If3wF6wkJgyFQ+1IpdASC
   U6fnDDqNRf2GOVt+kF3jvbg6Os6lFPFQqAYZVI66RonXwXr5uSthK+IW1
   A8fug5LpJU2TMYOFW9MpvC1tVaLkv+jpn2+lvuqhVs8kWfZAKmAOWleY7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="146672564"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="146672564"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:38 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 382B2CA1E6
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 584BBBDCA5
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D90F721CB3A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 85AA41A000B;
	Wed, 22 May 2024 17:15:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/42] ninja: upgrade 1.12.0 -> 1.12.1
Date: Wed, 22 May 2024 17:14:35 +0800
Message-Id: <1716369289-22526-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--2.290100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrowhSWTqHYRiwZuykSn6+/KVg
	brw0BQUqfbfCU7Sb6U6ysMXN8ch2JgE4dbnyjMJa/HTKStsDGMLBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDI3lq3YEgY6JoqzhSsGiK9tCbm0451GVI2eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNS6bZneGxthy0A3bOan0+7wtRZt43Vzx6zK6qeRg1sYfiiQJ0DIiUhnld3fluDATje/4u
	p8mx5csGMdT0iBBGKI5Q4eCe2C2+DIuZWQlOWCUU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199723

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Screen updates extremely slow on Windows
- Dry run error if the build directory does not exist
- New critical path scheduler performance improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/ninja/{ninja_1.12.0.bb => ninja_1.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.12.0.bb => ninja_1.12.1.bb} (94%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.12.0.bb b/meta/recipes-devtools/ninja/ninja_1.12.1.bb
similarity index 94%
rename from meta/recipes-devtools/ninja/ninja_1.12.0.bb
rename to meta/recipes-devtools/ninja/ninja_1.12.1.bb
index ef7f80d0ae..9f5c014b9b 100644
--- a/meta/recipes-devtools/ninja/ninja_1.12.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.12.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "65d0dfcbbea6b8ca7d8a3a0f673ecb522379e43c"
+SRCREV = "2daa09ba270b0a43e1929d29b073348aa985dfaa"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.34.1


