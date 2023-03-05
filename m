Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE4BC6FA8E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:05:35 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.5234.1678003527874658225
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RnTpxt93;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003526; i=@fujitsu.com;
	bh=RtqNjSSmPy2FlYlSSVk6gqYmCPCDJXrDVJQI1Gr+rGM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RnTpxt93k6gR7JPjyAJE35IOJsBCPJthU1Nbukw3k0559FTc23KkAoiTUw1ZMzs69
	 2217vFvvsE3X4lR2cMmOaIG9Id91zGIzIvxjQ4PDFPcLlzTFDKeovSRFNVkP4EF9Do
	 JwjVGj/Sq388pXfkZCA6TT31BgSBJfrK4oLV2hV/+UuB0XcgOW0SkHmQNMccufIgZi
	 yo4fVrPAHbJQrvP355UY8H2txxphVTRs/DcXR61eBB/P9oo4+LRxu5KFjrIzbNiC3m
	 F0JRLMGpoQHUFduIrdn1J1fAGvc/9zMxJYbxwZp6oDanG8U4MNn3nnSicffAyT1FyM
	 qtFTNMWOzbLCw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpOvqy5J
  i8G63hsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjHn9Xv2glO8FccO7WRtYPzB3cXIxSEk8IBR
  omPrTRYI5wqTxPS97xghnD2MEg0bn7J3MXJysAlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z1gJcICdhLbtx5kA7FZgOIX1+1lBrF5BZwkJnY9AItLCChITHn4HizOKeAssWLOS1YQWwio5v
  ra2+wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOxKidYPv6BsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYTYtTi8pSi3RN9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECQzelmMVsB2N731+9Q4ySHExKoryBv5hThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwP
  nVjSRESLEpNT61Iy8wBxhFMWoKDR0mE96EnUJq3uCAxtzgzHSJ1ilFRSpx3izdQQgAkkVGaB9
  cGi91LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5nTyApvBk5pXATX8FtJgJaLHGaQaQxSW
  JCCmpBqZVB06z5gbmf7ZmNGI3XDv3n8ByrQ/npvnuP7rz5lfXezf2y3Vy76hleWAhu8s/g4eB
  f93fm3mvtp++7K1vZ6l9xPi98FzxXa5vTtubXPq2K/ws94Jv5Z9/RtdXJtyTq2VX+vvn49zfV
  wtXhPvcZ6m9UVoTLxkmLsMv+q92tsCegHki/2J390jO0Jj8ZNneTQ+qeFyfSNyKvOVefpvnfX
  ygbXJBujpTyKSHD9WijjSudngu8T9rQvLpsrV/6gKjej79ri6R+778Po+OKX/kFD7GS71Pa++
  rBGUYVflYLrKyXflM7ERovtGSS6+cWfU5sh33L+Sd8Xb6yRC/h+pafckZq9g9ti4yOHpxxhWf
  6aZKLMUZiYZazEXFiQBIwnndWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-587.messagelabs.com!1678003525!189063!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9108 invoked from network); 5 Mar 2023 08:05:25 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:05:25 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 450611B7
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:05:25 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3975E1B6
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:05:25 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:05:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iso-codes: upgrade 4.12.0 -> 4.13.0
Date: Sun, 5 Mar 2023 16:04:59 +0800
Message-ID: <1678003500-30452-4-git-send-email-wangmy@fujitsu.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178031

From: Wang Mingyu <wangmy@fujitsu.com>

Added
=========
- ISO 3166-1: Add missing common names for Laos, Iran, and Syria.
  Fixes #32

Changed
===========
- Translation updates for ISO 3166-1
  - Kazakh from Debian BTS. Closes: #1025423
  - Catalan from Debian BTS. Closes: #1026972
- Translation updates for ISO 3166-2
- Translation updates for ISO 3166-3
- Translation updates for ISO 639-2
- Translation updates for ISO 639-3
- Translation updates for ISO 639-5
- Translation updates for ISO 4217
- Translation updates for ISO 15924

Fixed
==========
- ISO 3166-3: Fix withdrawal dates of AN, CS and YU. Fixes #28

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iso-codes/{iso-codes_4.12.0.bb => iso-codes_4.13.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.12.0.bb => iso-codes_4.13.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
index 1c884a1174..1950583f59 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "5e4dddbd1f8902ab0252ccbb19b783cc0359505a"
+SRCREV = "ab6b01d5b56af7da9f0d2d1619a3cf84e43ed76a"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.34.1


