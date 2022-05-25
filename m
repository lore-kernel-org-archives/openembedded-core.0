Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD40C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 06:41:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.3910.1653460873070479493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 23:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=w2mL6oQX;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653460871; i=@fujitsu.com;
	bh=BG1jT5bniIru93gxX/TDW5cfUy7qIaY7rd44JhxrLO8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=w2mL6oQX2BX/tnVepIWtdgHPX39+FT8kYv84+qM6tK/5QdLbA7x1LI3D1TBDiC4DD
	 v0ymogGoM3uNRqiZrMjIxSjoEjFE0HiYILgaybD6QcMLwbR4V6luoFOnaKD4frRrjK
	 XyOR/OuALAd2QKTak29t6mTjn2HA4O4ee5P5DfG7AYmfnNJg9AgYkPyoU1+lh/oZrt
	 KiD99wc5ZiRQIaqpKpCP2Aq8MMIWszukNMIFcnENzA5qDRXrLOTFiCZCEnIvAtZwFa
	 et7TxeYuS2GIk6cjtCyIeBoRqFg/R/DN2HRKtBkmCoY0Wj6X6oJuQi74L4N5uY7oe4
	 5raxMVY2m484A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqNt2vjf
  JoPmIocWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtH8aTtTwTmOik0LetgaGH+zdzFycQgJPGaU
  2DVvJROEc55JYtmedcwQzh5GiUPLd7J2MXJysAmoSUy/dQPI5uAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSzgI7Hv+VQwm0VAVeJx6112kHJeASeJhYsjQMISAgoSUx6+ZwaxeQUEJU7OfMICMUZC4u
  CLF8wQNYoSsy83s0DYFRIzZmxjg7DVJK6e28Q8gZF/FpL2WUjaFzAyrWK0SirKTM8oyU3MzNE
  1NDDQNTQ01TU21zW01Eus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J0ctLLdnECAzJlGJV
  4R2MHSt/6h1ilORgUhLlPbGhN0mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO/q00A5waLU9NSKt
  MwcYHzApCU4eJREeJ3OAKV5iwsSc4sz0yFSpxh1OY59/b6fWYglLz8vVUqc9/xZoCIBkKKM0j
  y4EbBYvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFf1HNAUnsy8ErhNr4COYAI6Ip8X7Ii
  SRISUVANTdlzlvsjavXtcLMIWJ02RlGG498Fkzuw5W1Qn/LLdE/vtw4fQg2Y/28U1m+8vv1Jf
  xM+4/ebdxZseJ9/ol/6/IDX41a9W0ewu+SDzdza3+Ix5p9y0+MKxNeI65zSdWWusVh7+vzD97
  C3BncsXXU45KyzZ+e/0Wft/e1jZZpjdqD+67cHBqs1POvqqzv2o2JHCHRP11O2R+P3avMo6mw
  BOl4aLm1jUztdWaV/rttmQx3rr4FM7j9MSWxknPrI/OOWCV/zeA/xTEll09Q+6/pf5WBh28vP
  y5Y0V6q/evU999W6q04K/CRe6ViiWy4QEWQrPsvx5gKd9OvfWHhnHpZzZZ7nmfc03PcgjuHOy
  MlvSWiWW4oxEQy3mouJEAGBBro9QAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-565.messagelabs.com!1653460870!1046!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14195 invoked from network); 25 May 2022 06:41:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 May 2022 06:41:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 49FF510018F
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:41:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2CE7D10004E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:41:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 25 May 2022 07:40:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-certifi: upgrade 2021.10.8 -> 2022.5.18.1
Date: Wed, 25 May 2022 14:40:34 +0800
Message-ID: <1653460837-12404-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 06:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166096

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-certifi_2021.10.8.bb => python3-certifi_2022.5.18.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2021.10.8.bb => python3-certifi_2022.5.18.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb b/meta/recipes-devtools/python/python3-certifi_2022.5.18.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
rename to meta/recipes-devtools/python/python3-certifi_2022.5.18.1.bb
index 4c376da897..ff460d40b9 100644
--- a/meta/recipes-devtools/python/python3-certifi_2021.10.8.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2022.5.18.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=67da0714c3f9471067b729eca6c9fbe8"
 
-SRC_URI[sha256sum] = "78884e7c1d4b00ce3cea67b44566851c4343c120abd683433ce934a68ea58872"
+SRC_URI[sha256sum] = "9c5705e395cd70084351dd8ad5c41e65655e08ce46f2ec9cf6c2c08390f71eb7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


