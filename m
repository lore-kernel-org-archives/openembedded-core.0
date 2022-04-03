Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1712C47086
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.7516.1649245630462603047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DlhhL2Sk;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245628; i=@fujitsu.com;
	bh=b48KMkZoPBY1f3x/tZ+950tyuIKgzbXfoMkvn2sywPI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DlhhL2Sk7Xh4s+LQjFBt/luJeITd1F/HwSEJCc8aH+5jDkx50toO2iGONdRR+7b7h
	 SDyQOWkk4ob19NptEEvKwXBtSACN6QlczamSW/f1R+KOzzGYux9OML5OoB7ppU9nnH
	 yFcjYaEevg6ikkJOvvV4xj5dCMj3HSloQQ2PRvddthzs5WQ+uzOKJem0nEMm3BYoTg
	 czr57R9oVM99CkPHDGMR3zHlFVBpb0oTykF9eJJ2LF0I2gDgkoglGWA7NiMbBje+no
	 UThGuAFTMLcCPRzqOa0RGFhEzW3WKnQm2PvyMkXEtSjjOmHGbdks/94vS534rQwDBX
	 nYa0zqhZRHEbA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSXdPrW+
  SwbVmSYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeNdUy9TwTeOiplr9zA3MP5h72Lk4hASeMwo
  8X7XFkYI5zyTxL1r11khnN2MErOvnGHqYuTkYBNQk5h+6wZQgoNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAg8SUt5fAbBag+LtdlxhBbF4BJ4kzT7ezgtgSAgoSUx6+ZwYZwyngLPGnMwkkLARUsr
  vhLxtEuaDEyZlPWCDGS0gcfPGCGaJVUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdY0tdCyO9xCrdRL3UUt3y1OISXSC3vFgvtbhYr7gy
  NzknRS8vtWQTIzCEU4rVg3YwflvxU+8QoyQHk5Io7/5y3yQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKErxbqoBygkWp6akVaZk5wHiCSUtw8CiJ8GrVAKV5iwsSc4sz0yFSpxgVpcR5M0ESAiCJjN
  I8uDZYDF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzrBTKFJzOvBG76K6DFTECL353xBFl
  ckoiQkmpg0mZiPPiQ4d/3NM+gWavdq5mPc1y0vFzelmT6Z+mVK7EiN39c1Jj9rWz/qsDVVrH3
  JL0KwwLvnLPjCzgQGTTxu+WDLEFuFS5D/d7lKse8maNaJzjO36Y43XlL8rfj3Lm+SrcYPNk+L
  9X9ILVv2VaL2n05WXtnrfqkZ7rGsq6UJdsrvEvmY3+zd4Ov9f+N70KOPbqw5HtE7ovfHfPj38
  /cmDuj/O4H1toXHZZz46Z6zshIV9/T/FwsUd+uatVizwdhe0UqbtlF5Lz6ZTI3fpcMQ9GF2tJ
  jT4+d2a2c4POjb9G0zL9b3RXvh4R7vvu0UU+KfRtHYF53ll3Kn927f8SFsV3s6H72+9MlO6fX
  E9TmKLEUZyQaajEXFScCAGE1nTdcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-571.messagelabs.com!1649245628!499690!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22134 invoked from network); 6 Apr 2022 11:47:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:47:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1501F100461
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:47:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 08532100453
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:47:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:46:51 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lttng-tools: upgrade 2.13.4 -> 2.13.6
Date: Mon, 4 Apr 2022 02:43:12 +0800
Message-ID: <1649011392-28818-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
References: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164067

Changelog:
=========
Fix: hide symbols erroneously exported in 2.13.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.6.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
index 0ea4da05ce..d40d0a2dd0 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
+SRC_URI[sha256sum] = "1d52d249437b3f7ba23a45a22c3e26dde006a5da10e96753952084a98e0523e3"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.25.1


