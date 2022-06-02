Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED48C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 02:31:27 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.2154.1654137085621337047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BReDtikE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id d129so3536308pgc.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=piQylXKEF/pxGqjWS+j4nHrsEz6dMIosI+45ppmV7HI=;
        b=BReDtikEXcBat2q+buPC75riEeG5kgquMnEdfem6vtWnFVc4rZGzXx5dC08dJYz+wa
         4EIBntLTu+7EygD3f6K6R70G54QLFa6zHJ9MG+CzTrPj2AzCe21lNFXNACLjk211fXwK
         cbnW+ZLzyTsnN/ZKqRrGLqqi9gmVoA36BRczLJP7OdWktCk8TrYz8x7PPeWc5dEGj3In
         BZVND+TkNaO/f1QzLE5J4xJBRa0+wQd3CgSiFgMBJ5+WzZRNoCistyYst89q6ioG3xZI
         S7MIuBu7wHO/JLmmogIG2l+AHcmuPXjukylkqJDUxajqDfvZJjU5wvtQNmBeYs50u3cd
         n6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=piQylXKEF/pxGqjWS+j4nHrsEz6dMIosI+45ppmV7HI=;
        b=11QP7n/9dKvsdVlUwXneZTS4Nixk5kIE0AfYwvYDv3lKwsoxuBurF2Wefe15qD88CH
         jH+1kYKPBRmIuQlds1iIIQh9+KV8Kx8tJoabvY6f10Jz3bSmh3Ill4C1rGTXhTmrMFEV
         8cc6ykrRz5BwZTVJe5LloUj6xQ50svEdHvr2hEp6nXY5zyvm4K+Pz1O/T7v06OYoZOT1
         2mWGXWMMfqQFnPBVmNFpTuAIAX5jTot9ye1XgFey0skuGe8fRuAZTML1W2Spt1lu79EQ
         FkXHYOSj/UFJiOr387ZV4d5MW2hW3vGdXKoMlAn3fyXGfgBhWRnviGz1FRh1TXebTSOp
         sOgQ==
X-Gm-Message-State: AOAM533A1hD21oYk9zUfSQLHYsJNPsaXXHOoeo/Uvn0yP0wj5rMee5Zy
	sFk30kL1xqKE3KMFwiRE6MJsbCBONeNAbgxk
X-Google-Smtp-Source: 
 ABdhPJzrkF2wDg1JImVxkKTjujx9Pv1ld3m02QIoal2ikX9+9XA8BAO+9cJaujaWhMXHa7L4qrEn0g==
X-Received: by 2002:a05:6a00:cc:b0:518:1348:8dc2 with SMTP id
 e12-20020a056a0000cc00b0051813488dc2mr2685130pfj.52.1654137084343;
        Wed, 01 Jun 2022 19:31:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j23-20020a63ec17000000b003fc37053c82sm1990447pgh.12.2022.06.01.19.31.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 19:31:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/11] ffmpeg: Fix for CVE-2022-1475
Date: Wed,  1 Jun 2022 16:30:44 -1000
Message-Id: 
 <2a97ba89f236b751b333622fbbc14180e9b72245.1654136888.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654136888.git.steve@sakoman.com>
References: <cover.1654136888.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 02:31:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166452

From: Virendra Thakur <virendra.thakur@kpit.com>

Add patch to fix CVE-2022-1475

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


