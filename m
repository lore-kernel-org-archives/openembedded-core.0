Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4212BC77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:09:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.48790.1681718960199940293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G+CS1PeZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681718958; i=@fujitsu.com;
	bh=f3mSR+6tSrK2dg1AGVpHhXV5rIhtcaOiawKY8PaMOYE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=G+CS1PeZ4/KHQzb5i80imGVMMciuIDQrfOi9uonpYJOckhEhtKETv196KVSqNxTpA
	 EcyXLr7jzizZ69hMyaqTbssZh8wI86c2ShpnqWXXFQcBPobsFg+R4+JYEzZbO3nWo9
	 /r2smvWEKmfw8WfuzGeVMLw1yb5xa4K2YzPQLRrzU5LudKhhtKK05zyXp1LYPLAaLq
	 bX7HBZ+G67C1TR1LlBZpEaESua9caBBGpArIHPA1d4VwUd/FtxdeH93pyliWp6PbyL
	 qq17uj6Ytf1/vQ08eYTUhsvWW3vgFAB3QNbg2jQE8vhuhd98cG++z7ArWXdODRUSQS
	 FiPG+IuiOExdg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSXfdP5s
  Ug5WPxS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ox5sxczF5zhqFg47QpLA+NT9i5GLg4hgceM
  El+P9zNCONeZJN5dfg/l7GWU2H5pNksXIycHm4CUxI37/9m6GDk4RAT0JK7+EwUJMwuoSLz43
  cMOYgsLOEjsan4CVs4ioCrR/e0nI4jNK+AkcfHABSYQW0JAQWLKw/fMIDangLPEgzdtYPVCQD
  VzF11hhqgXlDg5E2IOs4CExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQrTi0qSy3SNTTWSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3pRi9dYdjD/7/uodYpTkYFIS5X2Rap0ixJeUn1KZkVicEV9UmpNafIhRhoNDS
  YL35U+bFCHBotT01Iq0zBxgJMGkJTh4lER4jZ8BpXmLCxJzizPTIVKnGBWlxHm//QVKCIAkMk
  rz4Npg0XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjAvO8gUnsy8Erjpr4AWMwEtllMCW1y
  SiJCSamBiWNJXXZt9+9ATS1uJ0+XiR2rFr3UXP1Z1Ez+Zy8TmvmbxySM8bMbigfc/aF27sav3
  nvcDOZFTZ9xrm4znzq70Ku5Y7n5ioccNp/XNnL/PWPD69TJLSZ2+Zeb56FbsZnPe7YYcsV83p
  UtJrfKZmnPjJ9tJv5VPNvnv/TnJx/7OpdDTO4U3rEk1nWVTGxlee0ovynX+nXMl3pFzlILz3+
  rN63vFkJe8flrJjWd/vj84lcDvbD7h1E++1KlL/lxRYD1f8EPktOGcWp1z81hfTN/IKqtjUza
  PYa7Zyye8664YMIpxry2/p/dJ6teWw38OCfK15W7UnCLBZPt10sbLO2bXXpvyXejE5m9Ld3lU
  1JYlKbEUZyQaajEXFScCAEIv+vtZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-571.messagelabs.com!1681718958!407694!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29486 invoked from network); 17 Apr 2023 08:09:18 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 08:09:18 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1CDF6100329
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:09:18 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 10F0D1000FE
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:09:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 09:09:16 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.15.06 -> 0.15.07
Date: Mon, 17 Apr 2023 16:07:57 +0800
Message-ID: <1681718877-19480-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681718877-19480-1-git-send-email-wangmy@fujitsu.com>
References: <1681718877-19480-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180156

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.15.06.bb => stress-ng_0.15.07.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.15.06.bb => stress-ng_0.15.07.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.06.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.07.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.15.06.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.15.07.bb
index 31cf2e8987..674c58a6a2 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.06.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.07.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "f2a80e4fdba0aaf71d7d3687acb34e3827e68886"
+SRCREV = "83ab1d2d7e39d9accba9d6dd0cc567645bb21d92"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.34.1


