Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8A2D116F7
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:04 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.5578.1729834800186431819
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YTz9ajUA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834801; x=1761370801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6UIeGe+WG1RnICeOXS1epml7MKO+qBNnEEVXZGl4amo=;
  b=YTz9ajUAJJ6eeZJLP+PsVG8OthURsvm6ttuB4UwnqbNvJRGVEDmjjzS6
   cOp6nleee3HKxhSl6+oiuN7A2vONr2dIVecCVhrkNeotni/5O9oPK0r7k
   Wp+wzrXB1Q1IhxgJ8kBvXhyWpQe/D5XLbXpT5ncb3wYBe2HUYefvaWov8
   aRirVTfHclDJWM3xHNpCZf/8zm9wINwcgd0rGB0/OfCMn3xO6teVFVK7s
   ElEbpQ3FX94QrEfTQ9OxXCtNY6Htlq0MC/yVa3ms3a2iuDNo9oYp+VRpg
   76ORQPkU4VRpUxYguFR8PyDlOjcNoEHla4Om/ZEGr/90K0UkuV6OD6e14
   g==;
X-CSE-ConnectionGUID: HAZty6l5R32O8Uit38GwzA==
X-CSE-MsgGUID: s3iD9PJxQeOo5HMh4qHGfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="178163945"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="178163945"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 59AD3C68E6
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 92885D3F1E
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 38A7420071A1D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 025C91A000B;
	Fri, 25 Oct 2024 13:39:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/22] xtrans: upgrade 1.5.0 -> 1.5.1
Date: Fri, 25 Oct 2024 13:39:29 +0800
Message-Id: <1729834769-4717-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: N88p3DLIqpCjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJXW6gM8Ys8CB8TzIzimOwP0C1sQRfQzEHEQdG7H66TyHEqm8QYBtMOtzy
	nL9Pt5/tDUzgCuAxET6Gh6Ww1So87aYp/KazcXHXFmQqMtdLeejpTAmzGso/ghqSBtBt8oODUAb
	oU16/33gppEroaBQrdgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206332

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{xtrans_1.5.0.bb => xtrans_1.5.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.5.0.bb => xtrans_1.5.1.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb
rename to meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb
index 781382e516..ea362750df 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb
@@ -22,4 +22,4 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "1ba4b703696bfddbf40bacf25bce4e3efb2a0088878f017a50e9884b0c8fb1bd"
+SRC_URI[sha256sum] = "dea80fbd8c3c941495b4b1d2785cb652815d016849a0d2ef90d1140de916993e"
-- 
2.34.1


