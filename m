Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A9DC636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 12:21:45 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.13242.1676031704441317146
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 04:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CQNkNm4M;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so9646248pjq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 04:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cyD1AexZ2b20mw795DJdbd4/CRrfPDoj+/qEbyOeD4=;
        b=CQNkNm4MR1gYiWQGPbOSp+9Pbdm3zTQLJnfRLzjEy6xaZsUvI3ACFGTra3aMVThnUI
         WleYgTrcZ4w3tSlDE0KAcrRJ5MmW0Z3Q66PudLj+enYe2/7a45zRegLXd7I1JhabK7sw
         D0hHLHsllbkSk8/i0bjE9JIROLFzelCH6aYgr7r1kTTgANzIiuvPRJp9U81dfJbykIRj
         rSZ63w+CD657BGdHxc0OFzY2BmONf+QlcwIMC1w1eobWK4SKsrJAk6ELgO7BNmjDCt2o
         4sedLWDnUQZkLRHwhM9y4pe+3QnyRrZuXUz38Qr+f1kxoosXsS9PVT7GAX7GEJk3OcPH
         Weyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cyD1AexZ2b20mw795DJdbd4/CRrfPDoj+/qEbyOeD4=;
        b=FfXYmEa1B/huaCKAyr5NwIfdQzVvdIyn6YR8td03lJI27xKff/AhDuhiyRIcz0Ypaz
         X1Pitj7B/PIKdaEe4kze6oWLYl5LwjvVwli+jov6a0+bLI7IxeJAlLvoxVgLJ+s/Zm9M
         xXYmRzwiguG2gkWeWm3lgideDo4mYN4AH38g7KndmQ+Pg3SRAhtxLCEVwLYFOS6SEbmD
         hz/nab/j0DnT9+HCEpA4tZnqgVTMLtKVYr0ZJGZIMrlgXxBRqW+CI+GX63EzqBGr8Wnf
         cOlGajESdI17ohrPuSzq3oX8j7SuCJtTBc7nSH7QFgSTy7fhdRBG99wyw8b8Bb7pCBDI
         9Hbw==
X-Gm-Message-State: AO0yUKXh9epP8ErbBiH1t3xqDP3BEOfxU3j0F5XDZFb3vtW660xJAqIc
	MT54TZbJCMmv20XFtSomikmXR1w3vmw=
X-Google-Smtp-Source: AK7set9NH3PM50usgxjAxgFLDgUzEdq/fWzG5KALiAvcenfvBoP+QFls2QhnXHyqcF1LQN3BMiOQtw==
X-Received: by 2002:a17:90b:164e:b0:22c:4e1:93e with SMTP id il14-20020a17090b164e00b0022c04e1093emr16549548pjb.15.1676031703469;
        Fri, 10 Feb 2023 04:21:43 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f26:135a:cc5f:d2c8:7d23:7883])
        by smtp.gmail.com with ESMTPSA id f5-20020a637545000000b0047917991e83sm2890367pgn.48.2023.02.10.04.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 04:21:43 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: akash.hadke@kpit.com,
	Narpat Mali <narpat.mali@windriver.com>,
	Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][dunfell][PATCH] ffmpeg: fix for CVE-2022-3341
Date: Fri, 10 Feb 2023 17:50:58 +0530
Message-Id: <20230210122058.8715-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 12:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176991

From: Bhabu Bindu <bhabu.bindu@kpit.com>

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
---
 ...ec-Add-check-for-avformat_new_stream.patch | 66 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |  3 +-
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
new file mode 100644
index 0000000000..706db9669a
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
@@ -0,0 +1,66 @@
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index cbfdbf0563..737fd33fa5 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -30,7 +30,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2021-3566.patch \
            file://CVE-2021-38291.patch \
            file://CVE-2022-1475.patch \
-          "
+           file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch \
+           "
 SRC_URI[md5sum] = "348956fc2faa57a2f79bbb84ded9fbc3"
 SRC_URI[sha256sum] = "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
 
-- 
2.17.1


