Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72ABAC64EB1
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.38390.1650284414950586270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=No0Jsc3y;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650284413; i=@fujitsu.com;
	bh=aniNSjxdamq3HExfwmlQIwMHsxxzpY7ANBYq/GEVsnA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=No0Jsc3yA/zG3JPvGO74lUYZ3UzSIIlouFwd+KaWyvfJrgXlvhAgLzbODNb/1muyt
	 YUjEXSgyhE40eRVFZZiRIYtXJJK4Ew0EuA6AK0dSsxArCg6+1hPXbFsH08UK04YTca
	 Vuoiwgmucm0q24rl5TBC+RnJIlbUtPviejanSjiAXj48GyS/G3RdGQ3spjq8gtINsy
	 TJ7oz4+5xbck3T8HaJ6Kp4Xwn7pt5ZWIj3ZuktWAgiaOvLgEXlFL/fK3hVXPzO4kBd
	 B/zGS3geAenMA9DW2RcZrdhoIBn2ZhIZb3gxG81q/7IrMYglUljOfs8H5JOqE9czFP
	 m/syYwaiqLD6Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqFsTHpt
  ksGyehMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrH3z0TGgtmcFec3pDcwTuHoYuTiEBJ4zChx
  +/F/FgjnPJPEhNNTWCGcPYwSS85fAnI4OdgE1CSm37oBZHNwiAjoSVz9JwoSZhZQkXjxu4cdx
  BYWsJaYd6QBzGYRUJVoWTMXrJxXwEliUxcvSFhCQEFiysP3zCA2p4CzxMSeTkaQEiGgku52H5
  Awr4CgxMmZT1ggpktIHHzxghmiVVFi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbbpKLM9IyS3MTMHF1DAwNdQ0NTXTNLXXMTvcQq3US91FLd5NS8kqJEoKxeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgEKcUu3rtYDzS91PvEKMkB5OSKO9/39gkIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8s0KAcoJFqempFWmZOcCIgklLcPAoifD2g6R5iwsSc4sz0yFSpxgVpcR5q8OAEgIgiY
  zSPLg2WBRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+zMUaApPZl4J3PRXQIuZgBZvnx8
  JsrgkESEl1cDUzqFaVVlnfPXt82Vq8f3b2zTyLJd9C/src8757aM1C7kKs9auNwtt4ZzvUabP
  s3TO05UiX0wvtUQ2rXzmq7Fwx5ZJZdNulDh49x1a7c5ZXBSzSzrR58Bf01MnVtgYJs+1e+1ck
  vKX+9fR1UIHJFkOrfOpjts/79GcA3XckZN3TrSae/3YmpMVh/QTl+d8XLXePTxHSOVd+ZcFvj
  fLkiLi9ASXrvm5UzrvQ+wr0RfcZ22uz/1Yz8mosuhi+pPQ8/+cIjo6rbs71qS95NziciczrS0
  /Q/3Y82cKsu+1Fn3fwzV1Yb/Id66d965suJHtMXPGrIziBcGWggJeNSz3Kptm86rd4eRnanYX
  VbvhIWSsxFKckWioxVxUnAgAvOhNdV0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-528.messagelabs.com!1650284412!238308!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21692 invoked from network); 18 Apr 2022 12:20:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:20:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E431B100195
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:20:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D7CB1100180
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:20:11 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:19:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mtools: upgrade 4.0.38 -> 4.0.39
Date: Mon, 18 Apr 2022 20:19:22 +0800
Message-ID: <1650284363-16570-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650284363-16570-1-git-send-email-wangmy@fujitsu.com>
References: <1650284363-16570-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164597

Changelog:
==========
Rename strtoi to strosi (string to signed int). The strtoi function
on BSD does something else (returns an intmax, not an int)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mtools/{mtools_4.0.38.bb => mtools_4.0.39.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.38.bb => mtools_4.0.39.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.38.bb b/meta/recipes-devtools/mtools/mtools_4.0.39.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.38.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.39.bb
index dc2b9f8794..564ef02aee 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.38.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.39.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "7b94485f486e7df08cca68b00a164a13cd38f4c63cb8684d188759ee7bc5e729"
+SRC_URI[sha256sum] = "397f1e2b7b7a2a270eb7970fa363e445f956926ec51e8170c3869da85b0987bd"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.25.1


