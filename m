Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2316C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:58:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.40596.1681117121784008177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Blu0S9HI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117120; i=@fujitsu.com;
	bh=29RA+LpufF93xaERHx8eDpb5Kohii2wDVaRVyDFT4xM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Blu0S9HIY35eqwmQ04K2+2dWXb6PKGsISzzDFzunYwFf7Nm0jQeJiL5fZ+b97S63e
	 d7Ym6UvR0IGw66+YqoBUIlSA3Pto3pihzusPKiSQ4aKnqNElrbN8j1xmBxkjdoGKU/
	 6eAafXP5legllo+g8MwImwYVEM2wICr6kxqAWZfGeJIkeU5AASPnLsSIskCj4UHFZn
	 Xpn/j74R0Au8kX5G8b/CLmTS8R9YqOzQ9c5fqjKvkJt4KQ3Pj7fZ5nMDI19tsK/lO8
	 y/+6b8HckIWi30JOsRUwbI+Jf8dSQE5IaEky4q3kPmWCBGYj6m496kstXB/sy5ooKr
	 BXv7MX0A5yvSA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSXf/eeM
  UgzVH5Czu/HzH7sDocW7jCsYAxijWzLyk/IoE1ow7W5ULtnJU/D/F08B4ib2LkYtDSOAxo8S7
  OXuZIJxrTBLXf2yGcvYwSrz52c/WxcjJwSYgJXHj/n8gm4NDREBP4uo/UZAws4CKxIvfPewgt
  rCAjcTHmR+YQGwWAVWJbTv2sIDYvAJOEnMmLAGLSwgoSEx5+J4ZxOYUcJa41LcKrEYIqGbWxD
  lMEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsConG6YegZqpJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka2ihl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KX
  l1qyiREYuCnFbO92MK7q+6t3iFGSg0lJlLeLyzhFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvw
  VmgnGBRanpqRVpmDjCKYNISHDxKIrxZwEgS4i0uSMwtzkyHSJ1iVJQS5+UASQiAJDJK8+DaYJ
  F7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw77bDQFN4MvNK4Ka/AlrMBLSYy8UAZHFJIkJ
  KqoFpBudlNot/4g8PcntrhthdZz214n82R4+6+OqpgonSHkviXk9e4X2h64q24oXd5Y+MWmS4
  pOd59y20/Zy73r91KoexQWmjx42zT2bNkc1vm8x49ov4cdd5rdY15v2JV7eKyW9tMjkjGrohx
  6JIIS/goseHlWkyk66bfl3n+iCZSe3TzK5VZXHcO+6vK93H8XZ9iuZ8Bicl5WufQ71CGrYc++
  SS9Fvtwv/Mg0V3tsWFnUopf79vac22v74FKcLrPm49Hrb42a2mFuMvp0+q3H5w9aQr37zvbNs
  vV+7fdMnVbtdGNqY/la9aQ5wntCQp6lzYLvyjU7pLfukqz1ernVOCTug2xTOyS1zVX9KvxL9I
  iaU4I9FQi7moOBEAZDicylcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-587.messagelabs.com!1681117119!380713!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23222 invoked from network); 10 Apr 2023 08:58:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:58:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1FBD8100329
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:58:39 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1381E100323
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:58:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:58:37 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsdl2: upgrade 2.26.3 -> 2.26.5
Date: Mon, 10 Apr 2023 16:58:18 +0800
Message-ID: <1681117100-24726-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117100-24726-1-git-send-email-wangmy@fujitsu.com>
References: <1681117100-24726-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179850

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.26.3.bb => libsdl2_2.26.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.26.3.bb => libsdl2_2.26.5.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
index 15054e1ea9..3274475da1 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "c661205a553b7d252425f4b751ff13209e5e020b876bbfa1598494af61790057"
+SRC_URI[sha256sum] = "ad8fea3da1be64c83c45b1d363a6b4ba8fd60f5bde3b23ec73855709ec5eabf7"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.34.1


