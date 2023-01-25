Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42349C61D9D
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:27 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.46648.1674657742295117794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tW3facUc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id r18so13505429pgr.12
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jh+SmlUbXGGq7Ay5wurrHigFEShalXtI2xtEz33QvYs=;
        b=tW3facUcx0s7qKShkMnUc1bWc8+1C7k54vtut/+YuyaNAAewJprYQR07t+68hDTkRU
         /zFX4Buz5tkdKmUKkHjHXY17Ag2T8NPLFd0E/a9nAwxOm5bxdUuFtKhKO73urxpCCGd4
         E7pKZhxOqSuup8RtpCfl1VV8E7vfa9OjpP4J3VsIHr6zc/80HfwxKDcVBY5mOI7VgKCB
         i+ZOzKmEsI+RVxnvkPWxoXYjS2qusUA/rnOHm/M5rsf0/6FGhsklaxEL+edsx6go18+b
         9axmSbIRD3Ldi/ZCFaioSsgmZk3q4hoZBVW2Wbk/jzGbNYDpkgVsCsj6hkgLxpY3NUn+
         oFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jh+SmlUbXGGq7Ay5wurrHigFEShalXtI2xtEz33QvYs=;
        b=Gr9uvi3imh8jGk5srgFTeGylzftMDTHjFZcl4G/Jy7OA/tHhKIJxtGQpH4UYv+oq9r
         qdJsJvcN8c9FcCEBe8mBxMukuaFFJyuKGA3ZUBqy/na1uOG5SbPouDcEJ0fsrPx5TgGs
         ebOfL0acFFddqWfR7jtytAI6gTGQtmXB+qccwH2x8va11Y78asVbTvEiv05tjrwl0uC3
         H+hQp/MHD8ys2RfK5WQRnDh8WKS76OAwsMsy1zolBT/PEX+7KRRWU7FmkKubzmVgWo7a
         NlnP7dbjFX8BWjF7GHFtoUrqcG/X8k/8UTPgKvQTH3Rrs59xQt4O06WLJIIenAh6+q3+
         Wa7Q==
X-Gm-Message-State: AO0yUKWPF84NlbQ7HLShvKZCD3vJChJhxReuACI0jE1iaKGRa+O5ZYSV
	I+md1qz3x3zTPmWpqogfg0WgWoorc2ig06zdQqM=
X-Google-Smtp-Source: AK7set9sKhpaCm0o2scZsAc/GL70QWZJjoTf+1MoAV/v+P5SBwa3AbPQzNUwyQN1YluYXuqGdEyfew==
X-Received: by 2002:a05:6a00:21d2:b0:590:752f:3c54 with SMTP id t18-20020a056a0021d200b00590752f3c54mr574482pfj.14.1674657741332;
        Wed, 25 Jan 2023 06:42:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/16] ffmpeg: Fix CVE-2022-3109
Date: Wed, 25 Jan 2023 04:41:51 -1000
Message-Id: <a613a3d33f98770306161a3e9f3147f155ee0457.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176359

From: Bhabu Bindu <bhabu.bindu@kpit.com>

Add patch to fix CVE-2022-3109

Link: https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2022-3109.patch         | 41 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3109.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3109.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3109.patch
new file mode 100644
index 0000000000..febf49cff2
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3109.patch
@@ -0,0 +1,41 @@
+From 656cb0450aeb73b25d7d26980af342b37ac4c568 Mon Sep 17 00:00:00 2001
+From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
+Date: Tue, 15 Feb 2022 17:58:08 +0800
+Subject: [PATCH] avcodec/vp3: Add missing check for av_malloc
+
+Since the av_malloc() may fail and return NULL pointer,
+it is needed that the 's->edge_emu_buffer' should be checked
+whether the new allocation is success.
+
+Fixes: d14723861b ("VP3: fix decoding of videos with stride > 2048")
+
+CVE: CVE-2022-3109
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568]
+Comments: Refreshed hunk
+
+Reviewed-by: Peter Ross <pross@xvid.org>
+Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ libavcodec/vp3.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c
+index e9ab54d73677..e2418eb6fa04 100644
+--- a/libavcodec/vp3.c
++++ b/libavcodec/vp3.c
+@@ -2740,8 +2740,13 @@
+     if (ff_thread_get_buffer(avctx, &s->current_frame, AV_GET_BUFFER_FLAG_REF) < 0)
+         goto error;
+ 
+-    if (!s->edge_emu_buffer)
++    if (!s->edge_emu_buffer) {
+         s->edge_emu_buffer = av_malloc(9 * FFABS(s->current_frame.f->linesize[0]));
++        if (!s->edge_emu_buffer) {
++            ret = AVERROR(ENOMEM);
++            goto error;
++        }
++    }
+ 
+     if (s->keyframe) {
+         if (!s->theora) {
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index cbfdbf0563..ffeec92e0e 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2021-3566.patch \
            file://CVE-2021-38291.patch \
            file://CVE-2022-1475.patch \
+           file://CVE-2022-3109.patch \
           "
 SRC_URI[md5sum] = "348956fc2faa57a2f79bbb84ded9fbc3"
 SRC_URI[sha256sum] = "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
-- 
2.25.1


