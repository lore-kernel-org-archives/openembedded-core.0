Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A753D59D9B
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.35685.1732584621365787755
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P5g9B/OZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584625; x=1764120625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zjdn1IXpgy1kUfRfmyH+VFijp3POFz/B/zgZsBMzpIA=;
  b=P5g9B/OZVxoJUGxZbwU7RC9ixOnjtgFMhBp2f6CY2/Wb+oaZy8XPXZiT
   A7olE8cewM7CvMhT/8AIDwiyWr59lFTLUzRjxlAmWyVzBn9yDkVq4mUK+
   CcKrK56/+dcm4/aBYchFMEJkSapUttREeNzjCpefGDteIto6LOilpnUW1
   vBgFljcwAkEBCL+fPoIPXh7M/Bj00AxhwFheqgXc4UQYjcTLHl91SeY5K
   2rV3je88nOynWhh6FCkRmmRl97JSuZO2446xNwAO5BoIdsNlGRCVaxVYz
   70zBF9rQ2PPtQUc6iwQkDmEFcQtFjc1a/g8kI9pRD1tYloHab/RgbqWnR
   Q==;
X-CSE-ConnectionGUID: r5gwASEeQ4mD3DiW0klgqg==
X-CSE-MsgGUID: YCcHxnxNT/K6e4MwCcDInw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="181671592"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="181671592"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:24 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E33EBD6EA1
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 765112201F
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1079F2007B73D
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B3DDE1A006C;
	Tue, 26 Nov 2024 09:30:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/16] systemd: upgrade 256.7 -> 256.8
Date: Tue, 26 Nov 2024 09:30:01 +0800
Message-Id: <1732584602-4785-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.003
X-TMASE-Result: 10--0.963600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4Bqqq9awALpxCysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74CYkAyCbA7KVws5GlXF672zo8W
	MkQWv6iUoTQl7wNH8PuTCMddcL/gjxlblqLlYqXJtlc/qhEQY1nTGE1uYdoj7WsSqtHyujfy65h
	cBul05r0A0WEXuGjOuG2pya+dEWdyDJr6HN+nF/jmzCbwsvlvCOD6brwj/az/+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207822

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ystemd-boot-native_256.7.bb => systemd-boot-native_256.8.bb} | 0
 .../systemd/{systemd-boot_256.7.bb => systemd-boot_256.8.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_256.7.bb => systemd_256.8.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_256.7.bb => systemd-boot-native_256.8.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_256.7.bb => systemd-boot_256.8.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_256.7.bb => systemd_256.8.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.7.bb b/meta/recipes-core/systemd/systemd-boot-native_256.8.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_256.7.bb
rename to meta/recipes-core/systemd/systemd-boot-native_256.8.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_256.7.bb b/meta/recipes-core/systemd/systemd-boot_256.8.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_256.7.bb
rename to meta/recipes-core/systemd/systemd-boot_256.8.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 87bf9b78c0..989ca667b7 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "7635d01869ba325b9cf450923c8f13912b7ca536"
+SRCREV = "a2240d1cf9f3515728186c2c98a6f4b64a40e4da"
 SRCBRANCH = "v256-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_256.7.bb b/meta/recipes-core/systemd/systemd_256.8.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_256.7.bb
rename to meta/recipes-core/systemd/systemd_256.8.bb
-- 
2.34.1


