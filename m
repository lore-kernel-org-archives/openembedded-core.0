Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183B3C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:21:47 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.134763.1673760104893926608
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:21:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bDMWvecM;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760103; i=@fujitsu.com;
	bh=RYkw09LTa4ogeBNvHlSSp1OJGWcJznZ7LHclD7/0NkE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bDMWvecMp3Wgo4sJ34Y8Cws+H3ahE6W6XwYPdD8WoFTkj064ieRdrK80T0Ya0+Vq1
	 GL+9ML2yIzKtneTPV7h/avBvSvkciWM8jTAMUHL2xY1AVD2PP3oQWCpfuxJEvPXQh1
	 WpUddUEwnkBxckz7cgVDRa+wz9PPqZApLnUE78mIvT2ZA+FZIuZLjwt73wZoSdhDRP
	 nC5UzQGI3EYuNmOBqWVRj/xewrU+J+eueqlVI5n5qD2hJmKROmUFqWXMjDBVAYB8gT
	 kwQlEg2rpMYSEu3uOTyvKgVpd1p4cWNTQsLqRiCdKw9mH6s0ACi9vJi6UEMtumW88g
	 exb+Q1OhvNatA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSTet93C
  ywfpLJhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a9ozNZC57xVsybd5algfEjdxcjF4eQwGNG
  ib//f7NDONeZJE7sWAXl7GWUOL/gM2sXIycHm4CUxI37/9m6GDk4RAT0JK7+EwUJMwuoSLz43
  cMOYgsLWEvM+vWPDcRmEVCVODllLjOIzSvgKHFwxjuwuISAgsSUh+/B4pwCThILe2aA9QoB1R
  x7+YkNol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo2lxalFZapGuiV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYOimFLP57GD8t/SP3iFGSQ4mJVHeyG+HkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8
  G5oPJwsJFiUmp5akZaZA4wjmLQEB4+SCK92B1Cat7ggMbc4Mx0idYpRUUqct7IHKCEAksgozY
  Nrg8XuJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvE9BpvBk5pXATX8FtJgJaHFI/UGQxSW
  JCCmpBiZuiZVhj93WXt1y2EUk7P6rhOfp9s9z5UXbDQ6dLk98fII58GnKh9yy4nDv1R8trM8E
  7NzSfunWs+Uvcs4w75ERD3YNZV1Qw3hDxDlQbKeSy46foeE1uvv+1h02shNzjrt9bR/7c3kLQ
  aHnHA/vTGkQeJnCNf3C/tJ1p4/u+ySq/6H92YrlDW87dly5rn/+zoobalqVM/b+tfGQmBNy8w
  Dz3bOWT3433Vl+8MfuOY9Df8/P2SDrzFfrq/FQ7MD6a0291oerOPWi5HaFyobGlJ3OmmaeKH7
  m+70LFhybAm5ueSDf+OG3Rq8li6nU8Trz2wL5ErL5h3bevLzFvXdJk9GiU3M6cr1u1jH9u/eZ
  bVeHEktxRqKhFnNRcSIA2aVZdFgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-587.messagelabs.com!1673760102!233646!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15139 invoked from network); 15 Jan 2023 05:21:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:21:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7B16D1000D2
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:42 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6F1C31000C1
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:21:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dpkg: upgrade 1.21.17 -> 1.21.18
Date: Sun, 15 Jan 2023 13:20:55 +0800
Message-ID: <1673760055-2483-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760055-2483-1-git-send-email-wangmy@fujitsu.com>
References: <1673760055-2483-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175866

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * Perl modules:
    - Dpkg::BuildFlags: Fix strip method to always work with duplicates.
  * Documentation:
    - man: Add a note to dpkg-fsys-usrunmess(8) about Debian support.
  * Code internals:
    - libdpkg: Move compression level max bound check from dpkg-deb.
    - libdpkg: Switch dpkg_lzma_strerror() to use struct io_lzma.
    - libdpkg: Split compression filter operation tracking from its status.
    - libdpkg: Generalize compression stream action handling.
    - libdpkg: Abstract compression stream status tracking.
    - libdpkg: Add zstd support for .deb archives. Closes: #892664
  * Build system:
    - Update .mailmap mappings.
  * Packaging:
    - Update copyright years.
  * Test suite:
    - Add dpkg-deb build and extract tests.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.21.17.bb => dpkg_1.21.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.17.bb => dpkg_1.21.18.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.17.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.18.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.17.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.18.bb
index f6687671f0..3bb84a433a 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.17.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.18.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "e91be752ecfc3d4f5514835c79609804940d4b97"
+SRCREV = "ebc2c3def335ac391b010323ab65a302648f3ec7"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


