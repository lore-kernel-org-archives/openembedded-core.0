Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973E4C38142
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 17:41:12 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.52223.1674150064892532493
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 09:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=DgbV0zB1;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id ud5so7664882ejc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kpeRD8mQd/XH7HylGYSM8nF2kKmjeRcNmhOdnb6aCu0=;
        b=DgbV0zB1yVbJ5Si6hM5SFaOnmuSY9b81986KrVaSD4yZm4e+RCzvH273+U4ujvehAU
         /qhjESK/jy4fKI8fXIOqPNjhB4PMI4qFQ2E6/wYLLrGpmbg7HFkrzo7umIT+YXnMxodW
         74PmeHbySSpFaUpPVnJlt9LsbCIytF4skOXt+2fgvCH+RyKOFFo5Ni93WqN7irqFRXQP
         tz5hOQQbTm655KGzIk2LFp6EdoRX74uWlg5k77gao7rPMIBCBh+GVgEX6tc5V825TuOQ
         7PhTpRilXCU4t1uI03ZtfCKBww0HF5uUo3fezjJ8xfLjUTDY/zy7zoNC5rBZK3/NTMMS
         i+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpeRD8mQd/XH7HylGYSM8nF2kKmjeRcNmhOdnb6aCu0=;
        b=rhAlY+7Uy4UQcf4cMGGOLYxnyTK3oVcZu9tcHIUP1Hd1yeVyB5XvA9qGtK0WCpNCNp
         mrJtkGNOop32ypENOjkWZFG5ZKz97Jw7ONxmt6JPbjPITo5i4bArxJrGMVcI9NZRKn7h
         nOkD1ywTy6sdgLq+uC0BA/WThK64Tq/ZuV1j0y1wB89Gftf2VpKQHKfc2s8ajQUeueye
         AN5n/tRes8ZWVClmkAEKmDs+QfaS+8exNLvfiwExYV5PTVfr8lLI2OrP7swHH3OTwqem
         532BjUAB10J5QYygVchQyZnKxqfbRRoXOY7i18xRq3F19AhsyBo38aHoSmzxG3oNy6d6
         Qa7Q==
X-Gm-Message-State: AFqh2ko79EEBoDZKWU7R6mcyhBCmvWVRv5++/zEiMKi4okeK08oleNZ6
	/yXhcmGSRT+FZoGbGuBHH6Uvd80e/WILAFnTgEKhWA==
X-Google-Smtp-Source: AMrXdXuHdyi2PuhLSy3WAMZxP6KgmlAKbAqT0Whi7X9aDzd1uyOA8UldWNXYqr4aMC3FFK5plZm3eZCKhC1eU5kc/nI=
X-Received: by 2002:a17:906:4308:b0:865:d677:1f6c with SMTP id
 j8-20020a170906430800b00865d6771f6cmr1372681ejm.584.1674150063191; Thu, 19
 Jan 2023 09:41:03 -0800 (PST)
MIME-Version: 1.0
References: <20230119171657.656875-1-narpat.mali@windriver.com>
In-Reply-To: <20230119171657.656875-1-narpat.mali@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 19 Jan 2023 07:40:52 -1000
Message-ID: <CAOSpxdaZKx5PYBWgzmQbjXdsYicsqksmjS52oXy7PMxa5iiNsg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] ffmpeg: fix for CVE-2022-3341
To: Narpat Mali <narpat.mali@windriver.com>
Cc: openembedded-core@lists.openembedded.org, archana.polampalli@windriver.com, 
	hari.gpillai@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 17:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176157

On Thu, Jan 19, 2023 at 7:20 AM Narpat Mali <narpat.mali@windriver.com> wrote:
>
> avformat/nutdec: Add check for avformat_new_stream
> Check for failure of avformat_new_stream() and propagate
> the error code.
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  ...ec-Add-check-for-avformat_new_stream.patch | 67 +++++++++++++++++++

In the future please name CVE patches with the CVE number, i.e. CVE-2022-3341

This makes it much easier to see which patches are CVE fixes without
having to open the file.

Thanks,

Steve

>  .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
>  2 files changed, 68 insertions(+)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
> new file mode 100644
> index 00000000000..41d5884f880
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
> @@ -0,0 +1,67 @@
> +From 9cf652cef49d74afe3d454f27d49eb1a1394951e Mon Sep 17 00:00:00 2001
> +From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> +Date: Wed, 23 Feb 2022 10:31:59 +0800
> +Subject: [PATCH] avformat/nutdec: Add check for avformat_new_stream
> +
> +Check for failure of avformat_new_stream() and propagate
> +the error code.
> +
> +Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
> +
> +CVE: CVE-2022-3341
> +
> +Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/9cf652cef49d74afe3d454f27d49eb1a1394951e]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + libavformat/nutdec.c | 16 ++++++++++++----
> + 1 file changed, 12 insertions(+), 4 deletions(-)
> +
> +diff --git a/libavformat/nutdec.c b/libavformat/nutdec.c
> +index 0a8a700acf..f9ad2c0af1 100644
> +--- a/libavformat/nutdec.c
> ++++ b/libavformat/nutdec.c
> +@@ -351,8 +351,12 @@ static int decode_main_header(NUTContext *nut)
> +         ret = AVERROR(ENOMEM);
> +         goto fail;
> +     }
> +-    for (i = 0; i < stream_count; i++)
> +-        avformat_new_stream(s, NULL);
> ++    for (i = 0; i < stream_count; i++) {
> ++        if (!avformat_new_stream(s, NULL)) {
> ++            ret = AVERROR(ENOMEM);
> ++            goto fail;
> ++        }
> ++    }
> +
> +     return 0;
> + fail:
> +@@ -800,19 +804,23 @@ static int nut_read_header(AVFormatContext *s)
> +     NUTContext *nut = s->priv_data;
> +     AVIOContext *bc = s->pb;
> +     int64_t pos;
> +-    int initialized_stream_count;
> ++    int initialized_stream_count, ret;
> +
> +     nut->avf = s;
> +
> +     /* main header */
> +     pos = 0;
> ++    ret = 0;
> +     do {
> ++        if (ret == AVERROR(ENOMEM))
> ++            return ret;
> ++
> +         pos = find_startcode(bc, MAIN_STARTCODE, pos) + 1;
> +         if (pos < 0 + 1) {
> +             av_log(s, AV_LOG_ERROR, "No main startcode found.\n");
> +             return AVERROR_INVALIDDATA;
> +         }
> +-    } while (decode_main_header(nut) < 0);
> ++    } while ((ret = decode_main_header(nut)) < 0);
> +
> +     /* stream headers */
> +     pos = 0;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> index 95b4bf50ace..57990331487 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> @@ -26,6 +26,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
>             file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
>             file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
>             file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
> +           file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch \
>             "
>
>  SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176153): https://lists.openembedded.org/g/openembedded-core/message/176153
> Mute This Topic: https://lists.openembedded.org/mt/96381863/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

