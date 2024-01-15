Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA25C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 08:56:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.73816.1705308986273508692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 00:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="146004404"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="146004404"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 17:56:24 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AB0D4D7AE5
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:56:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DEEDAD4BC0
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:56:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6697F202D32A8
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:56:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EDD5D1A0162;
	Mon, 15 Jan 2024 16:56:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mpg123: upgrade 1.32.3 -> 1.32.4
Date: Mon, 15 Jan 2024 16:56:08 +0800
Message-Id: <1705308968-23689-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10-2.304500-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrX93p52Kh3th5eyhu4TpIq4oW
	lS5cw47VfBsxym6qrxzU0dvNBvLe++1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4rhX/lUQGcew7GX0c1Ulalwwo+sXt0rnsxzSjqs2IoGK1bSmSk9HUNoO6G
	HHxhgZD1slxAfd+6tXeTjw/FyRX6QfE8yM4pjsD7q9UFRTJ0kKxEHRux+uk8hxKpvEGAbTDs3FR
	aQYrbCNXDBw+Qr9QwMIutxRI0q2PEreaD4w8yRQahzAholKzUVOoOwxxm+g6qN+PkYwrsARiyjw
	B/ZS0H9eYvY3HomMO4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 08:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193638

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- build:
-- Reorganize shared headers, API headers into src/include.
-- Use relative include paths, avoiding internal directories in
   CPPFLAGS except for config.h.
-- Group C99 feature checks and make several standard headers
   mandatory.
-- Get rid of SIZE_P, OFF_P and friends.
-- Only enforce dummy module together with libout123, to be able
   to build individual modules using --disable-components logic.
- out123:
-- added --libversion
- libmpg123:
-- Avoid indirect branches into the assembly routines by using C wrappers
   also for dct36, relieving us of the need to care for bti / endbr
   instructions for control flow integrity.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mpg123/{mpg123_1.32.3.bb => mpg123_1.32.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.3.bb => mpg123_1.32.4.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.4.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.4.bb
index 3ea68b12a8..8c6101fee8 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.4.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "2d9913a57d4ee8f497a182c6e82582602409782a4fb481e989feebf4435867b4"
+SRC_URI[sha256sum] = "5a99664338fb2f751b662f40ee25804d0c9db6b575dcb5ce741c6dc64224a08a"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


