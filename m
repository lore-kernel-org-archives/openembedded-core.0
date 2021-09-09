Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.2192.1631207599221237288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 10:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ksurendr@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 189HDIbf014753
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Sep 2021 10:13:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 189HDHqc007509
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Sep 2021 10:13:18 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 10:13:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 9 Sep 2021 10:13:17 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 10:13:17 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 22123)
	id 2C765900244; Thu,  9 Sep 2021 10:13:17 -0700 (PDT)
From: kiran.surendran@windriver.com
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] ffmpeg: fix CVE-2021-38291
Date: Thu, 9 Sep 2021 10:13:12 -0700
Message-ID: <20210909171312.40323-1-Kiran.Surendran@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kiran Surendran <ksurendr@ala-lpggp3.wrs.com>

backport from upstream

Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
---
 .../ffmpeg/ffmpeg/fix-CVE-2021-38291.patch    | 54 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38291.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38291.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38291.patch
new file mode 100644
index 0000000000..ef1c760286
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38291.patch
@@ -0,0 +1,54 @@
+CVE: CVE-2021-38291
+Upstream-Status: Backport
+Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
+
+From e908bdb157fa493be2b50e2a11055d19c5254a15 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Wed, 21 Jul 2021 01:02:44 -0300
+Subject: [PATCH] avcodec/utils: don't return negative values in
+ av_get_audio_frame_duration()
+
+In some extrme cases, like with adpcm_ms samples with an extremely high channel
+count, get_audio_frame_duration() may return a negative frame duration value.
+Don't propagate it, and instead return 0, signaling that a duration could not
+be determined.
+
+Fixes ticket #9312
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+---
+ libavcodec/utils.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/utils.c b/libavcodec/utils.c
+index 81e34254e8..5fdb10fe09 100644
+--- a/libavcodec/utils.c
++++ b/libavcodec/utils.c
+@@ -1776,20 +1776,22 @@ static int get_audio_frame_duration(enum AVCodecID id, int sr, int ch, int ba,
+ 
+ int av_get_audio_frame_duration(AVCodecContext *avctx, int frame_bytes)
+ {
+-    return get_audio_frame_duration(avctx->codec_id, avctx->sample_rate,
++    int duration = get_audio_frame_duration(avctx->codec_id, avctx->sample_rate,
+                                     avctx->channels, avctx->block_align,
+                                     avctx->codec_tag, avctx->bits_per_coded_sample,
+                                     avctx->bit_rate, avctx->extradata, avctx->frame_size,
+                                     frame_bytes);
++    return FFMAX(0, duration);
+ }
+ 
+ int av_get_audio_frame_duration2(AVCodecParameters *par, int frame_bytes)
+ {
+-    return get_audio_frame_duration(par->codec_id, par->sample_rate,
++    int duration = get_audio_frame_duration(par->codec_id, par->sample_rate,
+                                     par->channels, par->block_align,
+                                     par->codec_tag, par->bits_per_coded_sample,
+                                     par->bit_rate, par->extradata, par->frame_size,
+                                     frame_bytes);
++    return FFMAX(0, duration);
+ }
+ 
+ #if !HAVE_THREADS
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index 0a49493abd..3e7ceb859f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://fix-CVE-2020-22015.patch \
            file://fix-CVE-2020-22021.patch \
            file://fix-CVE-2020-22033-CVE-2020-22019.patch \
+           file://fix-CVE-2021-38291.patch \
            "
 SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
 
-- 
2.31.1

