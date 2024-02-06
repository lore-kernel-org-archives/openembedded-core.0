Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17244C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 16:47:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.26198.1707238072074205830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 08:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=lmATYNZC;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40fe32fcbdaso6730495e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 08:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707238070; x=1707842870; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDNF7PyVZmK4NQDcLExhz9CQb8MBRaaKGZFhWDv5rIw=;
        b=lmATYNZC268yFdH4g8/SWLXuDC+rvZMfjUW3HnxUEbFuYVLge94QPjw9mx217lw4yo
         rxCxCmmSW1dcsfB1OVdEv148PXp7U5kn7McpCvTaNulel6rL6i5wAW7TA7lktFuWCsIX
         f/Jx4MczaozLpFO8p4fYwUNX0KZZ1kq80A12yV44ayhCTjQCy+axUNHK04GHvGfu4w7T
         EolI66uyH5vmkQctJbx9Bm/tDF8KHDrHWPoTZkOI63KH8GxwFBr7EhcTU87R8EN7PoR4
         zRFpPc/tj1r11pbn08LlpusYA9IkXFQJuXrdchnFexM+t8fApTO0/AF9cY1EHFsSvspP
         hn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707238070; x=1707842870;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDNF7PyVZmK4NQDcLExhz9CQb8MBRaaKGZFhWDv5rIw=;
        b=nt5WHpMKOXNiopJARZDmQDpM9Q6bbhfXy013c8Q8vWyW4p2IFwKBReibdsP8pjHS31
         oQjzz7gF7P/wNl/EC2Gf0dZ0EQwR+7tylqnSRlQd3AevxLO77b0A1nrVihJ3wHL061w5
         RwZ2lyMoFDoGOXNV//oMaQTPJ0I3BjOaukH9Xl/+hsj7JLvlArOfvY/IsavZzXpSrJbA
         suukBVJPWauX27BpH/xNxdleA5uZJVX+ZmViTRxpcPslMP+Iyxer0QA8IYFAPzYhv7go
         XZt4MPjQS2E37Y2Yd5IeOjJbrj3zSPYwsFoNbz53zcUxeQj9uvXXa6mrY6UtMwkKyywM
         2kGw==
X-Gm-Message-State: AOJu0YzK2KIVwjwYhpYFNOCDrWMCg0ZTnFWQ2CTSKqTwaz4cNcQb46Vl
	mb0t3NfXt/tBBzK6UZrRUFmdoJkl/sfASIi27kX25XzMTc2av9tmq57MrzMnRfg=
X-Google-Smtp-Source: AGHT+IE5G5J9XNbFi/7udKanSDwZcmoyWBdPn63QFtGzh0+tK48QSbFSs3zTkEVNOmoPmuC5E96ZTw==
X-Received: by 2002:a05:600c:3543:b0:40f:c1fc:e5b6 with SMTP id i3-20020a05600c354300b0040fc1fce5b6mr2184524wmq.38.1707238069935;
        Tue, 06 Feb 2024 08:47:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMZm+92E8udBK4+nJR4YBLEYFaXAzGuYuepyfZepKUX278DugDp/ji46DZx2U/+8hbFG1SUpyZBA8OBbfDvi6+ZAEvYl/6ftuUQrzZ8/MYOQ7OXmMNNx79
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c19c800b0040ffd94cd27sm101373wmq.45.2024.02.06.08.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 08:47:49 -0800 (PST)
Message-ID: <f6747386-d8ff-4dbc-8596-1a013cae50c3@smile.fr>
Date: Tue, 6 Feb 2024 17:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tiff: fix CVE 2023-52356
Content-Language: en-US
To: simone.p.weiss@posteo.com, openembedded-core@lists.openembedded.org
References: <20240206163027.2727885-1-simone.p.weiss@posteo.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20240206163027.2727885-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 16:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195012

Hi,

Le 06/02/2024 à 17:30, simone.p.weiss@posteo.com a écrit :
> From: Simone Weiß <simone.p.weiss@posteo.com>
> 
> fix CVE 2023-52356
> A segment fault (SEGV) flaw was found in libtiff that could be triggered
> by passing a crafted tiff file to the TIFFReadRGBATileExt() API.
> This flaw allows a remote attacker to cause a heap-buffer overflow, leading
> to a denial of service.
> 
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-52356
> https://gitlab.com/libtiff/libtiff/-/commit/51558511bdbbcffdce534db21dbaf5d54b31638a
> 
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>  .../libtiff/tiff/CVE-2023-52356.patch         | 50 +++++++++++++++++++
>  meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  3 +-
>  2 files changed, 52 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch

Thanks Simone!

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

> 
> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
> new file mode 100644
> index 0000000000..9a6d9a39d9
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
> @@ -0,0 +1,50 @@
> +From 51558511bdbbcffdce534db21dbaf5d54b31638a Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Tue, 31 Oct 2023 15:58:41 +0100
> +Subject: [PATCH] TIFFReadRGBAStrip/TIFFReadRGBATile: add more validation of
> + col/row (fixes #622)
> +
> +CVE: CVE-2023-52356
> +Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/51558511bdbbcffdce534db21dbaf5d54b31638a]
> +
> +Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> +
> +---
> + libtiff/tif_getimage.c | 15 +++++++++++++++
> + 1 file changed, 15 insertions(+)
> +
> +diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
> +index 41f7dfd77..6fee35db2 100644
> +--- a/libtiff/tif_getimage.c
> ++++ b/libtiff/tif_getimage.c
> +@@ -3224,6 +3224,13 @@ int TIFFReadRGBAStripExt(TIFF *tif, uint32_t row, uint32_t *raster,
> +     if (TIFFRGBAImageOK(tif, emsg) &&
> +         TIFFRGBAImageBegin(&img, tif, stop_on_error, emsg))
> +     {
> ++        if (row >= img.height)
> ++        {
> ++            TIFFErrorExtR(tif, TIFFFileName(tif),
> ++                          "Invalid row passed to TIFFReadRGBAStrip().");
> ++            TIFFRGBAImageEnd(&img);
> ++            return (0);
> ++        }
> + 
> +         img.row_offset = row;
> +         img.col_offset = 0;
> +@@ -3301,6 +3308,14 @@ int TIFFReadRGBATileExt(TIFF *tif, uint32_t col, uint32_t row, uint32_t *raster,
> +         return (0);
> +     }
> + 
> ++    if (col >= img.width || row >= img.height)
> ++    {
> ++        TIFFErrorExtR(tif, TIFFFileName(tif),
> ++                      "Invalid row/col passed to TIFFReadRGBATile().");
> ++        TIFFRGBAImageEnd(&img);
> ++        return (0);
> ++    }
> ++
> +     /*
> +      * The TIFFRGBAImageGet() function doesn't allow us to get off the
> +      * edge of the image, even to fill an otherwise valid tile.  So we
> +--
> +2.40.0
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
> index eb8a096f19..ab658a2a03 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
> @@ -13,7 +13,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>             file://CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch \
>             file://CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch \
>             file://CVE-2023-6228.patch \
> -           "
> +           file://CVE-2023-52356.patch \
> +"
>  
>  SRC_URI[sha256sum] = "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a"
>  

-- 
Yoann Congal
Smile ECS - Tech Expert

