Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77837CD342D
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.18355.1725352392627218283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tNrLQe1G;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352395; x=1756888395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vZ9jbNb7SEKctEwYNW3fkYpKXPKxMMGzrCx0pXpef5s=;
  b=tNrLQe1GniZkw73scqDZXi3mn4/mp9je3zv10JNYQlExJILlmpiJjzkd
   BU8F1D/F6fFrcn5IW5fxP6uTNSLRqIRt2s/hPtaaN0R/CinyZeR1pLTiJ
   OUgYNym/0SFKlkrfQpeBUjJoGFFOyBHV9AA4yySQjzFMh0JRT7/5gdx3f
   FnWO48F74gbZa4/DZBKQD93EFN1BavWZYK8Ss5rZ2p98uuwo/HOPYL6b8
   B6o1H1GC41BKUmoipkgNG3kxRo19e7q+bMbdCzGcy0zBc/6A9dXlRIJi8
   kEntm1YDsjQkPdYBEhqNNk7HEbjeP98xu0U31lbCI25aKpnKc7a8XPxol
   A==;
X-CSE-ConnectionGUID: DrSJD0vrQ3CFd2MBZe9HnQ==
X-CSE-MsgGUID: qnxOdo5kQR63vhTObq80Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="172584293"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="172584293"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:14 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2759DD8008
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 674C7D4BF9
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B69B320076D22
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3EE581A000C;
	Tue,  3 Sep 2024 16:33:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/22] ell: upgrade 0.67 -> 0.68
Date: Tue,  3 Sep 2024 16:32:42 +0800
Message-Id: <1725352379-20334-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--4.102500-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysvPRFFhcWhYHv3
	EJJrdBuxCC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BUENBIMyKD0eCbuVI7hVbLvIO
	fPEvWQc6gx1wnIrEXsoAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzQ4ha5VsRHmsAw5
	Z25Gc/r3RZ4fXMaGscffgG/Hyt917pSUZn59wX2hl71Cuspf5lvjmXsXWlPkE6Q+tCw+M1v4sQ/
	KrnH6R2iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204131

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix issue with string allocation growth strategy.
- Add support for netlink helper functions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.67.bb => ell_0.68.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.67.bb => ell_0.68.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.67.bb b/meta/recipes-core/ell/ell_0.68.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.67.bb
rename to meta/recipes-core/ell/ell_0.68.bb
index 6b0ebbe621..40c057afc2 100644
--- a/meta/recipes-core/ell/ell_0.67.bb
+++ b/meta/recipes-core/ell/ell_0.68.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "97942e8cefb130b632496e5485242f3f374f3b8846800fb74fffd76dc2a0c726"
+SRC_URI[sha256sum] = "ddcbf381d758f61a02954bf5d2907c8900462abb7b2dcf45589874978bc10125"
-- 
2.34.1


