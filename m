Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F62C3DA40
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.64107.1718936239658529387
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZPYb41Tu;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936240; x=1750472240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uA1yeyxUS9RnU1Ex98izP/HjBjHf2OhlxP8CL1EYZ9U=;
  b=ZPYb41TuBsvuzICrpjkXO1hswk1x3GCJgO9opwiIJecM/jw0sSrwyrml
   tFPjV/Ow5DAcA3EygB9Lw7DMzWAticqhpEFBWt6hHafjwXimfs2/h/EnP
   2hkIrHQpoRl36K35OBra2uwzP995wEeT1XkBGPjtGjsbCCMYCSfgM6hD+
   GngyjzwSe11GRQIy2NQa5UoYmd1myDn7KAzacpoeaP6yRnIzwaOgPYV9r
   stKTGBxeebha6rqo8AC06Cgivn9uxvmSaaBbZ2HOSRn0ScnuNGE3ZrWxM
   BZkxqf/G4Te2B+Q26BPgv3AmWkK3ZOJQjdYEnHc9zUDPfY6ZM7kLvHcOp
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="152461007"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="152461007"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:17 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0517CC9442
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3ED111B84C
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B9056E4A9D
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6B0111A0002;
	Fri, 21 Jun 2024 10:17:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/22] libevdev: upgrade 1.13.1 -> 1.13.2
Date: Fri, 21 Jun 2024 10:16:39 +0800
Message-Id: <1718936206-8080-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10-1.394700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z71Wx2uUbPLcO8pJojG7qSm1hi2McQf+Ho8W
	MkQWv6iV3LAytsQR4e5rSTaF7k3C43QfwsVk0UbvqwGfCk7KUs9/bDCArCspGkAxPa2jvKcIDM8
	iS7v7kVLlW2AiUNKtKyjRoipkbRh7YmyrImtOLB9Gl5dOJAHdC2yKhITXg4CpcGeN8chcl+Ygep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200979

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libevdev/{libevdev_1.13.1.bb => libevdev_1.13.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.1.bb => libevdev_1.13.2.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.1.bb b/meta/recipes-support/libevdev/libevdev_1.13.2.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.1.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.2.bb
index 85cfd78507..fd2bfdad9b 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.1.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "06a77bf2ac5c993305882bc1641017f5bec1592d6d1b64787bad492ab34f2f36"
+SRC_URI[sha256sum] = "3eca86a6ce55b81d5bce910637fc451c8bbe373b1f9698f375c7f1ad0de3ac48"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


