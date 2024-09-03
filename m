Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33B5CD342D
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.18518.1725352404463433938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y0z8UHgy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352404; x=1756888404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KkQWbpB7lwka6O6+VY+PEk3Ex1Jr3Y/7nZrfpQlYyz4=;
  b=Y0z8UHgymu92QIlrGKSZO3RV8LbZQs1KUyFgU01LQOzfjew5+sdeup8p
   NjcsmwBDgvVlpwUiktfdeAJHBxu4HHdlU8FRNK80rP1/Ct+BVTVZvC5Bl
   hKv0Vxw2EEHA4MHO056sIuBBnB1iJVeSJFVywedQwXsjoMnPtNzlqvIJn
   WiuFmDuGiRDMd61obRE//2Xw7EIZ6GAk0PVYl3XNN9jwTRkmFWjLGAqes
   DpEHFV4K29b4748nd2cJpkOEwq/6kS8pcV1ocjVjNejNrYHOQXX7MQ5WK
   dDQ5wTg33BnIwX5e3DXR08LvLpZ47S7smFokn7IGQlxVqHiQ2dqI984UJ
   w==;
X-CSE-ConnectionGUID: ds16T+h9SoejkkI7egyBww==
X-CSE-MsgGUID: kOsWd85xRXaky08OQ1q8rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="159919376"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="159919376"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CD39C68E2
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 58B7DD50EB
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D3B526C9E5
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 78FAA1A000C;
	Tue,  3 Sep 2024 16:33:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/22] wayland-protocols: upgrade 1.36 -> 1.37
Date: Tue,  3 Sep 2024 16:32:58 +0800
Message-Id: <1725352379-20334-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--11.124300-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzB1z1KvCXwaD7C
	2zi5xdOElnyhwSQkWk3G1iFzClhjw4vwqM9US01BkYD8wAZKsSBF5qVUCGhwT50C6WJNXTpiPLv
	PGJ0eFinN25nZ2p7B7YMNagOrNZddAquF9R7bYYAX6pCkJZNSOSy+piTiLP72zAdJD7JeNMPtb2
	IIDsdQC+ArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslNmVjpriVEtlgDeovr2tertKfQ
	2mUc6Ddye0MgpC/RogAUW9+iL8IlbUd2R7XKvn3ngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiAq
	rjYtFiS594B6d1VNB4OlZJcRPgcP8vIkKmDMzlx6hwOGV099R37cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204147

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- xdg-toplevel-icon: add error for destroyed wl_buffer
- pointer-gestures: Add punctuation to clarify gesture cycles
- tablet-v2: Fix feedback description in mode_switch
- ext-image-copy-capture-v1: new protocol
- ext-image-capture-source-v1: new protocol
- governance: document review requirements
- members: trim trailing comma
- readme: recommend using "Draft:" prefix for RFC protocols
- readme: use references for links
- staging: Add xdg-toplevel-icon protocol for dedicated toplevel icons
- readme: s/Makefile.am/meson.build/
- staging/tearing-control: clarify what happens after wl_surface destruction
- ci: don't run pipelines in forks
- various: Fix definition of double-buffered state
- Fix some trivial typos

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{wayland-protocols_1.36.bb => wayland-protocols_1.37.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.36.bb => wayland-protocols_1.37.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.36.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.37.bb
index 9b008ca534..2bf59b9719 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "71fd4de05e79f9a1ca559fac30c1f8365fa10346422f9fe795f74d77b9ef7e92"
+SRC_URI[sha256sum] = "a70e9be924f2e8688e6824dceaf6188faacd5ae218dfac8d0a3d0976211ef326"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.34.1


