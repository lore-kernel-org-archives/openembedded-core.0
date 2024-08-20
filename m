Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE05C54731
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.12771.1724136730186083990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mfQoa0yj;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136733; x=1755672733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wx2K6fBPFsTU2nsB6PpJgMi+G3L53nbumvm1LI6h9ZA=;
  b=mfQoa0yjI3BsbT+xjcHfpHS/W7iQ3gVaCJHW/p+9wGxBoUeYsCX68+t4
   MiOcYRZAjbO23N1q6bGEuaT3q+P7Ioo97dTxq2O2r8JybT+mlxTT5qP8V
   qewrZdG94XfbYfKUVcaMEMRDXiSkQsX7Wq1nUyvK0YDC9JEcoUTUo4m+s
   PCHgaKNdzxmYcyeLTHYUe6KBsWKKdc/DzRJ+r9JDKi17Ye/EGceJYTRY6
   SYfQg499haSqA1tNQk7sGFwz2CiP9x1KsS0eKtD9hHhmvJ7dmG2NWjOU8
   7ncdIbThOI66XBiVOlTgYPxVYI62iITm+yezVbkTeHtGxbnK9hsZ1ODU0
   g==;
X-CSE-ConnectionGUID: BPjbroEQSKKf3v2nWGdGCg==
X-CSE-MsgGUID: SN2UP0FWQfmoMImRFdatpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="149964412"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="149964412"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:12 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BF3ABD424D
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 10485BF498
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AB8920086115
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 45B3C1A0002;
	Tue, 20 Aug 2024 14:52:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/24] erofs-utils: upgrade 1.7.1 -> 1.8.1
Date: Tue, 20 Aug 2024 14:51:26 +0800
Message-Id: <1724136703-20023-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.004
X-TMASE-Result: 10--3.492800-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuY5nVpihxiw7WO
	DdZ1PDmEBHGj1qouCqtJiK3ymB2wQe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7N4/cC/TXj1JcfRJq1ctTfysxn4GpC3Y2tqLmLizFKyOO5odjU3jR5QDol
	RaRe50iTqFQ5xOiev0gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLOqtukY9EniFiQ2b
	NQ1q42UDNWtbuJLKDv/SADWtNt2wBTTmTKjwbj5AG2TTyRflu4XWJR3/JElM92X4jTSfaXUW5lR
	0BaSWUKIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203527

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix unexpected data truncation of large uncompressed files;
- fix decompression errors when using libdeflate compressor;
- fix an out-of-bound memory read issue with kite-deflate.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../erofs-utils/{erofs-utils_1.7.1.bb => erofs-utils_1.8.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.7.1.bb => erofs-utils_1.8.1.bb} (94%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.1.bb
similarity index 94%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.8.1.bb
index a23cb330ea..50d6e3b38e 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.1.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "83d94dc619075e71ca4d0f42941cfc18d269a2af"
+SRCREV = "ddbed14463fb798eff71fd4d4395357eb598e175"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.34.1


