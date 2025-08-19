Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703F5CA0FE0
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 03:35:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.5629.1755574541006345691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 20:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hQKP2sfx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755574541; x=1787110541;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zRnLJq6OiaDYv1UmO0VIQuVSgMjHONnC8nuLXbSm1II=;
  b=hQKP2sfxtsI+0OO3KVAArTxhjPjME5GYyPyZkNilOIZ/k9Pf/Y28rJ5G
   Htf2GQKM0JkeTsPqnFKYg1IsPH4vd9UzEM0Q/+KdhnToSM4et3qTu/Wvv
   CC8K97JjjTtv4JTSzjBfPH/MvAmUYYYEuRJKEvHzHQUcVZFteK8ZmQBU6
   3+/ofv+KYLEbePebSdTOrs/zamxG8r8xKLK56prOQbrf6FUjvs05A808Q
   bmdkr9lgAIdZ1qgjOKEBn1hX4NBEZTR9Y9HThlTmG0ZLNWJW9QSCFziYo
   1H4tFQQfLu1tmfOjlbhN3XK6JhYR4qWnGTsfrW/sjoL+UEk6W+D9akqkw
   Q==;
X-CSE-ConnectionGUID: 4OnZCyc8TbKBhBXRyY10bQ==
X-CSE-MsgGUID: Dp3XM5n7Qx6iFkgGudGP1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="197097619"
X-IronPort-AV: E=Sophos;i="6.17,300,1747666800"; 
   d="scan'208";a="197097619"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:35:39 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 205661C1C707
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:39 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id D3128140122F
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:38 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id D0CE11400096
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:36 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4FFFA1A000B;
	Tue, 19 Aug 2025 11:35:33 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 01/11] gst-devtools: upgrade 1.26.3 -> 1.26.5
Date: Tue, 19 Aug 2025 11:34:22 +0800
Message-ID: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222061

Refer to release note, no changes this time
https://gstreamer.freedesktop.org/releases/1.26/#1.26.5

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.26.3.bb => gst-devtools_1.26.5.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.3.bb => gst-devtools_1.26.5.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index aeb296aa96..34fcf6a30a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 9ed608c901955b0906aac102d5d7ab06accee60e Mon Sep 17 00:00:00 2001
+From 13b0d8e55ad490c8e867c740da2a00eb49319f8e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
index f107af110b..b0de19c10d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "4fde19c3c144834f8cb05c2ca3f14b3a50d395bad203d17f98a6e70c1672f2ba"
+SRC_URI[sha256sum] = "63d46a8effa8a225e25a464ba7538ace853fe0dc1e70366b27c208135e5401ce"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.43.0


