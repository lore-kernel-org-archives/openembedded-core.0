Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF797CCD195
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 02:40:22 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.9801.1760928020104138433
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 19:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ggMjOtN4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760928020; x=1792464020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vkLqO8Cr/zYqJKOQi2e4EUPg3WeZq/rhQRcbH9YhxKo=;
  b=ggMjOtN4bBNz589QPwhPOdTSftHc7fkdz/86vwqkPVU8zij9uWZL1MxR
   e/P2mfX29fwGdVV8cjI5ufBjxzUcSQj19uVl4kvhlFYouZiv8rU3JMlhM
   wl2SUWx5WSLzOE8AFDufRea6Sn2cRek0VVhS24zIFL7Yq9d/IGmtNLFpA
   RlogV3k9DGCz4l0ABwvAV3c09tVfwEXYKCvf6AOZdn1R+RvwHMvd+vux2
   b3n+vUf3iSn+d77Ir/Ho0TXdbLKUGt18LKxU0bL17u4vpAwUW5Ocovn3A
   6S8tLw1dTD65UX6CD6kLp3i8dGeWMPtpvaWEjFnFkTkSQPBnAXcn94vZs
   g==;
X-CSE-ConnectionGUID: 6v/XILlkQmaYR9mIAz+w5w==
X-CSE-MsgGUID: Riney/S1RhWS4F6n4GtKSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="217006494"
X-IronPort-AV: E=Sophos;i="6.19,241,1754924400"; 
   d="scan'208";a="217006494"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 11:40:18 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 722A11C1C708
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 02:40:18 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 337BA14003E2
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 02:40:18 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 146DC18001E0;
	Mon, 20 Oct 2025 02:40:15 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core][PATCH 1/2] kea: fix EXTRA_OE config to EXTRA_OEMESON
Date: Mon, 20 Oct 2025 10:39:54 +0800
Message-Id: <20251020023955.2962-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251020023955.2962-1-liuyd.fnst@fujitsu.com>
References: <20251020023955.2962-1-liuyd.fnst@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 02:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225091

After kea has been upgrade to 3.0.1,the build system changed to meson,but the config of build system is still be EXTRA_OECONF. So this commit fix it.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-connectivity/kea/kea_3.0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index cc34c05093..06f1a5edc3 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "ec84fec4bb7f6b9d15a82e755a571e9348eb4d6fbc62bb3f6f1296cd7a
 
 inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
 
-EXTRA_OECONF += "-Dcrypto=openssl -Drunstatedir=${runtimedir} -Dkrb5=disabled -Dnetconf=disabled"
+EXTRA_OEMESON += "-Dcrypto=openssl -Drunstatedir=${runtimedir} -Dkrb5=disabled -Dnetconf=disabled"
 
 INITSCRIPT_NAME = "kea-dhcp4-server"
 INITSCRIPT_PARAMS = "defaults 30"
@@ -72,6 +72,7 @@ do_install:append() {
            -e "s:${S}:@abs_top_srcdir_placeholder@:g" \
            ${D}${sbindir}/kea-admin
     rm -rf ${D}${datadir}/${BPN}/meson-info
+    rm -rf ${D}${runtimedir}
 }
 
 do_install:append() {
-- 
2.43.0


