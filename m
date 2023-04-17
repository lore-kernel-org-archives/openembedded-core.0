Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9D3C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:53:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.48440.1681714389419849193
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wuAAJZOU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714387; i=@fujitsu.com;
	bh=BKdBCz3dYwo6i1FajSnjNe66c1Pq0+iWIiB7eD0kgzI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wuAAJZOURN5j0p3pgZf1ofoar9uJf9eX0rS4OycMLWHmyOTHBlQ8Vdsz2fEqKdNjJ
	 RtQ8f4wqbMBFd8yIlVMws3Rod7C5FSsG/GaxH18nLUa/3i4jLcyMki5fV9RnxpMgcd
	 5ieLmSZvHo0pmAKiBHe/fAEr+e4uEnyCw7SJlsfeT7OZZ77JErZJFPZ3YTkNqUSMvc
	 JkWxHbz5M74G2slvxEwUTwAUAzRSJ1q8TOLHLDL5oBsuwWOR3eH2ALYnkEkb6oZa69
	 5uWfiYbcHpxMKslyI3Lkd3C25asUloKbS/SO0dvtnpi10SHfFMz3f5hRcCkn1AfqyZ
	 Pdq8uUGpEHJfg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqHv5jU2
  Kwbz7vBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bP9WtsBes5K+adeMLUwHiSo4uRi0NI4DGj
  xIZXR5ggnOtMEmeefmaGcPYySqy8dZili5GTg01ASuLG/f9sXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBbwk3s/fC2azCKhKdC5byA5SzivgJHGiPx8kLCGgIDHl4XtmEJtTwFli47GHrCC2EF
  DJ/13NYJt4BQQlTs58wgIxXkLi4IsXzBC9ihKzL0PUSAhUSrR++AVlq0lcPbeJeQKj4Cwk7bO
  QtC9gZFrFaF6cWlSWWqRraKiXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYvCnFacd3ML7s+6t3iFGSg0lJlPdFqnWKEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQnehtc2KUKCRanpqRVpmTnASIJJS3DwKInwGj8DSvMWFyTmFmemQ6ROMSpKifO2gvQJgC
  QySvPg2mDRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO+1F0BTeDLzSuCmvwJazAS0WE4
  JbHFJIkJKqoEpNO50uH+aCMeD+/N/L3/U8Z+F1Tem+oej7QTzU887T+t3eSfdyV7601j9fM2O
  C6JL6hjmZpu/vhTAbcNfHRn+yi5W9oHMxsmlU6ZP+ZLonH6Ro+Gin/y1r0fvTE+I8nLo2Nu+8
  nnU9WlKFxe4nz4icPCl5JH6dbybeHqaObUqpkb9/2ycsLxPTSPZRObqr92Fyr9T9NsCE4QDD6
  1kvJn34aS51E+hQ/G2y5zcv01YsXwPg37s7EWGb1R0KiOZTt8V2BLnyFN93oO3YH/ghpQdea8
  dt15KOXt9fs/RBWJ301Yun3qyrPL5pdQaswdWrUnPZCUduIu/6K8107fs333OxYVNK34Vd+ua
  PDtT999KLMUZiYZazEXFiQBfM/ZgWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-31.tower-745.messagelabs.com!1681714386!212659!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6813 invoked from network); 17 Apr 2023 06:53:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-31.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:53:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A31E81001A1
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:53:06 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 966A6100194
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:53:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:53:05 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rich: upgrade 13.3.3 -> 13.3.4
Date: Mon, 17 Apr 2023 14:52:18 +0800
Message-ID: <1681714339-18687-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681714339-18687-1-git-send-email-wangmy@fujitsu.com>
References: <1681714339-18687-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180134

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed for is_terminal ignoring FORCE_COLOR

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.3.3.bb => python3-rich_13.3.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.3.3.bb => python3-rich_13.3.4.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.3.3.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.3.4.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.3.3.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.3.4.bb
index 5621214b1..2a832f171 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.3.3.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.3.4.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "dc84400a9d842b3a9c5ff74addd8eb798d155f36c1c91303888e0a66850d2a15"
+SRC_URI[sha256sum] = "b5d573e13605423ec80bdd0cd5f8541f7844a0e71a13f74cf454ccb2f490708b"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


