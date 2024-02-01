Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391F9C48291
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 04:21:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8427.1706761296323151889
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 20:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PqO8Im9U;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706761297; x=1738297297;
  h=from:to:cc:subject:date:message-id;
  bh=cDSthGDq94iVyW097o1DwcE0r9J7YjALetKq4Sq2eB8=;
  b=PqO8Im9UwOkL1EoPKYq9pJCyqG/tO0a1yXsaax7GI+pMB+5eBSYoVh/u
   155XGiSWNKlz31qYHXgMpzEueTM+m06IPB4pHFZ1XOcognQOceVXsx5aN
   1jacJdfOzPowMPj9ZrHNVpnSqWg3gUe6zqYo2+zKWG9n/2/kYj6h+TaUa
   TFRcXHEiYNLBta3eZAP8v9tEExDA18a5fWDX6s4S+ltcooAVKIG/J9rwk
   bEKhyKQx4R3r9AUNn8MFVPMV/csExzCwwoQZWBga5Dul+SNWIm5zA9Nqu
   b+9ksM1FS6FXBNaVsJ4An3THit3+pbNbXT5r+/ywfXtMzLJLCGPb8fI5q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="148010491"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="148010491"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 13:21:34 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B17BF1730E1
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 13:21:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 02444CF7C7
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 13:21:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 858751EAC07
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 13:21:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2E0B21A006A;
	Thu,  1 Feb 2024 12:21:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libwpe: upgrade 1.14.1 -> 1.14.2
Date: Thu,  1 Feb 2024 12:20:49 +0800
Message-Id: <1706761249-11942-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--3.356900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrXs5nqGvDCfO7N2IdiDgmM5Zh
	jmb07zEXCC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BUENBIMyKD0VGJGXffuLdvhTx
	J68Al2VrJ7QyCkL9GiIZSCkD4rpM2SJD6DmpCD0fdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtnE9OZnBsbGC2lW9RKZMSIfX9wF+3tv7JrJ/pYOS/YP3fBPqnrrMLaxgJ3
	Df9oW+04DPsTUth8KtYN4W8ITYmKCbd/WL2KmlFHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 04:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194558

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Allow resetting the fullscreen client to a null pointer.
- Fix usage of the _wpe_loader_interface with the static loader.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-sato/webkit/{libwpe_1.14.1.bb => libwpe_1.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.14.1.bb => libwpe_1.14.2.bb} (88%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.14.1.bb b/meta/recipes-sato/webkit/libwpe_1.14.2.bb
similarity index 88%
rename from meta/recipes-sato/webkit/libwpe_1.14.1.bb
rename to meta/recipes-sato/webkit/libwpe_1.14.2.bb
index e63e1c8367..03ee88193d 100644
--- a/meta/recipes-sato/webkit/libwpe_1.14.1.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.14.2.bb
@@ -11,7 +11,7 @@ inherit cmake features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b1d0cdcf0f8dbb494e65b0f7913e357106da9a0d57f4fbb7b9d1238a6dbe9ade"
+SRC_URI[sha256sum] = "8ae38022c50cb340c96fdbee1217f1e46ab57fbc1c8ba98142565abbedbe22ef"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.34.1


