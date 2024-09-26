Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1A5CCFA0A
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 00:21:02 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.31668.1727310059142385093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 17:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XMGgxc99;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727310059; x=1758846059;
  h=from:to:cc:subject:date:message-id;
  bh=ZcZBXdvcKkkUw3QrEnFV2B9BW5vXiQnztEw1asHntGs=;
  b=XMGgxc99cYT07Xi1JxjBrwzXzJip3sYPFQNi+u6EHJPd2zjoO/aHUx5p
   pDOyjjNGvZCxiibO/AHEXvGOR44ftibcwF6wPQR1TuxI/R3gVoPaML9mo
   WPcgfazCD/A4YuPAoTGAhi1m/+EgPU++g+XjjW1RRqZf254QM1MHy2ah/
   5UoUfpUloOq+PioP71O/tnU5L0QpRe0DY+p5H6aRohkSRvdckHyK2fQ59
   v8XDuW1rGq1o/yK78L/s9mMo07oDJ6COeYTrslfrdGW4ucftfHBHyJg3W
   og6jfI43cm3Ykyz2IHXvyZtYlin/UkcCw6fl3uQqRcWTsvgLHxG7dJ2ds
   w==;
X-CSE-ConnectionGUID: nn3tL0CzSDql+r35R+RE/w==
X-CSE-MsgGUID: Tl1RkrYXQPy/CpvyferqHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="174844629"
X-IronPort-AV: E=Sophos;i="6.10,258,1719846000"; 
   d="scan'208";a="174844629"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 09:20:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 665C3C68EA
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 09:20:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A0819D5095
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 09:20:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 15B6C2007AA92
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 09:20:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 93D941A000A;
	Thu, 26 Sep 2024 08:20:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH v2] systemd: upgrade 256.5 -> 256.6
Date: Thu, 26 Sep 2024 08:20:47 +0800
Message-Id: <1727310047-26871-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28688.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28688.003
X-TMASE-Result: 10--0.963600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4Bqqq9awALpxCysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74CYkAyCbA7KVws5GlXF672zo8W
	MkQWv6iUoTQl7wNH8PuTCMddcL/gjxlblqLlYqXJpafilHtbssY/Rg3m3y7+4UInP60jGh3jT/e
	xRm+lgTEJPpxvi3U2sSSVH3gFc1T80/M34nCVpgJ2uOgbrzuiKHjvYKUl77tb+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 00:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204966

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ystemd-boot-native_256.5.bb => systemd-boot-native_256.6.bb} | 0
 .../systemd/{systemd-boot_256.5.bb => systemd-boot_256.6.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_256.5.bb => systemd_256.6.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_256.5.bb => systemd-boot-native_256.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_256.5.bb => systemd-boot_256.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_256.5.bb => systemd_256.6.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.5.bb b/meta/recipes-core/systemd/systemd-boot-native_256.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_256.5.bb
rename to meta/recipes-core/systemd/systemd-boot-native_256.6.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_256.5.bb b/meta/recipes-core/systemd/systemd-boot_256.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_256.5.bb
rename to meta/recipes-core/systemd/systemd-boot_256.6.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 83dcd65a83..d6a3332efe 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "b45730389ba025489ec8d445bc91534fef515c28"
+SRCREV = "230f5613c97175985f878580ef2f5f1937963da6"
 SRCBRANCH = "v256-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core/systemd/systemd_256.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_256.5.bb
rename to meta/recipes-core/systemd/systemd_256.6.bb
-- 
2.34.1


