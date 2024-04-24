Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EA3C25B74
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:04 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11785.1713948182732649807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ANgw87hk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948184; x=1745484184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pR1Gep5ngdDXoz22gI4ZZdB/KnGTaY8nf+bonAnAB50=;
  b=ANgw87hk9TfeIpqIe7R4894Ta/ENCdMHm8t+Oi5Db0rwHQyHOmNz6gA7
   Q61YSLiiZXivpwIVMm9h967WfQ+u8j1RLt5AdxY4A75gpdnn/3zv1+1yW
   +1NH+TxG4UYb3NmF5zVZH7pwDQIu7oFVIgg+Op2bPuxI4xsqjS7ZBEYHc
   eQKKpRLXc+8iCO+8J5bzIvLvNcULAZCRVPZNA/1IjMLSF31/9N/vnXECn
   Z+x0duzpUg7r3QuGK8S5vRiwrFmRCardwP07o3282qbig9ORnGWft+nOD
   tkKvZMGL2dKHrl8AuUaWL7sVOMULWL9G786liJirfwc1P2vYLi+Ah1QIv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="135926028"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="135926028"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:02 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A0AB2D6F63
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DC56AD8C03
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 72581202CE13B
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CDE381A000A;
	Wed, 24 Apr 2024 16:42:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/38] libxmu: upgrade 1.2.0 -> 1.2.1
Date: Wed, 24 Apr 2024 16:42:07 +0800
Message-Id: <1713948152-13501-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--0.464100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mra9qiaDSLgo3ozDhGeQC9EikO
	sLYPMHi2Q40E6PomDvwNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2a+2
	jJ5e7tWCxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzjkyl3mrFY4/v18
	8z+L6Rn+GURgmgxeoKgIn3qIgNKONiNLTjS74oBd/bK9GtC0XcycKVtXhD0CPorZEK3BOUEhFLC
	DXpeQwdiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198658

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
test: Add prototype for Xmureallocarray to silence warning
test: Add missing setjmp()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxmu_1.2.0.bb => libxmu_1.2.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxmu_1.2.0.bb => libxmu_1.2.1.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/libxmu_1.2.0.bb
rename to meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb
index d97bc7a3dd..51faf170bf 100644
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb
@@ -27,4 +27,4 @@ FILES:libxmuu = "${libdir}/libXmuu.so.*"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "072026fe305889538e5b0c5f9cbcd623d2c27d2b85dcd37ca369ab21590b6963"
+SRC_URI[sha256sum] = "fcb27793248a39e5fcc5b9c4aec40cc0734b3ca76aac3d7d1c264e7f7e14e8b2"
-- 
2.34.1


