Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842B6C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:41:28 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.33453.1653892883859829026
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eJqWIxJZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653892882; i=@fujitsu.com;
	bh=goQq8Uoex7paEVOfAcCHcBxFC5UiEIVqBz2V6drxuck=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eJqWIxJZDM4QuNbruj5D2iJAQzTnHZnFeKtEZ3nR/n8x/+XO4KWEIfVYouXbR8Ne7
	 jVcAjaGXn6QIJpsstxDBmg9Xqa6rteyXe6iK0p2FVPs3TvOPNTlHDEJeo8ZaGTKIZO
	 Jan8RUp/H4mG5T8OzplA9fAccukihEVOjz5lg/GNk43oIL34lPVCTPAClVgVRpWK0s
	 pDyc77TNWQVt7xulIieGuKe7fGbiX6i+4jyawtT40msJ1JkRZoe4SttQpxXNygRVLh
	 5JgjQRKVunGlDxJBH1wA3GTtrc4zzdr2LcnhzKbe9D+vriv9pc8uT3C7ORdRQRgk98
	 KA6IeWC3mZ33Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8OxWVcwfUq
  SwY/FuhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aPW5YF2/gqlndsYm1g3M3TxcjFISTwgFHi
  2+5vzBDOGSaJHXu3M0I4exglmje/ZOpi5ORgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  9hBbGEBS4m2yYfZQGwWAVWJRT3tYDavgJPE+8N7WEBsCQEFiSkP3zOD2JwCzhL7Dl8As4WAah
  be+8wMUS8ocXLmExaI+RISB1+8YIboVZSYfbkZak6FxIwZ29ggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGK2SijLTM0pyEzNzdA0NDHQNDU11jXUNLS31Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WK
  K3OTc1L08lJLNjECQzilmPn4DsYpfT/1DjFKcjApifKeVZ2cJMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mCNz55SpKQYFFqempFWmYOMJ5g0hIcPEoivEsSgNK8xQWJucWZ6RCpU4yKUuK85xOBEg
  IgiYzSPLg2WAxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMeysVaApPZl4J3PRXQIuZgBZ
  zM00EWVySiJCSamDSiugRWln3+8nEU1tC70UcuOvLdZ7z4IOeGI+575cvf7m3b6c8988lldvf
  79OU/xv193ND1LlF36dPj2y+3z7HprwuqmzlAhFWpmdV/Px2eYY7Dcs1bvuUPLRuXRxmODV2i
  /9mvymnCuysc9QkePllbG8wrpjhZc68dsOLWn2GxH1z77cue3q6dIVu2o1FxU/j3a+f9thl3X
  h3j8Cz9Nne8TMOK+ps/fks9YOGquWjL3t6ShRFnWPfRdvduJz4ql54yZ5vEjxvV1S1zWhQLNi
  q/vqJ48/FdW3hnm9yPTbel5yzNjm6zuX90fa6krxKicv/XRYUXOLgrf948l3IvpN56/UDtx2Q
  sGMWPpwey1+kxFKckWioxVxUnAgAA0xFdVwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-585.messagelabs.com!1653892881!212136!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13579 invoked from network); 30 May 2022 06:41:21 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 06:41:21 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3292C815
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:41:21 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 0A69380E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:41:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 07:41:12 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dpkg: upgrade 1.21.7 -> 1.21.8
Date: Mon, 30 May 2022 14:40:49 +0800
Message-ID: <1653892850-23554-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653892850-23554-1-git-send-email-wangmy@fujitsu.com>
References: <1653892850-23554-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 06:41:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166267

Changelog:
==========
  * dpkg-statoverride: Add support for --force-not-root. Closes: #1009069
  * dpkg: Fix <De-configuring> message to allow configuration to use new
    version.
  * Perl modules:
    - Dpkg::Source::Archive: Prevent directory traversal for in-place extracts.
    - Dpkg::Substvars: Add support for optional substvars assigned with ?=.
  * Documentation:
    - man: Reference deb-substvar(5) from dpkg-source(1) and dpkg-shlibdeps(1).
    - man: Structure and clarify deb-substvars(5).
  * Build system:
    - Unhook dist-cpan from make dist target.
  * Packaging:
    - Silence warning about merged-usr-via-aliased-dirs on Ubuntu.
    - Remove useless [] around tr sets.
  * Localization:
    - Update Dutch translations. Closes: #1010031, #1010032, #1010033
    - Update Portuguese man pages translations. Closes: #1011095
  * Localization:
    - Update German man pages translation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.21.7.bb => dpkg_1.21.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.7.bb => dpkg_1.21.8.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.8.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.7.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.8.bb
index 902cc03bcd..0d6b43aabb 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.8.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "e61f582015a9c67bbb3791cb93a864cfeb9c7151"
+SRCREV = "a154134fe70c0b823ae14905bdc33b64e7dcd454"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


