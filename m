Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E89C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:59:19 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.5036.1665478752946854722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CnuTocqs;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665478750; i=@fujitsu.com;
	bh=i50YflIRWpzzSxksLoTa94pad74xsBZr4tFdeEW23Lg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CnuTocqsBM4ahaQjr3mT+ymuN24U00+Q+Hf9ui8CPDHpknmmSbdBfEgSuoQnkZiEq
	 2RtbyJFJza9PKBxyd7B1NGBDvMAFEjoXfGGttmKWkrrUFEsWp4w7ZZ1zsDsQ87okRL
	 Ld/oJcdY5tdKcE9s49wZVuqtzChBMd7eNWyz8CJu2wIpeqD9PSyABQhDxA5eRnReyx
	 U12MMCEHDwcoOvl6stWjDqBQeCIoziAK3s49bLa1WMuNVn3Jlippc12SQrC+E6idyL
	 hLOoDEjaf7qFF4GVfLs7oR4UkNe0tLZP0OZ+6J95j4L7bP8ATMOCRJMfNlLhRz3X2P
	 B2JMJ5052M6jw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxSTfOwDX
  ZYOJkFos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPdduuCbdwVr3+0sjQwTuXqYuTiEBJ4zCgx
  b+l0ZgjnGpPEvanzmSCcPYwSD4+3MHYxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAtcTjOzOZQGwWAVWJVdeaweK8Ak4ST9/8ZQaxJQQUJKY8fM8MEReUODnzCQvEHAmJgy
  9eQNUoSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJNUlJmeUZKbmJmja2h
  goGtoaAqkjXUtTPQSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OTc1L08lJLNjECwzKlOD1k
  B+OZfb/0DjFKcjApifJ2qbsmC/El5adUZiQWZ8QXleakFh9ilOHgUJLgnawLlBMsSk1PrUjLz
  AHGCExagoNHSYR3qQpQmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4rzJ+kBFAiBFGaV5cC
  Ng8XqJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvOZApPJl5JXCbXgEdwQR0xMmrTiBHlCQ
  ipKQamKrXv83O3hH2+WVIh2Sk57yCDYvTf7GLG6eWNysEHu2Ua/tbJsdkk/rg7IKu4BIrHRvH
  o37bDgvv3LcnaNbjFxPiGUpnBO3QCosM/HnvYZHQppsqc9OPTD6rE/JHg7/b9NGFlQrHVDonv
  P6tKfRx2uyFLg1OMsteTFQst33Aa+jEu2/t3WmBW9vtJOe9f/j+9rEvyzVnyu57OrX4hHJdrM
  5N+8+T7tZkR+3KnHSKjdH/19vH2zfIGB15OtHwkJPuYieT42ulvk1WfZ0pxDp/x/aVyxfEJur
  59f4WY9I0nMsxW4Rt1WHhvaaK928J/pzy94B092P+2wJrSndJXosSONB9cMWmtjRJnrVuTNtD
  3xxVYinOSDTUYi4qTgQA/tz/71IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-745.messagelabs.com!1665478749!6972!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20735 invoked from network); 11 Oct 2022 08:59:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:59:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7C0B91000F5
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:59:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6F8571000EE
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:59:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:59:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libwpe: upgrade 1.12.3 -> 1.14.0
Date: Tue, 11 Oct 2022 16:58:48 +0800
Message-ID: <1665478730-16815-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:59:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171617

Changelog:
========
 New API to provide input events to be treated by WebKit as gamepad inputs.
 New API to configure the target refresh rate of view backends.
 New API which allow clients to supply an alternative mechanism for spawning WebKit auxiliary processes.
 New WPE_ENABLE_XKB build option, enabled by default, which can be used to avoid usage of libxkbcommon.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-sato/webkit/{libwpe_1.12.3.bb => libwpe_1.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.12.3.bb => libwpe_1.14.0.bb} (88%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.12.3.bb b/meta/recipes-sato/webkit/libwpe_1.14.0.bb
similarity index 88%
rename from meta/recipes-sato/webkit/libwpe_1.12.3.bb
rename to meta/recipes-sato/webkit/libwpe_1.14.0.bb
index 77ca517ef7..a08304d280 100644
--- a/meta/recipes-sato/webkit/libwpe_1.12.3.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.14.0.bb
@@ -11,7 +11,7 @@ inherit cmake features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b84fdbfbc849ce4fdf084bb28b58e5463b1b4b6cc8f200dc77b41f8545d5329d"
+SRC_URI[sha256sum] = "c073305bbac5f4402cc1c8a4753bfa3d63a408901f86182051eaa5a75dd89c00"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.25.1


