Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68739C25B7A
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 02:57:00 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.19652.1716778618021907206
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 May 2024 19:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t8uAM+Mq;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716778618; x=1748314618;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X5jANrosCxpbY/XkxJ+FXqoMY9tfIQcxC79N5uPNM6E=;
  b=t8uAM+MqP4+CKKqhUHnvs65faopm77+/3Z2vxhLkDfr3uA83fgfMr0DJ
   ZMc5vjt4eMEWsDLCvAGniF+BNdOVIjvjyNukYJ2uWSAUhuu2Z7HHMg04P
   RRbyk6UiSU7JFMWMBGqf+YKEODw/gSlMzdrJacC19gntcOn968LKRC/En
   bTtGIR9OBq12hjKTtNVZvCsq3V4Qq8yYzR9UkKsc5gDGC/hCSefTQQrYp
   6tjP/Yga8V8TpJnLWp8p0nQp9sDbDj+WO3AIny9ZxRYMaT/XdHgEye4hQ
   1H1BrvMw11Z/oulE+gtCMw3tG66MZbN4ycNu6yVGr8b5z0B7L87UeKEAC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="159618198"
X-IronPort-AV: E=Sophos;i="6.08,191,1712588400"; 
   d="scan'208";a="159618198"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 11:56:55 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4EEF3CC152
	for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:56:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7ADCD39FE2
	for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:56:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E6B7420076D17
	for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:56:41 +0900 (JST)
Received: from ubuntu20.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8F17C1A000A;
	Mon, 27 May 2024 10:56:41 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core][PATCH V2] run-postinsts.service: Removed --no-reload.
Date: Mon, 27 May 2024 10:56:40 +0800
Message-Id: <20240527025640.123884-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28412.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28412.004
X-TMASE-Result: 10-1.793900-10.000000
X-TMASE-MatchedRID: lbdkQWb+CNZXY5ze6zUPKR1kSRHxj+Z5qqq9awALpxAtferJ/d7Ab8WR
	DPV7XJXnqds6ObAtEwcTUXEquFY/gFmYLz/cjWG6CKFDk1kJexJJXeUbJfbZl99RlPzeVuQQ4SZ
	E5ILlOHgILxoCYZ47qaySzdfp0Hw7FHoHF8AR4fueAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNRmMVWQN9sTh99rr2CBE1kfQVYNfW4FRrON3zw/B0PamwblPMFv97PCPfAWp013izSn2B
	hmOUYaThmFcNZDcm6XpwYl8NMwhn/4Bx1weaSflFcUQf3Yp/ridO0/GUi4gFb0fOPzpgdcEKeJ/
	HkAZ8Is=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 02:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199894

From: Lei Maohui <leimaohui@fujitsu.com>

A warning will be output when users execute systemctl in the first boot
if there are any postsints scripts in image.

"Warning: The unit file, source configuration file or drop-ins of xxx changed
on disk. Run 'systemctl daemon-reload' to reload units."

This warning is because after systemd has been upgraded to 255,
reloading units operation is needed even when "enable/disable" units by
 systemctl.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../run-postinsts/run-postinsts/run-postinsts.service           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
index b6b81d5c1a..1ce19abcaf 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
@@ -7,7 +7,7 @@ Before=sysinit.target
 [Service]
 Type=oneshot
 ExecStart=#SBINDIR#/run-postinsts
-ExecStartPost=#BASE_BINDIR#/systemctl --no-reload disable run-postinsts.service
+ExecStartPost=#BASE_BINDIR#/systemctl disable run-postinsts.service
 RemainAfterExit=yes
 TimeoutSec=0
 
-- 
2.25.1


