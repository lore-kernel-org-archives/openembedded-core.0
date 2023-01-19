Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93607C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 14:10:31 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.45820.1674137422504863169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 06:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d5Ab7zJc;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id jl3so2396851plb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 06:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4WFzstPnDHrux4NoZ4Wu8HarRbYz12h/KldATux3No=;
        b=d5Ab7zJc1uU8go0tYVLEpXuvK0k0Nnt3klToveCmsvGMb7utjb9hem8Wvcvnj11yPK
         9jiE3y032OsxrdxWSdpB1q5jxaK3Mr9Xgh+5lj9uzEaaOAgKWpsb36XlU+1iz+4Ozpkq
         qvK7Q/nwF63FRz65T2WsHSmZaP3cfFrwc3ciLOYUERpNmH2IUkjZgDuJx9zjN3ohQJOu
         Q7EktOqTYGuuw56RwAaUsS0x00KsIYyz77rqUYPtPor0osiRPp4n+nhb6c7SyMvslWgH
         gQFB6Xn0PriGfJCpsBhxW6PEFAcvl69U5FEN723UhBnKD2Ix7RoGeEGSF8IrGXzp71eu
         m2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4WFzstPnDHrux4NoZ4Wu8HarRbYz12h/KldATux3No=;
        b=wTMqDSuSSR+SwQwjmp+zs3GyuXQKLZOG32P8CCI85Ym6sj7brU0r3OUEwvByxxCap3
         vpRhkwirdYP4vG5Gw9vMqOjmJZ4ENVrM4vRwXo5d74d6B52Q/MMRiymg1hu8edzJVuR+
         GY2Nvtsw5KBm8TcmqmBJZ9x1klNN8dswLr2t6ndgOCC1viZLD2r153Aphbd1WrqtFKWy
         WS5t3UFVIEdYOoi3ol5XttONEF6TOaERjfUwdwIeP9/l8/V/AH1d2Ja+b8qWe2/Ha4rx
         q7LwNHnpa63B0XabO9y0l60DJbm93lcX2rW9ZhbFU24x1Y3qfn+bT927I9af/8PyoJWJ
         Pw9w==
X-Gm-Message-State: AFqh2koiYBRFCYwG30XMzMiJklh+ipZpheAm36wAByZMa6mh1o62nkJ8
	kRcP9IVGYBMRD1wSrJsNTtSpAeCktWI=
X-Google-Smtp-Source: AMrXdXtntCwq0lnCHMZ1vAIxIeXuknxFesPoJdjvVemf3br2dm3ADakcMZJJpGDWehOd61nhGHtzRQ==
X-Received: by 2002:a17:902:f54c:b0:192:fc9c:a238 with SMTP id h12-20020a170902f54c00b00192fc9ca238mr12929975plf.66.1674137421503;
        Thu, 19 Jan 2023 06:10:21 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f26:4599:1c0c:7224:d887:59a9])
        by smtp.gmail.com with ESMTPSA id q3-20020a17090311c300b0018c990ce7fesm25116348plh.239.2023.01.19.06.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:10:20 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: akash.hadke@kpit.com
Subject: [OE-core][dunfell][PATCH] ffmpeg: Fix CVE-2022-3109
Date: Thu, 19 Jan 2023 19:39:34 +0530
Message-Id: <20230119140934.29733-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 14:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176140

From: Bhabu Bindu <bhabu.bindu@kpit.com>

Add patch to fix CVE-2022-3109

Link: https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
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
2.17.1


