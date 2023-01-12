Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC15C46467
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 02:33:34 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.45160.1673490808451027372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 18:33:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Q1LfEa1K;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso19302837pjo.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJRv9Qp3PuyZ9Xaxe4dk4TnbuULEy7brUPWl47voCeA=;
        b=Q1LfEa1KizDBKAKR4Ta1VPlzq9Kj5SmIYZZJ1lEokKfpd5wJfhlwQFwS2D8Gy1ffXr
         tpbAFzx+jTXk6F4PVWy42TFLvjt2t8GFnfolwR8wugwTM6KFHuT63YNxy8OMDx/Leala
         r4Jvhcd89xo5GosaDu/mlccuPdQGuO3EvtNUCvdHnQNzgzt4ZTV0mLIKrxwWpXz1iAVv
         pw66Rg/feMF8OpsTU9WKo9UvVTHneqJ3BbphKGvrTXd7dDgenqI3FOX9adL4zfaXPaDC
         yu1V3aEty+BL7HgTAPdP1ERlanYjS6uCaSjwy67ClyKi7RLF/id8NSKCWWSkDwPFboP4
         iD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJRv9Qp3PuyZ9Xaxe4dk4TnbuULEy7brUPWl47voCeA=;
        b=p/6TzL++I14Eicvcj/QAfFFftUwMr50jNenY4unvo7XqhM1cqC56mWVt1P3RayZRvS
         vf+Y8YJg6fWOhJCFABo+uI2dDOYUGa18XDnShiLsnIMjVPZw2uat4SJJjxRCD9tquv1A
         Zxwv/Y+Xfc9f7F/87bMr+3i9dgR2aPBRp85PCePDc5TQTsmfX0BAR/tVGK13Suz/EWR9
         LdqmDjnrwjpTxZ8AmvpRFhAenB9K42u8cyKvbmgttZ+YY/ZPpRUnBOetUfVedRI3v1r9
         f4JVYQyPJI/P2195mLWKFOJ/DtcSqvFWs7v7MBEPbJanjIqqnj2fnSo4mfdCamE1WvkI
         S84A==
X-Gm-Message-State: AFqh2krvoUVa7G/BI0d3bdI7rdKKifkS/Z0K+J1WwSFCEK/9o+ejnbeH
	6LmU/GrLpdO8qyUW69Ldj01sJ8cX/ugnXsChHhc=
X-Google-Smtp-Source: AMrXdXsV+XuCJrBld1QxRFjKhxNnbBuoavhQdy9S9yGxsxpyyOfB2DYGF7ZMI1YEg6Pg1rN+02eSwA==
X-Received: by 2002:a17:903:482:b0:192:f961:c391 with SMTP id jj2-20020a170903048200b00192f961c391mr29279673plb.53.1673490807423;
        Wed, 11 Jan 2023 18:33:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b00192d389db91sm11006719plg.75.2023.01.11.18.33.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 18:33:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/11] ffmpeg: fix for CVE-2022-3109
Date: Wed, 11 Jan 2023 16:33:04 -1000
Message-Id: <30119a4797c89b8b501246c4266b08a62467833d.1673490673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673490673.git.steve@sakoman.com>
References: <cover.1673490673.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 02:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175776

From: Narpat Mali <narpat.mali@windriver.com>

An issue was discovered in the FFmpeg package, where vp3_decode_frame in libavcodec/vp3.c lacks check of
the return value of av_malloc() and will cause a null pointer dereference, impacting availability.

CVE: CVE-2022-3109

Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568]

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-vp3-Add-missing-check-for-av_malloc.patch | 44 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
new file mode 100644
index 0000000000..94858a6cdd
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
@@ -0,0 +1,44 @@
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
+Reviewed-by: Peter Ross <pross@xvid.org>
+Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
+
+CVE: CVE-2022-3109
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ libavcodec/vp3.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c
+index e9ab54d736..e2418eb6fa 100644
+--- a/libavcodec/vp3.c
++++ b/libavcodec/vp3.c
+@@ -2679,8 +2679,13 @@ static int vp3_decode_frame(AVCodecContext *avctx,
+                                         AV_GET_BUFFER_FLAG_REF)) < 0)
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
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 95b4bf50ac..c5bebe9c2d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -26,7 +26,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
            file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
-           "
+           file://0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch \
+          "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
 
-- 
2.25.1


