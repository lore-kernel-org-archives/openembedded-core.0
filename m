Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3E3C54E7A
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.10796.1710313762319808399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gSrCSmap;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313763; x=1741849763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ysMzY9U5NQMzqauM0+nwMi7PdlPLaZPkMQ57UupJ7sY=;
  b=gSrCSmapj9eGtLmZX8mXPKNcpcDanDTF26XMY3AGxtmtu8ecwshKmjh+
   1NLsWpnNMF72n1COinlUsjHLRk6zK31EfxNc4xz/TDkvTWjNkQPhYVjUC
   OGIZOoPZkfE/9nAHXUSQCqc/dIx5Xkryud2HKtWOjepXi1cfFuHYhRkVN
   Ouk7jhwp3C7uvNY/BKqHCidCNSt0qHJtr+3k4WMAG8JyMJTF6zNcaW7+T
   UjgpdiZMvm+4D6p4/ufPE3BZAiUSyvkFCTbBU4+8savQe334h3os7QnRp
   enuFT/YtL3fipulQ1C2fx5PJGoeJW/XFpRA9xq0Ncs4i9UcAwCZsmsHlq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="153950939"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="153950939"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:20 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DB69ED9F01
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CBB1D3F38
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A819920097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 547E61A006B;
	Wed, 13 Mar 2024 15:09:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/36] libxdmcp: upgrade 1.1.4 -> 1.1.5
Date: Wed, 13 Mar 2024 15:08:12 +0800
Message-Id: <1710313714-12541-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 11-10.681800-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxj0V6RBuY3QSMO
	uGtF4L1EsaBg3jah7Po4bJd2G5kbyYIG4e8VKsyiLTHwnYOikQ1b4dXBMpIkhtP7VmP7Drr6HyY
	NpJEIQO+Q8jX9l2qhLUECImil5O/Q7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5AE59
	pk4kcc5bF9uGobEuT7gDLqnrRlXrbIDt27MLDp0hCwrhEsbpDF+gtHj7OwNO0NstCXmf87HPW2j
	ARST+2vQesRZzV/kINl2dTALd7QT3GsqWGQro+vYVHqjWOFQlbnTgpg2ckvdH3aLHt1d6wgu83z
	WB9Gcm2uO03veaGZ3fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197016

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-gitlab CI: add xz-utils to container for "make distcheck"
-XdmcpWriteHeader: use calloc instead of malloc to alloc buffer
-XdmcpWriteHeader: drop unnecessary cast of free() argument
-Clear -Wunused-macros warnings when arc4random_buf() is available
-Xdmcp.h: add access attributes to function prototypes
-configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
-Remove "All rights reserved" from Oracle copyright notices

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxdmcp_1.1.4.bb => libxdmcp_1.1.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxdmcp_1.1.4.bb => libxdmcp_1.1.5.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb
rename to meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb
index bf5d2d6721..d1a1a2e7f9 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb
@@ -22,7 +22,7 @@ XORG_PN = "libXdmcp"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "2dce5cc317f8f0b484ec347d87d81d552cdbebb178bd13c5d8193b6b7cd6ad00"
+SRC_URI[sha256sum] = "d8a5222828c3adab70adf69a5583f1d32eb5ece04304f7f8392b6a353aa2228c"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[arc4] = "ac_cv_lib_bsd_arc4random_buf=yes,ac_cv_lib_bsd_arc4random_buf=no,libbsd"
-- 
2.34.1


