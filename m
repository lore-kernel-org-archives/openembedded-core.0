Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133F1C25B4F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:04 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.11778.1713948174429262529
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rYNm66WT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948175; x=1745484175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uckrXIFJcSjD+8VzW99+Vt+OKlj4v6W6lV3zZeEj8Wc=;
  b=rYNm66WTXNoNVqEU48r1klr7nsHM/WOO5ruNIvrYr00rq2GkPSAtD8jD
   O17TXyNMaL2W2BMFD2rSVo4rpBdxqjPoWWrVR6WgrL2Flxf+vl8bnaIBy
   zBW8JjbXMvtCcnPEwsTDH4DgmhcUmodToZGOiUR6ATuT7fsXe43D1OLHy
   z+40IQ/Ysk+EjS+YFix4I5LMvWMVHTLIHBsY28FyqUaldm7qMV8eI7Tmj
   hWWNe6bso01WEyBUMmQytkuU9RM1RxwmBJm0h+6BQLdr6ZiAJ/ozIgbiH
   oH75wl2cuAszRMryxbiDim3IMOwuU9AlGvtjS6jYKYyWXVACrrm8lnnYX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="156595135"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="156595135"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:42:53 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E5364C2AC3
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E8F6D7B90
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 71455202CE13B
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1BA8E1A000A;
	Wed, 24 Apr 2024 16:42:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/38] cronie: upgrade 1.7.1 -> 1.7.2
Date: Wed, 24 Apr 2024 16:41:56 +0800
Message-Id: <1713948152-13501-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--3.980900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJohR6BxfAEeH7A34KY0g5BTfVBDonH99+VufdksK3etFJkeZ
	P2gCbh8iESVL06fzYOxP6uxGv2vDH5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2I3a
	djBtsMrB+crJ77x1JsaVKiuizu2oWaYVzn7igDcoJjyzQl8ISjZfFrGQV+dX1AQGKLMTYu7L1Ot
	Oqou47mZwUBWeSOJbsr/Ris8GKrjfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198647

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
*Revert setting the return path to <>. It is not RFC compliant.
*Inherit MAILFROM from the crond process environment.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cronie/{cronie_1.7.1.bb => cronie_1.7.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cronie/{cronie_1.7.1.bb => cronie_1.7.2.bb} (97%)

diff --git a/meta/recipes-extended/cronie/cronie_1.7.1.bb b/meta/recipes-extended/cronie/cronie_1.7.2.bb
similarity index 97%
rename from meta/recipes-extended/cronie/cronie_1.7.1.bb
rename to meta/recipes-extended/cronie/cronie_1.7.2.bb
index 854b68163c..abdaff644d 100644
--- a/meta/recipes-extended/cronie/cronie_1.7.1.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.2.bb
@@ -25,7 +25,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/cronie-${PV}/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[sha256sum] = "78033100c24413f0c40f93e6138774d6a4f55bc31050567b90db45a2f9f1b954"
+SRC_URI[sha256sum] = "f1da374a15ba7605cf378347f96bc8b678d3d7c0765269c8242cfe5b0789c571"
 
 inherit autotools update-rc.d useradd systemd github-releases
 UPSTREAM_CHECK_REGEX = "releases/tag/cronie-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


