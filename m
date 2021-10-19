Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682C6C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:10 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.15342.1634673249675128205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OAuux/Z/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id e10so9569622plh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9Fsrw68JMo5eHRbFzkc2/U14VJU5w5RrrIxbQ1/fYXA=;
        b=OAuux/Z/a6HB+DCVE/wE3Xlz5T4wMZ5YUWGbcUHjq6l4JHVDc6NnmYpkGE2C0Eah2z
         Aqo6+dJryCil4Xmxx0PdDqWYdgzLMwTELamqsMufW0+FYKTsmykBW2DytM4lVjSUz3vc
         tfIH4bVkGQQHAGXw6152z4sDJPGNtkhodpheo9kq7PImC1VK8aoL6rUa6UQKRLUmIpna
         HttFQTbmo1Ly+LX2A4DAfMTAwcu0F2/Ti064farBXz+TOa9XPYtShIANYKpcTBH7O4j9
         ElT3LYClQu8z91wef5gLe3MYweF9w6Uk/KDWwirXylozdAJvW+GodY0u7ANezIlkhW0W
         Bruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Fsrw68JMo5eHRbFzkc2/U14VJU5w5RrrIxbQ1/fYXA=;
        b=W5ASbzew7uWI8EUNs2K5bwpCGZq1MFXY2M2/09+nS2S422vVd1c49M3fcmBbv0YvZm
         5XNxWz/sl8Znf0v0mZeAX5jNkOh7yQNckCri4metHlynHdi8EONJ8HIFLP8Y4lG/FIUc
         PewUaOEmpgRVi3XEz9sqhqOjHcPTYXSSTFuoSIi26z39tr3Za4nB+LXa7+vkpz1UsYJQ
         Fd1o/54zdt0/d7DIFEqYh6TjK78UuNalYROFlqUY09u5PbJ82Gh+AwuVdDT+ZiO8mzEH
         wVIbKKCZkgjYkHUoHB5jSYL3+SlJkBl963ZgLbXKVboujMHy038bAiA/KXqdvRHvyVp9
         /mRg==
X-Gm-Message-State: AOAM533YPfhPYTYlT2n6YzCBUFxiw7rqi0rTUf1xiWxFjt/UkhCNc9Hk
	n+DEbhf6nZyOxCQlYlTzLzkqCYb04U5q6dDvIiQ=
X-Google-Smtp-Source: 
 ABdhPJxt6yzp82o9K3I28GtHQL2N8Qxd8eEG63hNFVCvXdBNpYR4bz1E2xKmobDuxa596rKx/ilrvQ==
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr2129015pjv.54.1634673248576;
        Tue, 19 Oct 2021 12:54:08 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/38] ffmpeg: Add fix for CVEs
Date: Tue, 19 Oct 2021 09:53:12 -1000
Message-Id: 
 <89df45b9e69a0d5c62a7e05156bc0d3fc85c77fd.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157206

From: Saloni <salonij@kpit.com>

Add fix for below CVE:
CVE-2021-3566
Link: [http://git.videolan.org/?p=ffmpeg.git;a=patch;h=3bce9e9b3ea35c54bacccc793d7da99ea5157532]

CVE-2021-38291
Link: [http://git.videolan.org/?p=ffmpeg.git;a=patch;h=e01d306c647b5827102260b885faa223b646d2d1]

Signed-off-by: Saloni Jain <jainsaloni0918@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2021-3566.patch         | 61 +++++++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2021-38291.patch        | 53 ++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |  4 +-
 3 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2021-3566.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2021-38291.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2021-3566.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2021-3566.patch
new file mode 100644
index 0000000000..abfc024820
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2021-3566.patch
@@ -0,0 +1,61 @@
+From 3bce9e9b3ea35c54bacccc793d7da99ea5157532 Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Mon, 27 Jan 2020 21:53:08 +0100
+Subject: [PATCH] avformat/tty: add probe function
+
+CVE: CVE-2021-3566
+Signed-off-by: Saloni Jain <salonij@kpit.com>
+
+Upstream-Status: Backport [http://git.videolan.org/?p=ffmpeg.git;a=patch;h=3bce9e9b3ea35c54bacccc793d7da99ea5157532]
+Comment: No changes/refreshing done.
+---
+ libavformat/tty.c | 21 ++++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/libavformat/tty.c b/libavformat/tty.c
+index 8d48f2c45c12..60f7e9f87ee7 100644
+--- a/libavformat/tty.c
++++ b/libavformat/tty.c
+@@ -34,6 +34,13 @@
+ #include "internal.h"
+ #include "sauce.h"
+ 
++static int isansicode(int x)
++{
++    return x == 0x1B || x == 0x0A || x == 0x0D || (x >= 0x20 && x < 0x7f);
++}
++
++static const char tty_extensions[31] = "ans,art,asc,diz,ice,nfo,txt,vt";
++
+ typedef struct TtyDemuxContext {
+     AVClass *class;
+     int chars_per_frame;
+@@ -42,6 +49,17 @@ typedef struct TtyDemuxContext {
+     AVRational framerate; /**< Set by a private option. */
+ } TtyDemuxContext;
+ 
++static int read_probe(const AVProbeData *p)
++{
++    int cnt = 0;
++
++    for (int i = 0; i < p->buf_size; i++)
++        cnt += !!isansicode(p->buf[i]);
++
++    return (cnt * 100LL / p->buf_size) * (cnt > 400) *
++        !!av_match_ext(p->filename, tty_extensions);
++}
++
+ /**
+  * Parse EFI header
+  */
+@@ -153,8 +171,9 @@ AVInputFormat ff_tty_demuxer = {
+     .name           = "tty",
+     .long_name      = NULL_IF_CONFIG_SMALL("Tele-typewriter"),
+     .priv_data_size = sizeof(TtyDemuxContext),
++    .read_probe     = read_probe,
+     .read_header    = read_header,
+     .read_packet    = read_packet,
+-    .extensions     = "ans,art,asc,diz,ice,nfo,txt,vt",
++    .extensions     = tty_extensions,
+     .priv_class     = &tty_demuxer_class,
+ };
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2021-38291.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2021-38291.patch
new file mode 100644
index 0000000000..e5be985fc3
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2021-38291.patch
@@ -0,0 +1,53 @@
+From e01d306c647b5827102260b885faa223b646d2d1 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2021-3566
+Fixes ticket #9312
+Signed-off-by: James Almer <jamrial@gmail.com>
+Signed-off-by: Saloni Jain <salonij@kpit.com>
+
+Upstream-Status: Backport [http://git.videolan.org/?p=ffmpeg.git;a=patch;h=e01d306c647b5827102260b885faa223b646d2d1]
+Comment: No changes/refreshing done.
+---
+ libavcodec/utils.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/utils.c b/libavcodec/utils.c
+index 5fad782f5a..cfc07cbcb8 100644
+--- a/libavcodec/utils.c
++++ b/libavcodec/utils.c
+@@ -810,20 +810,22 @@ static int get_audio_frame_duration(enum AVCodecID id, int sr, int ch, int ba,
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
+2.20.1
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index 0e359848fa..1d6f2e528b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -27,7 +27,9 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://CVE-2020-12284.patch \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
-           "
+           file://CVE-2021-3566.patch \
+           file://CVE-2021-38291.patch \
+          "
 SRC_URI[md5sum] = "348956fc2faa57a2f79bbb84ded9fbc3"
 SRC_URI[sha256sum] = "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
 
-- 
2.25.1


