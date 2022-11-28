Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C6DC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 18:25:51 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.126219.1669659950119730298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 10:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=OdsgV7Ay;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.53, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f53.google.com with SMTP id b8so16572933edf.11
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 10:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pQXv0v6ELp69+RfKqCd0V10RHxVWGUgnKsJC41FcWbo=;
        b=OdsgV7Aygk25PoaPGmsL5qIZ1yrxYbMoySmrnNbD/zavBDOkoS39QL+cCS7DdsiAFr
         H6boruM0SaTd+nIcFQIHQ4Cgcw0Jv9e+la30aKrLFqUaTVAo0qdAUkZVw+ITil3EJgn5
         Bqkehn7F6S7bhSTnW7NuP+HyW8/J4U4QonA1v7zHYHQQz0W4NQ7i6SsaQqcmQpXEdc9i
         lTvUGEY8SVFv3GJobO0ZKCJBLYEn06aBI2yJcOxFQ0rjVjlVc6lzRA3oafIcZjjMZZxo
         w5hd+ZdLqAplr2FX63hk6VWIdCA8TqbUgUCxa239fNgfuHKaWARBBfn1u4UHEDUJf9PW
         8egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQXv0v6ELp69+RfKqCd0V10RHxVWGUgnKsJC41FcWbo=;
        b=8H8xjkhQSR9k1YU3FEGpJuLJYEp6awPQvY9WRQgzb3bUfO64oen/eioJN3/WBkgu48
         Zqueh8NfsZwye1TOdNX1zeWJHUFjgIOvMN58t5euYbxvaJPSTzSj+XRSjnMko0ctu9Un
         ryT2CHg1LeFN5KxDzB80Jqtw+38cyhxDaGbQvNDE286bgG88k2emuNb+oyiyqe+CKZNk
         aIbOMZiP6PIZ4erjbpIjfdP2H3m+B23031/Fjuekw+zY5iTl23AOvVQLrDQomC9bu/aV
         6luSM4CDFmtr1MuLQoWqCZU6MLrEJQEgJYjaCiWqaCWHpI2xe1I0FkevPcVXiYAeaHC3
         F2tw==
X-Gm-Message-State: ANoB5pn64rsZCJftHX5t0Eo2m8eXUxILngpvu6KvVwAswujibMbqSO6b
	fq9NQl4LAonjEln2MEm7Slkm5obPyG/7XRTMU0PtxQ==
X-Google-Smtp-Source: AA0mqf4ILzsQXkD07CSekr3z+67kyl6oL0lG5xugAlN9pNULGAJmBvvex1qpxXkWJ4FtESwoatZFJV1WVHaqszUn95w=
X-Received: by 2002:aa7:d80d:0:b0:46b:7645:86a9 with SMTP id
 v13-20020aa7d80d000000b0046b764586a9mr573236edq.311.1669659948252; Mon, 28
 Nov 2022 10:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20221128174728.3804331-1-zheng.qiu@windriver.com>
In-Reply-To: <20221128174728.3804331-1-zheng.qiu@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 28 Nov 2022 08:25:37 -1000
Message-ID: <CAOSpxdZTJ6cpX=BgG8ehsdK=DHqhH3jdMpxZvqjQfDSJ0vzEHQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] tiff: Security fix for CVE-2022-3970
To: "Qiu, Zheng" <Zheng.Qiu@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 18:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173937

On Mon, Nov 28, 2022 at 7:47 AM Qiu, Zheng <Zheng.Qiu@windriver.com> wrote:
>
> This patch contains a fix for CVE-2022-3970
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2022-3970
> https://security-tracker.debian.org/tracker/CVE-2022-3970
>
> Patch generated from :
> https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be
>
> Upstream-Status: Accepted
>
> Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
> ---
>  .../libtiff/tiff/CVE-2022-3970.patch          | 38 +++++++++++++++++++
>  meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
>
> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
> new file mode 100644
> index 0000000000..e8f143933a
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
> @@ -0,0 +1,38 @@
> +From 227500897dfb07fb7d27f7aa570050e62617e3be Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Tue, 8 Nov 2022 15:16:58 +0100
> +Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow on
> + strips/tiles > 2 GB
> +
> +Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137

Missing CVE:, Upstream-Status:, and Signed-off-by:

Please submit a V2 with these included.

Thanks,

Steve

> +---
> + libtiff/tif_getimage.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
> +index a4d0c1d6..60b94d8e 100644
> +--- a/libtiff/tif_getimage.c
> ++++ b/libtiff/tif_getimage.c
> +@@ -3016,15 +3016,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t col, uint32_t row, uint32_t * raster, in
> +         return( ok );
> +
> +     for( i_row = 0; i_row < read_ysize; i_row++ ) {
> +-        memmove( raster + (tile_ysize - i_row - 1) * tile_xsize,
> +-                 raster + (read_ysize - i_row - 1) * read_xsize,
> ++        memmove( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
> ++                 raster + (size_t)(read_ysize - i_row - 1) * read_xsize,
> +                  read_xsize * sizeof(uint32_t) );
> +-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize+read_xsize,
> ++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize+read_xsize,
> +                      0, sizeof(uint32_t) * (tile_xsize - read_xsize) );
> +     }
> +
> +     for( i_row = read_ysize; i_row < tile_ysize; i_row++ ) {
> +-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize,
> ++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
> +                      0, sizeof(uint32_t) * tile_xsize );
> +     }
> +
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> index 29a2c38d8e..7df4369755 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> @@ -24,6 +24,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>             file://CVE-2022-34526.patch \
>             file://CVE-2022-2869.patch \
>             file://CVE-2022-2867.patch \
> +           file://CVE-2022-3970.patch \
>             file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
>             file://0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch \
>             file://CVE-2022-2953.patch \
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173935): https://lists.openembedded.org/g/openembedded-core/message/173935
> Mute This Topic: https://lists.openembedded.org/mt/95315738/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

