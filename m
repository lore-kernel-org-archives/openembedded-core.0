Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471BBC41535
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 03:01:50 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.10053.1671591701372984968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 19:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TftMrjpS;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671591699; i=@fujitsu.com;
	bh=bF98N+NuQuAXAKAMxhivByi1msUt90E+JYJ7fFdhTgg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TftMrjpSW4tqLg1vmmpJ/pjayfnFufSAUyxw967MU4kcht9R5yOcP6+13Qvf7kWdh
	 UOlhu9m6FhgilvGeMQ1LVUa7TZU/Y+orfW+Y45NueYei9YrqqbbbMR+H8vZq9zQ8u6
	 uPmVbwzfHUQZHkETPgoDgoNd8vIB/Vy493CezWXn/u/S9mkxxrDSWDBgICIhuBGEMZ
	 QWxLC2ldkC7DggOGKBmvtGivcbTFoBVB6mFlFGsOXnIh3CCe5fo31WM/CYPOUCrFFI
	 QSxXxxLez0mdKDD6yNirPoZKFKdq8zb67LyNcRCWeujQLvGh2jNc60YJwZ7iqO79Z4
	 wcCXsTzi9BIWg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSVe4fFG
  ywa113BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bRDa2MBR0cFRNuTGFuYNzG3sXIxSEk8JhR
  YkrDVRYI5xqTxIWJC1khnD2MEl1t64HKODnYBKQkbtz/z9bFyMEhIqAncfWfKEiYWUBF4sXvH
  rASYQFbicW3DjKClLAIqEpMnmIDEuYVcJJ49PskM4gtIaAgMeXhezCbU8BZYlVXAyuILQRUs+
  3nbFaIekGJkzOfsECMl5A4+OIFVK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMpsWpRWWpRbrmeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBgZtSrGqxg3H9sj96hxglOZiURHl9GBYlC/El5adUZiQWZ8QXleakFh9ilOHgUJLgN
  S0FygkWpaanVqRl5gCjCCYtwcGjJMJrVwKU5i0uSMwtzkyHSJ1iNOZY23BgLzPHzK9tB5iFWP
  Ly81KlxHl3g0wSACnNKM2DGwSL7kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHljQBbyZOa
  VwO17BXQKE9Ap024uBDmlJBEhJdXApPtO4/EX9oR7h/0/z2k88ewQU+eFJ41zXzBp/lpYySfK
  EeZTuIn1ukLo7pWCEdO7s7+WcV7OZVboKGll5GKMWPP4NLtMubOF6FrVy8lh0z0eq8pMlPl87
  5ICt/t5CY/L09LYLuyf99pg6kOBuxca3l1fHPV3V19SopLUWo4923dGr/8u8N3/lo4ol+o0Hr
  EVF+47ZxXqn9170Z8x+LmYlHcymxbvk9YPFXc31y9wMuDQFRF+4xdRLvXuny1Pbt6j/s9eM5P
  Vy3cfjzsef+yX8EanT6Yzvmc+MFyU5sz8eanouUinhCd93z6wWfIolkYr8W1IEs+Z/PXtq82J
  UjuytOwaH1739Ne4rXQx+XaCEktxRqKhFnNRcSIAhRhNK2kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-548.messagelabs.com!1671591699!67097!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13076 invoked from network); 21 Dec 2022 03:01:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Dec 2022 03:01:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DE7081000E9
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D22461000DC
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 21 Dec 2022 03:01:37 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] makedepend: upgrade 1.0.7 -> 1.0.8
Date: Wed, 21 Dec 2022 11:01:00 +0800
Message-ID: <1671591662-12509-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671591662-12509-1-git-send-email-wangmy@fujitsu.com>
References: <1671591662-12509-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174896

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-util/{makedepend_1.0.7.bb => makedepend_1.0.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.7.bb => makedepend_1.0.8.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-util/makedepend_1.0.7.bb b/meta/recipes-graphics/xorg-util/makedepend_1.0.8.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-util/makedepend_1.0.7.bb
rename to meta/recipes-graphics/xorg-util/makedepend_1.0.8.bb
index 12dea012dc..ad769de205 100644
--- a/meta/recipes-graphics/xorg-util/makedepend_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-util/makedepend_1.0.8.bb
@@ -17,4 +17,4 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=43a6eda34b48ee821b3b66f4f753ce4f"
 
-SRC_URI[sha256sum] = "17c1adf0284aaee473abfff0e8d3e754770615e1275f2a0043b9d97a00ed5cc9"
+SRC_URI[sha256sum] = "275f0d2b196bfdc740aab9f02bb48cb7a97e4dfea011a7b468ed5648d0019e54"
-- 
2.25.1


