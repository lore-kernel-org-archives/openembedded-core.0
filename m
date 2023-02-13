Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA967C6379F
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 02:41:14 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.5806.1676256067983795395
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 18:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=H/tnPEGp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676256065; i=@fujitsu.com;
	bh=s/dnDU4Mn/UtvUee63Bn9dSka0Rhp5H3850j6BbkG/Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=H/tnPEGppI8svY0SQSXI1IjAa4965A3e1wsbgWdX7ar8e0Hpz0SuAnpfGZC4ciR19
	 4MwS4pezk4AVloud/x75cHABRxIAJ4TiqVGhSOaX0gJ+JpdlseOaEthAxRxnEXkZ5v
	 sDDlFS4ey3789XI5i0+gpJm2C5APt6mOx0zQ2Ym4AZBjVJo+Za8nCXKLzNEWHqfAYS
	 Mec6MYhVQ/R3cahgJLL65QJ6/CSCs9Gpp2iqTs2LE9kunGRfKJaF08Yw768+fug4yN
	 M+EOkk8zMRd0ROgpfsjudDp0Bu7xQhC6Bv4z7ZhwbuSVbXbUn1ZM11+yzDFkm6XdxD
	 qerxu0rnN+Rcg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWddx8ct
  kg1WdIhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bfojdsBVs5K24fvcrYwHiFo4uRi0NI4D6j
  xI8lZxkhnMtMEjd3boNy9jJK3Jr2Hsjh5GATkJK4cf8/WxcjB4eIgJ7E1X+iIGFmARWJF7972
  EFsYQFHic7ne9lAbBYBVYld12Ywgdi8Ak4S7zctYwaxJQQUJKY8fA9mcwo4S2w9+h3MFgKq6T
  qwjA2iXlDi5MwnLBDzJSQOvngB1asoMftyMwuEXSnR+uEXlK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNZcWpRWWqRrrleUlFmekZJbmJmjl5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg8KYUp3LuYFzZ91fvEKMkB5OSKG8fx8tkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8U
  guAcoJFqempFWmZOcBIgklLcPAoifBaTABK8xYXJOYWZ6ZDpE4x6nKsbTiwl1mIJS8/L1VKnJ
  d/IVCRAEhRRmke3AhYVF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7exbQFJ7MvBK4Ta+
  AjmACOuIxH9gRJYkIKakGpoTFQqryT2IO8WxvZDq/5pnKsQdfGcQfCZb+6y6TWO1k/sby3jTG
  6uWLl5gKVzvHZTfWypXdPpyusWjHnM1MkTWTjXyyTTOP1n5f6zH5WEudQta1WettbkQvnuq2I
  Tfg4SuH8Gg5y1fhXq+6j5bqv0usUPA2m27TftdXiHmdku/eytjlIUe0Fj85fdlKbH3N/dUz+n
  4kJT1qu/M5c/JLduPk+yU9ASa/t31SyGzgy+spzTv412zfQ4XJrw64Lk04dmCuxuS8oBa5br0
  bkYmvn+UZ6zx8MvX72yTjVYbxIkIHLzrMNIqoLT0sUpd1xJa5p/uwNY/3gRCVE4KZivs3u9RI
  Hsj184t6cyY55kSdEktxRqKhFnNRcSIA6Yn8hGUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-728.messagelabs.com!1676256064!717889!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22952 invoked from network); 13 Feb 2023 02:41:05 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 02:41:05 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C13117B
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:41:04 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B588C73
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:41:04 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 02:41:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xkeyboard-config: upgrade 2.37 -> 2.38
Date: Mon, 13 Feb 2023 10:40:44 +0800
Message-ID: <1676256044-19550-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676256044-19550-1-git-send-email-wangmy@fujitsu.com>
References: <1676256044-19550-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177080

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xkeyboard-config_2.37.bb => xkeyboard-config_2.38.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.37.bb => xkeyboard-config_2.38.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb
index f9322d4866..53dfe1634a 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "eb1383a5ac4b6210d7c7302b9d6fab052abdf51c5d2c9b55f1f779997ba68c6c"
+SRC_URI[sha256sum] = "0690a91bab86b18868f3eee6d41e9ec4ce6894f655443d490a2184bfac56c872"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.34.1


