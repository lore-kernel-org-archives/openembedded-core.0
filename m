Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B254DC5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 10:44:17 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.68670.1673261048577831651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 02:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FJr1JiG2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso6705146wmb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 02:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvMUS0p58o4JcjBNVDlm6zqLpSZ0eVn7l7Ep+PzKejo=;
        b=FJr1JiG2LjlggeU/31+RzXTtPxOG7LoyJC0WZFvx7oj0nRIlAu/TMSkqIP7JGZWmqS
         cDppK2gSfr9ml6mE5QB8P/tkBz714akw7ubGj7IXrVys6ts5/hXwMIvOf3xqNxO024xO
         2e9DqtC7IRcHU75zeHi/PDryC6hhK0lJk8sDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XvMUS0p58o4JcjBNVDlm6zqLpSZ0eVn7l7Ep+PzKejo=;
        b=tXh/IqvFDpeY2dwOEgxglfMFbXEEDN12iID9GvmZcUn7rAdRPdorrFlP1EHRglqIW7
         IQlQL/e/WoSuKZeoufLwzX8jIe8In358sDU7vThhR8JJfIYzgBNlbAV7/p22NrATRJHK
         5fjxhxUa1IVJKJzWfroUTQULvGf3URbewbIYhT9p1qJwxYr2PdfQaVwZb1h66jdmWatV
         kqoGOrxd5RmtrGTGZ6/BZmYuZoASYy8O2b5gbkdVQlgAgMZYQuCEtwFOi3NCTQX5YI9z
         kDE7inkIG84rdSGwkV449WqN38k1ExV2MvRVckXlG4mZ8hPTs4QvsGUWj+jrmmJrkMPQ
         MMAw==
X-Gm-Message-State: AFqh2koCd1M2Dc7ueZ9yGrONkiUAJGAy+LYT8VF9ta3+/Pqod7S8rYDC
	Aq0eJ9s0ZD2Bgn7fSR+4OurBvg==
X-Google-Smtp-Source: AMrXdXvOsr8Mz8HakGih0HlU0cTfPKMphhKXiY2pc5X9prniSkqnDzwP8GnG56gyHnExD8SR881chg==
X-Received: by 2002:a05:600c:5c8:b0:3d1:4145:b3b with SMTP id p8-20020a05600c05c800b003d141450b3bmr47263859wmd.9.1673261046979;
        Mon, 09 Jan 2023 02:44:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bf05:daf1:cc08:7166? ([2001:8b0:aba:5f3c:bf05:daf1:cc08:7166])
        by smtp.gmail.com with ESMTPSA id r10-20020a05600c458a00b003d35acb0fd7sm16412769wmo.34.2023.01.09.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 02:44:06 -0800 (PST)
Message-ID: <90d500a25cd084c2e1a6238dddc17dcde60c125a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libpng: Enable NEON for aarch64 to enensure
 consistency with arm32.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leimaohui <leimaohui@fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 09 Jan 2023 10:44:06 +0000
In-Reply-To: <1672969740-3842-1-git-send-email-leimaohui@fujitsu.com>
References: <1672969740-3842-1-git-send-email-leimaohui@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 10:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175681

On Fri, 2023-01-06 at 09:49 +0800, leimaohui wrote:
> - When NEON is not enabled for arm32, it shouldn't be disable enable-arm-=
neon for other arches.
> - NEON is enabled for aarch64 by default, so, to ensure consistency with =
arm32, reference to libpng-1.6.38/configure, added enable_hardware_optimiza=
tions option for aarch64.
>=20
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  meta/recipes-multimedia/libpng/libpng_1.6.39.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recip=
es-multimedia/libpng/libpng_1.6.39.bb
> index d9dcf37..b17261a 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
> @@ -22,7 +22,8 @@ BINCONFIG =3D "${bindir}/libpng-config ${bindir}/libpng=
16-config"
>  inherit autotools binconfig-disabled pkgconfig
> =20
>  # Work around missing symbols
> -EXTRA_OECONF:append:class-target =3D " ${@bb.utils.contains("TUNE_FEATUR=
ES", "neon", "--enable-arm-neon=3Don", "--enable-arm-neon=3Doff", d)}"
> +EXTRA_OECONF:append:class-target =3D " ${@bb.utils.contains("TUNE_FEATUR=
ES", "neon", "--enable-arm-neon=3Don", " ", d)}"
> +EXTRA_OECONF:append:aarch64 =3D " --enable-hardware-optimizations=3Don "
> =20
>  PACKAGES =3D+ "${PN}-tools"

I'm a bit worried that we don't want this option floating. How about
something like:

ARMNEON =3D "${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-ne=
on=3Don", "--enable-arm-neon=3Doff", d)}"
ARMNEON:aarch64 =3D "--enable-hardware-optimizations=3Don"
EXTRA_OECONF +=3D "${ARMNEON}"

?

Cheers,

Richard

