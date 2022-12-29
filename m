Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86771C53210
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 03:31:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.55627.1672716691447766977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 19:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oac0t/9U;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672716689; i=@fujitsu.com;
	bh=G/ff1Hn1r3VrqcRCVbUYljxAfOTCscrElTVE/eAk714=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oac0t/9UkZOdhbIOxpxQ1UrF9ntQauLDLuOuD1hEXrGzFIpuhgWnIEBtTn1gRLJ7K
	 Ezajs3jSNOhSXemc+8Jqx3ACzybrpOE9I9OWt9WSAxFLCWPCXa4QcvKICcRC3ihFjo
	 9FIHxFGywakhBIYSHWsHSKG05mBm4ffGSHXwi8wSgSgdSZ66uf1Ln9sigaJHFboznl
	 KKL7EuTDAzioj+eat07R4JgTgMAavq13xNIdqvfOWv7/18tjCDj1JKd0cInpRDg8uN
	 fN8ze2vBRHlwYba3BH1yzg1SXs709JlA+MPOvzFqM3dY7ru4240jySnQyz6tmT2guB
	 HlJSQngZFFUxw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpDth4eZ
  kg4P7tCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oy+dx4Ffzgrlq+6wtLA+Jiji5GLQ0jgAaPE
  pQ8v2SGcy0wSZxa0QDm7GSXaFl1g7GLk5GATkJK4cf8/WxcjB4eIgJ7E1X+iIGFmARWJF7972
  EFsYQEbic0PG9lAbBYBVYnTnxewgti8Ak4Sf/oegNkSAgoSUx6+ZwaxOQWcJaa0b2ACsYWAah
  qan7FB1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQrTi0qSy3SNTTSSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3ZRipeYdjH+X/dE7xCjJwaQkylu+d1OyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  Qlenvmbk4UEi1LTUyvSMnOAcQSTluDgURLhPTQPKM1bXJCYW5yZDpE6xajLcXfh3r3MQix5+X
  mpUuK8InOBigRAijJK8+BGwGL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3vkgl/Bk5pX
  AbXoFdAQT0BFJazaCHFGSiJCSamBy4+5vVri7qSrvw/lIH4EV0z7LPZ9Uk3g8rdiSYbNw0KNg
  kR1GZZu71x8OsT4a0ntR1uv3A/uvnkoiFz1kbH955+fwRzKtCZ0uFf5C0eLMAkPfVamzkk9N0
  MkPDDXUtUsqlGh6VmF8Rc5Y1HP+59Pp57fZiaWdf7Qs4vn8edadepFWi/sf5r4UuZG+ZmWW46
  HF6lLsGxk+vo5ntUjsETB6vTBw6r+9Z1Q4ZjX8Dmvf7bSsS6ndZbn4Hpkyrc2/bUPUk996Nm3
  p/83JorW14M52zc0Mh1T3vKu5LGVY2Mud+Mtf5aawcWUaG+e/Q+8y9n8uqq8qP35eYJl4R0ny
  /5iLPIs4rnjWsl0PVeC+ocRSnJFoqMVcVJwIAK2c+oBkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-571.messagelabs.com!1672716688!280019!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24017 invoked from network); 3 Jan 2023 03:31:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jan 2023 03:31:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 691641B0
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Jan 2023 03:31:28 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 5E1D41AF
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Jan 2023 03:31:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 3 Jan 2023 03:31:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] librepo: upgrade 1.14.5 -> 1.15.1
Date: Thu, 29 Dec 2022 12:47:57 +0800
Message-ID: <1672289277-16171-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672289277-16171-1-git-send-email-wangmy@fujitsu.com>
References: <1672289277-16171-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 03:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175332

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Adds API support for waiting on network in an event driven manner (new API function lr_handle_network_wait)
 OpenPGP API extension and fixes (new API functions lr_gpg_*)
 Update license format to "LGPL-2.1-or-later"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../librepo/{librepo_1.14.5.bb => librepo_1.15.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.14.5.bb => librepo_1.15.1.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.14.5.bb b/meta/recipes-devtools/librepo/librepo_1.15.1.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.14.5.bb
rename to meta/recipes-devtools/librepo/librepo_1.15.1.bb
index 46cfce53ff..2c8d6fc719 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.5.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.15.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "f4b915be5e04e88263097f65addfcac5919fef41"
+SRCREV = "5f4de4a4e85845d4184fbd30c03ff8a8ec7df4af"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


