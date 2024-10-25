Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51298D1171B
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:05 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.5565.1729834796885812494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P1v6kC7t;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834798; x=1761370798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iafCif2Ycc7IKZcSp6jzFXGL4iIxcyAMvQSksWAv4U4=;
  b=P1v6kC7t7pir3oRFBSWCxrTbXXM0Czojdc/eJ6d5iQpSCiA5r+AFsDkp
   CMj2c5p9ariVzTflCPMG6i7fU4wazh0WeZbDIiqPvF/cIoovYMrg2K0Mv
   uW9hULuvxfJifW7rjyv6OXLtr6+uPjUuHakogMWe5G93iv+3/6ZqaFZJS
   qNHm/xkh8MbW/cZ1HjhFGUO6di9DhNzpJRLi//RkYlU8cepB82vE/ga8A
   3Sgennnl8qdbscbvdfDYeqnIe2Nzfe2//ql25FHn4EHl72SeBJaz+Ehan
   cHkW0NsrZ17x+kwIgRPBRgmMFMoa+N+6IXdw9qvmZg7nWgA3xeWlznum+
   Q==;
X-CSE-ConnectionGUID: ew96OTiYScefoWJ8+WrG4w==
X-CSE-MsgGUID: Z/pC0+agT4aWv5Ba5zFrPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="166312867"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="166312867"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:56 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DA69916B90A
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1400CD3F1B
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C3E720079541
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 492BE1A000B;
	Fri, 25 Oct 2024 13:39:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/22] libarchive: upgrade 3.7.6 -> 3.7.7
Date: Fri, 25 Oct 2024 13:39:13 +0800
Message-Id: <1729834769-4717-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-4.600300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOxse/qkPPq1SHCU59h5KrFr9+Kgn2XgeJDHQ2MaZXz4M1X
	7CPw/OT+Yw5+jAyhxtIAy6p60ZV62yA7duzCw6dIBpRCTkRk5SfoLR4+zsDTtnlVv2XS+do9Ksg
	FGXG0FqTH1aFooO2X0AOIp/ZeuuyL3TiRmSlRycYE//gqZmyCGPnf9vY/2ay6xKl41oFv8FBC4y
	/tevBeoURMhDuX6WzDyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206315

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libarchive/{libarchive_3.7.6.bb => libarchive_3.7.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.6.bb => libarchive_3.7.7.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.6.bb b/meta/recipes-extended/libarchive/libarchive_3.7.7.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.7.6.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.7.bb
index a1cb34415e..0a0a6b374b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.6.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.7.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "b4071807367b15b72777c2eaac80f42c8ea2d20212ab279514a19fe1f6f96ef4"
+SRC_URI[sha256sum] = "4cc540a3e9a1eebdefa1045d2e4184831100667e6d7d5b315bb1cbc951f8ddff"
 
 CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
 
-- 
2.34.1


