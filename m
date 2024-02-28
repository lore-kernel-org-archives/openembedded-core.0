Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024ABC54E55
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:31 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8393.1709105607655153432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AMX5a0zL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105607; x=1740641607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BIzXifSBZBhMFxuaFWozxL9F2teb+FM0rGl2bRD1Nnk=;
  b=AMX5a0zL8udRfUNTEOBFr/rNsdrI68tpUsh8zCT0IzJ0LECEpVoMiBVm
   AaOiWg+bfIuFVZ389YpIYbmb0qNZV0YB7FFH5mQtKjuKNiQ8wlAS3g9Qi
   LzdfE4+5GMs7PXRZ/qXaa4UWlnEpTv9kjKT33oZqEKlrIjNWRGK3nxeFb
   eMMgs4DGv795hn7YH7aSTxc/xGYmokiG6c5A1S0/UE8r/oulJV39O3SzL
   sjVaWvb/2LOOAPY5Kdd8SYD9kfwCpK+yi7uIEUXySU3NN41vPufzOSalU
   X31yh+py8BjfoYeixddqXdKPk3o9EZxaKADdCdoVewPpN/xag+wjQ5CH5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="138665580"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="138665580"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:25 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 308561590F7
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 52C22D52AF
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D8C5541180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8BFAB1A006A;
	Wed, 28 Feb 2024 15:33:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/48] libmicrohttpd: upgrade 0.9.77 -> 1.0.1
Date: Wed, 28 Feb 2024 15:32:20 +0800
Message-Id: <1709105575-24259-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-2.368200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrG24YVeuZGmOBAXl9LkPp6d3j
	jLnWeB3h4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2YXsbVsdXVIhoSV
	r3+zgq92xfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzaN1Ag6XPYXBaZZ
	zNvSUxumKCTlL6CoTJFlkjUoF1Zw6uPnZs0gx4kCjl9FyWnkAcR41TGXAoT7TMyelrjkROkwgjI
	iFsGRBaiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196338

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  fixes and improves builds with non-default configure parameters.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libmicrohttpd_0.9.77.bb => libmicrohttpd_1.0.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.77.bb => libmicrohttpd_1.0.1.bb} (90%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
similarity index 90%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
index 792ac24726..0628ee71b5 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9e7023a151120060d2806a6ea4c13ca9933ece4eacfc5c9464d20edddb76b0a0"
+SRC_URI[sha256sum] = "a89e09fc9b4de34dde19f4fcb4faaa1ce10299b9908db1132bbfa1de47882b94"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.34.1


