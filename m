Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB90C2BA15
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:02 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.5638.1716369328359877289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oFzXTUSA;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369330; x=1747905330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bInT91lic+kW0Ery5OrgE0zeugvHt765YrxpZrXBvHg=;
  b=oFzXTUSA+vdvTSDJ6nIkQa7GRMb7r2//e0If9nRNhYzcH1sfOaKloU6q
   ixXuqNHXIucuFJqDob74KqzK0H4CzQ5zlJvBDTNFJo+hZ8aOe/3uRXZWx
   sV5dmfH0vVOkfL7jj9V12CnFF7fU+l0X/XvsQ32oZvF4T0bOu9lc6PVYX
   kvgKIDF0MOl7rMiR2F1LnhxXerKLl7tUx9ji4Esw2hzMepvPwOERqUoRn
   nmWBOdoB0wyqJNStBnReavZa61+e4lF8AVZ1d1YdCy6YTEcFT75dSb6Bv
   ywwkIS+5WuTZvex38qCYHTLkrrclMXp1iYiphnAnBjbmUqs9DQp0Iv0fa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="147064677"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="147064677"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:29 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8540DDBD9E
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C23D5D7B7B
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A9E121CB3A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DB7941A000B;
	Wed, 22 May 2024 17:15:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/42] libarchive: upgrade 3.7.3 -> 3.7.4
Date: Wed, 22 May 2024 17:14:24 +0800
Message-Id: <1716369289-22526-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-4.139000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGHN78NmAjN8vOjf3A4DTYuEEa8g1x8eqF5DHQ2MaZXz4M1X
	7CPw/OT+HCmn/KV7Wink48PxckV+kHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDWXIr
	53h1qyUlsUqxQiFLQPKKu1Oacc7armnxeCphtUSqNlTq26fqOPbseDnf+3jGJUJvHgxuaiFD1DZ
	LptlQPXND8r7/jEzncyLmVkJTlglFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199712

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libarchive/{libarchive_3.7.3.bb => libarchive_3.7.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.3.bb => libarchive_3.7.4.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.3.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.7.3.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index bea91b6e97..da85764116 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.3.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 SRC_URI += "file://configurehack.patch"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "f27a97bc22ceb996e72502df47dc19f99f9a0f09181ae909f09f3c9eb17b67e2"
+SRC_URI[sha256sum] = "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd96bfe7abb971d5e8"
 
 CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
 
-- 
2.34.1


