Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD250C5320E
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:28 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.12776.1724136741991066597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G5Ttrid9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136743; x=1755672743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=M9zkdzaCIiwAy8LBP5yv0wSjJphAE253sSh3/rB2s/I=;
  b=G5Ttrid9Y0iZnAj8sYScmJOsFadwEDnWTNwg9qtCZIB7iyDO0BTdBhDa
   RDYIsjzAOyw3QEM/PwTH9sh4EKrjXjNA231RkP16cEcgMcqu/AjHDtCYu
   gAXMp0nh3KsAsm18Ddyn1ertfrKBAXTR43zvzPcecfBMCbKak01jAiBYx
   WccSbwfaXQRO3XGhtQDM//4ZBle66w30OgdddcnNyTf/Cw1URXiRUGNvP
   NlHpnPXxiWfXKydVu0IvH/MwVQiNzM1g8vHUb0VmGIflXZ5Cy4QEK0snO
   7gm1Stls7IlvEA6uHRxD58tqsRVVAzBij9xwrcpuelZts8FkYEL3Phe6t
   Q==;
X-CSE-ConnectionGUID: Bkfe4IA3Q+CfPtk/vqzRlQ==
X-CSE-MsgGUID: 5pjiFh6gRySm3Nr18sifWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="173068851"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="173068851"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:20 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55090E8521
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E1F6D50BB
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 33C4C216766
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D248F1A0002;
	Tue, 20 Aug 2024 14:52:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/24] systemd-boot: upgrade 256.4 -> 256.5
Date: Tue, 20 Aug 2024 14:51:41 +0800
Message-Id: <1724136703-20023-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.005
X-TMASE-Result: 10--0.963600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4Bqqq9awALpxCysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74CYkAyCbA7KVws5GlXF672zo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLFz1z0T3B7ry+q7samehgjnWlCMA1htCe1fH
	dFFOL2dFueh54OV1hxv//ALPg6Dv6xefTIetSdvJYvIdGxEAQT4xqTw+ZSDh7+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203543

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../systemd/{systemd-boot_256.4.bb => systemd-boot_256.5.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_256.4.bb => systemd-boot_256.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_256.4.bb b/meta/recipes-core/systemd/systemd-boot_256.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_256.4.bb
rename to meta/recipes-core/systemd/systemd-boot_256.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 63f024baa9..83dcd65a83 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "566210c272820ca6655800ce0d27b6ebc0aedc4c"
+SRCREV = "b45730389ba025489ec8d445bc91534fef515c28"
 SRCBRANCH = "v256-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
-- 
2.34.1


