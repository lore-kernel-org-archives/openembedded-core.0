Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AB1CF9C7B
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:44 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9311.1727246980454541622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UCXe2Iac;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246982; x=1758782982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=q+L1LUQzU+0/vKXGxXqYxM6TIQ5yWARC4XQ5zkad+sA=;
  b=UCXe2IacrnVCI9Qm0lFxwoXQCKuBK+xSGdlM1O7h8gDrYJgCu9hNpP12
   1qdWvivvAK8h1++gyEno3WxyCn+wKUKA2dNhmCsGDlu7A1OykrrUb69Cg
   VgdpvCrrmN9fzwolGWcVEpaEIZM6QYyJs/pQf+WDojR9o3RVQXjB+UNz9
   Kze9UQ/66Cg18x1Lcb6XI/qXZC5RQhkNzK60j3O3VIIZspqoIalXByxqU
   HGxxLGZNpcKxfFprs7mGkC+epNv1QirZBjIcKBhnojlcXNarxzUixAA/Z
   L1P9v+/330FDFzqSPl5iyGhK7LbyhHvo950DRyJMxG/MEcdL2JNzeG525
   w==;
X-CSE-ConnectionGUID: z5Ku/4p8SQ+XSBVEBSVhIA==
X-CSE-MsgGUID: c2M6W6rQQ3WQ0evRaDodRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="173949689"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="173949689"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:40 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AC24D9048
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A93ED5BAE
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EF64620086335
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A08F51A000A;
	Wed, 25 Sep 2024 14:49:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/47] ifupdown: upgrade 0.8.43 -> 0.8.44
Date: Wed, 25 Sep 2024 14:48:43 +0800
Message-Id: <1727246960-20665-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-0.474800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLHBvqhRdA8sjcWnfYuXbRjOjf3A4DTYuF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8Krf1bmjt73hlf/PkgXislweJ5GaayNTvryuYlsqtBA6vrUdOvz3butBAKqO
	9b/F/hXlSs3/Yii6eJL8ZkHxBRsN1ilFwhYAqOZB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204901

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ifupdown/{ifupdown_0.8.43.bb => ifupdown_0.8.44.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.43.bb => ifupdown_0.8.44.bb} (97%)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
similarity index 97%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.43.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
index 1557551d45..3e7bece41b 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.43.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=mast
            file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
            file://tweak-ptest-script.patch \
            "
-SRCREV = "cf86ad5819aba8f9b020a95257c9a8c4911b1c85"
+SRCREV = "7d44f9ce6717a4a496fd46f28c52e12dbf5bafdd"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


