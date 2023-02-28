Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0206C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 09:49:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.19817.1677577780045328846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 01:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GarDu+8B;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677577778; i=@fujitsu.com;
	bh=NnIIAK62K59m5Lz6CiCSXJ0NT1qo+kEhV7LtFRr44ds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GarDu+8BwwRHqe+JjEVdyIfRq2uYb7xIzcLrKeLtHA/5EhvaeKbVm7/SpFxPE80Fd
	 2l/z2w+IBguRRIbsothbHWhYHpxjvHoOCyXuMrmBma6Elgmn9kMhGdNCBE1/rzV8JR
	 J74MwzV8xjPjYEneAjS2gHanbt5eDJt82oYTnE6z384LFq8XJZ+r71AEx2bMz7McWx
	 A1m346x3H2ndPGQP869v2czFHJ49yfTpfc+wo77bzituMBUYuJYkOlA11CXVH89yOa
	 v+0bbrMSHuYlYidRQXB1mJECXFaw4oc61ZcNW/nnAMOOTrQG1S0Qv63V0hdoI0T0/l
	 MchP0qgu9zBPg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSVf/3N9
  kg+NdVhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aVhjnsBe3cFdfOrGFpYPzG2cXIySEk8JhR
  onNtZRcjF5B9nUli6eRPrBDOXkaJT0vfsIFUsQlISdy4/x/I5uAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSxgI/F4z3FmEJtFQFViwZ7XrCA2r4CTxPcjHxhBbAkBBYkpD9+D1XAKOEvsfbSVGeIIJ4
  l/y5+wQ9QLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQrTi0qSy3SNTTTSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3ZRidfcdjEf6/uodYpTkYFIS5U04+jdZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvltNAOcGi1PTUirTMHGAcwaQlOHiURHijTwKleYsLEnOLM9MhUqcYFaXEebVB+gRAEhmleX
  BtsNi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYd/4xoCk8mXklcNNfAS1mAlrccO0PyOK
  SRISUVAPTJuX5c6uen/VoC3um89CoaKbpBo5cqaXG2yV+VMfo+TyurtU5KX31b1JA0rHq/LCJ
  63Y8MU5vyC9W2ldxpfb0LLXrNiU1Kz6rM/UFTNSYyTHvtrm9zymTw6IJufd7ZrP83BKquGNq5
  1E7o0rDTZsELu3UyWhWKza+3J+z1lI1hfdyQ9qDfh/X61lsNU+tM19ejparjAx+mH9t++SGIi
  l/kRjv5ZZMBTvqiyu3Kl7tEYlyPnrLUyjq2dVOfgmldAN5pzXnFjH2aPZmnV9UJdsWz3di05d
  3039WcgrMS9bb+sPoTNDD1Pxtk152ffN8ZHi07KZOmmSRHuez7wcFU5tXyUj4n39udjdgWb7W
  TyWW4oxEQy3mouJEABWTaAhYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-548.messagelabs.com!1677577775!341014!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3395 invoked from network); 28 Feb 2023 09:49:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Feb 2023 09:49:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A689A1000E7
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:35 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9AEE81000D7
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 28 Feb 2023 09:49:34 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libnotify: upgrade 0.8.1 -> 0.8.2
Date: Tue, 28 Feb 2023 17:49:17 +0800
Message-ID: <1677577759-20868-3-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177828

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Set new summary for library
* docs: port to gi-docgen
* docs: Fix URL to Desktop Notification Spec
* meson: replace deprecated meson.source_root() calls
* meson: bump minimum meson version to 0.58
* Introspection docs fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnotify/{libnotify_0.8.1.bb => libnotify_0.8.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.1.bb => libnotify_0.8.2.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.1.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
index 3bdc70d224..e86aabce26 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
@@ -22,7 +22,7 @@ inherit gnomebase gtk-doc features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "d033e6d4d6ccbf46a436c31628a4b661b36dca1f5d4174fe0173e274f4e62557"
+SRC_URI[archive.sha256sum] = "c5f4ed3d1f86e5b118c76415aacb861873ed3e6f0c6b3181b828cf584fc5c616"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.34.1


