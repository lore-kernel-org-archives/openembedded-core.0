Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6866AC433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 12:25:47 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.48722.1653999942247648107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 05:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A4eIgKhh;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id u2so2115027pfc.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 05:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=kPQVq9YTu38C7Hx8GcXHQAUgrTzXTgCjpbrGi5io9GM=;
        b=A4eIgKhhOACoI85jresvrHUMXAc9FMF90/uQX5bPCuSZgwxZhDCkEw/D7DivUNoyq8
         +iPkmskwh4IH+d/FoPAJQ9c4DJM1lEVJCTV9nmR+cwARRKTlF8bCebHFhAYDFuMUX/tz
         E16pYbyCO/7Vzg4rZ9JrRquVl8jS+5vQ8Uz9JvpE4SkbL72qdUbrvPm4DQXgjpD+ohtX
         PEaeRNU/57B636+3Cs6+e2GxfSTa9EgoT5/J4lWQqU5CglZ6w/ZvAa0ZNYqrckejO7Vh
         6qQcT4CsLz6VKslf+xD3bUcYCBj2Si0obOqrPD6RFZvavrwteLFwDdjsKKs21Q1ECbcp
         hUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kPQVq9YTu38C7Hx8GcXHQAUgrTzXTgCjpbrGi5io9GM=;
        b=gO8BXe5rAwPH22d76jr83SF47NdOcAqgOgne3dBUqaXdgDh9nILTACkk0sniQ9Lpw+
         Q7Ma98nBMxx8Ecv5aWMqQY/W/cAKQOmpI9MBS6zVeAdr5Vb1j/31t71k8qBamXuZ25ju
         TBhSAGyqTP6jUfD/sCK1/2g8rLDpIP3uMX9+lThpISPRAW/Sr2NoHsMTtltCW9pgqE3y
         zb3PI0yABL5hSst8oizNiuON8NSb4rapyTDxAT2VY0g9tBBPDiqJSLCC5MK+RjmJyojS
         ycvdkbUauKzu0AIUphD3/YzfbhS53czeAQwEoWG5cvSS+f8qZnUmBC5SCm+HTqvgyt0T
         4H3w==
X-Gm-Message-State: AOAM530c869ZAACFn7UDFYFiTHn0IKTRde9JUcg1z+bHIe2SqYRBdk+y
	XB6CouuT4Rl4/Qq3h3MLpGTYZTFBj+b8oA==
X-Google-Smtp-Source: 
 ABdhPJx1+U1Y8De2WBW5lUaxt6rDgS3H0QpeWOMGfS6uvp6yK+WED6hAybwkUq9RU1tKZ9yoTN9w8Q==
X-Received: by 2002:a05:6a00:3023:b0:518:4721:13c6 with SMTP id
 ay35-20020a056a00302300b00518472113c6mr57525191pfb.34.1653999941462;
        Tue, 31 May 2022 05:25:41 -0700 (PDT)
Received: from localhost.localdomain ([182.70.14.64])
        by smtp.gmail.com with ESMTPSA id
 y22-20020aa78556000000b0051b915c1a47sm1304017pfn.113.2022.05.31.05.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 05:25:41 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Virendra Thakur <virendra.thakur@kpit.com>
Subject: [meta][dunfell][PATCH] ffmpeg: Fix for CVE-2022-1475
Date: Tue, 31 May 2022 17:55:27 +0530
Message-Id: <20220531122527.21223-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 12:25:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166308

From: Virendra Thakur <virendra.thakur@kpit.com>

Add patch to fix CVE-2022-1475

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 .../ffmpeg/ffmpeg/CVE-2022-1475.patch         | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-1475.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-1475.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-1475.patch
new file mode 100644
index 0000000000..bd8a08a216
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-1475.patch
@@ -0,0 +1,36 @@
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sun, 27 Feb 2022 14:43:04 +0100
+Subject: [PATCH] avcodec/g729_parser: Check channels
+
+Fixes: signed integer overflow: 10 * 808464428 cannot be represented in type 'int'
+Fixes: assertion failure
+Fixes: ticket9651
+
+Reviewed-by: Paul B Mahol <onemda@gmail.com>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 757da974b21833529cc41bdcc9684c29660cdfa8)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2022-1475
+Upstream-Status: Backport [https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=e9e2ddbc6c78cc18b76093617f82c920e58a8d1f]
+Comment: Patch is refreshed as per ffmpeg codebase
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+---
+ libavcodec/g729_parser.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: ffmpeg-4.2.2/libavcodec/g729_parser.c
+===================================================================
+--- a/libavcodec/g729_parser.c
++++ b/libavcodec/g729_parser.c
+@@ -48,6 +48,9 @@ static int g729_parse(AVCodecParserConte
+         av_assert1(avctx->codec_id == AV_CODEC_ID_G729);
+         /* FIXME: replace this heuristic block_size with more precise estimate */
+         s->block_size = (avctx->bit_rate < 8000) ? G729D_6K4_BLOCK_SIZE : G729_8K_BLOCK_SIZE;
++        // channels > 2 is invalid, we pass the packet on unchanged
++        if (avctx->channels > 2)
++            s->block_size = 0;
+         s->block_size *= avctx->channels;
+         s->duration   = avctx->frame_size;
+     }
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index 1d6f2e528b..cbfdbf0563 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            file://CVE-2021-3566.patch \
            file://CVE-2021-38291.patch \
+           file://CVE-2022-1475.patch \
           "
 SRC_URI[md5sum] = "348956fc2faa57a2f79bbb84ded9fbc3"
 SRC_URI[sha256sum] = "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
-- 
2.17.1


