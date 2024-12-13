Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57958E77180
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 00:15:39 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.5427.1734048933827062976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 16:15:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MVo8Dt5+;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734048933; x=1765584933;
  h=from:to:cc:subject:date:message-id;
  bh=xIiq5S0IOxUyUPoYUZKW9+Q8TnFco7vzbJjXDXbQ3UI=;
  b=MVo8Dt5+zEHGmfHJZZQh0WsQrS0qXxfmrps8fX1UKqbc+gJvM62KypQd
   XAUlx9AryseegVNu2gtv6U+DG5VpaPesaKm4dfIQEOh+/CVxTm23gi2Yh
   JKodS/y6iRtetxQ23eiwsP1piL0Yr9Oo7b0dcZKtN7ylTKrWcOtet1xWx
   k87hJTZYcPq2BusoT3X7FCKrk5nxCBjEEDrvB3Mi+yNNa4M3ghGUWidBW
   PjBSz2hAmrmZN012r1j+tW9VDNyGsmp3GRE34UsxoRhBCNGSH7v/TInPX
   R6QkW/qmFoncx1qyt4vyPfSA1lCDZk9kR1Ud5KerluRacRBHK1FStdAeZ
   A==;
X-CSE-ConnectionGUID: vbxseLbUQnGlXS3p0SW0tw==
X-CSE-MsgGUID: oUwFIuzSR06iyUc3fuf4QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="171528191"
X-IronPort-AV: E=Sophos;i="6.12,230,1728918000"; 
   d="scan'208";a="171528191"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 09:15:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A9D1D4F55
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 09:15:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3ACEBD975E
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 09:15:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C06612007C3F5
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 09:15:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 45AAC1A000B;
	Fri, 13 Dec 2024 08:15:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH v3] systemd: upgrade 256.8 -> 256.9
Date: Fri, 13 Dec 2024 08:15:20 +0800
Message-Id: <1734048920-13943-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28856.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28856.003
X-TMASE-Result: 10--0.963600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4Bqqq9awALpxCysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74CYkAyCbA7KVws5GlXF672zo8W
	MkQWv6iUoTQl7wNH8PuTCMddcL/gjxlblqLlYqXLxnIQJpL9dIUTHqFo8MondbBPRudEoaFnyPd
	/RmYRrN1WeFPh4KfFahEEpjgeDb4U1glm0P0IWJSRmoG0yJC/mz8+8Dup9c47+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 00:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208668

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ystemd-boot-native_256.8.bb => systemd-boot-native_256.9.bb} | 0
 .../systemd/{systemd-boot_256.8.bb => systemd-boot_256.9.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_256.8.bb => systemd_256.9.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_256.8.bb => systemd-boot-native_256.9.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_256.8.bb => systemd-boot_256.9.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_256.8.bb => systemd_256.9.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.8.bb b/meta/recipes-core/systemd/systemd-boot-native_256.9.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_256.8.bb
rename to meta/recipes-core/systemd/systemd-boot-native_256.9.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_256.8.bb b/meta/recipes-core/systemd/systemd-boot_256.9.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_256.8.bb
rename to meta/recipes-core/systemd/systemd-boot_256.9.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 989ca667b7..b85d5b187d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "a2240d1cf9f3515728186c2c98a6f4b64a40e4da"
+SRCREV = "f15fd96efd5ebdfb18746acb0cbb35a4331b4d8b"
 SRCBRANCH = "v256-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_256.8.bb b/meta/recipes-core/systemd/systemd_256.9.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_256.8.bb
rename to meta/recipes-core/systemd/systemd_256.9.bb
-- 
2.43.0


