Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADD8C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:42:27 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.6356.1657611741199134270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nrMqjcI3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657611739; i=@fujitsu.com;
	bh=amfraD3J9MtCTJPP2nq6FVFYLpw1bktY2EzQ4OvWOBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nrMqjcI3HhycIb9x+dRPSx3e8CFygQGQHVNLCeAS2y/OwQvlOkAgwqYjR4PIeg6W1
	 x8QU3zu96hbCXQVDGan8z4e3OdhcYcJobJI+e0WImILtfK4lLuVgrdZWhXv/B8zNCB
	 mI4WJkf3ulBgSHM19oS8CuHBdaF/NxdHqq+eCgL3MWo2rhE4mCwHA3YCmc+ZaklfLG
	 qQXEw24PTX9Yk3kdeFMstTbDArUmR43i5QDy7UQ2p278vnKbpTWLNSl3Tq/7LV3hmY
	 m/BmgK7vWWPKOX0FYvQNmb2wos6tNQAVhj3q+pXJS+AHayKuF9DXrBSlVAp5NSNIsw
	 mfA7VVoCp1kGg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8OxWfeW6tk
  kg9uvzS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oyJ71uYC65xVax+8I21gfEeZxcjF4eQwH1G
  iQn/XrN3MXICOZeYJD5ctoNI7GGUuDfjEStIgk1ATWL6rRtANgeHiICexNV/oiBhZgEViRe/e
  9hBwsICgRJrzjmDhFkEVCVmf98G1skr4CRx/NwGMFtCQEFiysP3zCA2p4CzxK8p38AmCgHV7L
  zhBlEuKHFy5hMWiOkSEgdfvGCGaFWUmH25mQXCrpCYMWMbG4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjVVJRZnpGSW5iZo6uoYGBrqGhqa6prpGxsV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFl
  bnJOil5easkmRmD4phSzvtzBOL3vp94hRkkOJiVR3jzps0lCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHhtVIBygkWp6akVaZk5wFiCSUtw8CiJ8JooA6V5iwsSc4sz0yFSpxgVpcR5BYARKCQAks
  gozYNrg8XvJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvNNApvBk5pXATX8FtJgJaLFc5Bm
  QxSWJCCmpBiamyesqnLOzvzg8KvD9kbFVanFWs7mNimCOQ5Pxpp6UV62XdnT2VSdeLXIsUeaK
  F2vmVXT8yWcWG8Jt1G/zfoJs6aWytj0ptRtdgxe+OtBVGRff6/zou+GvGcVbbzVve9bOcdxfJ
  OOWXOD9g9z9Af82OVslVAXYhQi5qk9YHb8xbM/aqToqO1Ud1cKsD0xabGof9XIBV1Ps7dsdq1
  /qK0apyS7b92ZfVqwNb+pjzy9dc+OTBCoXaAR27J3U6HzQR6Zbni9WzvPtdo286vyiq8uTq7/
  m3uOa9ihTfJbbn9KbvqXXV6Yf33q09F/gzP9qDrMbnQTS+TK+RkgeElLece+l1ONZ3I6Zm87n
  yRQrsRRnJBpqMRcVJwIA2RKenVoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1657611738!91342!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17762 invoked from network); 12 Jul 2022 07:42:18 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 07:42:18 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 899BE7B
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:42:18 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7D10B75
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:42:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 08:42:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cryptography-vectors: upgrade 37.0.3 ->
 37.0.4
Date: Tue, 12 Jul 2022 15:41:45 +0800
Message-ID: <1657611705-30786-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657611705-30786-1-git-send-email-wangmy@fujitsu.com>
References: <1657611705-30786-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:42:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167899

Changelog:
==========
Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.0.5.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...vectors_37.0.3.bb => python3-cryptography-vectors_37.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_37.0.3.bb => python3-cryptography-vectors_37.0.4.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.3.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_37.0.3.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb
index 8c0a7ee9d3..270d8ceca6 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.3.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "ac90c1340f73bc29b3bf964120b2db5f8e98e1fcf0074d85ddc871541974a559"
+SRC_URI[sha256sum] = "5a61400510e28937a5654b40c6ea4e3e593c5aaf0c2081c5b912f0e7cf883ea8"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.25.1


