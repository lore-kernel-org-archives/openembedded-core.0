Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24573C636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 17:20:17 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.22469.1676049615634012242
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 09:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aykqvQik;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id qw12so17756726ejc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 09:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=54aouW14H0ehow4dn2PZLikHdGqT6ZcsgDf9ddljpy8=;
        b=aykqvQikhnSx0AQ58v4t/vKIthHPP57QnR0wA6DrxqmtTMz0/j/ia7kIrx84e55S09
         8pLs2/GdnJ/IBdwDOiuwZz4I7Hsom27xgRCMVBB4H/uwoXsnNRhG7WOUZeCf7DH3wDc4
         GM+8Y8e02s37PWBE/wAPmc3y2u/KDHOdBpsivOt2pBxodEzBoqDob47YFePtGvGk0iEl
         EasdMEJO8EffKH79Wd7ZlL+UBPD0NQO0h5KbBqedE+LwgUszesJB/lBwWA69WExKdWO8
         JF4pnA5B28EglEKyG42FpXMHTVttRP0Muxl79ffA18lusOHXlt1BPotYGRQFUNr4ZOkS
         wkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54aouW14H0ehow4dn2PZLikHdGqT6ZcsgDf9ddljpy8=;
        b=jtURnOoGGD2UVMbMdVpVU0Ooi6eb2yOYixmSbwU5WO0y/FrYMDTeyudDdfIQtDwjIY
         ie9pQJlla3jlMTBxZL5NFmfpxWue74cfnTQZE+l+lTxrvB7jxplz6JFr0ttjmzNKZzSR
         jBFqHAexGy7+MmJjhG667GLqHo1cA+ik+K0Yf1P78yDzTjx3DDxPI5fLYj2BRLlDeXlx
         CyeQKfkP85MohAEgiijSPmVDIBZrK/LLnOqgK1BAvptQpFwp/Aje9Awufn3qfeFYSH+p
         ehzb5LPBG4uGWbj69mW2KNiDdp+3erravJTsyTp+lJh4NEBCop0oQQN4x6UxVc8rUNQ2
         NQew==
X-Gm-Message-State: AO0yUKXr34vZXq7qEGD3bNvW92qBKTDINvj7QhW747YmpGMHcDRIMOhB
	uwOU2U3XmeCvfeDF87lVye3sKAlXcWU+D7uPNYKpmw==
X-Google-Smtp-Source: AK7set8OCY9NvXW/RwRyVeEJ6fiBmxfsBxWjsmZ3lSTv7PQEq/g2yTVmj/iyie1/PfNU9UxHByS9Ohp8EUNnm8PwOd0=
X-Received: by 2002:a17:906:fc01:b0:850:2768:735e with SMTP id
 ov1-20020a170906fc0100b008502768735emr3603987ejb.64.1676049613978; Fri, 10
 Feb 2023 09:20:13 -0800 (PST)
MIME-Version: 1.0
References: <20230210122058.8715-1-bindudaniel1996@gmail.com>
In-Reply-To: <20230210122058.8715-1-bindudaniel1996@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 10 Feb 2023 07:20:03 -1000
Message-ID: <CAOSpxdbO31d4_AQbPNCUbk6y88n200rCzvbqZnzqXkxvyEW7bA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] ffmpeg: fix for CVE-2022-3341
To: Bhabu Bindu <bindudaniel1996@gmail.com>
Cc: openembedded-core@lists.openembedded.org, bhabu.bindu@kpit.com, 
	akash.hadke@kpit.com, Narpat Mali <narpat.mali@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 17:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176996

On Fri, Feb 10, 2023 at 2:21 AM Bhabu Bindu <bindudaniel1996@gmail.com> wrote:
>
> From: Bhabu Bindu <bhabu.bindu@kpit.com>
>
> avformat/nutdec: Add check for avformat_new_stream
> Check for failure of avformat_new_stream() and propagate
> the error code.
>
> Upstream-Status: Backport [https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=bba70ce34115151362bfdc49a545ee708eb297ca]
>
> (From OE-Core rev: e17ddd0fafb562ed7ebe7708dac9bcef2d6cecc1)
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit bba70ce34115151362bfdc49a545ee708eb297ca)
> Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> ---
>  ...ec-Add-check-for-avformat_new_stream.patch | 66 +++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |  3 +-
>  2 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
> new file mode 100644
> index 0000000000..706db9669a
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch

This patch should be named CVE-2022-3341.patch.

Please submit a V2!

> @@ -0,0 +1,66 @@
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
> +Comments: Refreshed Hunk
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
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
> +@@ -793,19 +793,23 @@
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
> +             goto fail;
> +         }
> +-    } while (decode_main_header(nut) < 0);
> ++    } while ((ret = decode_main_header(nut)) < 0);
> +
> +     /* stream headers */
> +     pos = 0;
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
> index cbfdbf0563..737fd33fa5 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
> @@ -30,7 +30,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
>             file://CVE-2021-3566.patch \
>             file://CVE-2021-38291.patch \
>             file://CVE-2022-1475.patch \
> -          "
> +           file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch \
> +           "

Also, this won't apply because we have your other ffmpeg CVE fix in
the current pull request:

https://git.openembedded.org/openembedded-core-contrib/commit/?id=a626228a4be4c52c9d3f43eb1756c1defc22a5e4&h=stable%2Fdunfell-next

So please take this into account with your V2.

Thanks!

Steve
>  SRC_URI[md5sum] = "348956fc2faa57a2f79bbb84ded9fbc3"
>  SRC_URI[sha256sum] = "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
>
> --
> 2.17.1
>

