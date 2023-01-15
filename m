Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9EFC67871
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:23:17 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.134783.1673760196545691430
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HQSHZ7hD;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760194; i=@fujitsu.com;
	bh=Dw0D9zqwYhuRi5f1uQ63GRmDYmgN1V2Z5+zjLgFBZjc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HQSHZ7hDZyKvT7KVtXasKB0tzz1UwWER5CCAepS8f1tVT/fla5Cw5kKSLOF43tz8A
	 j94ptKibyy3vp09vnCNgS/85TK/+j5CP+mmc4V98AaDR2upBW2PsARkjluG2uBWCQ3
	 5mGJ2e7MkrA/txrxJLcrqAM0BhQrNk318vwFuNCmGY6epKNLTLxVFojG2GISr0TcQn
	 5h37HemfCP//encPszFlKBi+Az3S3kmEWgXRvewiKkhRgZOkAXf1G3MxSNLX/b1qVm
	 +vadeh74AP2MT0MimlmNWV4mhbJxEVPeICuYJNpj2d829pXaFcejPMYSXl+YgfHMgS
	 L75ynVNmrf8Kg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSfdg7+F
  kgwdd4hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bzg6XMBQe5Kx60HmVpYDzH1cXIxSEk8JhR
  4sDS5YwQznUmic3Pt7NCOHsZJaa/fcXcxcjJwSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAm4SDy7vYASxWQRUJTpe/AeL8wo4Siw9v5wVxJYQUJCY8vA92EhOASeJ7vs7weJCQD
  XbjvRD1QtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJVo//IKy1SSuntvEPIFRcBaS9llI2hc
  wMq1iNCtOLSpLLdI11UsqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzelOIEpx2MU5b90TvEKMnBpCTKG/ntULIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d4NjYeThQSLUtNTK9Iyc4CRBJOW4OBREuHV7gBK8xYXJOYWZ6ZDpE4xKkqJ81b2ACUEQBIZpX
  lwbbDovcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPcpyBSezLwSuOmvgBYzAS0OqT8Isrg
  kESEl1cDEXil6zvRxSHPQChUH3ZncWz0EK75pr+sxX+Q4Z+3y4wGrb34xVrRXmWX8Mf+YW274
  tfSXh5IWunS8z1lqdXPaE2+h2+stbop4n3w04x5P2EX31bJGq2de/7Djju729a9UH67IMTj3K
  GCt564d96xe/Z0g6yOcmv2ybWeX4D8BuXiNTUs2Pq75+bc3eNXJGZfcXadULdB0cXx4bl9p8L
  pf1pfLlPhtMoIUGaPYSkxlH83Iq2Fy67GStmWRuXapP2T/A9fe3XO4VAX6Xm1lDrn+03OzBYc
  w2y1BpZnu7lsz0idJ2909ldpcdPm9h1Cy++nI/0H6pw6kzFzS5rHAfPnNnS6qW28+753SFrBM
  a3mZEktxRqKhFnNRcSIA+UM+BlkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-728.messagelabs.com!1673760193!229501!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1064 invoked from network); 15 Jan 2023 05:23:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-23.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:23:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CC7541000D5
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:12 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BF3A11000D2
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:23:10 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-alabaster: upgrade 0.7.12 -> 0.7.13
Date: Sun, 15 Jan 2023 13:22:53 +0800
Message-ID: <1673760175-2523-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760175-2523-1-git-send-email-wangmy@fujitsu.com>
References: <1673760175-2523-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175869

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/bitprophet/alabaster/blob/main/docs/changelog.rst

License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-alabaster_0.7.12.bb => python3-alabaster_0.7.13.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-alabaster_0.7.12.bb => python3-alabaster_0.7.13.bb} (66%)

diff --git a/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb b/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb
similarity index 66%
rename from meta/recipes-devtools/python/python3-alabaster_0.7.12.bb
rename to meta/recipes-devtools/python/python3-alabaster_0.7.13.bb
index 3381ce9568..9571137fb6 100644
--- a/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb
+++ b/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Alabaster is a visually (c)lean, responsive, configurable theme f
 HOMEPAGE = "https://alabaster.readthedocs.io/en/latest/"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=da053683d66d543813a727e8a30c96ca"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=21860fdb805bf4e0bfaf94b566b747fa"
 
-SRC_URI[sha256sum] = "a661d72d58e6ea8a57f7a86e37d86716863ee5e92788398526d58b26a4e4dc02"
+SRC_URI[sha256sum] = "a27a4a084d5e690e16e01e03ad2b2e552c61a65469419b907243193de1a84ae2"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


