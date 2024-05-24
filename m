Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29242C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 04:20:08 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.8381.1716524406696854682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 21:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jSe4Ylzi;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716524406; x=1748060406;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P/HroGS1fzGbR8x5MGEnUb5RvTsuoW19m9jwLcxd+q8=;
  b=jSe4YlzilwM5evXZ/QOlVxnPNUCBhVNU/yvS3Cdps6gzoUHPOvdkIZ+Q
   p+EW6BS8DF1czl7Vq9OZxcAiHG3xmwW1Uf+HWxf1L3W+pPGteUvqnLyur
   FhM9aC9Wdl3Cjldluwn6y6LGziXl7VKVrEsP9Irsnv3PBCnkGY3nFA+/J
   2HV+78MleCOIH3L+DHgUF/KnbnJdqZhWpEeW6x+FCcQz7wYdSilmuG3qn
   q+2VFLHvW9qEMR1xlC/BVTDmFfnJNbGK6dOFQFggRcQnDtjqdBCjkzJB3
   WH/qsWictCOfb1Ps0O/LfYGUNPVLMCn6cV2Cjja0DDgeWDRXZJrOW5CEP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="147452108"
X-IronPort-AV: E=Sophos;i="6.08,184,1712588400"; 
   d="scan'208";a="147452108"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 13:20:04 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2421FE8521
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 13:20:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 53D73CFF81
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 13:20:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C36D36BE6B
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 13:20:00 +0900 (JST)
Received: from ubuntu20.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 402E51A000A;
	Fri, 24 May 2024 12:20:00 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core][PATCH] run-postinsts.service: Removed --no-reload to fix reload warning when  users execute systemctl in the first boot.
Date: Fri, 24 May 2024 12:19:57 +0800
Message-Id: <20240524041957.37093-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28406.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28406.005
X-TMASE-Result: 10-1.337500-10.000000
X-TMASE-MatchedRID: /2NGPvLZz+NxWhMaDPpmye9kW9mxCQvtlDt5PQMgj03rQGUex1PL9f/q
	b9sK3pliT0dK3a38v4Cd6Lv9qI8wHwH3QVwvWrgw/HTKStsDGMJHNQ8CqEKO2EfyM5VfgjG2ZLQ
	YXtpV9U7i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFC6XCaISO9i4tyoKr/Q7lkeQDK
	oJNVfbVktUcMjt0OS/ByGJN71wWiy1InoeYy9NghBut1Tuih+Gp9eh5tUl+4ky1/U+3Y/xrZsNE
	GpLafrrLM/nEDLP056e+TDiyH/49wxfkLAfkNNSaAZk0sEcY14=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 04:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199825

From: Lei Maohui <leimaohui@fujitsu.com>

This warning is because after systemd has been upgraded to 255, reloading units operation is needed even when "enable/disable" units by systemctl.

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
2.34.1


