Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A932C46467
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:06 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.70805.1669472100936548173
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=OILjlgVV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so10001401pjc.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=quqHbKFiYs+s3A+VgiCwZ1loVzpwGxFwoD98K8xBIZw=;
        b=OILjlgVVcd8HmlgoImASex4XX9mKWrXCtKlcBcIMwSrTiRHvIFFttVw+Mf+bpfH1GS
         oFN68NxlLoKV8iNLr9zEVdsLwzlgGjPSJqx2LozCBVeNA8nWhS644U1kVdQTZ72OIY/c
         sMDnX5KOazi8bBkHiDCZ5Y4WF9gYC+Xu7Kvfh4E6CnAuh0eXpZ1JhI387v8tO6CzkCoD
         +D9hSFCMOxvOTDIgBi24JFDCPWp6Y06wWVOOulAwlcc6MBsSFdSVcJ1TpgkSF+y+7r/l
         MW/L6ZKP2Hb77UmjsFfYyOZdlg4Ykess0ieIvyD1KYcGLEduQ2lBPomMP7Pmd86vwUr7
         C8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quqHbKFiYs+s3A+VgiCwZ1loVzpwGxFwoD98K8xBIZw=;
        b=Z6kF2FFnU3qZdKVFvpxTu6HXOPG/m/7Sum6AmEwxrwtuFlPRXneFLopcSsGakkJEej
         GK+sAI2rCK+9GXnWUeNhh7kfBHaFv6pFE6tsKDgc6s5lYOwpcjDkfckVlzEgP1v5lHVL
         cz017TXENd7UQyi+i8WyWLH9JcFjegB7yjsLbR0rVF+isT5+FNQLDBnVFEK62hys+Ces
         GHL/iRVO1baBwUDY/1U+VYAOxIZEqokMd8MjcqJdu8Q3OJUyhU1IMcdAPPfxYbs8jAPx
         /4UZy+cERMqPqkTxvW2m9zgooVRfTzHQFNA7jQX/d1CXq2d3sYjw4PsdYsKXyFk7FCbs
         gHag==
X-Gm-Message-State: ANoB5pmsZpH3MB1Gkn16eID7qOXai5VscISa8kpT0hlpORD9OQ+c+C3P
	mwkFXA7x6Xsg6i3FV69JkhZljkT2FNejuEIkhQA=
X-Google-Smtp-Source: AA0mqf70eeqlXX4+KE+NGvLn3Ks5hFoQWy7tjFioxtlqroqSF6k3a/2Yc0992QtR0cYhRzNzjHFG9w==
X-Received: by 2002:a17:902:d552:b0:189:7722:99d9 with SMTP id z18-20020a170902d55200b00189772299d9mr2496176plf.119.1669472099721;
        Sat, 26 Nov 2022 06:14:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.14.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:14:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/37] ffmpeg: upgrade 5.1.1 -> 5.1.2
Date: Sat, 26 Nov 2022 04:14:05 -1000
Message-Id: <c893aa4d621de7505fca1bc4b9af22eb503c549c.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173794

From: Alexander Kanavin <alex.kanavin@gmail.com>

version 5.1.2:
- avcodec/dstdec: Check for overflow in build_filter()
- avformat/spdifdec: Use 64bit to compute bit rate
- avformat/rpl: Use 64bit for duration computation
- avformat/xwma: Use av_rescale() for duration computation
- avformat/sdsdec: Use av_rescale() to avoid intermediate overflow in duration calculation
- avformat/sbgdec: Check ts_int in genrate_intervals
- avformat/sbgdec: clamp end_ts
- avformat/rmdec: check tag_size
- avformat/nutdec: Check fields
- avformat/flvdec: Use 64bit for sum_flv_tag_size
- avformat/jacosubdec: Fix overflow in get_shift()
- avformat/genh: Check nb_channels for IMA ADPCM
- avformat/dxa: avoid bpc overflows
- avformat/dhav: Use 64bit seek_back
- avformat/cafdec: Check that nb_frasmes fits within 64bit
- avformat/asfdec_o: Limit packet offset
- avformat/apm: Use 64bit for bit_rate computation
- avformat/ape: Check frames size
- avformat/icodec: Check nb_pal
- avformat/aiffdec: Use 64bit for block_duration use
- avformat/aiffdec: Check block_duration
- avformat/mxfdec: only probe max run in
- avformat/mxfdec: Check run_in is within 65536
- avcodec/mjpegdec: Check for unsupported bayer case
- avcodec/apedec: Fix integer overflow in filter_3800()
- avcodec/tta: Check 24bit scaling for overflow
- avcodec/mobiclip: Check quantizer for overflow
- avcodec/exr: Check preview psize
- avcodec/tiff: Fix loop detection
- libavformat/hls: Free keys
- avcodec/fmvc: Move frame allocation to a later stage
- avfilter/vf_showinfo: remove backspaces
- avcodec/speedhq: Check width
- avcodec/bink: disallow odd positioned scaled blocks
- avformat/cafenc: derive Opus frame size from the relevant stream parameters
- avformat/dashdec: Fix crash on invalid input/ENOMEM, fix leak
- lavc/videotoolbox: do not pass AVCodecContext to decoder output callback
- lavc/pthread_frame: always transfer stashed hwaccel state
- avcodec/arm/sbcenc: avoid callee preserved vfp registers
- avformat/riffdec: don't unconditionally overwrite WAVEFORMATEXTENSIBLE layout
- avfilter/vf_scale: overwrite the width and height expressions with the original values
- lavc/pthread_frame: avoid leaving stale hwaccel state in worker threads
- avutil/tests/.gitignore: Add channel_layout testtool

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 32da2113e553a3f81f4dcc5834e3fe30f48e4709)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/{ffmpeg_5.1.1.bb => ffmpeg_5.1.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.1.1.bb => ffmpeg_5.1.2.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
index 2306fe4a42..a0c98d4ae0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "95bf3ff8c496511e71e958fb249e663c8c9c3de583c5bebc0f5a9745abbc0435"
+SRC_URI[sha256sum] = "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.25.1


