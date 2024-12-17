Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD604E7718C
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:45 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.77570.1734425919706697862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PVjHq2RG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425920; x=1765961920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DRut7hXPcguinjks2J9Ezs+pw/goZjOkV54ZdPNR6dc=;
  b=PVjHq2RGvQxAVs/QX1FAGrcjL42RlMQP72swT/6Ptnv6CPYK15iZQsTB
   Mt2/bVIKXfI1PcUmRvRGZg1Ixm/NnP7bbWjJjLfJrod1W+nswcBtlDUv5
   sjfigmcPD7d5LQiPpQg9fWRjIEaLIiXmFwROetbUNMUw0x6PvukjzY4vh
   GwH4cZ58mbgj2DaPCFGB5Bl0sNYgF5FwouSgX98XaD3MP7e8z/HlCYg1A
   lOx0SMOhvic3sBt0WEBN18OxtZRfYYh+1KdPv0YTUrtVGXOA+F3tIlxAE
   X1Lfs/8ouiMXHpd1/SdALR1NWitEeXUjQjndRXaWeDH5WSkqSadmc9q0p
   Q==;
X-CSE-ConnectionGUID: gk5v7T8yTySq4UpEN1wBDQ==
X-CSE-MsgGUID: rB7J5j1MR4232+c/YHW5Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="186395100"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="186395100"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:38 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 520C896743
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EE87D5098
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B30A13479C
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:34 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 514601A0071;
	Tue, 17 Dec 2024 16:58:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 17/21] ofono: upgrade 2.13 -> 2.14
Date: Tue, 17 Dec 2024 16:58:03 +0800
Message-Id: <1734425887-18069-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--6.628800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svLwLt
	Av8b4f0oUUs12plMtRCfpS8fdiMxuZXlm91Fv1IpA9lly13c/gFyGvikEsYi8AfxTM57BPHD7P0
	f4RQxQyUi+t+0AiFaYlxD8VfJsTjmlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2J8Y
	JgRrgXF0PAWwM2sciTh9Fj1p4t46cFG2CUV7CVzGg5QjuTHgFY
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208821

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix issue with STK and buffer length checks.
- Fix issue with SMS and buffer length checks.
- Fix issue with QMI and handling RAT detection.
- Fix issue with QMI and handling call forwarding.
- Add support for handling MHI network interfaces.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-connectivity/ofono/{ofono_2.13.bb => ofono_2.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.13.bb => ofono_2.14.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.13.bb b/meta/recipes-connectivity/ofono/ofono_2.14.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.13.bb
rename to meta/recipes-connectivity/ofono/ofono_2.14.bb
index 2cc59b5c5a..0a695c978c 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.13.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.14.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
 "
-SRC_URI[sha256sum] = "fa813ed74a4658e5702f707033497bf891504ffdc0f1b45d85bc3f092010744f"
+SRC_URI[sha256sum] = "983cbfd5e1e1a410ba7ad2db7f50fadc91e50b29f1ede40cdc73f941da7ba95f"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.43.0


