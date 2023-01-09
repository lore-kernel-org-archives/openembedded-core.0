Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327E0C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 05:20:46 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.64542.1673241637257566713
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 21:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lPNnEk7k;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673241635; i=@fujitsu.com;
	bh=2u4YVdBdUxhPuXUfWug931p+vtMsxaZzyRL5nZ7frtE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lPNnEk7kL2j4Si3hnexyOV8CJrKAjPUlh7kvBZeuVa8mKnc619RZl9Fbu95VMzvtZ
	 vjuJCLvFYY4KzJIGHbf5/m5uTktFeuRawPTvXX8p88zn5DFB+CKTBei4YgqbbUR7wl
	 2zuk22QoO7nZ9QXuKNEpPX1RmpV6irl5l9Rf/CLsukyEDwfMdbS1f0VdZFzHf8cF9P
	 PYn3BT+Gj1uBR00VkjOloX9X7oc+OXgHuQ/KorWDso57cUgalfEqn0W9g+1is4A6Aj
	 GlxBBhpxbLKAeB9F/U126zpOTvDKvivVHhmclm2KttjIX/WtDnEzi+BtBYGT6+lFcj
	 Vf85Kt9/8WTuQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORpKu0ZHe
  ywYfHWhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aK/etYCu6yVzw7cpa1gbGTvYuRk0NI4AGj
  xMrXRV2MXED2FSaJdeunMkE4exglPvzazAJSxSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  veADRIWsJZYfesaI4jNAhS/OHsdM4jNK+Ak0TbnP9gYCQEFiSkP34PFOQWcJfpaVjNBHOEkse
  /1NCaIekGJkzOfsEDMl5A4+OIFM0SvosTsy81QcyolWj/8grLVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0LU4tKkst0jXUSyrKTM8oyU3MzNFLrNJN1Est1S1PLS4ByiSWF+ulFhfrFVfmJuek6OWl
  lmxiBAZuSjE76w7GF0v+6B1ilORgUhLl5ajalSzEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgnf2w
  t3JQoJFqempFWmZOcAogklLcPAoifByzQRK8xYXJOYWZ6ZDpE4xKkqJ875eBJQQAElklObBtc
  Ei9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV6JeUBTeDLzSuCmvwJazAS0+MfUnSCLSxI
  RUlINTHoRBhMtVGo6Qu78nRS8t3vxW4E37PurFEPbmxbvDot6f9j+JZNWsO3LJV0P3stueq7m
  ZinwdKGLV/PLJf51Hc4sh0KSpx6afUmw4UpC/K/JjletvjYezql7uKIkglUp6IWPWIpy7EnFU
  zNdMg2Xqq3nWvtKd8PX7r2VKYwqUhMvBeVrSpvMlF6XxirKe980KzWodbLSrb8C17XTNHT892
  62kWCa5zXx+vcUa2OFl/dPdLq9vVr1+53m99lPWdx0mTU0MrcETt/94FjRjOPfvjzrV11hulj
  nZuq3EwfD2dndai/IGqWsfVJtny0a99Lo6gl70Qc/a2XNJwQ+cnTZeJHJwtlzXpr1S/+fog9Z
  lViKMxINtZiLihMBPj8f01cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1673241634!302327!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29732 invoked from network); 9 Jan 2023 05:20:34 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jan 2023 05:20:34 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 512DE1AD
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:20:34 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 45B351AC
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:20:34 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 9 Jan 2023 05:20:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dpkg: upgrade 1.21.13 -> 1.21.17
Date: Mon, 9 Jan 2023 13:20:20 +0800
Message-ID: <1673241622-29031-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673241622-29031-1-git-send-email-wangmy@fujitsu.com>
References: <1673241622-29031-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 05:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175664

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.21.13.bb => dpkg_1.21.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.13.bb => dpkg_1.21.17.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.13.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.17.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.13.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.17.bb
index 8637dcfaf5..f6687671f0 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.13.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.17.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "ff61d6d650e0455d4c070306a482cf757285d58b"
+SRCREV = "e91be752ecfc3d4f5514835c79609804940d4b97"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


