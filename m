Return-Path: <bhavesh.maheshwari@einfochips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982D8C982C5
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:13:17 +0000 (UTC)
Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13334.1789560785946635924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@einfochips.com header.s=NAESA-Selector1 header.b=GrE9c9tC;
 spf=pass (domain: einfochips.com, ip: 216.150.161.27, mailfrom: bhavesh.maheshwari@einfochips.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=3122; q=dns/txt;
  s=NAESA-Selector1; t=1789560795; x=1821096795;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qwY6+tthqFqojtd1Ir3v0R6aMK1OUCzds47TZ4j5q7s=;
  b=GrE9c9tCtZAfKmoNeIfU7jFXgSrPsktMWU/vURW3KnT/R9rdLq8sukd4
   YJ8G5bp0sww1IgUAvJHrt9ZYF0tE5iCkcD2xiufOhYTf8T830Yp0ZbuYT
   Ja9+7o3IXM8pLU67a1T5innzxJcjv1gcr1mmNnBD1nyyEXj5N7IA6l0+A
   dyliG03yfczbvHIiaCzSOd2lyrj7R/F0SAKicaKYsfDcZSoe6PBQ1Aw4R
   lpX9eRUcka+wGa3O38VOAa6VO/LUNnbjsMhls5ICbKmYa4G7isrHQJwiw
   B8UELkDamcIC1X93fD4INGtKTavxarROo6OLI4qFJ8FrKotbWseMlQzko
   Q==;
X-CSE-ConnectionGUID: QE4TKtiKSrqeUGfBXWH/Sg==
X-CSE-MsgGUID: QhUUozJnSJiYpWOzMLazKA==
X-IronPort-AV: E=Sophos;i="6.27,103,1787032800"; 
   d="scan'208";a="63580028"
Received: from unknown (HELO 6T8J9X2.ap.corp.arrow.com) ([10.126.18.101])
  by naesa06out.arrow.com with ESMTP; 16 Sep 2026 06:13:14 -0600
From: bhavesh.maheshwari@einfochips.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose,v2][oe-core][PATCH 06/10] ffmpeg: Fix for CVE-2026-64835
Date: Wed, 16 Sep 2026 17:39:29 +0530
Message-ID: <20260916121258.1699611-6-bhavesh.maheshwari@einfochips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
References: <20260916121258.1699611-1-bhavesh.maheshwari@einfochips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245960

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1836ef96846937a6cc2443698a693104f5c0b21e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64835

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
---
changes in v2:
- rebased on new CVE fix
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
index c00c3f32b7..8d3b0dd79e 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64832.patch \
            file://CVE-2026-64833.patch \
            file://CVE-2026-64834.patch \
+           file://CVE-2026-64835.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
-- 
2.43.0


