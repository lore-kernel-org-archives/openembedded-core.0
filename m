Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3619EC3A5A7
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:25:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.5323.1670207126459901017
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J74NZegG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207124; i=@fujitsu.com;
	bh=3cion/XhDqKPXKHjnyrOGR3stnHJRiQl+FzBvLnhARE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=J74NZegGNQZ4yc+pmnbdfRBZjAnn/GeJ8580//jchwwB//db2TpDGxq3KVlSc33lY
	 A4h3Rzc8QrbtJJOx6x5pVbmanKRhTsM/jMMT3D472JEpXeioWeBFMHB2OVxqab0qod
	 JUkF1oBZo6dHTlSkBnDhRzjYr2FvzNYAoXBk3tuWafu6p1w3EWdz5/sprJblPbKCPx
	 +K8zPMOjYUekZUijO8tGz6c/GG94BeFusVG0CBr3Tt+xBX5/oUW7lbMWPSjo9QFp11
	 QRxcQWnmaj+609qMe6QyA1fhXo2F5sNY8fOM+urqqWly91lfrIAeauU10SDDlW9ppm
	 G9z7N3RDUkxPw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORpDs5rDf
  Z4P4Ba4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePHLsOC1RwVt+bqNDCuY+9i5OIQEnjAKHFk
  4mQ2COcyk8TTvcugMrsZJbYe62HtYuTkYBOQkrhx/z9QFQeHiICexNV/oiBhZgEViRe/e9hBb
  GEBS4ktz7cxgdgsQPEl21+xgNi8Ao4SM/tngsUlBBQkpjx8zwxicwo4SXxe/RxsvBBQzZvvJ1
  gh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtUHNVJO4em4T8wRGwVlI2mchaV/AyLS
  K0aw4tagstUjX0EwvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8v
  tWQTIzBwU4oVt+5gvLHsj94hRkkOJiVRXqVH3clCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhXB
  vUmCwkWpaanVqRl5gCjCCYtwcGjJMIr5A2U5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+XqqUOG
  93CFCRAEhRRmke3AhYRF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzr5gs0hSczrwRu0yu
  gI5iAjtjI3wVyREkiQkqqgWmVXoPXIlNr+42My0yufVA81C79l3l+5FfHKX+FN1w98elCqdFN
  w1Cr9HiGH7v2XtBe+MXxA0dI2PVZFw2KS3f+WfHqS3Rd3Jcf8jLLWecsFH09wYRjffPJpkVyh
  1h4ea9Oj9epk9llyKPyvzLJujza5kBx65t5y5Oj2ZPiJ1zeHzzvsJQPyzRLhr3nblhrCypsb2
  kJa2R3Wxy4ismLscCqtfJw7LQXKxazerwKjvs13yfkCv+muEnZ3r/d8ixZt552vRnft7zytrG
  CUaJ+iP3a9aamFUEzpp+ep9P5NoHRc6K95UbvRReYYn+WdMj187Us+xK0V2h/3WqmadLJElbM
  kpt/5kexN7vMLs05o8RSnJFoqMVcVJwIAJ2PBHZjAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1670207123!126641!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12248 invoked from network); 5 Dec 2022 02:25:23 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:25:23 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id AF21A1AD
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:25:23 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A43011AC
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:25:23 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:25:22 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ccache: upgrade 4.7.2 -> 4.7.4
Date: Mon, 5 Dec 2022 10:24:51 +0800
Message-ID: <1670207094-6846-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207094-6846-1-git-send-email-wangmy@fujitsu.com>
References: <1670207094-6846-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174257

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.7.2.bb => ccache_4.7.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.7.2.bb => ccache_4.7.4.bb} (90%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.7.2.bb b/meta/recipes-devtools/ccache/ccache_4.7.4.bb
similarity index 90%
rename from meta/recipes-devtools/ccache/ccache_4.7.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.7.4.bb
index b8598af639..0419d07c4e 100644
--- a/meta/recipes-devtools/ccache/ccache_4.7.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.7.4.bb
@@ -14,7 +14,7 @@ DEPENDS = "zstd"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            "
-SRC_URI[sha256sum] = "6b346f441342a25a6c1d7e010957a593f416e94b5d66fdf2e2992953b3860b9d"
+SRC_URI[sha256sum] = "dc283906b73bd7c461178ca472a459e9d86b5523405035921bd8204e77620264"
 
 inherit cmake github-releases
 
-- 
2.25.1


