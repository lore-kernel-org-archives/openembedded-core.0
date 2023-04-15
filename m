Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F003AC77B70
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 15:33:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.10666.1681572837559471693
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 08:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=mqPW6LJL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id q2so26125858pll.7
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681572837; x=1684164837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQgU6Nb1fW6yQvFlj4dP9Py3h/cc+mJIyynDfey97GU=;
        b=mqPW6LJLiSgZK+Pdyh26iSA0Nlkds0leWFMqJ7nqUqA5J92OBAh8p4Fhi10XKr1VGS
         HSPF0d724cRML4aOg4moCliE63galaQIUCYj6hYOKpfjBzBFYYcIZP/Iqh7jKwHT8IPv
         QpLnDyf+2tC5Fh1laqyjce1BFXvXPCAoP6sVKqiDO4k+ol8Qinte+KqEp5euIPlngpwd
         A3WxG/xSYeCCOOdjgOG+ewXo8KPzHw4W3R8U0GCcEAPkRv9/2soYV5yJ6vm7UodsoYWK
         9ZZdS2liv2Ug1t+Xz6DmMLgA5yxni6mPEtvchgCY0PEumY3SE8fwqdYGfVD+2ebsx89m
         UItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681572837; x=1684164837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQgU6Nb1fW6yQvFlj4dP9Py3h/cc+mJIyynDfey97GU=;
        b=iX2vphx6ylBfQDoFJIT8WJQOwGKKaOwdPuj0ByYydS1h5P49f5Qfy0wfcOFWF3dSm3
         fALv3AUI/twmhShGRPw3dhqYTlgfQka75QpNhwi1XxHaXANbSTrc6ATpUYAwudiiASPu
         OuyBWBtyftpHypWAubhfHASrY8YxFVIMSH2IYhJfBwaN2CQ2cEIUmc/qu9dhkBsNGFEg
         9Yj1zZ9KLUr3daDAiFs1gubov1a7OKNEvLrDPI9J3ECyuNSo04bdAfqtQgOZVJK33ZMN
         R7UofZ7c7I0JR7qfP0NzEuq78prTmEHbG+B7+LR6BOt4QEVNzedCd7O+diPUObzKKHCA
         SqIQ==
X-Gm-Message-State: AAQBX9dwiIVzF5dUCe2wMe0xqnGmRTJbZtzcJ0Nv9lOAoFTpCEQ3gyE4
	atj0AXY2uBZ/QT6R2woXYb0ke5zZUInkqvSQUBA=
X-Google-Smtp-Source: AKy350Z6kcLr00/kMk3VyPWyeRGJhWatAsTvhBZ9LIEjILt10aWSmvW3MnDCCtmpbuj3UBkF7zUJUg==
X-Received: by 2002:a17:90b:4d81:b0:246:5f9e:e4cf with SMTP id oj1-20020a17090b4d8100b002465f9ee4cfmr9229825pjb.43.1681572836608;
        Sat, 15 Apr 2023 08:33:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id cs19-20020a17090af51300b002367325203fsm6313969pjb.50.2023.04.15.08.33.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 08:33:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/4] ffmpeg: fix for CVE-2022-3341
Date: Sat, 15 Apr 2023 05:33:36 -1000
Message-Id: <0c68435a7c0ff1c417119dbd408e75443c09afcb.1681572706.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681572706.git.steve@sakoman.com>
References: <cover.1681572706.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180019

From: Bhabu Bindu <bhabu.bhabu@kpit.com>

avformat/nutdec: Add check for avformat_new_stream
Check for failure of avformat_new_stream() and propagate
the error code.

Upstream-Status: Backport [https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=bba70ce34115151362bfdc49a545ee708eb297ca]

(From OE-Core rev: e17ddd0fafb562ed7ebe7708dac9bcef2d6cecc1)

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bba70ce34115151362bfdc49a545ee708eb297ca)
Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2022-3341.patch         | 67 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3341.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3341.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3341.patch
new file mode 100644
index 0000000000..fcbd9b3e1b
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3341.patch
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
+Comments: Refreshed Hunk
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
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
+@@ -793,19 +793,23 @@
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
+             goto fail;
+         }
+-    } while (decode_main_header(nut) < 0);
++    } while ((ret = decode_main_header(nut)) < 0);
+ 
+     /* stream headers */
+     pos = 0;
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index ffeec92e0e..1e000dddfa 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2021-38291.patch \
            file://CVE-2022-1475.patch \
            file://CVE-2022-3109.patch \
+           file://CVE-2022-3341.patch \
           "
 SRC_URI[md5sum] = "348956fc2faa57a2f79bbb84ded9fbc3"
 SRC_URI[sha256sum] = "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
-- 
2.34.1


