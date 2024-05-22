Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62D7C25B7E
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.5638.1716369328359877289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NkgxjszF;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369329; x=1747905329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nNSrVvGYaq/lPsi3V+nfA4vBbBDMW+qoW0FwSNr+4Mw=;
  b=NkgxjszFBA/bAjgTjJgc+1GIwIProWGtpo2pG3k0eUPc9cGs232j3mSW
   1OU4irxKkqqID1AhhEZ/tbxfSODkdYW0Awd6UYdk5OhD+5jCGXOo3F9Nj
   XPT1F2s0rr1dLgubCQ0bsS/CpW1NYsGcS8fk5dxrOZPcQqH8n/JIWQjoe
   W2xbj1I00lQDtwlgU7uCElU9epas+vZs0L3oPLHcrXS81x4nCs7ms/6OC
   AGssxH7iHwbJs/NAeeJrZwb3DPFzhxNzg9u9pSHu6JkFbmtw6rHHeRaky
   WEWuDYRgv+JOW9Llt3tZ8Qs1l+3z+sZCgmixzO0L7JtIzNXEH2+JGGqMf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="147064674"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="147064674"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:28 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A80DECD7E7
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D4957D6FF0
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B6AA20097E68
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 156C71A000B;
	Wed, 22 May 2024 17:15:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/42] iw: upgrade 6.7 -> 6.9
Date: Wed, 22 May 2024 17:14:23 +0800
Message-Id: <1716369289-22526-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--2.263500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2s0FJKIRy8cWueKNmNNd29XrMZ+BqQt2NoQtuqs6BbPJ5QOYBrXJCKAKsm
	10TThDCKxfbhqGxLk+4Ay6p60ZV62v2ThXg3lx4Bq8/xv2Um1avoLR4+zsDTt+gmVy5VdZklJmj
	TDwju5PL7bPRoUUCF0ElIa/504vWzdJTRgnt0Y8qDcEyn2Zx+n6CE8t0XeMcnDRwfNfLOlG3b/i
	PkUXN5HCVoPSiKOZs7yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199709

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/iw/{iw_6.7.bb => iw_6.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iw/{iw_6.7.bb => iw_6.9.bb} (90%)

diff --git a/meta/recipes-connectivity/iw/iw_6.7.bb b/meta/recipes-connectivity/iw/iw_6.9.bb
similarity index 90%
rename from meta/recipes-connectivity/iw/iw_6.7.bb
rename to meta/recipes-connectivity/iw/iw_6.9.bb
index b46b54bc93..dc570d1124 100644
--- a/meta/recipes-connectivity/iw/iw_6.7.bb
+++ b/meta/recipes-connectivity/iw/iw_6.9.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[sha256sum] = "b3ef3fa85fa1177b11d3e97d6d38cdfe10ee250ca31482b581f3bd0fc79cb015"
+SRC_URI[sha256sum] = "4c3194778b175d58442907d51d1977e7270fce5cbebff0eab11c45c1da287a4b"
 
 inherit pkgconfig
 
-- 
2.34.1


