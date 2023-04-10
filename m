Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4A5C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:13:58 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.40059.1681114428597066282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aswsOkJ5;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id kh6so2490623plb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 01:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681114428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8ChsUdqhitZIjg5kUZxUxODuTmtw7btdYXU1H40Hik=;
        b=aswsOkJ5YTqt4MvdTZOLuKC0+v5lhaeMRFvH+MURI4LNlJMQC2snlRzWvA4/WJmVSj
         P3sDZoSmH5p+DhK/nWLdeDikPN8uMbM0acLI7OdXbPQYs6IFkacN2F4RqO+2s84OGs/0
         ESdbHzFRHCvaRNQtKxzzpyvsZ6A5PVEFclYhTH0/I+a+i+EIknXiJ51D4GX3DCQJ62VY
         ONI+9WU6XeICuRYQeIMOTuQqCEn61B4Ygt9z0cu+Zq6geOKLRZ4Dz6IePPHgMLm99IcK
         LhlMN+rOKIqX52NcBZg47EtH4Sdz/pF6j+p9l3yDS9jA50hTZRcX0YKHpAfpK+iFR+Va
         HP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8ChsUdqhitZIjg5kUZxUxODuTmtw7btdYXU1H40Hik=;
        b=E3kdKblKCtW4mAPFv7hCuxNXrdyfadX5+TyBs+906niOryKIFhilGVD3IobYj4BIbb
         WuB9vLUWV8qXFHQISvMuHH6n+ZnHNI0z+kX7jdxkevau5PE1oNgDRdy7MKr+viKkfBxD
         bUj/AjAGxaWQqYc0TqPigsRyobPdWqnlWkrUaCus4ObJ2vTQ4Mmk7BQUw6ygQ/1DGKje
         pynh97ZU2JiJNNleib2730GOnZ6GXmraIbMgHz3VT+nQZm2830GNycSq0JfnbpjE22I6
         Sgnc8son+xcSKzFaOjmLN4lAJHwveFj9Kwyow1Nxfh68tI7FLavXmobCS2nTSY7W4Rmr
         LePQ==
X-Gm-Message-State: AAQBX9elZ1eM574aStd8YvpMdF0SD/ujLZYpGSmMaeO5m3OpdjzRTYzF
	gmP+8jZPV3NarSL5WXOyKOHJe6Da/meWPQ==
X-Google-Smtp-Source: AKy350ZViuFsMw5R63NjmVWtM/CYFvf4QLdO/iGP+VrKtBn3ArZL/hV1a6OMiDfJO3zHnzeMN9aUJw==
X-Received: by 2002:a05:6a20:b21:b0:de:5e0b:caa8 with SMTP id x33-20020a056a200b2100b000de5e0bcaa8mr7131914pzf.52.1681114427713;
        Mon, 10 Apr 2023 01:13:47 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f26:5bf2:2f53:7cd4:907:b9ed])
        by smtp.gmail.com with ESMTPSA id n4-20020a62e504000000b0062ddefe02dfsm7442216pff.171.2023.04.10.01.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:13:47 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Bhabu Bindu <bhabu.bhabu@kpit.com>,
	Narpat Mali <narpat.mali@windriver.com>,
	Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][dunfell][PATCH] ffmpeg: fix for CVE-2022-3341
Date: Mon, 10 Apr 2023 13:43:25 +0530
Message-Id: <20230410081325.1415216-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179842

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
2.25.1


