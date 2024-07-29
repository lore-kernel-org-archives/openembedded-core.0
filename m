Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04CEC52D71
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46587.1722215420520138463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jZBec2T+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215426; x=1753751426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=A2Dy5I3VxYM3cbJtfzrwtu7OD5ixJcyJqanG+59ekl8=;
  b=jZBec2T+4hazSzU0ZrrftXM8Z56wLiCA/aNdU2eEnOqMvitMW0kPCPQq
   X/z/vhTuqy5eIhV7exyhyo5JvtAxCZb3NCiDA7K2kHea1+oxJgKtga2Gi
   gGsBALFkM26oRYQAkQ0B3QUpsw51aI6ZSKzWS1SbF4eAZMNcj64+pp+5b
   BvNOME3oYzIzO9mP7BBGmr89HWYu+5lNwaYK1fT4OH3RheXwmkfWi2EJF
   nPawp4CBioT9NwZIas97JOIof43ErsG01yDW4+SsrS+55WN0cqwlONuuJ
   JSo+GwOipy6QTzUO/EWnLVxCu4fIY+djgWFPMzSKsBqN2hRguAh3aXw69
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="148298400"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="148298400"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:25 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E1A07D9239
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 21FFED5B5E
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C1C420071A2C
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 518C11A0002;
	Mon, 29 Jul 2024 09:10:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/33] libproxy: upgrade 0.5.7 -> 0.5.8
Date: Mon, 29 Jul 2024 09:09:42 +0800
Message-Id: <1722215408-27541-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10-3.916000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrgphi5OOXbyVlSB4Tpn2REwjJ
	lierVE/nMXEju8Kv0dENyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDI3lq3YEgY6Jjrmb2Z4b9ZLGVb/LG9fKnmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNdndQFxIC9HgyTy3uM1OkIdD9G4ZzTplXtjwma3zt2Zc4fi9TjxGLHXY9nkeUnJuk8WRU
	xThuAVqBsZMKXlMOdpl43vlBejnlPzs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202579

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Update repology list
- Properly handle empty proxy ignore entry
- Add support for direct keyword in PAC

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libproxy/{libproxy_0.5.7.bb => libproxy_0.5.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.7.bb => libproxy_0.5.8.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.7.bb b/meta/recipes-support/libproxy/libproxy_0.5.8.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.7.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.8.bb
index 80441d4525..5dcd7d019b 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.8.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "2686d35cfa5db970d4ba65e2951ebc8183b1be82"
+SRCREV = "04c5185729e164dcc2d010177f83b6209769d9e7"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
-- 
2.34.1


