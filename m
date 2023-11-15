Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D5FC4332F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 13:22:09 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.12707.1700054524390772117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 05:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PYEIKBlf;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso9688796e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 05:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700054522; x=1700659322; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+7kVgwg9x2vDb3HE8lERVV9PHSjnHivGhNTApIUcGn4=;
        b=PYEIKBlfVp4j6hKnxjYdmHpbHIeYbLnJVSJUlifP8fZHG79l/E8QSpUkD/w1rHUS44
         yHT2mlOO/Mv2BaXeWxMMguNAEwQR4I7LyVEGfZkC5TmJn6ZlSj9Y97COmkDYsRBGijTH
         vNtIF0Zc1cXoTERl9IKpkVuq0oVgysFgy5L9k+HDjB4Q6pvor3mu52F3qu+A5/MRI7/4
         rhVc9v68OZnR6/jgTJnKRyifLY6DNSjmwPkn1b4G7cFJ2d5iRFrHv2wibhQB8f5xrBJZ
         XP0XC33ziho7zMW4/vmuNYyMRtRCn3x200qb8YCvYrSGvzSqi8CC7G5/bFf/RyIqOCoZ
         g9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700054522; x=1700659322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+7kVgwg9x2vDb3HE8lERVV9PHSjnHivGhNTApIUcGn4=;
        b=RWpp6USTf6o1JuE78PlugIRe/s5fBqN0ExzqarGxaIlZNeajE1bzaTBiddkNz/c1PT
         5z1/JDbnD1KrbAn1naHuIlHwZ/Wri8hRqdb0S2T6lIHmf4TlDAXGpbqgmBMP2etgUL3N
         p1TuwlXbPMDgKPqmGqQOBteI9gEGdXJ2ZzXdd0/1h0e/zsa3tOZfAGcSoA1rHEfIomTC
         wzb9vy+p8PEWgKDhc0KtjOnQmFE3Mrkb7pAhtL5qVVMpYehtXn0bwcTyEzgMr7GHqZye
         Pwk4dwjFLOzpq4sd1a/vX8k1n0RtJypUpSNoxAfTBClPPqAV1wpvLUNwNwa4xq5qUoMa
         GWQw==
X-Gm-Message-State: AOJu0YyaQsnDcIXwjNizmiDvULaWi4boxIW06tqrMYy2c0q5IDljP9eM
	LwoD6L1WX3TpftWxg3wQPPPt66bJeSvHIylVWzqjLfK38Q8=
X-Google-Smtp-Source: AGHT+IFU/QiAtMgNit6+X7E1xcksnNrpiaWTJq5A8dRLhZAZf4o00j3vE9svuia8vJ4lcrp3/6PW//KGbyAIFgAqHpY=
X-Received: by 2002:a19:ae17:0:b0:506:926c:9b0d with SMTP id
 f23-20020a19ae17000000b00506926c9b0dmr7812701lfc.20.1700054522130; Wed, 15
 Nov 2023 05:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20231114210418.1323819-1-dmitry.baryshkov@linaro.org> <20231114210418.1323819-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231114210418.1323819-3-dmitry.baryshkov@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Nov 2023 14:21:50 +0100
Message-ID: <CANNYZj9tspe63BkSUU_sWQHdSpnK8kwFQvJETa6Mrw7CfifQXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] image_types.bbclass: add support for
 sparse images
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 13:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190595

We perhaps need tests as well?

Alex

On Tue, 14 Nov 2023 at 22:04, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>
> Android-targeted devices support so called sparse image format. This is
> the raw filesystem image with dropped zero blocks. This way the image
> takes less space and the bootloaders and/or filesystem manipulation
> tools can flash it quicker (as they do not have to write useless
> sequences of zeroes).
>
> Add new image conversion type called 'sparse'to be able to generate
> filesystem images in the sparse format.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta/classes-recipe/image_types.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
> index d615b41ed1ed..d0c9514b36a3 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -328,7 +328,7 @@ IMAGE_TYPES:append:x86-64 = " hddimg iso"
>  # CONVERSION_CMD/DEPENDS.
>  COMPRESSIONTYPES ?= ""
>
> -CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
> +CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync sparse ${COMPRESSIONTYPES}"
>  CONVERSION_CMD:lzma = "lzma -k -f -7 ${IMAGE_NAME}.${type}"
>  CONVERSION_CMD:gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.gz"
>  CONVERSION_CMD:bz2 = "pbzip2 -f -k ${IMAGE_NAME}.${type}"
> @@ -355,6 +355,7 @@ CONVERSION_CMD:qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}.${type} ${IMAGE_
>  CONVERSION_CMD:base64 = "base64 ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.base64"
>  CONVERSION_CMD:zsync = "zsyncmake_curl ${IMAGE_NAME}.${type}"
>  CONVERSION_CMD:gzsync = "zsyncmake_curl -z ${IMAGE_NAME}.${type}"
> +CONVERSION_CMD:sparse = "img2simg -c ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.sparse"
>  CONVERSION_DEPENDS_lzma = "xz-native"
>  CONVERSION_DEPENDS_gz = "pigz-native"
>  CONVERSION_DEPENDS_bz2 = "pbzip2-native"
> @@ -375,6 +376,7 @@ CONVERSION_DEPENDS_vhdx = "qemu-system-native"
>  CONVERSION_DEPENDS_vhd = "qemu-system-native"
>  CONVERSION_DEPENDS_zsync = "zsync-curl-native"
>  CONVERSION_DEPENDS_gzsync = "zsync-curl-native"
> +CONVERSION_DEPENDS_sparse = "rust-android-sparse-native"
>
>  RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
>  RUNNABLE_MACHINE_PATTERNS ?= "qemu"
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190521): https://lists.openembedded.org/g/openembedded-core/message/190521
> Mute This Topic: https://lists.openembedded.org/mt/102592509/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

