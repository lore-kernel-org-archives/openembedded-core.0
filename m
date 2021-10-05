Return-Path: <jainsaloni0918@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC05CC433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 15:02:40 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.1861.1633446160425647193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 08:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JILH64pl;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: jainsaloni0918@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so2267741pjw.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 08:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=FJoe0yvmxYBZ+rrCrq4BSYnU7pk0gGYBebpCvUwehbE=;
        b=JILH64plwpliKsKi397U4oHbfYT8nG79ZPyiFp561sAXsT8JCNZjlEIeJ+OTxmbavw
         DGrO9w6xvxcSbJNRpLVUuSfiz8uL/WZkworLdKaLWWb9/IZD34OGyhJ0CK+BVysFxkeN
         AIYvo8U5J9DxrGPcRy6oC0wovXbOclFeRKoCDaCUhflPdCG4WUkRSDUIL5+4pkMpjrmG
         tzS/buD/BKECCjAmKgEG2//dr57ICKrJ3od8dTaPln4Uu/8yNSrLqo9COxx/enAMasTD
         Ku2M8qOP6LDqub7v2EZ/KCAVZxqv0gLPZC8k9xWO5X4cDSDyOFbQK64554nEIE4+AeA6
         iaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FJoe0yvmxYBZ+rrCrq4BSYnU7pk0gGYBebpCvUwehbE=;
        b=dNNqsASc5C6yVYEfsZH1bATstF2/Ps6Y6B4DyaWBdXj9LYexvJDM4rg0oEp0AadIlt
         f4RaoU96eG1m+t0y5zgbHhGJcXXR6M2/xXPY/2hkBltvhAuq1aX6jixmlrPs3+tXa3Bd
         gyYdQfOuTS56P/035D+OeAoXIanKr7JayELRu99KDy5xvMHBfUVnVBnWJorytEV0/VRh
         jGF74uYBYDvTECr13/Me1u4TeUxyXgUpnQZv9d7z3LXqkUZm0tx/ywadd0WB7Jt9osWt
         G8Irc/ki1oF5/Omaed4DBP/e64ebxABTZMII6au7XXaMpJWtILlLsLOeEvOLSQg3IjIp
         1sKg==
X-Gm-Message-State: AOAM532CswzGt4LSDrCTbDFqo1MiB16qwRGCIyp4kFI0s09XtNGzL1lW
	7Bxx1zBPPo4fU1zyElU/MKHRzQ/ue82fwA==
X-Google-Smtp-Source: 
 ABdhPJwtVJEIluRNlVAp0hCADEzbQfMuspNqh10tphVbc9YdSq9RHUyRGS92SxqZtVrDMcLvDFi/Yw==
X-Received: by 2002:a17:902:7d95:b0:13e:1272:884a with SMTP id
 a21-20020a1709027d9500b0013e1272884amr5776108plm.34.1633446159413;
        Tue, 05 Oct 2021 08:02:39 -0700 (PDT)
Received: from localhost.localdomain ([27.97.41.185])
        by smtp.gmail.com with ESMTPSA id
 d14sm17929331pfq.61.2021.10.05.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 08:02:39 -0700 (PDT)
From: Saloni Jain <jainsaloni0918@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Saloni <salonij@kpit.com>
Subject: [poky][dunfell][PATCH] ffmpeg: Add fix for CVEs
Date: Tue,  5 Oct 2021 11:02:21 -0400
Message-Id: <20211005150221.26982-1-jainsaloni0918@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 15:02:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156648

From: Saloni <salonij@kpit.com>

Add fix for below CVE:
CVE-2021-3566
Link: [http://git.videolan.org/?p=ffmpeg.git;a=patch;h=3bce9e9b3ea35c54bacccc793d7da99ea5157532]

CVE-2021-38291
Link: [http://git.videolan.org/?p=ffmpeg.git;a=patch;h=e01d306c647b5827102260b885faa223b646d2d1]

Signed-off-by: Saloni Jain <jainsaloni0918@gmail.com>
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
2.17.1


