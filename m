Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE87C6FA9E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:05:35 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.5234.1678003527874658225
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ya+VMuOF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003530; i=@fujitsu.com;
	bh=aMS8/OPPVMHvjRBQBRdhHa/TgjiPMwgJSXkvPv+F4GA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ya+VMuOFG7yUIhsc60kF5mUw0nylaDvsBK0V4H1ZDODXFKcqN9g0puxKpnPNxuDrT
	 mgKMwdHgpaaHhDT3EECo34xUl7ydKMSrCbABZ9GK3LqyBCt301MaVNjX/KAqx0/SWR
	 /uOjFYBEeLx3QRLYMNzWO6sFzmWn8FmS3yq5puu+3aYre0phSIFsy8zd4CjbG+qQOK
	 3Pr2JD+rPjR9XIIEAapl4k3ka5poOBxZepbUqc3I2F28Vl3TKnjy12Cq6dzJZXLgiz
	 HfQ7UDDRkgtps+i9jf+6ulzkv+MMjgu5UVlaiojD6GqIQgAe0qhon51gGuR2VJEF7L
	 wcr7cNPAcRUEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSdfTlyX
  F4Nh7c4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP+n9ksBXc5K26e7GJvYHzP0cXIxSEk8JhR
  4vzZfkYI5zqTxNFjF1khnD2MEreO/gbKcHKwCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAk8S52f9YQGwWoHj7vZdgrbxA8QmzZrOC2BICChJTHr5nBrE5BZwlVsx5CRYXAqq5vv
  Y2O0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbT4tSistQiXRO9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL28
  1JJNjMDQTSlmfbuD8X/vX71DjJIcTEqivIG/mFOE+JLyUyozEosz4otKc1KLDzHKcHAoSfA+d
  WNJERIsSk1PrUjLzAHGEUxagoNHSYT3oSdQmre4IDG3ODMdInWKUVFKnHeLN1BCACSRUZoH1w
  aL3UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmdPICm8GTmlcBNfwW0mAloscZpBpDFJYk
  IKakGJheBi0Wp6uePn76ezHrv/vYshWuPdwnNPh52QkstedueDvtDymVzOiqKbbarL9Bt3L3q
  s4xwfqvu/esiC1Nt1BoNYh9bsi2KYbuzetutSXMPTzv906nA671TqYJs29MpM5NCkkVeXj0ox
  KeVPZFxZ8yRxHiLK5bsUi2sSzULfqxt022rKBaUi7ynwLe9plBoQ7d7PcOb1v85D00+HnSI+3
  aKe/ObecdLmS9e2sTPGVRzed8FzgPLFy8yUdETmf3gEVvDNW47S0abFwda7TO1C7/1Ks3T8eV
  c1tT4ISJ7zteyHlebU2UzFlXKMn+ezrxys/abH3MST2/Sn6p647adtdEf053/C4zL5aL1d56W
  UWIpzkg01GIuKk4EAHKiUBlYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1678003529!188708!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3055 invoked from network); 5 Mar 2023 08:05:29 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:05:29 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 873C51000E7
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:05:29 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7B5091000C1
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:05:29 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:05:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libmicrohttpd: upgrade 0.9.75 -> 0.9.76
Date: Sun, 5 Mar 2023 16:05:00 +0800
Message-ID: <1678003500-30452-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678003500-30452-1-git-send-email-wangmy@fujitsu.com>
References: <1678003500-30452-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 08:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178032

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Fix potential DoS vector in MHD_PostProcessor.
Releasing GNU libmicrohttpd 0.9.76 hotfix.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libmicrohttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb} (90%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
similarity index 90%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
index 043fed367c..7bd66f63cf 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9278907a6f571b391aab9644fd646a5108ed97311ec66f6359cebbedb0a4e3bb"
+SRC_URI[sha256sum] = "f0b1547b5a42a6c0f724e8e1c1cb5ce9c4c35fb495e7d780b9930d35011ceb4c"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.34.1


