Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD86EC54EB4
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:21:46 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.34074.1674440502628422957
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zJlYs2s0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id g205so7757947pfb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNHKXkvSMz8o15+a58c1SmUeAPgO/fn5OW8MY+EIdDg=;
        b=zJlYs2s0c8TuybkRVGghqLYaqHe5+I2m0ckKEhvAOXLKYXeDR/6Hy4Xbugv+teQcjk
         KUtynnRdbBcSeJ4ppymKZ/kGsEarh6g+F+xixpTDJbxd1wMaBb8DCTboBDpfMh3Jp8iU
         DriVR01RCah2SJ+Y0QQabrJ/dtFp+5/BbWtCCRTc9D0fVECOgkTZ2i8oBHpvTyN1P2TA
         BoNdj0xQTV7OsjROypu1yeXSV+2emvQd7s8Vg3x0Fm4U+553bhzOJnSVItuy1wPHLIDw
         efJwIKTORJKe746W0ZfVILOaak0/n9j9jGYmqBq+v8UBHBnJZMGUVLu2uimOs8wmMvp7
         BItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNHKXkvSMz8o15+a58c1SmUeAPgO/fn5OW8MY+EIdDg=;
        b=dLRb2V2LnZPva4LShPOnd4HgLUDJTYstriWlbDZIbSjLAVcGepnRDjH2YPITn2sUZo
         E91cSnTFGdT7/+xiZ8csze6QOKVbA9k5QZwdwfg/aJv/oK93n4FzHObC1uIg5C+FDibz
         pnjnv2vrp1U9YfXkPkIxBLzvIeD/CZQRkKq/4dVQlVZVr/ZNoMb7oASxFV/RTiKWadhY
         MoZkkjXQqiVpNeIlrd/wjivkN2ZoQIFVBPubou9FkYnr18TGtZVbDB1TM0UwzRMtoF47
         JjrZYZ/XrahJyIciDdHWYX5vpLQCaGmUdZm5NuQOASZPZ8m3hpqr5VyT54dNax7xQBbi
         Mxsw==
X-Gm-Message-State: AFqh2kqpcNcqOSKlbN1o7WvBXIie1k0zZEK83mSgugqV8/QFphF00HBd
	59FEADXEvqFM/XF1CmjCWdMGOV1Q1cyyNlATUvY=
X-Google-Smtp-Source: AMrXdXuL1hNoSA0EK6pD+Em3xF7sQvBn7kFzbUKSqJ5l/gt+nkrZ26xRXZdv6FwThZkPYGlrOypQFw==
X-Received: by 2002:a62:640f:0:b0:581:f301:23fc with SMTP id y15-20020a62640f000000b00581f30123fcmr38885370pfb.12.1674440501631;
        Sun, 22 Jan 2023 18:21:41 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.21.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:21:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/32] ffmpeg: fix for CVE-2022-3341
Date: Sun, 22 Jan 2023 16:20:56 -1000
Message-Id: <e17ddd0fafb562ed7ebe7708dac9bcef2d6cecc1.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176266

From: Narpat Mali <narpat.mali@windriver.com>

avformat/nutdec: Add check for avformat_new_stream
Check for failure of avformat_new_stream() and propagate
the error code.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ec-Add-check-for-avformat_new_stream.patch | 67 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  3 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
new file mode 100644
index 0000000000..41d5884f88
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
@@ -0,0 +1,67 @@
+From 9cf652cef49d74afe3d454f27d49eb1a1394951e Mon Sep 17 00:00:00 2001
+From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
+Date: Wed, 23 Feb 2022 10:31:59 +0800
+Subject: [PATCH] avformat/nutdec: Add check for avformat_new_stream
+
+Check for failure of avformat_new_stream() and propagate
+the error code.
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2022-3341
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/9cf652cef49d74afe3d454f27d49eb1a1394951e]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ libavformat/nutdec.c | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/libavformat/nutdec.c b/libavformat/nutdec.c
+index 0a8a700acf..f9ad2c0af1 100644
+--- a/libavformat/nutdec.c
++++ b/libavformat/nutdec.c
+@@ -351,8 +351,12 @@ static int decode_main_header(NUTContext *nut)
+         ret = AVERROR(ENOMEM);
+         goto fail;
+     }
+-    for (i = 0; i < stream_count; i++)
+-        avformat_new_stream(s, NULL);
++    for (i = 0; i < stream_count; i++) {
++        if (!avformat_new_stream(s, NULL)) {
++            ret = AVERROR(ENOMEM);
++            goto fail;
++        }
++    }
+ 
+     return 0;
+ fail:
+@@ -800,19 +804,23 @@ static int nut_read_header(AVFormatContext *s)
+     NUTContext *nut = s->priv_data;
+     AVIOContext *bc = s->pb;
+     int64_t pos;
+-    int initialized_stream_count;
++    int initialized_stream_count, ret;
+ 
+     nut->avf = s;
+ 
+     /* main header */
+     pos = 0;
++    ret = 0;
+     do {
++        if (ret == AVERROR(ENOMEM))
++            return ret;
++
+         pos = find_startcode(bc, MAIN_STARTCODE, pos) + 1;
+         if (pos < 0 + 1) {
+             av_log(s, AV_LOG_ERROR, "No main startcode found.\n");
+             return AVERROR_INVALIDDATA;
+         }
+-    } while (decode_main_header(nut) < 0);
++    } while ((ret = decode_main_header(nut)) < 0);
+ 
+     /* stream headers */
+     pos = 0;
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index c5bebe9c2d..4bcbda9976 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -27,7 +27,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
            file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
            file://0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch \
-          "
+           file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch \
+           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
 
-- 
2.25.1


