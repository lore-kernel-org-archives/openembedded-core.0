Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82D6C88E40
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:34:24 +0000 (UTC)
Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14218.1789047242011078389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=mwGs4cBg;
 spf=pass (domain: einfochips.com, ip: 216.150.161.23, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3075; q=dns/txt;
  s=NAESA-Selector1; t=1789047255; x=1820583255;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=N6TR5i4LTCrhGSKkYGjkkw7pb2hm8qeVvuE9C851HKc=;
  b=mwGs4cBgYEy3KQeV5LAstVtaP/4CxjP28JJSY5JUdi9Q41udw1EVIIXI
   E1jtnndHVqmAg6jx35Gd0ks3u0mlI5vazZw6wyd+ZwH6ionxoZtOAeaEs
   2SZlk8xF5dcvkuEJvQnXaJyvJkcyWVK2wVnpY5k2DSH/lPfkSxszJEWiP
   flzA9vFTtOjGx+3AOUdiWO3EZqRPgS57+AOnH51r1NKdiB930xUD7fDPv
   miK7lpxBJRjEUi+FReRXnc8IFN8nHj4O+aobr6rqj3yuylUbvJvMkjLW6
   BnlU2ADHPEl71zP6pBhVsNaR+c+JVxoXVxXvEJr/4FbUiBO42n4cpdirH
   A==;
X-CSE-ConnectionGUID: 9fvIy2oKR1adauDs5tYjRw==
X-CSE-MsgGUID: qd8GlE8DQdGbzBHrzUKvVg==
X-IronPort-AV: E=Sophos;i="6.27,95,1787032800"; 
   d="scan'208";a="122105811"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa03out.arrow.com with ESMTP; 10 Sep 2026 07:34:14 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][oe-core][PATCH 06/10] ffmpeg: Fix for CVE-2026-64835
Date: Thu, 10 Sep 2026 19:01:40 +0530
Message-ID: <20260910133357.452394-6-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245575

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1836ef96846937a6cc2443698a693104f5c0b21e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64835

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
 .../ffmpeg/ffmpeg/CVE-2026-64835.patch        | 45 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64835.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64835.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64835.patch
new file mode 100644
index 0000000000..735bd1176f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64835.patch
@@ -0,0 +1,45 @@
+From 99c7dfd80d63bf009a102d3278a9f98b2fe68002 Mon Sep 17 00:00:00 2001
+From: Pavel Kohout <disclosure@aisle.com>
+Date: Mon, 29 Jun 2026 23:46:16 +0200
+Subject: [PATCH 4/9] avcodec/adx: sync decoder channel state on NEW_EXTRADATA
+
+Fixes: out of array access
+Fixes: heaNtmHvklpe
+Fixes: 92396cee602320c714713ca2d93b53684ad57000 (avformat: add CRI AAX demuxer)
+Found-by: Pavel Kohout (Aisle Research)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-64835
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1836ef96846937a6cc2443698a693104f5c0b21e]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavcodec/adxdec.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavcodec/adxdec.c b/libavcodec/adxdec.c
+index 21be6fe..10fd81d 100644
+--- a/libavcodec/adxdec.c
++++ b/libavcodec/adxdec.c
+@@ -172,6 +172,7 @@ static int adx_decode_frame(AVCodecContext *avctx, AVFrame *frame,
+     new_extradata = av_packet_get_side_data(avpkt, AV_PKT_DATA_NEW_EXTRADATA,
+                                             &new_extradata_size);
+     if (new_extradata && new_extradata_size > 0) {
++        int old_channels = c->channels;
+         int header_size;
+         if ((ret = adx_decode_header(avctx, new_extradata,
+                                      new_extradata_size, &header_size,
+@@ -180,6 +181,10 @@ static int adx_decode_frame(AVCodecContext *avctx, AVFrame *frame,
+             return AVERROR_INVALIDDATA;
+         }
+ 
++        c->channels      = avctx->ch_layout.nb_channels;
++        c->header_parsed = 1;
++        if (old_channels != c->channels)
++            memset(c->prev, 0, sizeof(c->prev));
+         c->eof = 0;
+     }
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index b988fe2293..8d9e975721 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64830.patch \
            file://CVE-2026-64833.patch \
            file://CVE-2026-64834.patch \
+           file://CVE-2026-64835.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


