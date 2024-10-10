Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3871ACF11EE
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 13:03:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.42657.1728565409115579804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 06:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JHnciL4U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-431160cdbd0so5403795e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728565407; x=1729170207; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OJgMDufwmxidBghfIfK5U6Xl32B3mlNgStf7NLPMXg=;
        b=JHnciL4U0LPNhOLYt9JX3+AylpnXpFxZih+uvVGiPXqYydjkKlIXl5T9JORle9W2E6
         NJ1n+iVPETN+a6fIg2zzgOiNHUMFGfFwWfkp2wYe+GzPGNxDipxFHIZ1IrXAZAOOXsOK
         1KugY1r7NyoNPjCcwM45w6MpnVSvJiDJO9BMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565407; x=1729170207;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2OJgMDufwmxidBghfIfK5U6Xl32B3mlNgStf7NLPMXg=;
        b=ICudiXhKpjijTFL79YV7eOsCh17vZ32z/l4yNcLRgeQgGKqhbHzRE9aVpSm0JWGa09
         YW1O9w7oGXJ69G0XV/VdRmUJlC+8EIby4wEwLbx4QW1uKYi+zFTss5EVRxevCqh/2kzB
         TKnPJPSCBNUom+tRL8hUBGNHZ97r6GBR29iDmIKqMgjmHNk/3y950dAxq7w4HNsQxN4b
         UN/ClXJH7BUTUtYhMba3U6htOJdJ+jMlKkCwCeTW73hMMe6bW04+K1jgl2begZAZWaAf
         +ob61WrWesBhCYAVvY2q1tJM87ERRGkBlpJJePUKjKE0P50rZoc5bv5+3CAm8xomMrQ5
         sbZg==
X-Forwarded-Encrypted: i=1; AJvYcCUOK2Pq+BSk7Wl6mVH0qGHw9WWvAQ3uJxnXy7tliRxCydXbTfm0B+CGvn56T4W9paUNTDdcJrHAjP8VKRPnx7Xr0g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw0OeD3UFCRgYi21Pt/TiPwqiTVhDEDUPhIJyskUoXEIkFtMflS
	KR77iW0rvUh3rm4M1jDcZBKFE0FAIDpcUj3z9jfBq2C1rCjHNvEDMjNfF6jm9HQ=
X-Google-Smtp-Source: AGHT+IE+vrTccMMK6GsFCuXmyaGVqEkGz+UUUe3VLDccgCNewZ9U8BDmufrVLTvUVPfKPFW+HlCcJw==
X-Received: by 2002:a05:600c:1c19:b0:431:1458:4d78 with SMTP id 5b1f17b1804b1-43115aa529bmr28189515e9.6.1728565407390;
        Thu, 10 Oct 2024 06:03:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a7cf:f342:7de0:8e9a? ([2001:8b0:aba:5f3c:a7cf:f342:7de0:8e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835d7b2sm15984665e9.42.2024.10.10.06.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:03:26 -0700 (PDT)
Message-ID: <7a24e8f91d5488a7d6b3fc8a101fe95004d1b436.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/10] ffmpeg: nasm is x86 only, so only
 DEPEND if x86
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2024 14:03:26 +0100
In-Reply-To: <20241008193103.2429829-1-ross.burton@arm.com>
References: <20241008193103.2429829-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 13:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205406

On Tue, 2024-10-08 at 20:30 +0100, Ross Burton via lists.openembedded.org w=
rote:
> No need to depend on nasm if we're not going to use it.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> index 9e60b5cd23e..b16bd51dbd7 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> @@ -46,7 +46,8 @@ ARM_INSTRUCTION_SET:armv6 =3D "arm"
> =C2=A0# libpostproc was previously packaged from a separate recipe
> =C2=A0PROVIDES =3D "libav libpostproc"
> =C2=A0
> -DEPENDS =3D "nasm-native"
> +DEPENDS:append:x86 =3D " nasm-native"
> +DEPENDS:append:x86-64 =3D " nasm-native"
> =C2=A0
> =C2=A0inherit autotools pkgconfig
> =C2=A0
>=20

I think something in here is causing:

https://valkyrie.yoctoproject.org/#/builders/99/builds/216/steps/17/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/89/builds/208/steps/12/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/7/builds/233/steps/12/logs/std=
io

and maybe more.

Cheers,

Richard

