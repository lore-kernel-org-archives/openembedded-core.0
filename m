Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86740E77181
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.116742.1733788632681701727
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HMOXBuAF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788632; x=1765324632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1NCbA6+pd/BC4GJOiYlGUzretk0jU0B3JRN1iKMNyPI=;
  b=HMOXBuAFK74mtSrUMn79AJ5SluRK9lIUZN9XD1mIO96d6Jmx6OrFSO6m
   FmuAET9f8tZ1EbmNk9qwScLulAD81Fj4/bcJj0P/9hcPV5hDeKbP+YVn5
   36uc88YzvjtrN66jFXm1Rgv504ts2b3qmtk5A8r2q6Hy6lYrbi/3j8F7a
   +j+gSDPKVKXzadUm6mBeS737/rdzyoYND/HTGaEck1yFrk17srN7im/RW
   UUzv4xLkq6ge7gS5/WusR4glKB0c2YFnHHlFNJLJPtzeL31jmh7MQQWFC
   rjZ7kljm+Dka1BR4NF31ViY0poCb/OGoLf/aPUxpSbV+YF7q5a/y5jUNO
   A==;
X-CSE-ConnectionGUID: lDM261fLR0CWoKrZl8NZig==
X-CSE-MsgGUID: wxpGkFY1SC+t/SdmnKHT3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="183357533"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="183357533"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:10 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 67846D500C
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F3A0CFBC0
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CF79FE8DB
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:07 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 765B91A000B;
	Tue, 10 Dec 2024 07:57:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 18/20] systemd-boot: upgrade 256.8 -> 256.9
Date: Tue, 10 Dec 2024 07:56:50 +0800
Message-Id: <1733788612-20933-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10--0.963600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4Bqqq9awALpxCysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74CYkAyCbA7KVws5GlXF672zo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtTjnZfCQLdouldVFmquF0+ls4LZ+nwgRWsRXkOkqZhbhTH0
	Fzqb2bnG/OiEg7emW6ixoJQStaCJE7vPZSN9pt8M4KCa8Ywn4jHSbhGbmGylXFJK7yLnZRGZdO3
	Q67ImL8gi4RUz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208513

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ystemd-boot-native_256.8.bb => systemd-boot-native_256.9.bb} | 0
 .../systemd/{systemd-boot_256.8.bb => systemd-boot_256.9.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_256.8.bb => systemd-boot-native_256.9.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_256.8.bb => systemd-boot_256.9.bb} (100%)

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
 
-- 
2.34.1


