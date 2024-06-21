Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EB2C30653
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.64030.1718936235260504963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XueZ+BZm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936239; x=1750472239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=erdqTrrtMrKQxUNiZmoIZIeOz62ZJh752pzoclQcj9A=;
  b=XueZ+BZmZ8QFnMELMAa6vfmrAxv7dYZqGUwSI9b+3BkbTg8thuavVGiB
   Zui04Qkz65iZIN5t+S5PDoiGMC0Px+jK6ACTbOIcaHzOj8qTmT0jYaCkT
   bdXM7NeokF0OYzyZ4wdIYXO3eavW5fGAOzilSz0R8vmbz2o4iPP5EeRsS
   4/BonlXba2U2InQLsxNYj80qiJLJR8BFiCWTff3tAXULdxAWCI+dFumAw
   IeFpzyWKAYvV1m7dN0lOJlAOyselRTWxR3Z4SPxFd35P5X8PzXztECM2K
   ufd2gvKsgF+27oB8FESp2FRvkXgrXiisY1+4aQafS277clEnezm0pQaRm
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="152738578"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="152738578"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:18 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6668FD6862
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A452DD7B6E
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2836A20086E86
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CE0D71A000C;
	Fri, 21 Jun 2024 10:17:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/22] libjitterentropy: upgrade 3.4.1 -> 3.5.0
Date: Fri, 21 Jun 2024 10:16:40 +0800
Message-Id: <1718936206-8080-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--0.010000-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yXg2y0j5vXZGlEDhvi2wR84H4DTIEE89jAjJ
	lierVE/nEPhqtlmGkXezARj4K/dXaMjroKRD7pZMA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYiAZLYWCvCs2ZcIP0NnMyBFrzsINdopFUmv34qCfZeB4Dvzf2yu4Kdgql2
	Lcz4U/jR0Dxc9hDIBQBhQWw3lZ+IWuyr/sGF0bIJ4CIKY/Hg3Am4n49vyf9XEvM/mydp5vVCq2r
	l3dzGQ1hHtQJ5vlWBt9LRiMzFqp2fYk34UfHsC8o4qY1uM26SuX9iR3oTOE/xAKoz74oSLLDFVL
	pcC6O3Vgj5dhUk53rFW7wxcNCNBBmW1z9vWl8eZTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200977

From: Wang Mingyu <wangmy@fujitsu.com>

Lisence-Update: Copyright year updated to 2024.

Changelog:
===========
* add distinction between intermittent and permanent health failure
* add compile time option to allow configuring a mask to reduce the size of
  the time stamp used for the APT

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libjitterentropy_3.4.1.bb => libjitterentropy_3.5.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.4.1.bb => libjitterentropy_3.5.0.bb} (89%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.5.0.bb
similarity index 89%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.5.0.bb
index 6cef8c068c..f23a122a9c 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.4.1.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.5.0.bb
@@ -5,12 +5,12 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
 LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=64a87180908540620ce364b5e69b3b03 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=18a5cada7ee95e61db4180f0cb4a69cf \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
-SRCREV = "4544e11320138ac02797af81766f4476a71bb09f"
+SRCREV = "48b2ffc128af776ff3658a70e5d7bb4a82180189"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.34.1


