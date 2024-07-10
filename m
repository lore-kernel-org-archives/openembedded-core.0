Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D01EC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:29 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.10246.1720604660262726393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OA1Z54id;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604661; x=1752140661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fplvovZN2pZUGKLHok1ZcEPUjP9AmSlxgbdwC+f+vFo=;
  b=OA1Z54idMxP0FlHUIO4YF35dsPYO6KbcagIKgZ92mSfoNjMx0MghfztF
   oPpcaQGoJ6o2BrPOz1+8kjI4Xdx8KFF674odlL1YMMj307fWjRmowS2D3
   qkKm3Vqq/WRvalsWMuVDGMZs/v53/zlKtb4vEndhf3eyYqoPvIjh4rL4Y
   EDgFDYwIczTOiwpGnAELd2n7w4WEDpVvUKnNaPc3qi6/tLfTvLX4NFRja
   oDExLTk5fCJ4dkNGyayklp/y7NToLKUtoapN1xV7gRfDiHZiA/yMaES8R
   uPlKb4n6rFdGsUJSavcRvzSgqMxGcObItFwH9R/YKLqhUk6o42O8+ONpI
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="166535736"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="166535736"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:18 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A15353E4BB
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E1B27D510E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8290E1EBE69
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 33D401A000C;
	Wed, 10 Jul 2024 17:44:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/30] libproxy: upgrade 0.5.6 -> 0.5.7
Date: Wed, 10 Jul 2024 17:43:39 +0800
Message-Id: <1720604634-23406-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10-1.038000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mroZoUnnV928KxKD5d4wJGXb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyU+Hv
	2UJ089058IlHs6bk0vxQAXi4Ga9GRHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w7BfW
	Jx3tQLZuVyraD9GEwjMkaKw1uS9gQ1HOKFf1XuM9niKjsvWgCK++Dm8FdNfeU/OICnWMtGToGI+
	0NJOh+hkcAjelS9XsiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201711

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Update github actions
- Handle empty ignore settings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libproxy/{libproxy_0.5.6.bb => libproxy_0.5.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.6.bb => libproxy_0.5.7.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.6.bb b/meta/recipes-support/libproxy/libproxy_0.5.7.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.6.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.7.bb
index 6a705b305f..80441d4525 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.6.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.7.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "e7d18806575e21f94cf2f6024659386b129ca189"
+SRCREV = "2686d35cfa5db970d4ba65e2951ebc8183b1be82"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
-- 
2.34.1


