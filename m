Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68984C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:35 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.11734.1713948206993505121
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sVjaVxhu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948207; x=1745484207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=x6YQIqyVwdVxxapHL/v/5beLIQA/4z6RtW9gOmZ4PWE=;
  b=sVjaVxhuevNgM85UtGjqBAM/Cq5uDgTySMMSCuxU5PdNoMp8Ia4CD894
   2jcoIzfNFi9Kpgi2ZNE4p0lOsprdPq7IzP3RVdtMkA55hWrnLLO8LFgKT
   KqtqzmLzvOzm4Dm7Mpxzp6lIIPFd6sIy2Gz7IKHFBj33BMQB+3l1W7Cer
   ew8PQz/ALy96+NqdUhYyuKrs3Ye2/SVZ1hfeV4qqyTEWf/swVkkrcTSE6
   evzDOEY4e9LJg8ROldzqLNWwxOehON/NXytPCwzPQwg7zOT3N4NssaXZH
   GDqsejoDTP5HDi5VKY1j8rGWrtbRcDmNNNm4gY2fnYaNiji+Oa2VOM1CA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="135926060"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="135926060"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:25 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B3284E8FC5
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EDF37D52ED
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 86B39223FC9
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 32EEF1A000A;
	Wed, 24 Apr 2024 16:43:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 38/38] xcb-proto: upgrade 1.16.0 -> 1.17.0
Date: Wed, 24 Apr 2024 16:42:32 +0800
Message-Id: <1713948152-13501-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--2.558100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGLxShod3dnywzicFXrGSe5rVBDonH99+VmzUivg1nMWaB2Y
	GivS0f82xfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzZE6mpNOobVB5y1
	wJ4NcNOKCCVdWevb5WL5jWwrXQ5g7vk/orlW01VDCFILyY2LVNE4EqwrSqgmaNEoD98tRwNPSFY
	39hku4eiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198683

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-proto/{xcb-proto_1.16.0.bb => xcb-proto_1.17.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.16.0.bb => xcb-proto_1.17.0.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
index 67c1e8d97d..2a78a87e77 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz \
            file://0001-xcb-proto.pc.in-reinstate-libdir.patch \
            file://0001-Fix-install-conflict-when-enable-multilib.patch \
            "
-SRC_URI[sha256sum] = "a75a1848ad2a89a82d841a51be56ce988ff3c63a8d6bf4383ae3219d8d915119"
+SRC_URI[sha256sum] = "2c1bacd2110f4799f74de6ebb714b94cf6f80fb112316b1219480fd22562148c"
 
 inherit autotools pkgconfig python3native
 
-- 
2.34.1


