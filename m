Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F263FC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:48:47 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.6529.1657612118720558211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hqZ13JBO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657612117; i=@fujitsu.com;
	bh=OAFRFnhBWErv1f47IpazoBehyUscYkCUV+nq7e/wxQs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hqZ13JBOeb0+oW/sB+p3Di1efmvowPcCUiWohS24suUeWbcMqCGFJl7B+N/UAsfYC
	 qQn++RTT4m4ur7/FD4obPbGkAgyDOsBxOs8EerdovO4b9nsiBKrzNHRC1hrquMbM3W
	 VRbG//SYF93eicbqYP7UsaIOmRWHA52xkozR/y6pikQoVobgbqReuGXDO309K3L76F
	 /+tcxE72PECWXuXWmkryPxdKqK8CUILZSEMtZMF2um7nmYEPGnkcs2fND3P6Nsl36j
	 SmG5gwwiN9q9gMDHYnJFUFOqkoSpW/dPKM8dM4nR1g8BT+6dUYg8vEkRYPjAGj38dt
	 J1BnAzhzXgpOg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSTdE/Wy
  Swe8NOhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8alqTNZCibyVKz+s4+1gbGFu4uRi0NI4DGj
  xNR3txkhnGtMEhcXnWWHcPYwSvSteQXkcHKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgYWEBF4m7P0pBwiwCqhKvrjwA6+QVcJJ4vvQfmC0hoCAx5eF7ZhCbU8BZYvmcbkaQViGgms
  07ZSDKBSVOznzCAjFdQuLgixfMEK2KErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIFRcBaS9llI2hc
  wMq1itEgqykzPKMlNzMzRNTQw0DU0NNU11DXSS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxN
  zknRy0st2cQIDN6UYkamHYzL+n7qHWKU5GBSEuXNkz6bJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mC10YFKCdYlJqeWpGWmQOMJJi0BAePkgiviTJQmre4IDG3ODMdInWK0Zjj6pUre5k5Zn5tO8
  AsxJKXn5cqJc4roApUKgBSmlGaBzcIFuGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzTgO
  ZwpOZVwK37xXQKUxAp8hFngE5pSQRISXVwHT7hHPC8r4js/rEN67zvNNlwbh/2937PZxlc91s
  d1xLvjujNuZyk5zeyvdH2h8ueFJivOHYun/Hq9p7P0+7cMkmJrpD8VVmvvGW2riqll16dw57F
  gpGnN3lG5IQLnD4wGUDqeMTE59zlwhfktP1uhDP9Pen4LT69/6Spq0Ft5m+71yb1XXGo1H8T0
  D0l68VL+NYY0qXpP5XWlBzxfvKXzHnJeevqJXFJgn9mz2jXf/zfP2c+2/sWhbP1ug9H6J78ZL
  xHaeJndnzK7l/r4jKXpa/x6bo/Ftvm67A08HXvx6IWsi2uOPiFYFaPecf90UZ9ZWXrHo+VYEh
  LeeQ5aoSrwDvYwUVTj+T56nvPKAdGKrEUpyRaKjFXFScCAApp/o+awMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1657612116!91636!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24003 invoked from network); 12 Jul 2022 07:48:36 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 07:48:36 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5DDD3100078
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:48:36 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 515B2100077
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:48:36 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 08:48:34 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] init-system-helpers: upgrade 1.63 -> 1.64
Date: Tue, 12 Jul 2022 15:48:08 +0800
Message-ID: <1657612088-30882-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657612088-30882-1-git-send-email-wangmy@fujitsu.com>
References: <1657612088-30882-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:48:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167908

License-Update: year updated to 2022

Changelog:
=========
  * Team upload.
  * d-s-h: break infinite recursion on symlinks. (Closes: #1014119)
  * Bump Standards-Version to 4.6.1, no changes
  * Update date ranges in d/copyright

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nit-system-helpers_1.63.bb => init-system-helpers_1.64.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.63.bb => init-system-helpers_1.64.bb} (91%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.63.bb b/meta/recipes-core/initscripts/init-system-helpers_1.64.bb
similarity index 91%
rename from meta/recipes-core/initscripts/init-system-helpers_1.63.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.64.bb
index 1251ddf639..22ddd6840f 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.63.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.64.bb
@@ -14,9 +14,9 @@ include their helpers in this package."
 HOMEPAGE = "https://salsa.debian.org/debian/init-system-helpers"
 SECTION = "base"
 LICENSE = "BSD-3-Clause & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=c4ec20aa158fa9de26ee1accf78dcaae"
 
-SRCREV = "af94bae943a80954af7fd486c1cab3f900e0975f"
+SRCREV = "c440893051406c11f0a315058939657d5937be4f"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


