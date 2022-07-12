Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00579C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:48:37 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.6386.1657612111830834471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hVlyoEeV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657612110; i=@fujitsu.com;
	bh=IJn+HJdUwSEF8v0tkrQCecDrJPnT4S9vOkuWvDOHvJY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hVlyoEeVsRtJd/GMp8RfPZTY5hikpTWCSvpV6MQXAIqRgOU2eITtV8WuLu0+E1s/J
	 ifXvFUTTJAorJXZmLp4iM64sJsu2g9na7HdWmlXWNhTsv51unPx5jqUyQ0OEO/OM5c
	 UkHnQjVRTTMNfV9PUzaifBrw1kB4AHxhBkr1RTMHSc9TUNyy9pynhcFybZndHQHmcL
	 sPzX4GUnUofMKIjQPm6K8LgqhjqAhfcoewHj22ntt18ctuW5m6R/VLRZr4qxl0MBCy
	 EnOdD/J+5OCg5UD8c3/MaKN4UJuKsveZe6cklwxwBJwEVgWJk31RLRUpor5dTmvwA9
	 OyOUNve4qCoog==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORpOurfjb
  J4PZ9eYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPteitbwTnOiq7HLxgbGG9zdDFycQgJ3GeU
  uNHexgrhXGaSmPhzMwuEs4dRYkb7ZyCHk4NNQE1i+q0bQFUcHCICehJX/4mChJkFVCRe/O5hB
  7GFBZwk+g7PZgKxWQRUJZoONbKC2LxA8W+X9jGD2BICChJTHr5nhogLSpyc+YQFYo6ExMEXL6
  BqFCVmX25mgbArJGbM2MYGYatJXD23iXkCI/8sJO2zkLQvYGRaxWiVVJSZnlGSm5iZo2toYKB
  raGiqa6hrZGCsl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGJQpxYyndzBu
  6vupd4hRkoNJSZQ3T/pskhBfUn5KZUZicUZ8UWlOavEhRhkODiUJXhsVoJxgUWp6akVaZg4wQ
  mDSEhw8SiK8JspAad7igsTc4sx0iNQpRkuOqbP/7WfmWA4mZ35tO8AsxJKXn5cqJc4roArUIA
  DSkFGaBzcOFsWXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzTgOZwpOZVwK39RXQQUxAB8l
  FngE5qCQRISXVwNTvt9NMak0VH8vuHcEr1/CF+a2yLmDqemB9wtD1bmXRgaMSlm4bnyQLbOpz
  yGWx/341MoljVq56wRexjaW+Cj7dG4wn/Dkd9KV6sQiHZMjvfnVO58VbeC4quvB69d7IUGdNs
  fPzsEz7f6mv58+m/UsX8r3MV17ioGK99PZPEwUDiclmN1an/tFbkya5ZrnTpzt9SanLklaKax
  wQXv/m9QORDRo1z1cEPXG8qNLy8MvdXhH9hkMM6rvVHtyySnZ6x/n02/PXpqJpdk4GloJLee+
  sPvYv/eZc66Vbpv2ru77L2/uTju63xYYsaQ9r2Axa1JP3nzN+umfBv0TpBwUmEZv+p3ytL7f8
  efqNkLyNihJLcUaioRZzUXEiAKKkwv1dAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1657612109!91929!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21649 invoked from network); 12 Jul 2022 07:48:29 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 07:48:29 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 214737C
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:48:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 15AAE1A3
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:48:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 08:48:27 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.23.0 -> 1.23.1
Date: Tue, 12 Jul 2022 15:48:05 +0800
Message-ID: <1657612088-30882-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:48:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167905

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-numpy_1.23.0.bb => python3-numpy_1.23.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.23.0.bb => python3-numpy_1.23.1.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.23.0.bb b/meta/recipes-devtools/python/python3-numpy_1.23.1.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.23.0.bb
rename to meta/recipes-devtools/python/python3-numpy_1.23.1.bb
index 5457b7d34b..67ab1d9298 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.23.0.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.23.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://run-ptest \
            file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch \
            "
-SRC_URI[sha256sum] = "bd3fa4fe2e38533d5336e1272fc4e765cabbbde144309ccee8675509d5cd7b05"
+SRC_URI[sha256sum] = "d748ef349bfef2e1194b59da37ed5a29c19ea8d7e6342019921ba2ba4fd8b624"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1


