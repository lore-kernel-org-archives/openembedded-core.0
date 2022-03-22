Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B730C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:30:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.8226.1647945013837549350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 03:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gT7mXxVT;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647945012; i=@fujitsu.com;
	bh=ClRML9xA4iBKMsQc226Ktt/HZsutvPvNTy9rduCHT7U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gT7mXxVT3ymD8NNtZwy/ZyPQv+eYyFlB3+W2Zs51y0HmEQP165VkOM9E6C1CakHYL
	 xdzu+gddoGBxyznKNBlUwc1hgXKah6bgYtZN2b1j3ZH5wks6IrFXdN85RyQuZ8rJ2j
	 m4stbzU5kDdGibLC28mFUPu8jKitzsxEoC+6fA0qxMwh9w5zyeimMSpX0VdPKHL37A
	 QLAJssZnVCEpa261JxWQNpzaXIl7na6Ud2Ympftmtu5fbOLYJgz9lPKqTx+foEmCVe
	 D4bCOUouo+KAF0I6S0aEsKvHL4wURB5yaqMjaU+txeoGgLOy3eo8dhuLV56LUh10DB
	 +pDFYF5vMeuXw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqGu81DL
  JYMMWHos7P9+xW9ybv4DNgcnj3MYVjB4dv68zBjBFsWbmJeVXJLBmXNtwiqngAXvF/i+nmBoY
  v7F1MXJxCAlsYZTYduI/C4SzgEniwLqj7BDOHkaJywf3AmU4OdgE1CSm37rB2sXIwSEioCdx9
  Z8oSJhZQF5i+aY/bCC2sIC5xOajvxlBbBYBVYll7RPAbF4BR4kXk/6B2RICChJTHr5nBrE5BZ
  wkJuy7ygRiCwHVfJm8AqpeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSExa1YbE4StJnH13Cb
  mCYyCs5C0z0LSvoCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhqa6hrqmlXmKVbqJeaqlueWpxia6h
  XmJ5sV5qcbFecWVuck6KXl5qySZGYFinFDNa72Ds6Pupd4hRkoNJSZT3TatlkhBfUn5KZUZic
  UZ8UWlOavEhRhkODiUJ3qOLgXKCRanpqRVpmTnAGINJS3DwKInwZnQDpXmLCxJzizPTIVKnGB
  WlxHlfgvQJgCQySvPg2mBxfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO82kCk8mXklcNN
  fAS1mAlqsz2oGsrgkESEl1cCUG3uy+FMbp+DqAM3w//YNygKzeX+WrNdZ6vFyY/mqNxecF39z
  Fq19vjFISibytfFxLdOrBf21u4TNnq75bmit2J2esG/R8n+R2r573VbdfV4joRHRGa8XXK474
  V7zjBV3XcPWiWzIVzIwXjkrh7+85S73uWNsFm4mG+T5F0hF1lRXlr8wsii6zyFdfCm/fHnto6
  gU8RS9z7/zr1dYHXc/ytf/QkKqbpZpumXI464+yzmXryzl3vvmRai2i2two2us0JU0F7WtH9U
  kHv9mSNnF9Gp3Bwt7wjzDbUtU369Z8+PRjRm72f/raF7hyMxT28uy9HzvvUBdG8v60PTZTFPD
  NG6FKvkw8nV0KlV+VmIpzkg01GIuKk4EAOudPfZmAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1647945010!262539!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8690 invoked from network); 22 Mar 2022 10:30:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 10:30:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 848B3100185;
	Tue, 22 Mar 2022 10:30:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 350A810018F;
	Tue, 22 Mar 2022 10:30:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:29:56 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>
Subject: [OE-core] [PATCH] bluez5: upgrade 5.63 -> 5.64
Date: Tue, 22 Mar 2022 18:29:42 +0800
Message-ID: <1647944984-5058-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647944984-5058-1-git-send-email-wangmy@fujitsu.com>
References: <1647944984-5058-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163535

From: Upgrade Helper <uh@not.set>

---
 .../bluez5/{bluez5_5.63.bb => bluez5_5.64.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.63.bb => bluez5_5.64.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.63.bb b/meta/recipes-connectivity/bluez5/bluez5_5.64.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.63.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.64.bb
index a9ee29135d..4319f9aae8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.63.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.64.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "9349e11e8160bb3d720835d271250d8a7424d3690f5289e6db6fe07cc66c6d76"
+SRC_URI[sha256sum] = "ae437e65b6b3070c198bc5b0109fe9cdeb9eaa387380e2072f9de65fe8a1de34"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_IGNORE += "CVE-2020-12352 CVE-2020-24490"
-- 
2.25.1


