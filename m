Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CACAC63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:21:27 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.134711.1673760079686764910
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EfwvE1Tw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760077; i=@fujitsu.com;
	bh=+JKje9OEgeIYBsP6EezGiy3ej+sC2jQaitXXTmVsz0g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EfwvE1TwVLPiZQirLje0QvxNSR7U+bTkCeHqJaclHgKDFKV7bN17UeyKKW7I2/zgf
	 jWSvgVk505wN1M8b2afqCZG+XMoQJT3tUKx2i0j8SADjka0v0ouFWB67t3YWXEUaUC
	 IgpakxZ9WR7dbmD96xJ2C3tRX4tUDBSw2hQgGBt5BoMoZ9i7idEZeEhH8jdsfo1h0p
	 jhiQablo++CFWI0B5jyl6YWlVpa0/8SYZztHnmG1Yc2GpO1/nUMdqfJWDlU3PnSkpO
	 Eh9sTWxbrIQowrVi/oj3LleSWa7bLpnLTNSfVsTs1YRuwz/8gDaM/3cJINQNtrhYsJ
	 Bl5EULs5xNlfw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8OxWden93C
  ywaYPMhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0brqR3MBTe5KxY3rmFqYNzI1cXIxSEk8IBR
  4u3XtaxdjJxAzmUmiWWH+SDsvYwSVye6gthsAlISN+7/Z+ti5OAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSxgJfFn7iVGkBIWAVWJWYvkQMK8Ao4Sj7ZMYgGxJQQUJKY8fM8MYnMKOEks7JnBDrHJUe
  LYy09sEPWCEidnPmGBGC8hcfDFC2aIXkWJ2ZeboeZUSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFacWlSWWqRropdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yT
  opeXWrKJERi2KcVJNjsY/y79o3eIUZKDSUmUN/LboWQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rwbGg8nCwkWpaanVqRl5gBjCCYtwcGjJMKr3QGU5i0uSMwtzkyHSJ1iVJQS503uBkoIgCQySv
  Pg2mBxe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK8ByHiezLwSuOmvgBYzAS0OqT8Isrg
  kESEl1cCU3++o9+3dyrD/q5iLkz4aHBX41n6jQZWBWejmmcfHlJ6dr7G+auO9umul0e51KnKX
  7nu+YLkRls7Fc62h94rYiYuzNVpVpps42N8psbWtUC/Ijd7vG17YuFU07uL2KK5LAlsWv9356
  9N+9X8lvRdPvGz/zDgxb9X1iO13Ouw8ChVNyqKsU2WmixUoHn9+4fbU9LWeTVv2szlXy2/+KP
  CsuNMioyqsY8GFkAv7lsnv2zhlt/mLEqfHp86YBlazT157/fBnIU3f5f4BDxd8tNu66ls4D0O
  7fUxhEtsku5X3VkzdpXE88Pubt36T472srtirH93zyW3//s2MNf/X3hY7cmLrov3xr0w3WF+7
  omVbpMRSnJFoqMVcVJwIAOnTLGdWAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1673760076!229334!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12463 invoked from network); 15 Jan 2023 05:21:16 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:21:16 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id ED05C142
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:15 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E16D573
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:21:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libwebp: upgrade 1.2.4 -> 1.3.0
Date: Sun, 15 Jan 2023 13:20:53 +0800
Message-ID: <1673760055-2483-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673760055-2483-1-git-send-email-wangmy@fujitsu.com>
References: <1673760055-2483-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175864

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* add libsharpyuv, which exposes -sharp_yuv/config.use_sharp_yuv
  functionality to other libraries; libwebp now depends on this library
* major updates to the container and lossless bitstream docs (#448, #546,
  #551)
* miscellaneous warning, bug & build fixes (#576, #583, #584)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webp/{libwebp_1.2.4.bb => libwebp_1.3.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.2.4.bb => libwebp_1.3.0.bb} (95%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb b/meta/recipes-multimedia/webp/libwebp_1.3.0.bb
similarity index 95%
rename from meta/recipes-multimedia/webp/libwebp_1.2.4.bb
rename to meta/recipes-multimedia/webp/libwebp_1.3.0.bb
index 263589846a..7b4d138d2c 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.3.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df"
+SRC_URI[sha256sum] = "64ac4614db292ae8c5aa26de0295bf1623dbb3985054cb656c55e67431def17c"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.25.1


