Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8898DCCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 02:06:58 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10878.1761185215976192163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 19:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GLCZczUN;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761185216; x=1792721216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QwJsXr0XSjbDUGTwU37ljWhwSYeHrcBNKn9yG3elie0=;
  b=GLCZczUNPLU1ndGgFgKd0Q1KI2Dgi54tVKa2aenicPND2Gw9ojeU2bIx
   mIrNNCspEobnKnINDihtNxTmu2oPaT0nJB2SI9XQ5hcqHJI32uknpwQ1z
   GXlzRw9DFBrD+3gdX1JYasMtzvwIFI88jjxC1zKn7Bk+2m2mZvCxFCP19
   kgh8h25SYou7jH6wQBnxDQ8/k5NJ8vWUi2ORjkV9zV4OXXnvwbw3DkGHj
   5LIHtwUpJdIE+AcQvfWO5NAnc97Kr1azT0/lABfW35IsHJHgR9PlYQ2mU
   HevCHCe5pHxGUprEI5xjbiwFaWGHcmYXAoL4WHi9rCoC1qpCSyCBBb3gm
   A==;
X-CSE-ConnectionGUID: ZzRX7o4OTXiL/t+48YUZRw==
X-CSE-MsgGUID: es1Cmv7aRGKdHPUvY8ag+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="195767993"
X-IronPort-AV: E=Sophos;i="6.19,248,1754924400"; 
   d="scan'208";a="195767993"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 11:06:54 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 412311000352
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 02:06:54 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 0265F18019AC
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 02:06:54 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id B4C851400BD6;
	Thu, 23 Oct 2025 02:06:51 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core][PATCH 2/2 v2] kea: fix installation umask to 0022 of meson.
Date: Thu, 23 Oct 2025 10:06:36 +0800
Message-Id: <20251023020636.2817-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023020636.2817-1-liuyd.fnst@fujitsu.com>
References: <20251023020636.2817-1-liuyd.fnst@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 02:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225216

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
index 2dca645cdb..6e75cff0a5 100644
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


