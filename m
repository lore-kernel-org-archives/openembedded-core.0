Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C8CC4708D
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:31:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.5461.1670207471382631596
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y3yiaHsB;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207474; i=@fujitsu.com;
	bh=6QKpRQqs3JSRlr1+7J1h1SOKnlTcuBnEkFKDjnbKch4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Y3yiaHsB3XWcUqrtJ7NZ5AYozuq3L2jh53Vh5r3Yw+laHd9q3m4lJP5Ufto8ONHnb
	 PqXO7nrfW+z+sp4X/Juzpy0AkOlw70EqDuowMQBqv7GxlSwgFgKG3Xywv/oTsvxM5i
	 ieDswU0arD2fk5ptkOP6Uo4Ty63CyBZ4jnTvij1EVkysNkABy52VSEvKGvmELL2xoN
	 x3QTZBFphYW4ov3zIuvwu744cKyxeaipfUPxRdpFWeckRobIWDoqivDm84V55in0Z0
	 PU2uMUcntIzeThbos1YQ0JcamUdFyvgbh+A2dlCG4L1t/7EBRsAUINiJtz4tlF/vcP
	 iVmhb1psTUkQg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqPsxvDf
  Z4PkJQYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNrwzbmgnbuira/11kbGF9wdjFycggJPGaU
  OPPFvYuRC8i+xiRx8UIjG4Szm1Fi8dXXjCBVbAJSEjfu/wdKcHCICOhJXP0nChJmFlCRePG7h
  x3EFhawkVh0Zg8TiM0CFL9wfCuYzSvgKLH+ywZmEFtCQEFiysP3YDangJPEt1VPmCCOcJRoOb
  KEEaJeUOLkzCcsEPMlJA6+eAHVqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNZcWpRWWqRrqGFXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg6KYUq5/cwbhh2R+9Q4ySHExKorxKj7qThfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwR
  of1JgsJFqWmp1akZeYA4wgmLcHBoyTCK+QNlOYtLkjMLc5Mh0idYlSUEudVAekTAElklObBtc
  Fi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV43X6ApPJl5JXDTXwEtZgJavJG/C2RxSSJ
  CSqqBaYXL8YN/TT4mcG7P9j8ulLLknMfabbu6FSs235r4PsqF5/jMnOdrZ//667rvySWWW3/9
  wy6t6hTwCJkgccDv+G4dM27/R48+fd6boP+uoYd/k3+/3OW3u7RWsOv/9KtcIFK8RzC6mVXw4
  6dyVla/ORn5rAVTDvIa63dPv1hx6k/5h1XbYmPLe4yWbl5RtWDz5i+qlm/OZPXzv0oS/3owJ9
  Dlzj+Nhw8Lr865PO+spabg93NL/fWrjSPjj3qFGJo0/Spd8/n2a6X8s8y//r7d4OqbkPGubef
  FCSeO7NvJ+qxlmvxea1mLP9eXrlv4zU+HQelJUaps3XGFy69m7igV7/916LRwz7ofpn95d/GW
  qa9UYinOSDTUYi4qTgQASrngTFgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-565.messagelabs.com!1670207473!167359!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3612 invoked from network); 5 Dec 2022 02:31:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:31:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 02E12100194
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:31:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id EA8C2100191
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:31:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:31:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] shaderc: upgrade 2022.3 -> 2022.4
Date: Mon, 5 Dec 2022 10:30:39 +0800
Message-ID: <1670207442-7087-2-git-send-email-wangmy@fujitsu.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174267

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 - Update to Glslang 11
 - Update SPIRV-Tools, SPIRV-Headers dependencies
 - Add Cmake BUNDLE DESTINATION option for target install
 - The code coverage build is no longer being tested

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../shaderc/{shaderc_2022.3.bb => shaderc_2022.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2022.3.bb => shaderc_2022.4.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2022.3.bb b/meta/recipes-graphics/shaderc/shaderc_2022.4.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2022.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2022.4.bb
index c340646fa7..0fe6887cbc 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2022.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2022.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "4bbb646ddb3279c6a27e7aa0eb86c10c8add987b"
+SRCREV = "067e008c80c323b1cd1ab1e547b38f9a5f52269e"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.25.1


