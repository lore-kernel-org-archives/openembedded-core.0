Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06128C636D7
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 02:42:25 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.5740.1676256140093866040
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 18:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J4djL7kC;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676256138; i=@fujitsu.com;
	bh=UvQ8stE+ylpM938tbweptk0E6KUXxICorEa3Mya4NQQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=J4djL7kCdi0RKibXVN2zRCMYB2QamRWEvR88gzNnOG6Qkq1n6fl/j69WxP9an682k
	 lFT2uDJJARFgJmNninIN3XnGDwJICF9+K4x+uw8tjQu7v0PA5gbJfn0YJWVfgAa5pw
	 LDUhXUybaJg8CiSzJLtJKHcPlKMzkkkhh7JF0FwpnJN4VU8zgSYlr9KqDT5xZDgfiR
	 OPBqN+7eGCI5Det8WJVDveFAL7MypVtrBd/xIZnhubc1UYOHDbeDnhZde2eBFNkTcA
	 Th9mhItAqEUxXHSI5i3DvcUDQ7yB+6L7Zx+ZDOqPMtvNR2AWU+//U3FlAoH/T1N+MF
	 m+vdfz+vSxfAQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MxSbdz8ct
  kg855MhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b35k6mgrvsFXeObmdqYHzH1sXIxSEk8JhR
  4nTHCyjnOpPEpSXtLBDOXkaJe9+vATmcHGwCUhI37v8HquLgEBHQk7j6TxQkzCygIvHidw87i
  C0sYCjxsqGXEcRmEVCVePx/CiNIOa+Ak8Ti1iyQsISAgsSUh++ZQWxOAWeJ77N/soLYQkAlJy
  YuYQKxeQUEJU7OfMICMV5C4uCLF8wQvYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0
  LGJlWMZoWpxaVpRbpmuklFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek
  6OWllmxiBAZuSrH6rx2MM/v+6h1ilORgUhLl7eN4mSzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  ldqAVBOsCg1PbUiLTMHGEUwaQkOHiURXosJQGne4oLE3OLMdIjUKUZdjrUNB/YyC7Hk5eelSo
  nz8i8EKhIAKcoozYMbAYvoS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeXfPAprCk5lXArf
  pFdARTEBHPOYDO6IkESEl1cA0uTzkxEdlI0ENXquZaid/3olLPH3T7XuuiucWGynznf2ZO+of
  HVavMv0nfOe5gdMMz5Kl9oonFuWY/6+KEnj9/YOg3/ksM12LRsPnXhEiTYWMh88+epr2sNpy1
  Vu5+t3Onn4bam9qv162x9Hm1hGbU+8MM7cvPuSgl9qy+M6bmfdKqnKe72Rdrq72ZeaUgKXtsx
  f93cXHM2XRNsOOdGk/b/197IYS52vP7df6+OZoydYzVuZ+yb0cPLFXHbR8/59ji0zbyXTqwfH
  +CT8P/C3fG3Kvtd3cuu3r25n27r+P9fkzOolG9+86YCqws7p09/1CxfsCMXvjsi/c/vPh0Hqd
  elVpQVvZWdo5iU9+dugqsRRnJBpqMRcVJwIAENn7OmMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1676256137!519920!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32049 invoked from network); 13 Feb 2023 02:42:17 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 02:42:17 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2E2DA1000DC
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:42:17 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2295C1000D7
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:42:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 02:42:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libx11: 1.8.3 -> 1.8.4
Date: Mon, 13 Feb 2023 10:42:03 +0800
Message-ID: <1676256123-19590-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676256123-19590-1-git-send-email-wangmy@fujitsu.com>
References: <1676256123-19590-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177083

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libx11_1.8.3.bb => libx11_1.8.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.3.bb => libx11_1.8.4.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
index 06519df5da..1b95cfb432 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
@@ -26,7 +26,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch \
             "
-SRC_URI[sha256sum] = "e31565c84006b6b8e01dc9399c806085739710bc2db2e0930f1511ed9d6585bd"
+SRC_URI[sha256sum] = "c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e45c0e2ee59e84c86757df518"
 
 inherit gettext
 
-- 
2.34.1


