Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3F3C54E6E
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.10643.1710313766710061392
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YUQSFkw5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313767; x=1741849767;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2RMBwGiX7M/Pf94uwmSBSYLuHrDnkMqKu3NCTYYMbxw=;
  b=YUQSFkw5Fu/gjzPu/NHsXxLxL2KzDZx7sqjh66JpzxoJ3IdzpgNYY1Ql
   HNRPNGmmw/P7LQ+m/+qWBwi4Ixswcknit9N0P2JoG4O+xSuKv9DWwHnDt
   WTm/pOwcTZFcnjpx4ihSpCgalukhANt+5fUdQXTJY85Ak7IfM5a4UBF5e
   O/Yk2aV2+6onxYms6tkxN85tGej8xI2cDhEby4WeLI6y2KNFPS8EYcHe9
   w+HrxZbVvQypBceKt/FN4JrNDItYj18m4zpPIqhxiSnBRaSDEFuYrAcoL
   MIgRwrzONFMiSGMXcU85w0UdU/jVHYeJCpMAwYpgqNoOQaOIyIwZ8lyaQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="152102047"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="152102047"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:24 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 56207232BB
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 917F7D1EED
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C4472C666B
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BEE901A006D;
	Wed, 13 Mar 2024 15:09:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/36] python3-libarchive-c: upgrade 5.0 -> 5.1
Date: Wed, 13 Mar 2024 15:08:20 +0800
Message-Id: <1710313714-12541-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--2.662800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvDQeGGV/t6Wzoj
	JH9oiMoV4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyWY5v+NllnxQoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJ29DKNiUL4l7SLTs1v+MlkD5M96yVsjVWqR8
	iqZy4TwwYEyTqevbqLe993MaoXXLrJiTNstQ1ifGWfzPT2MFlcPFz8j38JoOv+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197024

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Fix the format_name property and move it from the ArchiveEntry class to the ArchiveRead class

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-libarchive-c_5.0.bb => python3-libarchive-c_5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-libarchive-c_5.0.bb => python3-libarchive-c_5.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
rename to meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 6ac86fc7a1..4e318e52f4 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d673f56673d87ec740d1a328fa205cafad1d60f5daca4685594deb039d32b159"
+SRC_URI[sha256sum] = "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a372027c10615a2721"
 
 RDEPENDS:${PN} += "\
   libarchive \
-- 
2.34.1


