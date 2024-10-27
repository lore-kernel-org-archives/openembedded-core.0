Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3600BD10C0C
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 03:09:20 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.23690.1729998552454991436
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Oct 2024 20:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EijZsHdQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729998553; x=1761534553;
  h=from:to:cc:subject:date:message-id;
  bh=NQAn+mb9fWi7jWW6UWYhI8wpdUIOwTrQ2S8RU4lU6iw=;
  b=EijZsHdQGPDA5FoBSd5tkRlhjFeaEyRfG6LUScoayl6+cViwkIa8TgGX
   ToylaR6DVexYbsY4+KgEMMG1C50Mbr7epO6v/jKokbvjgPN0XwG58021l
   SR2Du8wu6fvKc98kUA5X9s9Meppney44Zn5Z/I+T7s8fRecvSkzfZbFPn
   j5YASxo1uT8gRGauPAAjuKQL/Cg7odSz3JWp4JQFC1n9sVVQwc0z86omX
   cE7jqIV0/MfiY2VkGDSjzli9PFPMOa0rKE1HAXRp28refVumL8+5l8ZMM
   geULjhoxDIhyvhSkdv3A/+69sZhFiCLGH274NWe7sClwDYjYHW0k+ZeQE
   g==;
X-CSE-ConnectionGUID: 6t/BAX+hQdi/6+GWj0uQzQ==
X-CSE-MsgGUID: A4QGPE+DS/Go842s7qCPgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="180332665"
X-IronPort-AV: E=Sophos;i="6.11,236,1725289200"; 
   d="scan'208";a="180332665"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 12:09:10 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E95E5D647A
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 12:09:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 214A4D6A86
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 12:09:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CA4F409B6
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 12:09:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1CC371A000B;
	Sun, 27 Oct 2024 11:09:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] ptest-runner: upgrade 2.4.5 -> 2.4.5.1
Date: Sun, 27 Oct 2024 11:09:01 +0800
Message-Id: <1729998542-2255-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28756.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28756.004
X-TMASE-Result: 10-2.531700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGIqHTZr8DAG4tw+xHnsmQjMQhNjZQYyI3LRPJs/q8vyUrBh
	yv2DtHP/i8zVgXoAltuJ5hXsnxp7jjk+J12DihEQvM/mydp5vVCq2rl3dzGQ1nZYyduQUiMCK/0
	2uY7prR34MhcVUj/HaK27PeswXk7N3eiLpIn4WAF2fF3KhdFoMH1GvZLDogCdg0chubsvX5WIUr
	rMnolyBgle0oHY5RttTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 03:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206388

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{ptest-runner_2.4.5.bb => ptest-runner_2.4.5.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.5.bb => ptest-runner_2.4.5.1.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
index d28ae7ca91..e07f5d444b 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "aea9f42f87f2a78a973ae22cade8e45259f754e1"
+SRCREV = "c99e8c2737ff802f110612cc2d90c60233c33255"
 PV .= "+git"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.34.1


