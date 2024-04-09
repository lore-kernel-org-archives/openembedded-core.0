Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39725CD129E
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.130850.1712646642177723217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lfnTrHNB;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646642; x=1744182642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=az7Rm6in+0bTmQ5O+DJPrND/K3CiPJTH9j/LLvCHeBQ=;
  b=lfnTrHNBl6Tv1IINcm2wSwfY0x0dey+rPm84u24Nra9hU25jQYJsrFad
   a3PXCjvJZ4FsHeZHzKA6xmHIOJgLNAonkQ/Hhdvh1zuOwTVxZxXFdLdaZ
   PpZWK3Xtb1RESPRMxVALkx0vhySnjF66N2RBTRXx/RgztYJlSkPxBuCuA
   MAtb/MZdsTj5JL1Ce9eR7Jl0appTEofgQA1NGoW5fOLoq4Ujl5Kdnhov2
   +WFTNGbv3S9sKYRq4wY8E6iTahSpfSmabgfYyp3zGk4uuiIY+DSjSaYwM
   z2Bk0A4UQpuCNRHpE8Dc7xjU9FH0y4TrfrT8PR5O0+dTXiLIS3/SfwhPb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="134320623"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="134320623"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EC267101DEB
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B77A30D85
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B49081EA82C
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 632881A0002;
	Tue,  9 Apr 2024 15:10:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/33] enchant2: upgrade 2.6.8 -> 2.6.9
Date: Tue,  9 Apr 2024 15:09:55 +0800
Message-Id: <1712646620-16608-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10--4.819500-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrBpEC0DNwn/qU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN6nHbeBu5LnkCtGYG0znilMZICH6pwLFJMXK
	r8K8YxN+xfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzWEf4VLbztIcSTD
	PHkSUs1BWiD7r1yEm1gLAEe+v05XxUrFP2Tcb+0hYeHrtpGLpXmaJHReZujZJuldme8jLwOpG88
	m5ZNSasiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198027

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Implement user dictionary support for Hspell, Nuspell, Voikko

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.6.8.bb => enchant2_2.6.9.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.6.8.bb => enchant2_2.6.9.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.8.bb b/meta/recipes-support/enchant/enchant2_2.6.9.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.6.8.bb
rename to meta/recipes-support/enchant/enchant2_2.6.9.bb
index e2bbe2eabf..aaf3525ad8 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.8.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.9.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f565923062c77f3d58846f0558d21e6d07ca4a488c58812dfdefb35202fac7ae"
+SRC_URI[sha256sum] = "d9a5a10dc9b38a43b3a0fa22c76ed6ebb7e09eb535aff62954afcdbd40efff6b"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.34.1


