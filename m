Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471BAC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 16:32:59 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.11202.1700152372162233435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 08:32:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MkEMlcwZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50a938dda08so1446934e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700152370; x=1700757170; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbMUcwzI8OPy19SrCteMGT63QaFzM0rHhmbRybGOKYw=;
        b=MkEMlcwZSHh9H60PShbgnlQqVGKeO10/PiaGw44psSpTSuqxWCcO/SEOnxKfvVTMTg
         tcjDjxzUSuhD49SblChI2+OorDZYCnuDO2ZolGyQpc+gxx/WzxpOu+rKdtC/8jXHSPhF
         ifm+3165jYbK9ZZlR6nPnhPsVxBZBRd6llIds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700152370; x=1700757170;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TbMUcwzI8OPy19SrCteMGT63QaFzM0rHhmbRybGOKYw=;
        b=Dd+mOc1I8q+aB7eJCL34zFYwzom3iUwwTwRHSLnDD0ZNugC315anBjq2AZzdGd8saO
         4Ievyn/UHU4U7VyRN1ugAi27uumpYtdYXkpN6fFkGvsQkXkQgugZxintNAfOCpzP7BBM
         RZDNG6SFS3Q+bfAz8E9MssQG4CsU0uJuT46FLrFQIO+1gU2OCAs2xWXXT4D5KbuavvL7
         rz//gIJ7bTBFvK+VxCPUceUnK923vSOQ04ZfSxrAo11ExrWvGltbBJJu9txrq144iDzz
         Nni47/I0hSbgVUC7rDa84IqbM8V9SiM3Uzhkxu56QaEwqzWIuy6NvFCU0nU7DUt5LPuE
         cAKA==
X-Gm-Message-State: AOJu0YyYcMWmeamjE5N/Lxw6+AnZBfmJ+CPFe7u0OAufMeMAFXcBZ/dk
	ywc762AaU7be9NJOEtGpgQU7bL//zB+tBGeQs7I=
X-Google-Smtp-Source: AGHT+IH7c9RjPBKJ2igiYBn+7SKWhen4IQoNa6fAjMCZtidXkZboqJwyoyUAVAFsBghNWOwEjLJqrg==
X-Received: by 2002:a19:4f4c:0:b0:509:440f:73e with SMTP id a12-20020a194f4c000000b00509440f073emr11943451lfk.39.1700152370339;
        Thu, 16 Nov 2023 08:32:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f8ae:b070:36e4:3937? ([2001:8b0:aba:5f3c:f8ae:b070:36e4:3937])
        by smtp.gmail.com with ESMTPSA id d34-20020a05600c4c2200b0040a48430837sm4116819wmp.13.2023.11.16.08.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 08:32:49 -0800 (PST)
Message-ID: <b76e12f0d17a26331a803b32203d8404081160a8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] image_types.bbclass: add support for
 sparse images
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2023 16:32:49 +0000
In-Reply-To: <20231114210418.1323819-3-dmitry.baryshkov@linaro.org>
References: <20231114210418.1323819-1-dmitry.baryshkov@linaro.org>
	 <20231114210418.1323819-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 16:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190803

On Wed, 2023-11-15 at 00:04 +0300, Dmitry Baryshkov wrote:
> Android-targeted devices support so called sparse image format. This is
> the raw filesystem image with dropped zero blocks. This way the image
> takes less space and the bootloaders and/or filesystem manipulation
> tools can flash it quicker (as they do not have to write useless
> sequences of zeroes).
>=20
> Add new image conversion type called 'sparse'to be able to generate
> filesystem images in the sparse format.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta/classes-recipe/image_types.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recip=
e/image_types.bbclass
> index d615b41ed1ed..d0c9514b36a3 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -328,7 +328,7 @@ IMAGE_TYPES:append:x86-64 =3D " hddimg iso"
>  # CONVERSION_CMD/DEPENDS.
>  COMPRESSIONTYPES ?=3D ""
> =20
> -CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1=
sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi q=
cow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
> +CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1=
sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi q=
cow2 base64 gzsync zsync sparse ${COMPRESSIONTYPES}"
>  CONVERSION_CMD:lzma =3D "lzma -k -f -7 ${IMAGE_NAME}.${type}"
>  CONVERSION_CMD:gz =3D "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}.${type=
} > ${IMAGE_NAME}.${type}.gz"
>  CONVERSION_CMD:bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}.${type}"

I think we may need to be more specific about what kind of "sparse"
image this is, maybe "android-sparse" ?

Cheers,

Richard

