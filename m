Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951C7CD3437
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.18355.1725352392627218283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SXNvRHIY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352397; x=1756888397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=W7h7dSnWVvMG6vVMpqGKnuDzdcWkSc10QuGoAZJ8DCs=;
  b=SXNvRHIY4gya0NbDFacaeTfa9sygn5Q3fq/0/dwsJ0HbYohLAZRbctT1
   ZgGkcc4Tbw2G1OLWhXg8dpjTyawx71pEbfsf1mlV/Y3IzsM6ZCrkIx33B
   IWwf6P7vIbzgC6VlS26VFIFvy8DEyTAuiufA0naq3HYeN4viQojtiGauq
   gVsSI5rpy0XiZXeANlXdSxyydXjR+CDkNAdFeLQnoqXYpi4gVxnGVOqAo
   Nu3pA0PqDGXH/w5KLFuuCTSQuXSb+5RAKnQWd5LhTJaD8dTRdLA9dcWEk
   BDoB2sz9XiE0P6nbpT1TU/8ShUJOKJug61TZ4RrUxz8BI/kjFCEiqG2JT
   w==;
X-CSE-ConnectionGUID: T/+fvsAtRJGjFPBPtsRdgg==
X-CSE-MsgGUID: 6hHn2pn8QBqe+Nd8rzR4aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="172584299"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="172584299"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:15 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D2EEAC9440
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 25A42D3F08
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A7D1B6C811
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4E91A1A000C;
	Tue,  3 Sep 2024 16:33:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/22] libsoup: upgrade 3.4.4 -> 3.6.0
Date: Tue,  3 Sep 2024 16:32:45 +0800
Message-Id: <1725352379-20334-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--2.258300-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfO5sqk1xxsSyLek
	d2LX0DpIZ61GfB3kCupgRWLzgh5fxiAn5eLpIQo3Ojf3A4DTYuGvMPxisLn2/J7fzNec2D1DGy8
	LahkVAd9gG9c9uJNevtYQqrf/H6Owd9gzS2tMJnv2TmdnNlUFIAT2OEnoCt48jwC3xgJVWx+GPn
	eCOFgqRLTF66D5pWEgGAzFQK6zqXi+8cB3bxsYx1Jbv6sGZHYqjbv3ERJ0uO2U8ftiyKjZrdMjj
	wb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNcCpWIzs12NVr8DB8nU9Rc5soi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNZRSEbv6aIG2uNG/DwXE/WociYoxWJ9vgoseOXvMLVmBkTd+OOcUkpgDMyw
	D7+ta1w4e3vRfSQiMmDXOPFTR79G+5QfEanNgDmOCjzW1o6/EU8mdcvbI1h2S6jzjuXTm0MTMzI
	CazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204134

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Allow HTTP/2 to be used with non-HTTP proxies
* Strictly forbid NUL bytes in headers
* Fix minor leaks
* Add 'SOUP_METHOD_PATCH'
* websocket: Add 'SoupWebsocketConnection:keepalive-pong-timeout' property
* Increase maxmimum size of HTTP headers
* Fix 'soup_uri_copy()' in Vala
* Fix leak in 'soup_message_new_from_encoded_form()'
* multipart: Improve handling of messages missing termination
* logger: Fix request filter function being called with response user data
* logger: Fix response bodies never being logged if request bodies aren't
* logger: Add Soup-Host to logged headers for when Host is missing
* cookies: Fix incorrect logic in determining same-site cookies
* cookie-jar-db: Explicitly handle old databases lacking same-site column
* cookies: Limit the Max-Age to 1 year

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsoup/{libsoup_3.4.4.bb => libsoup_3.6.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.4.4.bb => libsoup_3.6.0.bb} (96%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.6.0.bb
similarity index 96%
rename from meta/recipes-support/libsoup/libsoup_3.4.4.bb
rename to meta/recipes-support/libsoup/libsoup_3.6.0.bb
index 6f7cac4cf8..195fc4f741 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
+SRC_URI[sha256sum] = "62959f791e8e8442f8c13cedac8c4919d78f9120d5bb5301be67a5e53318b4a3"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.34.1


