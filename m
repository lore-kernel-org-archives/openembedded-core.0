Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A4DC83F29
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:55:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8804.1693450539541846764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="109550768"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="109550768"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:55:36 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 079D0DE57E
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:55:35 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 389AD28712
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:55:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A75E86C8D;
	Thu, 31 Aug 2023 11:55:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] zlib: upgrade 1.2.13 -> 1.3
Date: Thu, 31 Aug 2023 10:55:07 +0800
Message-Id: <1693450507-28715-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10-3.830500-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/T+1Zj+w66+nw6
	H06bMgiv9TMC7kXRtfdYvEbC5R0PJT3b9SMZbm850jkOdkwgJjCfmd9HsjZ0U44QQ2CxQC5iOXB
	2cqV0mCJofowBadiqrksUw05wJJKkDXVj0zMhpTbWX4GMszyWyqn/3nyhTdZwmOZ1aYocYsN79x
	CSa3QbsePbnNqqMN0Tc31wN89Z7gZaQiLka9EcSj9B1SHosSXQwTlc9CcHMZerwqxtE531VKMLo
	6XddXOYZRUjkVFROF5BvNjTrFVUpJlp1iR8bRTgCtzGvPCy/m5uj2qdTD3bR9WRpq/imUBbnptr
	8PnHpyni8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZIIJJXJpFsfWXZLH3wa14qJFr35Qy880jAaas3
	ddkk9RQwbvQZIj4mr1aHabkJ1pRSYagxnxWfbCteq5xZBwIqkxp3nekiyALRLv5Eyr/YIrqsDhz
	tRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186960

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Remove K&R function definitions and zlib2ansi
- Fix bug in deflateBound() for level 0 and memLevel 9
- Fix bug when gzungetc() is used immediately after gzopen()
- Fix bug when using gzflush() with a very small buffer
- Fix crash when gzsetparams() attempted for transparent write
- Fix test/example.c to work with FORCE_STORED
- Rewrite of zran in examples (see zran.c version history)
- Fix minizip to allow it to open an empty zip file
- Fix reading disk number start on zip64 files in minizip
- Fix logic error in minizip argument processing
- Add minizip testing to Makefile
- Read multiple bytes instead of byte-by-byte in minizip unzip.c
- Add memory sanitizer to configure (--memory)
- Various portability improvements
- Various documentation improvements
- Various spelling and typo corrections

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/zlib/{zlib_1.2.13.bb => zlib_1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/zlib/{zlib_1.2.13.bb => zlib_1.3.bb} (93%)

diff --git a/meta/recipes-core/zlib/zlib_1.2.13.bb b/meta/recipes-core/zlib/zlib_1.3.bb
similarity index 93%
rename from meta/recipes-core/zlib/zlib_1.2.13.bb
rename to meta/recipes-core/zlib/zlib_1.3.bb
index ec977a3035..c8fd855ee6 100644
--- a/meta/recipes-core/zlib/zlib_1.2.13.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://zlib.net/${BP}.tar.gz \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-SRC_URI[sha256sum] = "b3a24de97a8fdbc835b9833169501030b8977031bcb54b3b3ac13740f846ab30"
+SRC_URI[sha256sum] = "ff0ba4c292013dbc27530b3a81e1f9a813cd39de01ca5e0f8bf355702efa593e"
 
 # When a new release is made the previous release is moved to fossils/, so add this
 # to PREMIRRORS so it is also searched automatically.
-- 
2.34.1


