Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39210C2BA18
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:02 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.5640.1716369330229003910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mOJZzN/o;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369330; x=1747905330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZNUySOCCA5EJJAPATAqVI4ZYx31N5sULXnkXeTknWSw=;
  b=mOJZzN/oU0EZwhZ4zebGeynqd/Cms49pkNzOCjqw0OjuAp7FnNc7GiOL
   UQK7hYWsl6w6R67H4ExcPnBx1lmxoNmWwzAp6th0WTgT9kAu/x7Z55oNQ
   HeeQIaFYPEolm/X0XEZ7y+MVCn7+UpzJMo2UZ5duGWZRe8RXkni+WfN3v
   cycdsvXQWhhwzn2D1IiczHSCFbtzrAxRsemSZHbjtoZXtEUk2zY4yEYAQ
   oQjVJXcY7BynZYVeVTBE3LxpoCkPphLUKlYnXXAuBVcUQjMbW/o5KFqLW
   8Vhe3smuY5/wg5U2JblM/tjkuSz6lFsNZtGiNKbA3XP+yE4Dl5WiT15x6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="138467719"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="138467719"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:28 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F3B8EC68E2
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 39861D45FF
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AB37B21CB3A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 579551A000B;
	Wed, 22 May 2024 17:15:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/42] iproute2: upgrade 6.8.0 -> 6.9.0
Date: Wed, 22 May 2024 17:14:22 +0800
Message-Id: <1716369289-22526-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmK2oB9n2uCv2uVHGbcDbAq6FEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtpmd
	/ehreR4VocRuPRC6s8i0j5/E4j8gc/WtkuEOuD/KxJvmAokSMxxKylvfXp2O3+XfddToK29Utcs
	30S7RAyQXkQ/ftR5fzE9EArG//ycbyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199711

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iproute2/{iproute2_6.8.0.bb => iproute2_6.9.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.8.0.bb => iproute2_6.9.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb
index 24539e3d99..d21885cd73 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb
@@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native iptables libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "03a6cca3d71a908d1f15f7b495be2b8fe851f941458dc4664900d7f45fcf68ce"
+SRC_URI[sha256sum] = "2f643d09ea11a4a2a043c92e2b469b5f73228cbf241ae806760296ed0ec413d0"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.34.1


