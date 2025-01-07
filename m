Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7E8E77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:45 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.16520.1736240498640895913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=huT7cNLz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240499; x=1767776499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wTaSuFg1WctsQHpTr42Xpzw0oge9eMk+SAHFqhR2RiE=;
  b=huT7cNLz4EYEyvg02PQaT7bt/5vVvTONTdH5xOjSbNS+2oyfOtungZv5
   7x7vSHOMFRn0XdPtiw2g2V85Z4jTRSfNwOVvmuoncX2x5Yi65623khPZ5
   1/gi2En1TwbqRQ7u+Eb2h65r7ktSKlX/rIP7FhbupuQ+nPj9hVRmla3if
   ofF4D7OqxYPzyk/5oOko48XJAs8LCwccL54PAZHKH6ry+iWGpS28eSAJs
   AtXA84cIxnGLIh4UJ2bXfIbrFutPT5btezSZy+JUcwf9aajriWe90g/1e
   QYqRofpxRbhQ9GWNsw6DyNkQlVL1l6dgM9T0DxBCWxYZdXXs7bfK4HdF5
   w==;
X-CSE-ConnectionGUID: XJCeUdXQTTaIjKHKbx7adw==
X-CSE-MsgGUID: BVlosqVJTGqADudqko2SYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="185825545"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="185825545"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:37 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A770C2262
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F31FD8B6E
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C0793200930C2
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7B8351A0003;
	Tue,  7 Jan 2025 17:01:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/13] hwdata: upgrade 0.390 -> 0.391
Date: Tue,  7 Jan 2025 17:01:12 +0800
Message-Id: <1736240482-5243-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
References: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-1.013200-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmLP85tlrdTfE3uDhljfG03rOwpfLMeBwRvAQzqh8D4IY5soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S6H5RFmRONJ9+b+dH3MFDiTBudJJC9ssB8raTAg2JQ5u5tk
	tCYbTkFCwXrWPJhSmN2egU9UZETHtedvfX/NZ5qDPPHPutULr4S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209446

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.390.bb => hwdata_0.391.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.390.bb => hwdata_0.391.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.390.bb b/meta/recipes-support/hwdata/hwdata_0.391.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.390.bb
rename to meta/recipes-support/hwdata/hwdata_0.391.bb
index 3ca39ead73..e4b8c59c59 100644
--- a/meta/recipes-support/hwdata/hwdata_0.390.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.391.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
-SRCREV = "8b9819d19b1554d41dcc9c76a784e1732484cb15"
+SRCREV = "0955087d49d085d1ef2207d6bef0c07b02844b78"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


