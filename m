Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9C7C3A5A7
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:31:21 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.5465.1670207478634279818
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Hd3QK1ZE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207479; i=@fujitsu.com;
	bh=QVjz1T1iT1bBdqz24xRvCeScelrQ01HCXrQJD9cUtoE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Hd3QK1ZErCgl6LsDDD5J8WgsRNn2T0qeNSXaB+iNqBn0bv4OYnQjxCsnCba+q1TSR
	 U3UMl7ofXGhDPZCdDlqzfsc4nSD+BWxdATV+nPJ8o8k85zb7nkmVoH9SBl+xA4IUxY
	 NmqcR+B0hx1Ihaf9ZcMD2/noY4HtzGWxaPhjDMAQqFsgtc/53Nv9o7IFFFbPgBhlRC
	 tNIeJDPnfmKOmkufTUOEXJ4Azi4uIspKGqjMjozSF2/cXu3JdlDLjKGnqrSjymT5fV
	 lX5CbUlpGHJ+8U35S+XOx568uJreHGBfrEpa5VG9T2yuq5jGrdYpA9ApA9vtMAdU8K
	 q+L9s7PooZVPA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8ORpPstvDf
  Z4EKnkcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnG0P6jgAkfFmQ6zBsYv7F2MXBxCAg8YJf4+
  3McM4Vxmkpgwq4EJwtnNKHGxfxFLFyMnB5uAlMSN+//Zuhg5OEQE9CSu/hMFCTMLqEi8+N3DD
  mILCzhIvF14FKyEBSh+cw0HSJhXwFHi3JHjTCC2hICCxJSH75lBbE4BJ4lvq56AxYWAalqOLG
  GEqBeUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSMya1QY1U03i6rlNzBMYBWchaZ+FpH0BI9M
  qRrPi1KKy1CJdQ0O9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL28
  1JJNjMCwTSlmmL6D8eeyP3qHGCU5mJREeZUedScL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCND
  utNFhIsSk1PrUjLzAHGEExagoNHSYRXyBsozVtckJhbnJkOkTrFaMkxdfa//cwcy8HkzK9tB5
  iFWPLy81KlxHnlgJEqJADSkFGaBzcOFueXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzuvk
  CTeHJzCuB2/oK6CAmoIM28neBHFSSiJCSamDS7rV7V6H4e2nm2zpBpYNR3nVsH3hmKjPvnhmT
  bdfmvEMpS+d9fpLRA6mKngV5qy9/dU667Bzx41LBqY1blzr4a8kdOfnM+2pXfYzwmjl2wkde/
  1nNcNpJzqolf/71SteQW9rci27bzOfdHHxz8pMMixvRXjWbeq/PmdPTzHf29nV2w7vc8//rVV
  peDoi4Uvq66Y3G9tITFt2rFp2+enGPnsXVnXt3eQvkpl7edL/qmCsLg+L0mpUN9fu7me4b1PB
  EaG/KONmR+5vJw5DzWVxq553XYqaC4hM5d2ifKrEKtw9+en+nolPCsWxzrl02k+YqMayKsJHu
  6hZ6anY+/nX8wQ3f/i/u/bX3bOdUz2wlluKMREMt5qLiRACEPQ1NbgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1670207478!358063!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19792 invoked from network); 5 Dec 2022 02:31:18 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:31:18 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 779AF1AD
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:31:18 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6CB861AC
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:31:18 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:31:17 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.14.06 -> 0.15.00
Date: Mon, 5 Dec 2022 10:30:41 +0800
Message-ID: <1670207442-7087-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207442-7087-1-git-send-email-wangmy@fujitsu.com>
References: <1670207442-7087-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174269

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.14.06.bb => stress-ng_0.15.00.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.14.06.bb => stress-ng_0.15.00.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.14.06.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.00.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.14.06.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.15.00.bb
index b4068b0598..e0d8a58517 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.14.06.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.00.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
-SRCREV = "03493cb69e91c29718ff9f645514355cd99762c6"
+SRCREV = "91ec6bccd7e94fd04674b29e081e579710b97d71"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.25.1


