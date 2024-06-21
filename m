Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8379C2D0D1
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.64030.1718936235260504963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SA6aVa22;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936241; x=1750472241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=paj4bScwH4GQ3xGLtTwmglUamcH2IFezFUsjhh1BZk4=;
  b=SA6aVa22nhZNcrxAY8l7mZgXQFy7dgsKEnxCHU0szxFEOvJikunRIN+L
   MkFBlV0Kw9F0RLjCoUd4+HKSFwexaHKOqXxTALPVwj0ZgAAMD5siXRseD
   9sdapl3eL2U23OEYroG1peTqW0b+45HhnPpnm9T4IWHMh5beo/5Kjr/G3
   3qj/V93AknxwSjmyawS7IJ/ulMULycAtwrHBiIK2aIcJUIb3BnOIemUKS
   q+1e2Fhw1SQohcEoXsZZKBl5jcjfFE2N8W8i8GT+oT1j34bnx6FrSx4PE
   4nMWdd+YmqnJbWCeqwmab6BtV/9RxOBX2owXbSJEQwVAMg0Buf+gynaMo
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="152738585"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="152738585"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DABACA1E6
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FF22D7298
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 01EB520086E86
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A31951A0002;
	Fri, 21 Jun 2024 10:17:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/22] rng-tools: upgrade 6.16 -> 6.17
Date: Fri, 21 Jun 2024 10:16:45 +0800
Message-Id: <1718936206-8080-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10-1.340100-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrEAImHgFYA95gPgeggVwCFqQt
	HlwwSfPRMNT2HEOPMEvEF4IcVRQj+jp6jKUd1ROda87CDXaKRVJ4ZOyb2NAqLA8f7az6nRQNE3w
	8XCDtk5vgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3Tnjsp5O052MzLqLlQ
	g89oDHCuLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUW2ZEqEEMnlqBTee+sjV3W8vZv
	iBC/mZCX26Gn8j6KL7FVo3I4Vt9ruGfxTAw9sc/O+j/AGY6bhakETblNBT0Eu+Gb9+N1C8w7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200981

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- mix data fed to the kernel byte-wise from multiple sources
- added option to attempt more persistent use of slow entropy sources
- fix some missing m4 quotes
- improved debug output to show FIPS failures more clearly
- added a named pipe entropy source
- adjusted linux poolsize
- fixed some pkcs11 error messages
- fixed ignorefail and random_step options

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rng-tools/{rng-tools_6.16.bb => rng-tools_6.17.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/rng-tools/{rng-tools_6.16.bb => rng-tools_6.17.bb} (98%)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.17.bb
similarity index 98%
rename from meta/recipes-support/rng-tools/rng-tools_6.16.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.17.bb
index ed755ae705..fc141a984c 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.17.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            file://default \
            file://rng-tools.service \
            "
-SRCREV = "e061c313b95890eb5fa0ada0cd6eec619dafdfe2"
+SRCREV = "bd00c08b0c3c6a880b0988befe97fd35b315468c"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


