Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11E0E7718D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.116738.1733788627421061498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KH9zur3k;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788629; x=1765324629;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Z/TCf3Gr3RXagQd8ZujT/uYigBxsoz78LuB+1gjJGKc=;
  b=KH9zur3kgKVIOX/40HI30Xy0blmEWlNBExy6Gk6qjd19q3RCg+yH1Tps
   6NaLtsS5dqmhpvx69JDiTMa6z1aOYvl1KpayRallZuEvMF5n16S3QvqTV
   7HOUQ1bIsXRheWqBvJTsBnzajhP08YLpz1OioyZmS++0XJx6n6gwMLt+L
   LL1it2YspkPOnIJYQ+wUO7mczxTZJxKu6spCsSVPy4W8y+mob0/5dZbxM
   kNMt/U4hnw1BrYHZOoj6zx9R/GDHjyBfWNARO9h7AJGS3Lw91T2FcBpq7
   D54HwtFpTBXb07bZOyI2WJts4H10IdpHbYayZSyhbfOsUDAI8riIJ2GUN
   w==;
X-CSE-ConnectionGUID: aGqRO5LcRHCL2mwx52R2Pg==
X-CSE-MsgGUID: MgZWCAaUS2iNBHCPl06b2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="162594287"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="162594287"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:08 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F72AD500C
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F03BCFBC0
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A68514018B
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4418B1A000B;
	Tue, 10 Dec 2024 07:57:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 10/20] libdrm: upgrade 2.4.123 -> 2.4.124
Date: Tue, 10 Dec 2024 07:56:42 +0800
Message-Id: <1733788612-20933-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10-1.174100-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGFxxDx5qbkR9FEUknJ/kEl45N6P0pQOPlfc8OJc7+0VJjoc
	zmuoPCq2HbsZBdk1Xd5s9GD0pya8cdZ3/Zi/uuBkLhi9cgMhb1/WB3ce0BbTw58LpPyJin2Ti9F
	jupG3wh5Ekj8fK+lzZZgerEAB5b3odJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhFTP3QRDAbYw
	Clu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208503

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../drm/{libdrm_2.4.123.bb => libdrm_2.4.124.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.123.bb => libdrm_2.4.124.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.123.bb b/meta/recipes-graphics/drm/libdrm_2.4.124.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.123.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.124.bb
index b75d7b6103..78f31ccb95 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.123.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.124.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "a2b98567a149a74b0f50e91e825f9c0315d86e7be9b74394dae8b298caadb79e"
+SRC_URI[sha256sum] = "ac36293f61ca4aafaf4b16a2a7afff312aa4f5c37c9fbd797de9e3c0863ca379"
 
 inherit meson pkgconfig manpages
 
-- 
2.34.1


