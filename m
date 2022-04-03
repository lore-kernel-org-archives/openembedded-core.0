Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC627C4708A
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.7493.1649245766367099213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d3jdzx+B;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245764; i=@fujitsu.com;
	bh=fXvltre/Pg5BCp0TJKvACxR2aISC40OsQUMD4xPzHns=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=d3jdzx+BBXbQYcFx+UvunSiNun4dqcxbsX8TeV+sLk5R/GQQFGiTks9xj0Nmt3L8Z
	 x8hFb2/089XKEsepoBRqneBcqBdlwQMupOag22z/MJGkhCxyySfPB8flVsdizFG1Ri
	 J7Z9wfGd+Dzhk2AL3C0M8MsdhxpaqTx7uBLLY3QUENiQfyNQ3Zk1vk2UNVZnGWOkhH
	 /FUfHIkWu8dqhJIADSM9F6spjrNkgbxg81Lvpqnc0rQguLokKngTT+Y8bCJ7daMsIw
	 9hPStUCRuLHGk96SgA+bFP2ArLmE63YBgWNUEyr9SLRiXKmZ02X+kRWyOkW0F42XIr
	 rS5exA5CpSOFQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqOtS55t
  kcPIer8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrH+wAzWgkMcFSv/zGJvYDzP3sXIySEk8JhR
  4tA0ni5GLiD7PJPEksOLWSGc3YwSK24+YwGpYhNQk5h+6wZQgoNDREBP4uo/UZAws4CKxIvfP
  WCDhAXMJFYs/AlWzgIUf7RyHVicV8BJYsmyl0wgtoSAgsSUh++ZQWxOAWeJoxNOMEEc4STROG
  E6E0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0Ji1qw2qJlqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hpbAClDvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src
  5JwUvbzUkk2MwCBOKVbL38H4d+VPvUOMkhxMSqK8+8t9k4T4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8G6pAsoJFqWmp1akZeYAIwomLcHBoyTCq1UDlOYtLkjMLc5Mh0idYlSUEud9CZIQAElklO
  bBtcGi+BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4vkCk8mXklcNNfAS1mAlr87ownyOK
  SRISUVAMTu/SZl9pSlQEehw2yt6Svve3q/fvVry0HYhOYf4dGvdBRe56j0rPjaajupGcBTz8k
  VOhcWD9Xie/auY8L9q2Ws85e1/ncdd2/phv53bOMlNZVvpkl//TC3YVXe7VbjkYcXPGYoevA7
  nt5crHu1j+el1frPpJdnpw8OU30nZh87+ukc8FeBlmCcuvMeh6KNJ7a1BTnGrjx5BGdf6yci/
  nebl23Xv5Ja/OqyrMTVdtWBwZduS3bbtxld5btYZ/qIw8BiZO/Cj+H/jqxODk++0jH7tAmjbj
  XgvNuV8TZ+S78eTjrt/DMRbcPHc7gji2P6bsgu2sdM1tXvZns1TOJbJN6u6esbi7LtAhY8MDm
  7+8jSizFGYmGWsxFxYkAI7ZEeF0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1649245764!229756!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3467 invoked from network); 6 Apr 2022 11:49:24 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:49:24 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AAE8B1001A7
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:49:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7896A100197
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:49:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:49:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] apt: upgrade 2.4.3 -> 2.4.4
Date: Mon, 4 Apr 2022 02:45:37 +0800
Message-ID: <1649011540-28857-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649011540-28857-1-git-send-email-wangmy@fujitsu.com>
References: <1649011540-28857-1-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164071

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/apt/{apt_2.4.3.bb => apt_2.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/apt/{apt_2.4.3.bb => apt_2.4.4.bb} (97%)

diff --git a/meta/recipes-devtools/apt/apt_2.4.3.bb b/meta/recipes-devtools/apt/apt_2.4.4.bb
similarity index 97%
rename from meta/recipes-devtools/apt/apt_2.4.3.bb
rename to meta/recipes-devtools/apt/apt_2.4.4.bb
index 27e455747f..9faf1e7ea9 100644
--- a/meta/recipes-devtools/apt/apt_2.4.3.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.4.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "5a7215ca924302da0b2205862cd2d651326eea222a589184ec6ce663885729f7"
+SRC_URI[sha256sum] = "d6d83d122ddd7cc83b2c2f839a55940c13ab93e5cf6024a010d6a6b4110dcf0e"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.25.1


