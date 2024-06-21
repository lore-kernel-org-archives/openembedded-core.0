Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A766DC2D0D0
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.64029.1718936233782481070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PpEGmZ+4;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936236; x=1750472236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cKKv6skYIioUz7SVm85uDlp+6j9J3L3F6xJQGEbw6jA=;
  b=PpEGmZ+4kKB6Zm0Ez8OWQk91jpFo5oea2vya8mPcdXL+zZ/rckDy38w8
   idh9OKd5gM1NtxPNAJoj5SV6rn5SWxLiwgnm0n56FI1IotR9jym12Ps/B
   8GMVM1XBP1kkDxgW9KKNV+uIk3HhK9snd2o8FRYvrII7NtwiKcxEnqVIT
   EyLL/+GUYhncscHaeaG0XXXDhrc1A7S7KYm1EHz/hm0Opb2ELHQ8TV94N
   36buNz7dTb3nbAhYYR3+Vapgqel3LLpQiEaZ1P972Mss32Oiau4zTLhzx
   nq419pAtM/addbN7V/M0rXUn6MogVPWmjyPngZxbwIKIk5FHV0GALbfsy
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="143508274"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="143508274"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:14 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CE3DADB3C2
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D0F3D5108
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 93F3EE5185
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 463191A0002;
	Fri, 21 Jun 2024 10:17:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/22] enchant2: upgrade 2.7.3 -> 2.8.1
Date: Fri, 21 Jun 2024 10:16:32 +0800
Message-Id: <1718936206-8080-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--3.325300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrGEfoClqBl86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN6nHbeBu5LnkCtGYG0znilMZICH6pwLFJLRI
	949JB9GPi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFP8tFqWyoYYVED07xhVCrfxN/t
	K9hm7qh1pt1IX7YElRIFf6lHdgtbeaJpvyLixble5weuAPtMSjAm32xpXGmE5BA6zJTz7vI+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200972

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- restores an optimization removed in 2.8.0 that reduces the
  frequency with which personal wordlists are reloaded.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.7.3.bb => enchant2_2.8.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.7.3.bb => enchant2_2.8.1.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.7.3.bb b/meta/recipes-support/enchant/enchant2_2.8.1.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.7.3.bb
rename to meta/recipes-support/enchant/enchant2_2.8.1.bb
index d5073b6f31..825cf2e388 100644
--- a/meta/recipes-support/enchant/enchant2_2.7.3.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.1.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "fe6ad4cbe8c71b9384ffdef962be52d4d2bd5ebfb6351435bb390543d4f78b1e"
+SRC_URI[sha256sum] = "ff79de470b8eb16f53849dc49f2bce8ca4eb7decabfc1349716fe12616e52f4e"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.34.1


