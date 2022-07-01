Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B671C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:30:17 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.36796.1656675008082489600
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FnhS9pP3;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656675006; i=@fujitsu.com;
	bh=KxesPG+A3oAEKPrub7ZIgjmH11I/Lsg1aIdCeuC65MM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FnhS9pP3VXLX10BXD03GfB7z7vuB6kVibURX+zxMdcBIoGrrt1J0grHnrbyAdCB3E
	 gb988mC9ZyMbO2QIIEsgCvKfcgW58d73o8zC5J7ASH0u3xbTw9eSxfktSdZ75/rEAo
	 eKaqzZm9QzFkW4ced4GjqLhuopYRfGDpyUvmHBRafJ0F85yEmmNziW3y/v/NR+dPSK
	 rT74WobbBHibzq4pmg/v4kLo0s0z//hjlst04NbTDa8EGYcmkOk6PJHjCg97CXmtuk
	 IRGS2PUeyl2+lio8qi1v3+28TjE1KUNgSF10SjoS5rArMnDcVCYjwh6awSvgOgjMA3
	 e/V/qdxHHHsxQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpLvv1r4
  kgw3P2C3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxTl6ezFlzmrLgzMbSB8SVHFyMXh5DAA0aJ
  DX+Ws3QxcgI5l5kkZn3WhkjsZpRomdkClmATUJOYfusGaxcjB4eIgJ7E1X+iIGFmARWJF7972
  EFsYYFgiYk989hAbBag+Kttt5lBynkFnCS2XnUACUsIKEhMefieGcTmFHCWeLhnMliJEFBJ9x
  oekDCvgKDEyZlPWCCmS0gcfPGCGaJVUWL25WYWCLtCYsaMbWwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjFZJRZnpGSW5iZk5uoYGBrqGhqa6xsa65iZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBwZtSrOi1g/HVip96hxglOZiURHmvXtuXJMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mCN+8mUE6wKDU9tSItMwcYSTBpCQ4eJRHefpA0b3FBYm5xZjpE6hSjopQ479/TQAkBkE
  RGaR5cGyx6LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5t10HWgKT2ZeCdz0V0CLmYAW75y
  2B2RxSSJCSqqBSez7pomPNhu3pWcUuP457LvsoLH6kuDMTX3fDt0pD3jzII1l8X2fht8qXy3u
  eRyUi73R3Hl+voxnloXifoedVl8OJ3GZ7TVvmqTHzJlV+ynzdO1Z5wzGj1HJ8myv/z15zH3ST
  Ng3e8bfmdskLLyWzJu0yG7p2ZpHa8ICQiYv+pLrvzP9hEzRmqzYzquFusLPzx48WGxkwX0kNI
  Q/LtLpjngZ2/TV7Dvif1zdx3v5zYvV9/dNdsybdvO3ZJ5qqvTfgtJwrswGj65um7wvf+dkVNr
  trNu4ujrsRtbDj54Hvx2ZLfKM54eFxJ60jBOPZSZ+0reRtnYV3cr0xDz0v5jeU7WPxrz7bd9O
  5Is5wtu0QomlOCPRUIu5qDgRAFC4A9ZZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-571.messagelabs.com!1656675005!3783!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7406 invoked from network); 1 Jul 2022 11:30:06 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 11:30:06 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id CBD7F1AC
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:30:05 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id C07911AB
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:30:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 12:30:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 7/11] gstreamer1.0-plugins-ugly: upgrade 1.20.2 ->
 1.20.3
Date: Fri, 1 Jul 2022 19:29:46 +0800
Message-ID: <1656674989-20458-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656674989-20458-1-git-send-email-wangmy@fujitsu.com>
References: <1656674989-20458-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:30:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167461

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-ugly_1.20.2.bb => gstreamer1.0-plugins-ugly_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.2.bb => gstreamer1.0-plugins-ugly_1.20.3.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.3.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.3.bb
index edc2ece979..ad7b84b5ab 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.3.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "b43fb4df94459afbf67ec22003ca58ffadcd19e763f276dca25b64c848adb7bf"
+SRC_URI[sha256sum] = "8caa20789a09c304b49cf563d33cca9421b1875b84fcc187e4a385fa01d6aefd"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.25.1


