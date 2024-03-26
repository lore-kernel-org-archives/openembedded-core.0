Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D54C54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:35:23 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7812.1711413319580607062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YGh6lUR6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413320; x=1742949320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=a2VmY5Q9Z0KZfTBPr7g0isQjl0u2oUEp6YLocZWVmCo=;
  b=YGh6lUR695NTPH7Txk6wr4pOLRlV1U1iFY6/ZM10AvlvsVidq3OU/WvN
   XhTTyi1xOVNugQ5M4xeE7wEVP7QLQL2B+nzPk0EWLroGzR1klSNqFO5b0
   jjHmb7SJJ1GqXVQbmjmHwwSzFNItB52hotMz5VH3cn4lwYK4ZajrqHsfK
   BtGp9Eipgnu3jjct8fPQnMPi5ZTdOBwQgTxkiLRhcR0m/ums/Wo28H+ye
   T3TrFAUNvq4jBrWpbjRiAecTYLBRrp8q+GruNWaS/7tysprUZCbzOoVzN
   fi4VOVQ1MM0lF5XiWYh2pmd/N9eGGajwkYg0snwbVugefdf+4VyKMMXWT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="132701852"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="132701852"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:35:17 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B54C10A331
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 579D2D7B63
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D0E4920097CE1
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7EAAB1A006A;
	Tue, 26 Mar 2024 08:35:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 05/34] enchant2: upgrade 2.6.7 -> 2.6.8
Date: Tue, 26 Mar 2024 08:34:23 +0800
Message-Id: <1711413292-3025-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--3.905100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIpG7TeLn9NOt5OpgzWD3qjA34KY0g5BTd95IJ601ONV4Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJXTb03xyNvLaZBEpwFqzRh2ufWqk+xyRaXA3
	qHuxY07O+BTk5xA6LglffLKmBdAmPfsCe0oM4B9R4Cw081R6iJKFYJ2VKhpxn+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197495

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.6.7.bb => enchant2_2.6.8.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.6.7.bb => enchant2_2.6.8.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.7.bb b/meta/recipes-support/enchant/enchant2_2.6.8.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.6.7.bb
rename to meta/recipes-support/enchant/enchant2_2.6.8.bb
index b31bdc422b..e2bbe2eabf 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.7.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.8.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a1c2e5b59acca000bbfb24810af4a1165733d407f2154786588e076c8cd57bfc"
+SRC_URI[sha256sum] = "f565923062c77f3d58846f0558d21e6d07ca4a488c58812dfdefb35202fac7ae"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.34.1


