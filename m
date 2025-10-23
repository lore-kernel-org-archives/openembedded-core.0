Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3FBCCD1AB
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 02:06:58 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.10851.1761185213548305407
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 19:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mtR9LHW5;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761185213; x=1792721213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=b/VzkcogZzYDRH5cZfYFJe9jmcmO75fs9CrDVbh9hlw=;
  b=mtR9LHW5lalgHjUqBjsGg6zhw+ABPmDGeHrZk4mx6EXQjcR5ejPTMtf6
   aMZrkZxWkXVGlMvD7kNN9IK79Ac88S4kcsgyVK41BwAEr5gxckZhAr4Br
   X1bWQ4HAq1nKioPmqDmOFZb62TNe9fzfXVs+8kBdASOPzS9nlPLMkCPh6
   FZa5w9njAYl4d/jRkl767St9qodyJRl2jydy6xp/eFvjyczgzQvRa6pOx
   QYK1mo1ljxWOB1l0lqmZcXqhIDBWvA7QRdknbsfHr/EAdi2vmRZk4iO0m
   51/l30256J5V9YqWI79coJ/7RdHDYnvkW9vxjz30hw6wWi6bs9q4gWW2Y
   w==;
X-CSE-ConnectionGUID: cbtKShvGQxiVHaDepvug0g==
X-CSE-MsgGUID: y6xkRD2wTHiudAnDaLGF+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217409021"
X-IronPort-AV: E=Sophos;i="6.19,248,1754924400"; 
   d="scan'208";a="217409021"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:06:51 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id D24CDC00354
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 02:06:51 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 924181803114
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 02:06:51 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7518314000D0;
	Thu, 23 Oct 2025 02:06:49 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core][PATCH 1/2] kea: fix EXTRA_OE config to EXTRA_OEMESON
Date: Thu, 23 Oct 2025 10:06:35 +0800
Message-Id: <20251023020636.2817-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023020636.2817-1-liuyd.fnst@fujitsu.com>
References: <20251023020636.2817-1-liuyd.fnst@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 02:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225215

After kea has been upgrade to 3.0.1,the build system changed to meson,but the config of build system is still be EXTRA_OECONF. So this commit fix it.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-connectivity/kea/kea_3.0.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index cc34c05093..2dca645cdb 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "ec84fec4bb7f6b9d15a82e755a571e9348eb4d6fbc62bb3f6f1296cd7a
 
 inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
 
-EXTRA_OECONF += "-Dcrypto=openssl -Drunstatedir=${runtimedir} -Dkrb5=disabled -Dnetconf=disabled"
+EXTRA_OEMESON += "-Dcrypto=openssl -Drunstatedir=${runtimedir} -Dkrb5=disabled -Dnetconf=disabled"
 
 INITSCRIPT_NAME = "kea-dhcp4-server"
 INITSCRIPT_PARAMS = "defaults 30"
@@ -72,6 +72,8 @@ do_install:append() {
            -e "s:${S}:@abs_top_srcdir_placeholder@:g" \
            ${D}${sbindir}/kea-admin
     rm -rf ${D}${datadir}/${BPN}/meson-info
+    # Remove /run as it is created on startup
+    rm -rf ${D}${runtimedir}
 }
 
 do_install:append() {
-- 
2.43.0


