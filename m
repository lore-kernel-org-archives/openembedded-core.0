Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA642C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 09:49:37 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.19816.1677577776551458325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 01:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I3O/7Bbc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677577774; i=@fujitsu.com;
	bh=00ARQG8PQJnJYdlMlXA64t8oFDcn2yM2B9WTeWI8XqI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=I3O/7BbcoZRzQOjbNe2mo4JV1Z7qgMZK9O2VfWM8wXvkL5fonRPmrFZFpGmXq9Gbq
	 c2kRefoUlxCKh3G+tNztEzr/jvY4QQYOytcgg2ZA5ZSFuwLapkWv9Q764UCzZxVAJt
	 2qrqQPTmBu6my0Lp1THMAqswVpp8nWvFDrGDufpO5+a29eZM/WSlJ51eEaf3o9bDRY
	 FRAWodb7UCKGFR6+U97EahOBbjp+j6QkgIzExL722BJHUMxTVpXmqSdk2f1usAeQ8i
	 CSWWfc0f4W+64yooNLrNKz9K7lFUHia2wB4wP7zOLVxDgk89Y6JEKejdaYr5Ap7tdd
	 8mVy86ANUNj6Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpKt37m+
  ywfVvPBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aBo9UFD7gqPix/wtLAeI6zi5GLQ0jgAaPE
  hy9bmCCcy0wSO2f/gHL2Mkq8+LeQtYuRk4NNQErixv3/bF2MHBwiAnoSV/+JgoSZBVQkXvzuY
  QexhQWsJd6ubgMrZxFQlZjdN4MZpJxXwEniXrMkSFhCQEFiysP3zCA2p4CzxN5HW8FsIaCSf8
  ufgI3hFRCUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaF6cWlSWWqRrZKCXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYuinFaft2MHb0/dU7xCjJwaQkyptw9G+yEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QneLaeBcoJFqempFWmZOcA4gklLcPAoifBGnwRK8xYXJOYWZ6ZDpE4x6nJ07u86wCzEkpefly
  olzqsNMkMApCijNA9uBCymLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5p1/DGgKT2ZeCdy
  mV0BHMAEd0XDtD8gRJYkIKakGJp/35c2fX19KOep4+GhAoxnH/brpqvuEpdTuZi2RWBH02zpf
  w+bmE32+t6tbntnKbP3up/tVRD3enF3T69Fs1fObG8xWZYs8ePXcbZZx1sMATu+Lu61Wxea3L
  Nfb2XlH99qGiSWvdf7NjhVXM4tIc4rep+Iyc/Miq98ts5iObfFpkC+P5+O6Xj0rVn7+0jU50z
  vDZhYuFP338M6dA2Efwidqdx2YZL7+nkF9Q+LvKsHfh7fn7NDsKfH2nHlv2g69I6GzkiZ4/GA
  5kjN3W4b7/5bPvyUe1XzZf1VPb0e5/7Fbj0x08hffLnC3zLxx26T8Ldvd3bfnq2+XX1t7JJzD
  NfZTabDyz2cfpnPJ7p4UkqDEUpyRaKjFXFScCABPcGDXZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-728.messagelabs.com!1677577773!311920!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31975 invoked from network); 28 Feb 2023 09:49:34 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Feb 2023 09:49:34 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9426A1AF
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:33 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 881CA7B
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 28 Feb 2023 09:49:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] enchant2: upgrade 2.3.3 -> 2.3.4
Date: Tue, 28 Feb 2023 17:49:16 +0800
Message-ID: <1677577759-20868-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677577759-20868-1-git-send-email-wangmy@fujitsu.com>
References: <1677577759-20868-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177827

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Document the personal wordlist format.
- Improve the man pages in various ways, and make online versions, now linked
  from the web site.
- Fix some potential crashes (double-free and NULL dereferences).
- Update the build system to use autoconf 2.71.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.3.3.bb => enchant2_2.3.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.3.3.bb => enchant2_2.3.4.bb} (92%)

diff --git a/meta/recipes-support/enchant/enchant2_2.3.3.bb b/meta/recipes-support/enchant/enchant2_2.3.4.bb
similarity index 92%
rename from meta/recipes-support/enchant/enchant2_2.3.3.bb
rename to meta/recipes-support/enchant/enchant2_2.3.4.bb
index c892f570c4..fe28d323c2 100644
--- a/meta/recipes-support/enchant/enchant2_2.3.3.bb
+++ b/meta/recipes-support/enchant/enchant2_2.3.4.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3da12103f11cf49c3cf2fd2ce3017575c5321a489e5b9bfa81dd91ec413f3891"
+SRC_URI[sha256sum] = "1f7e26744db1c9a0fea61d2169f4e5c1ce435cf8c2731c37e3e4054119e994a0"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.34.1


