Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF566E7718E
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.116736.1733788625205018428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FOXXazo9;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788627; x=1765324627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qfM3obMnmQ5O0EnRE5jqHI7GLFXow0HMolQRJHhkqEE=;
  b=FOXXazo9JHiAxtQ1ImqL8fCi2hJfWNaGrnflpkApOy4GVXZLEwreai/G
   qCLLgi+l3lrbnGqB4MylnKBcGW/08tNa9q0/HCxxY1gFRVdNQ1WFfpSch
   oIfZq2LF1O00glxx0aJCXZ5CEiUM71hkNyuyaR1nzFkvxh5pvpGOm9+Q4
   sTmbp2aJxxbD1uRzYI+DGOjHo6VolZGVKJoDUbS3padcZON7ym46+kVuA
   GMQnmHxP52Alk/wEIye5nkGBqhRn8wntY65Qpb5CaM1o7VKhevIU5t/VI
   KorZuMupsOrEfG5anxd/lMs9EHvaChi/CYq5SZRWVJcUWBNhRQAFOHEKC
   w==;
X-CSE-ConnectionGUID: QVw/n9oeSe+7ukv5jxw/Cg==
X-CSE-MsgGUID: qnpBIAJKQRKba5QM+Se/xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="171497097"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="171497097"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:06 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 62582DB61A
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:04 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B35BD8ADF
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C9F80E8DB
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:03 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 66BFD1A000B;
	Tue, 10 Dec 2024 07:57:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 08/20] hwdata: upgrade 0.389 -> 0.390
Date: Tue, 10 Dec 2024 07:56:40 +0800
Message-Id: <1733788612-20933-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10-1.013200-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmLP85tlrdTfE3uDhljfG03rOwpfLMeBwRvAQzqh8D4IY5soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SUkWJgimsZoWCTKKs2i2vZY6T+yWv9HSonbykY/WW+owf+Q
	16FmrtXE3uCCtV03E5wNFmM1BTT4pKYZGfUFPd6FPIvlX2BL4AS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208502

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.389.bb => hwdata_0.390.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.389.bb => hwdata_0.390.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.389.bb b/meta/recipes-support/hwdata/hwdata_0.390.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.389.bb
rename to meta/recipes-support/hwdata/hwdata_0.390.bb
index 8ab455cd2e..3ca39ead73 100644
--- a/meta/recipes-support/hwdata/hwdata_0.389.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.390.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
-SRCREV = "5313a12eb992a354c17fc895c1d69c8c42b09a06"
+SRCREV = "8b9819d19b1554d41dcc9c76a784e1732484cb15"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


