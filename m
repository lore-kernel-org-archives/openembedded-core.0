Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B99BC7EE23
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:27:31 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.22288.1677256050123788407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EHWPmW9I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id bw19so3872374wrb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 08:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=grKoBukwQicRTe1EhxWkaCwpPEQVRL5ZFxSLobn9ASQ=;
        b=EHWPmW9ILUEPsePkm3fuLsMaU/im+e2VqVu/x9uhoytfE3wT8PcAiLLZ/IOBYhwf70
         wTkMCxdEgkD4Nxo6f0Xii9zfxIM7OJZukIuYcT9Hl3uKsF0b04AaKqrKIr/bs+jv6Ltp
         i178De7RIJI+6kMfTDchfR72tfyr3/+wq9RTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grKoBukwQicRTe1EhxWkaCwpPEQVRL5ZFxSLobn9ASQ=;
        b=kBewLZ1xDblm2ipJ/r0GwU0vcGllQnFZo3SHIae/6KSUniHSzzJi/EhyRKZFKrpoGM
         Y8+akgF3jsKA1oH8VAP5MOyKzznf/cwr7+PcGQ9m0nv4ncw8afzbPZ91qfM1beKNENc1
         a3GcIQWEuQ48NemJWhIjE7UMfQxeBNjr6Flywx62QpHE+zW13rMpEKnNgqNMTm/yY+Gw
         1wXxyE4HG/vam/OKzDjxPdIuxg2dXsPmt/g4zkbAyarMnT1q2l1ebLrL+ZN1zLbKlONJ
         4ZTOar+kLnAr0JRSwZAKl2DIAC5m7z6zU9/3tzCAzQaLqVJYmS3Bma+3PgWm8mWeyJmE
         eOkw==
X-Gm-Message-State: AO0yUKVtYOuzGCUaBa/APwxNUVm/gggRXgBGc3T57gd2lfGKhn6+fnCY
	26MVzEKc9Ys5U0g9lE1f2pYOIA==
X-Google-Smtp-Source: AK7set/pyrjqAAocAJvuXaucrXnfnqMvCILaU63iU5DH9TQCkt0RxVSyosIvVxclSTmcv2m7g+mboQ==
X-Received: by 2002:adf:e58a:0:b0:2c7:d6a:cca9 with SMTP id l10-20020adfe58a000000b002c70d6acca9mr7235308wrm.23.1677256048271;
        Fri, 24 Feb 2023 08:27:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7? ([2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7])
        by smtp.gmail.com with ESMTPSA id n13-20020a5d4c4d000000b002c55de1c72bsm17464746wrt.62.2023.02.24.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 08:27:27 -0800 (PST)
Message-ID: <bdc9e1da6cce62c017e767addc91633a724bf27d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] icecc.bbclass: enable the network only when
 ICECC_DISABLED is not set
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Date: Fri, 24 Feb 2023 16:27:27 +0000
In-Reply-To: <20230217095855.1932015-1-jose.quaresma@foundries.io>
References: <20230217095855.1932015-1-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177694

On Fri, 2023-02-17 at 09:58 +0000, Jose Quaresma wrote:
> Enabling the network uncondictional is not need for some use cases.
>=20
> Such use case is usefull to reuse the sstate-cache of the build
> and it requires the icecc inherit in all of the builds.
> The real control control of the icecc is in the variable ICECC_DISABLED
> so this patch change the logic to enable the network when the icecc is in=
 use.
>=20
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes/icecc.bbclass | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 312e0f17b5..159cae20f8 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -428,22 +428,18 @@ set_icecc_env() {
>      bbnote "Using icecc tarball: $ICECC_VERSION"
>  }
> =20
> -do_configure[network] =3D "1"
>  do_configure:prepend() {
>      set_icecc_env
>  }
> =20
> -do_compile[network] =3D "1"
>  do_compile:prepend() {
>      set_icecc_env
>  }
> =20
> -do_compile_kernelmodules[network] =3D "1"
>  do_compile_kernelmodules:prepend() {
>      set_icecc_env
>  }
> =20
> -do_install[network] =3D "1"
>  do_install:prepend() {
>      set_icecc_env
>  }
> @@ -457,3 +453,9 @@ ICECC_SDK_HOST_TASK:pn-uninative-tarball =3D ""
> =20
>  # Add the toolchain scripts to the SDK
>  TOOLCHAIN_HOST_TASK:append =3D " ${ICECC_SDK_HOST_TASK}"
> +
> +python () {
> +    if d.getVar('ICECC_DISABLED') !=3D "1":
> +        for task in ['do_configure', 'do_compile', 'do_compile_kernelmod=
ules', 'do_install']:
> +                d.setVarFlag(task, 'network', '1')
> +}

I did want to talk a little about the overhead this has. Basically
you've turned a simple flag setting into some anonymous python so the
parsing overhead increases with it since there is now code parsing and
execution to add in.

For a single recipe this isn't so bad but when it is being added to
every recipe it adds up.

I'm not against the change as such, I just see a continual flood of
patches adding conditions everywhere for various reasons and each one
degrades parsing speed a little bit more (as well as complicates the
test matrix).

I personally don't use this class so I don't have a stake in this one
but I thought it worth highlighting since I think the overhead of this
was mentioned elsewhere and I think the overhead isn't widely
understood.

Cheers,

Richard





