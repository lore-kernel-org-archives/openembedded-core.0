Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E224BC5321D
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 08:31:19 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.13804.1724142673665974497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 01:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Tf7mHRhg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724142674; x=1755678674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ruMTpzEydMs1hSSezyFOfAoSQMx//kn8JtUNseV4pOs=;
  b=Tf7mHRhgRqYSALon/AHDG1EXMXnsQ1sSGGD82h8zb6yWmWIk9TiNFn9b
   +aS7mVc7QtcBGX49gwcXvgz9XCD0sqSiFcF0AhmDDqBGMd4FmieqqDk8k
   XYL5tm0tUdGY0+GMeC1IKgTZcHHwI82GNji29yUg1NBGqRoaL7n5dh8Ii
   FcePsSBMLTHMubtz/n6acWSmihJQF3eBJyCtZVT33F7qtw9BRo828UaYg
   ssoImHJ8QzjgD/Zkn5/naeMoEBHer/eXz2IXio0z6mLQstqDSTh/ul3ZR
   GkbmDDaave4QGjwN+/CUqOf6YCLG8reQUfuGVTfRICXqy1ppDi1C7vId9
   g==;
X-CSE-ConnectionGUID: BdlTtDFTRrOnxG8V/iSCXw==
X-CSE-MsgGUID: aHfok/ZARc6byPMUaP3OgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="170314328"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="170314328"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 17:31:11 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B88FAC68EF
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 17:31:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0832513F61
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 17:31:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D53520076D16
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 17:31:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 31B5E1A0002;
	Tue, 20 Aug 2024 16:31:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] systemd: upgrade 256.4 -> 256.5
Date: Tue, 20 Aug 2024 16:30:44 +0800
Message-Id: <1724142644-20746-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724142644-20746-1-git-send-email-wangmy@fujitsu.com>
References: <1724142644-20746-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.006
X-TMASE-Result: 10--0.963600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4Bqqq9awALpxCysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74CYkAyCbA7KVws5GlXF672zo8W
	MkQWv6iUoTQl7wNH8PuTCMddcL/gjxlblqLlYqXJpafilHtbssY/Rg3m3y7+4UInP60jGh3jT/e
	xRm+lgTG/AjRoDvIv7HYaBmh6aujkmzQwdRpBlueX+QQKOG7nT71gHyebhE0b+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 08:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203552

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ystemd-boot-native_256.4.bb => systemd-boot-native_256.5.bb} | 0
 .../systemd/{systemd-boot_256.4.bb => systemd-boot_256.5.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_256.4.bb => systemd_256.5.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_256.4.bb => systemd-boot-native_256.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_256.4.bb => systemd-boot_256.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_256.4.bb => systemd_256.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.4.bb b/meta/recipes-core/systemd/systemd-boot-native_256.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_256.4.bb
rename to meta/recipes-core/systemd/systemd-boot-native_256.5.bb
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
 
diff --git a/meta/recipes-core/systemd/systemd_256.4.bb b/meta/recipes-core/systemd/systemd_256.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_256.4.bb
rename to meta/recipes-core/systemd/systemd_256.5.bb
-- 
2.34.1


