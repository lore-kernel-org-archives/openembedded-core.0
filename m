Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B3FCCD195
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 02:40:32 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.9803.1760928026840034814
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 19:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BwkBf48L;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760928027; x=1792464027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3cHqO+9dMCiHD5bWiJl+PpVY2x/IdxAfC5iNpJVhCKg=;
  b=BwkBf48LgkUODQL07zds56HQwITF4SHvC4n7Y5EhRZ2fzYLbjc/o5GWQ
   EQaIrGi8l7N7wYYvzu+nP87xYFkXhSnjo7GWc8zixVC/ktD6AiMOGAPGj
   WsWLpabaomdvO5oLCZrsPtKGaQq9EVJd43YNUs9jNQb+1Uo+GnzaiyP4M
   D21TJWNkU/idS8Nw7FC1basLF4W6L2Ti+Ydm5hcU8xfbP14jMpaJtoTyV
   8KIJf3tNOL5U0+OurHtkUdIwoObTiQtUC9PsTvxSDuPMjeikymyVEIdHo
   neQlWK3LsKCaCnPlElixbV6Kxv5YWjyXKtlQFrHGCQRV/NAHe2xQgRsTp
   A==;
X-CSE-ConnectionGUID: dRJKqPftSzOTOw8POpZI8g==
X-CSE-MsgGUID: MjOOZKhRRo+JsyFHjFGH1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="216390668"
X-IronPort-AV: E=Sophos;i="6.19,241,1754924400"; 
   d="scan'208";a="216390668"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 11:40:25 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 4E7CB100034B
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 02:40:25 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0901F10001EE
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 02:40:25 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C0CC618001F5;
	Mon, 20 Oct 2025 02:40:22 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core][PATCH 2/2] kea: fix installation umask to 0022 of meson.
Date: Mon, 20 Oct 2025 10:39:55 +0800
Message-Id: <20251020023955.2962-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251020023955.2962-1-liuyd.fnst@fujitsu.com>
References: <20251020023955.2962-1-liuyd.fnst@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 02:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225092

The default installation umask is 0027 for Kea-built artifacts.

And it caused package conflicts as following:
Error: Transaction test error:
  file /usr/lib/pkgconfig conflicts between attempted installs of kea-dev-3.0.1-r0.x86_64_v3 and btrfs-tools-dev-6.16-r0.x86_64_v3
  file /usr/lib/pkgconfig conflicts between attempted installs of libgcrypt-dev-1.11.2-r0.x86_64_v3 and kea-dev-3.0.1-r0.x86_64_v3

I submitted an issue to the upstream and found upstream alreadly known this issue.
https://gitlab.isc.org/isc-projects/kea/-/issues/4171
https://gitlab.isc.org/isc-projects/kea/-/issues/3993

Then I follow the method in the SPEC file of upstream to fix this problem in Yocto.
https://gitlab.isc.org/isc-projects/kea-packaging/-/blob/master/rpm/kea.spec?ref_type=heads
meson setup build \
	--buildtype release \
	--install-umask 0022 \
	--bindir %{_bindir} \

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-connectivity/kea/kea_3.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index 06f1a5edc3..4a6623f94a 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "ec84fec4bb7f6b9d15a82e755a571e9348eb4d6fbc62bb3f6f1296cd7a
 
 inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
 
-EXTRA_OEMESON += "-Dcrypto=openssl -Drunstatedir=${runtimedir} -Dkrb5=disabled -Dnetconf=disabled"
+EXTRA_OEMESON += "-Dcrypto=openssl -Drunstatedir=${runtimedir} -Dkrb5=disabled -Dnetconf=disabled --install-umask=0022"
 
 INITSCRIPT_NAME = "kea-dhcp4-server"
 INITSCRIPT_PARAMS = "defaults 30"
-- 
2.43.0


