Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CF9C10F16
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11800.1713948206613892977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jwQf97AW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948206; x=1745484206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gmaw1CgVVnUII4648s4FGIMJ2g0qDTaTBv4JViuH6Ss=;
  b=jwQf97AWNwBXq8J64BqrJa/lugcUV3s5GxiDjL0L4jKhmmmPSvhp7nsS
   y36rOYBR92FJiDFE1YY6UJHRms5j7JogxYagsqIznrgOYMon2a4p8sqiX
   soasLwMWeXjkhaWtLwvAOj0KESCaqaQko0i4H7dC6yAUwg+wqlGevOM3c
   FVU0pOxKO2b5BrlYm0i+0q5bi1v/UYfC0B34zD6yIaJBZuXgFUVCXSWmN
   kzxQIvBsL31waUvZRbdWwgNKqAuk3JBn0fxL8DWngnIznfzCr04aaiWfQ
   AKO3IsUXt3LPGEZzr2n6shE2nhOOMuhzqRQVlp8uE4/FJBEeND1qtiJFh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="144151953"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="144151953"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:24 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 38E50C6905
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 74B1315AE8
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 00555202CE122
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A0D191A000B;
	Wed, 24 Apr 2024 16:43:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 37/38] wayland-protocols: upgrade 1.34 -> 1.35
Date: Wed, 24 Apr 2024 16:42:31 +0800
Message-Id: <1713948152-13501-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10-0.204200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mregIHHX2L4YydAuliTV06YnJ9
	Mbn64cXRcAY7QJ9OlYsNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDIcfwGQIbwrkHST2s0VE1NFzDS8WsQcZbNIcJTn2Hkqsa4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq0QxjoSuMokQsRAWtjmJ2+CKA8RKzF/bHzSyaTmjOXFYFwi7
	91RQfocn0oXdaBb15zQuLZzXMVk15jZJmRbJlFRsTESoyreWbkdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198682

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- tablet-v2: mark as stable
- staging: add alpha-modifier protocol
- xdg-shell: add missing enum attribute to set_constraint_adjustment
- xdg-shell: recommend against drawing decorations when tiled
- cursor-shape-v1: Does not advertises the list of supported cursors

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{wayland-protocols_1.34.bb => wayland-protocols_1.35.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.34.bb => wayland-protocols_1.35.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.34.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.35.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.34.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.35.bb
index 8c12985714..7e70de346c 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.34.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.35.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c59b27cacd85f60baf4ee5f80df5c0d15760ead6a2432b00ab7e2e0574dcafeb"
+SRC_URI[sha256sum] = "37a2716a28133dc819341c568a29d21e8cb72130e5c126a1fcfc9f42c23d95ab"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 
-- 
2.34.1


