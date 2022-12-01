Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24536C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 19:12:56 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.53909.1669921973477637605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 11:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JlVYMxbO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id h12so4336339wrv.10
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 11:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mo0KjB3zGuXdn1Tw+XGL7DW7J7oDW8noPVT0oHU8vvU=;
        b=JlVYMxbOMmAZI0dJIQv2yx5s4a80LEuBXQAbUlcEEqvKk9sIk98GUcoOxZhTGDNwkT
         6SvjaEsUxlH25dHCzwzCZ7PRZIU/9XImbMD5PGEtykDLGcVA0b1hnXX4hQrlX+nPYguX
         HDCPbI//152gEDzOg31X5zz8r38JfK+vMqOU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mo0KjB3zGuXdn1Tw+XGL7DW7J7oDW8noPVT0oHU8vvU=;
        b=xYjt/WDQLpeNga3VKHkVq7o5Sbxx2xWYAXZObH8BLaTlEJc2jF75X8gnqJ3U6TyCEd
         ce8yqx3WRROuSBAbzJsCvswN1XQHjenF+LJVI7lg7ZyeBcK4YnAPrI4XojYqWgajpYrM
         cj3c3fXt89F+TBoSQf9GQwLyn7gKdkWokfgSLLwuIhp3dOhMbWIIImyuTxstS+dO6rQI
         yK5xfKCpxyeWkd1KL/2llUr2kXW5eL7djrR4hkyekNwHnvDfqZWY71aXjJVhOKcPTXwo
         7f0c75QKDxcT36vLWW+v1mEK2x3xYLqSuwkIvVlE+BalT9xxiguiS/b0hoXUx67AVoB/
         VWAQ==
X-Gm-Message-State: ANoB5pkxH/uqX6gJDZdkZUwm3bEoj0Q/PIiC7UcOnNmHBEmoK0iRR3A6
	IwHFH/sG91cmZOY2NuFFlFE7GQ==
X-Google-Smtp-Source: AA0mqf5dBl8epkg3VGDkq8j2SbGlrJ71HtFoyMZP7ljAWyiM8dIV1aixpqKi6mmcae6Jc/vbDeGhfA==
X-Received: by 2002:a5d:67d0:0:b0:241:781e:606 with SMTP id n16-20020a5d67d0000000b00241781e0606mr42044855wrw.216.1669921971660;
        Thu, 01 Dec 2022 11:12:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3f4c:de93:c029:9984? ([2001:8b0:aba:5f3c:3f4c:de93:c029:9984])
        by smtp.gmail.com with ESMTPSA id h34-20020a05600c49a200b003d0701ade2asm6891855wmp.7.2022.12.01.11.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:12:51 -0800 (PST)
Message-ID: <e65f40a225318abefd91c75d51943fc141368082.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/6] pseudo: Disable LFS on 32bit arches
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 01 Dec 2022 19:12:50 +0000
In-Reply-To: <20221201190248.175753-6-raj.khem@gmail.com>
References: <20221201190248.175753-1-raj.khem@gmail.com>
	 <20221201190248.175753-6-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 19:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174209

On Thu, 2022-12-01 at 11:02 -0800, Khem Raj wrote:
> pseudo overrides certain libc functions which are aliases when LFS64 is
> enabled. In anycase pseudo may not be much used on 32bit systems anyway
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
> index c34580b4ff..c3f0a987fc 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -17,5 +17,7 @@ SRCREV =3D "c9670c27ff67ab899007ce749254b16091577e55"
>  S =3D "${WORKDIR}/git"
>  PV =3D "1.9.0+git${SRCPV}"
> =20
> +TARGET_CPPFLAGS:remove =3D "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64=
"
> +
>=20

We need to put some comments in here about what this is doing and why.

Cheers,

Richard


