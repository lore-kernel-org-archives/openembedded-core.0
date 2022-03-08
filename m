Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EC7C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 10:36:27 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.6821.1646735786537925809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 02:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PhJ13gHI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646735784; i=@fujitsu.com;
	bh=iFxZmC1SFiPG9+SF8Jjv2fO/XC2dDFvrCteTM5wYk+M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PhJ13gHIta4boEJfzkNC7qBG/E8l0T2EC3HK/agwBcH3d5cAAFlzFbYOfAdtpLgzS
	 IgNI7N49s9IP1sGB5Ktzyj2S6zQn87/B+b9aYllGPRf27JBOqxzgfAxuZ1vpwZlqSs
	 k6i0SBqoANMoRV6XI40yi9g4KxBCVpY97KfIFT9U/naJc7rfvCe5My+UcdXfmVPsON
	 ggUp92pySZAiuFctQ9bN4oG1QzB7LxWFlniz8D7VH02KGS3+abAdWKnAKkVnoDhNV3
	 WQY2vb9IUt/ETCBQGearQwwrpLP4tWBhjDR8UDkH7lBlM9SPl8ASn0asKFhv/CLukD
	 3e0DExGL/wgJA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRWlGSWpSXmKPExsViZ8MxRXeFoXq
  SwcpdKhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8auL3fYC1ZwVBz9cJelgfEiexcjF4eQwHQm
  iRVNa6Cc44wSix+eYeli5ORgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e9hBbGEBB4nnk
  1rAylmA4j2be5lAbF4BJ4nTNw+CxSUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXjBD1ChKzL7cDF
  VfITFrVhvTBEbeWUhaZiFpWcDItIrRNqkoMz2jJDcxM0fX0MBA19DQVNfMAkjpJVbpJuqlluo
  mp+aVFCUCZfUSy4v1UouL9Yorc5NzUvTyUks2MQIDLaXYhXsH452+n3qHGCU5mJREeevZ1JOE
  +JLyUyozEosz4otKc1KLDzHKcHAoSfDu0QfKCRalpqdWpGXmAIMeJi3BwaMkwluqBZTmLS5Iz
  C3OTIdInWJUlBLnjTcASgiAJDJK8+DaYJF2iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw71
  yQKTyZeSVw018BLWYCWmxnpAayuCQRISXVwMTtIOZbMEfmh1/745U8W0/W8BlrHfZ9H73m9d4
  wn3139HvflVnacVsdDq05Yb67+cjFH/GHvGM1uQwuT7sfeTfjVdVpb6mX0gd/3eZ3u5++Kua4
  sGm0La/Z7wIBWX4F++1iEm2L7ixpvhPQ79VoEnGGvaXykwCDMt+lOa9z93kHJD3lkupY9ObNj
  CDHp7P6VK1XKH42/vSXfWcoR9u2jE3v2KrPaOXqHmrY/nFrxa/1OY0v1c9as+67kvjaLfRahc
  wR/oyo0x57ZOuKbn3vrGj7tbB22UyG1Cu7JgscUF+1km972F09hb1MOk1VMwLF12d+mbV+wYk
  JgmUyqybuvLyhwCuppLutOXuywaZTX5VYijMSDbWYi4oTAcCNUAcvAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-545.messagelabs.com!1646735784!3682!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23934 invoked from network); 8 Mar 2022 10:36:24 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-22.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Mar 2022 10:36:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 228AaILF013458
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Mar 2022 10:36:24 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Mar 2022 10:36:17 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.13.11 -> 0.13.12
Date: Tue, 8 Mar 2022 18:36:07 +0800
Message-ID: <1646735768-59031-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 10:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162899

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.13.11.bb => stress-ng_0.13.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.13.11.bb => stress-ng_0.13.12.bb} (93%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.11.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
similarity index 93%
rename from meta/recipes-extended/stress-ng/stress-ng_0.13.11.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
index 12e10951a6..fe177a4de0 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.11.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
-SRCREV = "48be8ff4ffc4a04a0e3b5f2feaf63cce0cbd4f2b"
+SRCREV = "f59bcb2fe1e25042e77d5e4942f72bfa026fa305"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.25.1


