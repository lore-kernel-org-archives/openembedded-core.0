Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F985C54E4A
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:20 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8387.1709105594034947332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WJ9fLZRJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105594; x=1740641594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+Xw43RjRR36cHWO5/QU5r/0hvfgVoNih7bm3fHkJjfQ=;
  b=WJ9fLZRJQFFeQ1QWKDU0ulmhfJoZa7PC2fq7k/J6Sdr9yRoceyb08XXr
   xhEQ549fXfJ/EkKWe7ig0n4gQxfK1lyr9BBNupQAmkpzSFt65DflToCL+
   rRxsdVtrhmu4SJSkUPRXX5bBbVS6oE1oeIfsHH/9z4mPlkT7F7HlsuEG0
   RrLki/DaGzQTQ8c30uEKZbEME1IN2ku8g7RP2SLain6/QJyu2D7bn50GS
   sfmvPsibggc+T+Yu1Xv9Hkwt1oNk3k3VT20Qw8oM2B8w8N7J9DNiJZmGh
   gZk83vRLuiyd+CBbEGuaUnlgZujM1+m44loL+i00qaet+uYBv5/V6fbBJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150123375"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150123375"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:11 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CA56FAFF6
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AC27D5A3B
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3001C41180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CF7431A006A;
	Wed, 28 Feb 2024 15:33:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/48] ed: upgrade 1.20 -> 1.20.1
Date: Wed, 28 Feb 2024 15:32:12 +0800
Message-Id: <1709105575-24259-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-2.986100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrn5nfR7I2dFOysPB8dBBorYIP
	FubbBVyAoTssFGSH7W3mn3xyPJAJoh2P280ZiGmR46cXaPycFZsEa8g1x8eqFz2wpEqqHW/Enpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFMz1igAcHRVhMBA4ihaHSuktoM
	x5Ni6Sy0XVE5D7bQKmvFKpfI6AIJeoeqsxTSyXmZ3bJ6KLpF/JvdI6/WOdYMQ1CXo2gR9GCex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196329

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  io.c (write_file): Don't create missing intermediate directories.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.20.bb => ed_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.20.bb => ed_1.20.1.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.20.bb b/meta/recipes-extended/ed/ed_1.20.1.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.20.bb
rename to meta/recipes-extended/ed/ed_1.20.1.bb
index 076666b04b..9ae53002c3 100644
--- a/meta/recipes-extended/ed/ed_1.20.bb
+++ b/meta/recipes-extended/ed/ed_1.20.1.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "c6030defe6ae172f1687906d7354054c75a6a9130af319d4e73c50a91959c5a6"
+SRC_URI[sha256sum] = "b1a463b297a141f9876c4b1fcd01477f645cded92168090e9a35db2af4babbca"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.34.1


