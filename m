Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA143CF58C1
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.9326.1727246990413115226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JU+3IHCK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246994; x=1758782994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=L7jgI95iaiF+669WdYd82YreepUW+okZU7C3OZDd5Q8=;
  b=JU+3IHCKysiwy3A1/KoTto+oqfqFIt35pK5O2kJVASLeh53Ti0E0/Fit
   Vgg60ERsp1otPHlxWUKrx/vrirzg0Rf3TXrbRwrIJ18TKZCw4E1fNvpNa
   7o0kMX2TbUIDDd2DwZKWnimEw6REI5rdtEWBldFuaDnQz1HlYrliMXwV6
   BZk12VjVL0/YheKCjxs7hsn/Ka+n3Nl6/nm3tQRKzQ5l6Gm+ARfWJ2EiK
   NiJFLJdjn39PlmRj6q969D6LiReiJwDbJqlPLSXbjQZqL0piPB2uTWKUW
   NRf8tBSTGoveZsDEi5kvZnmsKJTLD5cuZHabc8VX/F2Jml6aWHApT7O7/
   w==;
X-CSE-ConnectionGUID: B99Wg1zTSpCcf4bdfrda+w==
X-CSE-MsgGUID: uCqEabJ9QmGOkid02FtoDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="154170432"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="154170432"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:53 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DC88C8B45
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 81797D5BA5
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 12A006B5C3
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B7A8D1A01E9;
	Wed, 25 Sep 2024 14:49:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 44/47] systemd: upgrade 256.5 -> 256.6
Date: Wed, 25 Sep 2024 14:49:17 +0800
Message-Id: <1727246960-20665-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--0.963600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4Bqqq9awALpxCysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74CYkAyCbA7KVws5GlXF672zo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtoNNMK/AH8lvNmXIy0wD6vKCqz9bWdNeIUB3mDnWRK2jw9o
	FUtTapVng5tb/wopzAqNrvwTpKx7CYxVdjuGro2hu5odjKlQ72HSbhGbmGylXFJK7yLnZRGZdO3
	Q67ImL8gi4RUz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204937

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../systemd/{systemd-boot_256.5.bb => systemd-boot_256.6.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_256.5.bb => systemd_256.6.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_256.5.bb => systemd-boot_256.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_256.5.bb => systemd_256.6.bb} (100%)

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


