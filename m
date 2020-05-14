Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.1379.1589491277499988388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 14:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gsEkTdzL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id l18so626014wrn.6
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 14:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xdszW9MCzPWD5zSSTwJzAlafK0visFYJ8KbKbjthEk4=;
        b=gsEkTdzLkxqUqY0IueOzzUa3X5udwGwKXn74TleCOf8S7X9xl7CQkJlXkg7PXb9C42
         NcblLe+gZLodVaa8NocK1ETCmhIjtp9TgTK2mIsYku4CVAfo/EZoISct6P5yM2TDpjPk
         jN0qMW6z4pHj9Dr6F0W3de8kTBITo85dSfEWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xdszW9MCzPWD5zSSTwJzAlafK0visFYJ8KbKbjthEk4=;
        b=fQNiTVLWOEwAOYrRWT4oDmJFb8Mp/xCT0XmlNcLEbIQGnxdcwPmPVouTJlrWvlij6X
         q3nKDv2CwFEfIdi+HsroM/Qem8aU0KyQxTFU95udh+duVrsriHKkX1jpYwcqaFi65WXY
         nOTn5KQzXCIDj7IRvQFKxPWsl6u+dj7CdLehkWRpSvjDp5SpUaQSrrsZAGrHNsSCAHny
         LkGMVSW+W8Bwd19wQTOD78SRzO8kR+NSvgeEO5JDQAokC7lXhPjlS66bPcVfM0pdVGXl
         IWxkBSOwqo+epFCAVXPnfdkQYMRZQsQNW1tGe13yfbot/HM6PmO0cBvAxfuI2XqEmFYH
         GgUw==
X-Gm-Message-State: AOAM53311cQe/7aLmLuygDXMzl/BI6tVrQlsus6XKT03NZ+MqxsPO8x6
	FbGmlMGtxS6dRn43Av471/cm/g==
X-Google-Smtp-Source: ABdhPJxTDgkCzRhXiZD42ow6b6qT65RvlNVYtnrhR+Take7W2E+AnlGP+2ZnU2Wnx8PdHD/AxJyV6Q==
X-Received: by 2002:adf:8b98:: with SMTP id o24mr456598wra.156.1589491276019;
        Thu, 14 May 2020 14:21:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h27sm381271wrc.46.2020.05.14.14.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:21:15 -0700 (PDT)
Message-ID: <46e7dbc17ee0237529c6ae3d3f5162aa16105cd0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] image_types: declare support for wic.zst
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Diego <diego.rondini@kynetics.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2020 22:21:14 +0100
In-Reply-To: <20200514131956.18463-1-diego.rondini@kynetics.com>
References: <20200514131956.18463-1-diego.rondini@kynetics.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-05-14 at 15:19 +0200, Diego wrote:
> Declare images in wic.zst format as supported, as bmaptool now supports
> zstd:
> https://github.com/intel/bmap-tools/commit/1b8437d58447d3796dc11fd0f2c62bec5746e5d6
> Given the very fast decompression speed of zstd over, for example, gzip,
> writing images with bmaptool can provide big write speed improvements
> when decompression speed is the limiting factor (especially with very
> sparse images).
> 
> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> ---
>  meta/classes/image_types.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index f82f1d8862..ab05cc90ff 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -273,7 +273,7 @@ IMAGE_TYPES = " \
>      ubi ubifs multiubi \
>      tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
>      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
> -    wic wic.gz wic.bz2 wic.lzma \
> +    wic wic.gz wic.bz2 wic.lzma wic.zst \
>      container \
>      f2fs \
>  "

Causes selftest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/931

(oe-selftest -r imagefeatures.ImageFeatures.test_image_fstypes)

Cheers,

Richard

