Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A46EC433FE
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 08:34:25 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.7039.1653381262342730638
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 01:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=md922t2y;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653381260; i=@fujitsu.com;
	bh=Cf1Ntx4fSNgk9L/o6BND+EQ6+G/3tcQNuZA7wYBijBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=md922t2y51Jj7HCQJbXfgOQ7PcDQSxP8bBDwgU6i8kDf+LW76JHf3gAhhWOhQdyPy
	 nKFC16YCp2efajrwoFGWJDuI3HKDEXze8IP0CePobf0+DI4Ww20ElPyXUz13TXg3ko
	 /nxLtsf315Xj7MzyVlygn6gJwZ9S98LoaPJaE0PruKgCiVyrqAXkgQD9G2YRs7niEP
	 9HWMLLR1/nf4cVpC7SbNGdwXkAGO9psTLxv4NZYySHsc9lzl5Ny6aL/S00EOnhX1rr
	 JL1ejRAyQ/uRQ9C6P/hagFE6mFq9C3HgmKHI8WLi8nsJQqZG5SFNDL1bBRHAeszj8R
	 8Q3BjphW0C/Zw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8ORqNs9oyf
  JYO0OM4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePqs72MBS/YK2bPXsrcwDiVvYuRi0NI4DGj
  xPb+g8wQznkmiee7mlkgnD2MEp+mHwNyODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jASeLa5r9g5SwCqhJXn8xhArF5BRwl5qy9DxaXEFCQmPLwPTOIzQlUv+z0MUYQWwioZs
  ryiewQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5uh5lRIzJixjQ3CVpO4em4T8wRGwVlI2mchaV/
  AyLSK0TapKDM9oyQ3MTNH19DAQNfQ0BRCW5rrJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfm
  Juek6OWllmxiBIZySnHK0R2Mx/b90jvEKMnBpCTKm9HSkyTEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgje7HSgnWJSanlqRlpkDjCuYtAQHj5IIb/t0oDRvcUFibnFmOkTqFKOilDhvF0hCACSRUZ
  oH1waL5UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmjQKbwZOaVwE1/BbSYCWhxr0QnyOK
  SRISUVAOT5dxH/PbmJ68dvNWrzZeoNvnLnaszmbqL2kIWvDS5tqG9PtqklDNp9mfte9U84fd3
  tKV0xLzTOBA+8VPBFsf4pZ7dSdUmlctUsq0dnjzUZw4+rLnlVCl30yRTlvOT1lrXq8pez1PPi
  eLeeeLD4TuMrMbXNNl+bPtx78P7wCS+gj+WGm5rs60tei91Zb0vZ5Aw+/tvHdfbyzf7Ctxev+
  kqXuYnL8z19McJxc1Lvjst3HJRefKir07vvpsfaPnDYKzG96j5zEuDm08qV/sW8+St6pKQu57
  inq5aukKtgS+V51r+29CidWUORUxX7wSr7GS9ai5Qneuw+2yplMOfTQv/zmUvn7ledbGI4RUe
  WX0lluKMREMt5qLiRABIfnIWYAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1653381259!8505!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3778 invoked from network); 24 May 2022 08:34:19 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 May 2022 08:34:19 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E9E6110018E
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 09:34:18 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A9F03100191
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 09:34:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 24 May 2022 09:34:09 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH] ninja: upgrade 1.10.2 -> 1.11.0
Date: Tue, 24 May 2022 16:33:45 +0800
Message-ID: <1653381225-6080-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653381225-6080-1-git-send-email-wangmy@fujitsu.com>
References: <1653381225-6080-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 08:34:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166052

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/ninja/{ninja_1.10.2.bb => ninja_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.10.2.bb => ninja_1.11.0.bb} (94%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.10.2.bb b/meta/recipes-devtools/ninja/ninja_1.11.0.bb
similarity index 94%
rename from meta/recipes-devtools/ninja/ninja_1.10.2.bb
rename to meta/recipes-devtools/ninja/ninja_1.11.0.bb
index 7270321d6e..4ec361cc1a 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.11.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "e72d1d581c945c158ed68d9bc48911063022a2c6"
+SRCREV = "51edeeb063a82693573db43782d9e3733b2840e4"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.25.1


