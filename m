Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6250FC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:30:58 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.37650.1670830251383712907
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:30:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L36/9ohK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830249; i=@fujitsu.com;
	bh=k9xpX+ynoBsqhG7KMhifTaqZBFdV67/EtkypO3A6DCE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=L36/9ohKHlGDtAhr2Ff4UElWMUZtIL8nys7LUaSLO8++7HoyAXct5wqL2B+U3S7+w
	 +pY21YdrzXX1VwE+U3083mQ5Hnsx7lM6XO2oSchWjbrlStqm33cViNJhmLthdTyH/d
	 4pgPqJJ1KvhiyXIOfd9s59vWVvgpmrUUGqOep77pHULllTW3BpkDY7sQSZazHe1oLX
	 dD3lxDQUSxhUhtOympIzY0Fq7GdUxzfgUGTKcKJ24hcjw6oOrBOucwsRUFUHyMaprj
	 ayw478GgxMymqqwRRmU5EYH0F6BUAErnKz544+GkTaOaLP4jdxsGl4PA8rYFcFQAu5
	 nAQiU3zNDGI1g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8MxSXfljWn
  JBqva2Czu/HzH7sDocW7jCsYAxijWzLyk/IoE1ozF086wFNzjqNi35yFLA+Mf9i5GLg4hgceM
  EhsPrmeFcK4xSey8sQ4owwnk7GGU2PLWF8RmE5CSuHH/P1sXIweHiICexNV/oiBhZgEViRe/e
  8DKhQWsJSb/aQOzWQRUJS60nWICsXkFHCWa2j4xgtgSAgoSUx6+ZwYZwyngJPHsaBbEJkeJtg
  czGSHKBSVOznzCAjFeQuLgixfMEK2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhanFpWlFula6iUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To
  5aWWbGIEhm1KMdvvHYznl/3RO8QoycGkJMpbeWVashBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  g3XgHKCRanpqRVpmTnAGIJJS3DwKInwuoG08hYXJOYWZ6ZDpE4xWnJMnf1vPzPHcjA582vbAW
  Yhlrz8vFQpcV7p60ANAiANGaV5cONgcX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvDcg
  Unsy8Eritr4AOYgI6KOrlVJCDShIRUlINTGnd/TwqzAvfsU68d3ED07ty+53PntRLnlp33nsT
  F+OT5W/eCsknL2f/yvX4/+eMmF86DKtr3jw6a1rT+39zkDIzzwSuXPdnDnndTiainAqnmmtTl
  nh9EV2xLGD6lcwcf5H2xy+77OuEuCac5Dn8cZ8bo6Aqz1JGzWff+tTjzlYalzTn3jxhZnl6xR
  RdjwbvPUodd2KdPN8mXqp9sXfJhKufjStYPTj3BS9Y0M/LsezSfW39jozlO2cseX3QR/yq95u
  jWosee7StjEtYd/xl03E7Cc9nTrze6b2x56a+OxJnL826SlqPe2tHr8b+rriX0vsFfCY+sVz6
  7YT5Zu/v9psOHfkW8LM0/53vbK05r5RYijMSDbWYi4oTAR1WkeluAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-585.messagelabs.com!1670830248!315816!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7022 invoked from network); 12 Dec 2022 07:30:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:30:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B043B1000D5
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:30:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A33D21000E7
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:30:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:30:47 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libpcre2: upgrade 10.40 -> 10.41
Date: Mon, 12 Dec 2022 15:29:53 +0800
Message-ID: <1670830196-2900-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830196-2900-1-git-send-email-wangmy@fujitsu.com>
References: <1670830196-2900-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174482

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpcre/{libpcre2_10.40.bb => libpcre2_10.41.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.40.bb => libpcre2_10.41.bb} (95%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.40.bb b/meta/recipes-support/libpcre/libpcre2_10.41.bb
similarity index 95%
rename from meta/recipes-support/libpcre/libpcre2_10.40.bb
rename to meta/recipes-support/libpcre/libpcre2_10.41.bb
index 13f7c8305f..2a50d07192 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.40.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.41.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 GITHUB_BASE_URI = "https://github.com/PhilipHazel/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "14e4b83c4783933dc17e964318e6324f7cae1bc75d8f3c79bc6969f00c159d68"
+SRC_URI[sha256sum] = "0f78cebd3e28e346475fb92e95fe9999945b4cbaad5f3b42aca47b887fb53308"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.25.1


