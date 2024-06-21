Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A65AC2BD05
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.64030.1718936235260504963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GimoFkkF;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936235; x=1750472235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=m68iqPzovfzevP+pRc9QVs0yBBJ6JDRi+nb+6mFV6XM=;
  b=GimoFkkFb0y1Wfr3cC6jLks+8krGNJNiqLojgqeZhu4BbHF1OxUvEjDY
   6J1Msq7QcmhpDju6H25Gou/5oqbzdlffzUR16RzIsADbFdT+0Sq/Ro5k2
   BNqoc2I6gU89zSTycUiQvZXXnPKsXPD3RqNyLzMgtH3RI5ZZhxFF44V+E
   mNI0VBbSEByCUadOMFFVDuVjLvM4u0LLWJuQ4zVl836yd1U/S/oKr+Beh
   2oEKxmh+kRzIH3dxGT34RxQ505582WfP7LXl47TypODaoAQ1s/ru6xFs2
   tGJOIXfJ6qtyTDSnYDz1+lRqI/0mO3X9+NYwwq5Xzf38Zmsf1jw+bx5YJ
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="152738561"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="152738561"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:12 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F33B8CA1E1
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 46368BF4B6
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D7A8E20086E80
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 888DA1A0002;
	Fri, 21 Jun 2024 10:17:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/22] dhcpcd: upgrade 10.0.6 -> 10.0.8
Date: Fri, 21 Jun 2024 10:16:29 +0800
Message-Id: <1718936206-8080-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--0.851200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgC10TsipyQq76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74CC7C2rJeUToWzUivg1nMWatY4
	N1nU8OYSqJw61GpPIsoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzC+R+SmoidPFECO
	edDBWkaYeFJU5+gcQYZjrbXXUXhihHJAEQmKVNMETq20/rZ/Yd22fBoSTGyzS1+yQhHHFjk6cke
	8goz1TtiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200971

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed compile without ARP
- Fixed closefrom test for glibc
- Fixed spelling of ADVERTISEMENT

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dhcpcd/{dhcpcd_10.0.6.bb => dhcpcd_10.0.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.6.bb => dhcpcd_10.0.8.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
index fd193b2cff..43de279cfd 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
+SRCREV = "a15ba1987c264eaa06c2655ddd0891aa5ac48c09"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
-- 
2.34.1


