Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F71BC2D0CE
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:36 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.64036.1718936249112223071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oJy+Wzu3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936250; x=1750472250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kyw0TTEgMnjsnUi3FeBgQ188EGpifa4i+NRdB0Q4s2k=;
  b=oJy+Wzu317QuKh2MhUuxS8T0FLUUrsTw9TI7eqZDU0D8hJNGPi+tKimQ
   Ep356IXsgXz9pee7MDvLJrlHtaBiHXXkwRq+fpxsmsXFOiaSmYmTeHnmC
   K4QyHHCwxATwOI7W+0M9HNYr7gXyxypGqQmK52hx3SMHbKKvxKdiEg3eK
   Ms7nG564R1MD15/fGTpAuwpPI3NRbKlWlLC+I8xwPBj4oMDU0y4T/7MJH
   /Du/VRVaxQQKC4bp6ttgXI2Q6FN5MsHcqfTX/d7Ftaw/5FtCqVPfu5cJm
   VLCUbmtMcl4SxMoiEv1XJBT7TmEvkKICD6ADrQ8Mv0ORNxKwyISXVc2S9
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="164461631"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="164461631"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:14 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F0F3E8D3C
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AAB3BD73C9
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A640E5185
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 38EFF1A0002;
	Fri, 21 Jun 2024 10:17:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/22] diffoscope: upgrade 267 -> 271
Date: Fri, 21 Jun 2024 10:16:30 +0800
Message-Id: <1718936206-8080-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--5.267000-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrxqwmEOBVKeq3CLdtdG1oCKB8
	tGwEqygaRECgjUxM4TB1VEmx7sTk/+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ6Po
	oNqqZn93i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSkj80Za3RRg8PRKHneouooiC8KPuy+Ml3X/id
	VtOTBKfid5groQgWMSHB0hb3N1Qt8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200986

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Drop Build-Depends on liblz4-tool. Thanks, Chris Peterson.
* Update tests to support zipdetails version 4.004 shipped with Perl 5.40.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_267.bb => diffoscope_271.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_267.bb => diffoscope_271.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_267.bb b/meta/recipes-support/diffoscope/diffoscope_271.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_267.bb
rename to meta/recipes-support/diffoscope/diffoscope_271.bb
index 69bad508cd..a8443183ec 100644
--- a/meta/recipes-support/diffoscope/diffoscope_267.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_271.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c0a807aa66e18eae88c1adca28988675c9749d3ad1a8db3d2eb7e2afb8763568"
+SRC_URI[sha256sum] = "7690f284a84a866c6f89fa5bb33a867574417ee1c5f2c6d49655cd3761d0fe2c"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.34.1


