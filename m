Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00262C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 13:01:22 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.25868.1646658081298204345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 05:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h0SV75ME;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646658079; i=@fujitsu.com;
	bh=bS3nJVaNyVwCHELctJ4IJezzDWkmiExzwId/gyTCD5k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=h0SV75MEBv3q54YZIQRsuEXrins24PklCY107zumTSCFApzc2YyVi5nid5QbiXtoe
	 PVSRLyaAyYdgBoAlqnzu7Gzmu7L/fAnSBqmxF/Uvzh0HCEaHBaZjiHPWxxWO28TxkP
	 ixLAqSXw4MGoLULIIefaDDYs6lcTofaUwFhxo7oD2uw3RB8OgpaKWmPIa8WQ5gjy8N
	 YnnBCJ6LWQrXi0HaDiGJ16PCx4+FZK93fRtTMF210d1q4e6QTTmhe7olzFw8eVNxdw
	 JKhInzvzJ3PPFSc2UQDANTHyz9YpGAfYUlwoUgTFuew9hzbkOz5c6mYrfINqCU2rTm
	 LkxWG3jxT9rsA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSVeOSS3
  J4PQuc4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP5yl6Wgj/cFYffT2RvYNzH1cXIxSEk8JhR
  4vDLG0wQznkmic7+DSxdjJxAznFGiQvvJUBsNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxu
  4cdxBYWsJW4OfELK4jNAhR/fLWVDcTmFXCS+PZwIthICQEFiSkP3zNDxAUlTs58wgIxR0Li4I
  sXzBA1ihKzLzdD1VdIzJrVxgRhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJdUlJmeUZKbmJmja2h
  goGtoaKprbqhraGmgl1ilm6iXWqqbnJpXUpQIlNZLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMzZRi
  9307GF/0/dQ7xCjJwaQkynv9r2qSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQlefga1JCHBotT01
  Iq0zBxgnMCkJTh4lER4Q74AtfIWFyTmFmemQ6ROMRpzXL1yZS8zxw0QKcSSl5+XKiXOOxFkkg
  BIaUZpHtwgWPxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMex5kCk9mXgncvldApzABnVJ
  lqwRySkkiQkqqgaliRX/MseCSutytSs87TgTcTBOUr3rx91Ds1ds75n4wX7PcyHiqQvGvHRsC
  E6peHc+z5luxOaDgsmW++t2zkUkLJh4uO+/PuON0k+/P8s8Lz8Ze13O+b1QU67T+yvLWK5nbH
  9bfvqORbzBn56Ti/g9+stb8VxwM5nxnDOA8pf6//3nGtblxr466WbL8XabX0PRtr+t0WV3BDq
  5px6VcdFxPFS48eyS96JxptHFQbMuf57Ku7DoJKgZ32JbUZ3JMKSg4du1cGFsIj0bv0sfar20
  tOnSX7/565JzsFJnVf0w2SuczCJp2btiY0qH9+ePFh5Mafk1StZa33b9tzXIHg6CAfBNF0yNu
  pbrmfxKPpimxFGckGmoxFxUnAgAPWpK+WgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-532.messagelabs.com!1646658078!32601!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20445 invoked from network); 7 Mar 2022 13:01:18 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 13:01:18 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5FCA110034F
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 13:01:18 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 529111000FE
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 13:01:18 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 13:01:15 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] asciidoc: upgrade 10.1.3 -> 10.1.4
Date: Mon, 7 Mar 2022 21:01:04 +0800
Message-ID: <1646658064-56217-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 13:01:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162815

Changelog:
=========
.Bug fixes
- Add missing test py files to dist archives
- Fix DeprecationWarnings in a2x regexes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asciidoc/{asciidoc_10.1.3.bb => asciidoc_10.1.4.bb}    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_10.1.3.bb => asciidoc_10.1.4.bb} (84%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb b/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
similarity index 84%
rename from meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
rename to meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
index fc8cbc89c8..484250b33e 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
@@ -5,11 +5,12 @@ articles, books and UNIX man pages."
 HOMEPAGE = "http://asciidoc.org/"
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
-                    file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=aaee33adce0fc7cc40fee23f82f7f101 \
+                    file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py;protocol=https;branch=main"
-SRCREV = "342639edbbc0dcc64354a0291d2214d4d5e65cab"
+SRCREV = "c724bbf95b1840b04bb298a61a72b6a5ea94c2ef"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.25.1


