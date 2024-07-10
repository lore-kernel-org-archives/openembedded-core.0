Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F420C3DA58
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:19 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.10245.1720604657638805985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X6iezErK;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604658; x=1752140658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iY/yi8atzk+dlRzmKBWXqBBMIALCHhl4c8Zrx7N5hjo=;
  b=X6iezErKwJdXHfBAA1HcdgVv2BIdw6291iQZUVRfXPd902QzZeirK+V/
   Y96D7iSObmUHDX2Vzb+lVf+F1X2MX38beHrGzIlc6MQ6EMWuJJ80oGAIa
   Y+CO0bxaVi208qTLRKc04Xv+KM9FxhHdyOChGGTONxjVDYM01aXXU/XV4
   ITeTuMgoSmBr8Yf8F5I3itdZ0pj/UStYo4bayUmjXk454sKnYq0122A3i
   O6MwYd+tYFhzXjzTFvJUj1dENVdy6nHhKAbdUD/FxRbpba5c7YKmvLTdH
   H+s0R2ASMIfaW/lIe5l2BZW53R7EQHIYyqmJR0H0M97uKBHeFz7EWDV1e
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="154818594"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="154818594"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:17 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 283F6D6482
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F79BD8B6A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A3212005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BF5ED1A0002;
	Wed, 10 Jul 2024 17:44:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/30] libdrm: upgrade 2.4.120 -> 2.4.122
Date: Wed, 10 Jul 2024 17:43:38 +0800
Message-Id: <1720604634-23406-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10-1.174100-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGFxxDx5qbkR9FEUknJ/kEl45N6P0pQOPlfc8OJc7+0VJjoc
	zmuoPCq3lTDC3C9usCj/weRwRdOj1QuhmGjHQfPyWsbfbR6vXmKThfmTo8867vEf7pWZBHQKVNR
	DYQXtQtL4QrKjhoPsHzmqKzS21ekodJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhFTP3QRDAbYw
	Clu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201709

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{libdrm_2.4.120.bb => libdrm_2.4.122.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.120.bb => libdrm_2.4.122.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.120.bb b/meta/recipes-graphics/drm/libdrm_2.4.122.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.120.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.122.bb
index 18b3256843..e295f64178 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.120.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.122.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "3bf55363f76c7250946441ab51d3a6cc0ae518055c0ff017324ab76cdefb327a"
+SRC_URI[sha256sum] = "d9f5079b777dffca9300ccc56b10a93588cdfbc9dde2fae111940dfb6292f251"
 
 inherit meson pkgconfig manpages
 
-- 
2.34.1


