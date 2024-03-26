Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948ACC54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:33 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7876.1711413452564248321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C0OJh7xW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413453; x=1742949453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=V6lPrQa7byH8jGhXRpYgwLm+D7ax36Z63SgKI/IFb0w=;
  b=C0OJh7xWJC1fOcLJqwu2aAnSqQoOTid9xl6llmojkW4g2Ar23KUmJxQP
   QmCKfb7wGQQwTW6zo4My8Kcc/v+wxkWGSWzs/wT+IoU7YNTWilzz16762
   ljovtWBd1cDm/2Tm4hGql9oA1nUGV1CNoq8+fSzUy8BrgM4FhpyoM+Ehn
   1kv6jQ/0a3HnqX082z2ZgcpqFpvBJH7s/70tRnaQE8qhtKMTUDJEgAOCF
   lPU2FAJHoJe7uYyoZuYJt59Gaco6+IMHG7O2tSm0Usep4aejQUK+RSdHY
   V5LAEqCUWEMi8tPC6Hh2Y4XFRRbHXKZBmAU9IZAJedowVB+mbDvPdnNuG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="153207786"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="153207786"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:30 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2353ED9F01
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CCFEE6505
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D6D726B4C5
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 845B21A006A;
	Tue, 26 Mar 2024 08:37:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 13/34] libwpe: upgrade 1.14.2 -> 1.16.0
Date: Tue, 26 Mar 2024 08:34:31 +0800
Message-Id: <1711413292-3025-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--3.356900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrXLILvyEBT87I9EDAP/dpthp5
	7Xpv5seJjs+GIL5CCDDGKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat054zdlsYL2g/87GyQ
	B1oR95AqvfMofmxGxr3ST2s0VE1NFeZu37iG+/R7dCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtELY8vfSk3OKbejEro4EZYuCa/O0zanHoONHAoyzqxrAQn/Kl9FD4X/p6+
	q1mr/x33BdrMDWbZi+BmV0WJI1GMsTdp7VUB/fKHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197503

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- This version does not contain changes over the 1.15.2 development release.
- Allow resetting the fullscreen client to a null pointer.
- Fix usage of the _wpe_loader_interface with the static loader.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-sato/webkit/{libwpe_1.14.2.bb => libwpe_1.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.14.2.bb => libwpe_1.16.0.bb} (88%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.14.2.bb b/meta/recipes-sato/webkit/libwpe_1.16.0.bb
similarity index 88%
rename from meta/recipes-sato/webkit/libwpe_1.14.2.bb
rename to meta/recipes-sato/webkit/libwpe_1.16.0.bb
index 03ee88193d..57f91ce87e 100644
--- a/meta/recipes-sato/webkit/libwpe_1.14.2.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.16.0.bb
@@ -11,7 +11,7 @@ inherit cmake features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8ae38022c50cb340c96fdbee1217f1e46ab57fbc1c8ba98142565abbedbe22ef"
+SRC_URI[sha256sum] = "c7f3a3c6b3d006790d486dc7cceda2b6d2e329de07f33bc47dfc53f00f334b2a"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.34.1


