Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189E5D11707
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:05 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.5580.1729834801253357882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Nnx3QLb3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834803; x=1761370803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rVjrqsXQzF3lRX928fmlSUOOAux6CcgQsZqcmkBs4q0=;
  b=Nnx3QLb3fF0NmEni9rWPFQiKr14An6cjxgBCiHcQF4+t1vVOc720lD77
   igOCFNPpwM5SF3aTFeoMvgsbhvns8OTlb9AMybWXDd/5Wm3qhAchdteCl
   uvIFnB8q92MD/+1FLQn5AsHqfGuh/RUk+9JY3ePA5g0r3XTXSoZGzp4UM
   Vt2eQhvNYB1Yzl2qR9pCk4c53JLzx/JgMiYQ5jgRDL7gY1dzOGCPcKGY7
   q8wz5Rt6XfaEAY1F2HCJxGJ6MkJ5YKJLulr2g7aJjiwxaQIlVVvMKlMH1
   e2FmRx+pGqWXqlD3+vRtbNoK69N5sXsYsWB988oW0sYHsA2zFCDxk+ZE1
   Q==;
X-CSE-ConnectionGUID: /inIgjI1QN+3ttdQNzezhA==
X-CSE-MsgGUID: yNOChKNwQEeefvyZ/7xjDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="178015453"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="178015453"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:40:00 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C1E5DB3C1
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F29DD3F19
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D16920071A0D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BEC6C1A01E9;
	Fri, 25 Oct 2024 13:39:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/22] systemd: upgrade 256.6 -> 256.7
Date: Fri, 25 Oct 2024 13:39:28 +0800
Message-Id: <1729834769-4717-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10--0.963600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4Bqqq9awALpxCysPB8dBBorQec
	3JTmkn8uJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74CYkAyCbA7KVws5GlXF672zo8W
	MkQWv6iUoTQl7wNH8PuTCMddcL/gjxlblqLlYqXJpafilHtbssY/Rg3m3y7+4UInP60jGh3jT/e
	xRm+lgTBAGewnbkrqU4f3i/VfQKkYW3tpftG6U/dc+9OuKxxH96aUddugupbv+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206333

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ystemd-boot-native_256.6.bb => systemd-boot-native_256.7.bb} | 0
 .../systemd/{systemd-boot_256.6.bb => systemd-boot_256.7.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_256.6.bb => systemd_256.7.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_256.6.bb => systemd-boot-native_256.7.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_256.6.bb => systemd-boot_256.7.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_256.6.bb => systemd_256.7.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.6.bb b/meta/recipes-core/systemd/systemd-boot-native_256.7.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_256.6.bb
rename to meta/recipes-core/systemd/systemd-boot-native_256.7.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_256.6.bb b/meta/recipes-core/systemd/systemd-boot_256.7.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_256.6.bb
rename to meta/recipes-core/systemd/systemd-boot_256.7.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index d6a3332efe..87bf9b78c0 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "230f5613c97175985f878580ef2f5f1937963da6"
+SRCREV = "7635d01869ba325b9cf450923c8f13912b7ca536"
 SRCBRANCH = "v256-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_256.6.bb b/meta/recipes-core/systemd/systemd_256.7.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_256.6.bb
rename to meta/recipes-core/systemd/systemd_256.7.bb
-- 
2.34.1


