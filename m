Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF594C47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 19:04:02 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.796.1705950234341727554
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 11:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tga0OPQU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e86a9fbd9so38584415e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 11:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705950232; x=1706555032; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FsQpmV2zdTjZo/47+IFiDxu8+EDLujh6RENmNKAIdA=;
        b=Tga0OPQUMttBd/KHI7xx+fp3EN0ffYx5pw5+eqqBBLqCbwaKklDHNj2+EdA16atGGR
         /fftp8TMpqZiRJ2uNWvFAXtwdV7z0jVsWESigiPnYe79LrpbRQEzCRPhb/ejZcBvYvcK
         jxlJhhF7ltMPJG3SSlx1goAIPR3xPeOOWlSmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705950232; x=1706555032;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+FsQpmV2zdTjZo/47+IFiDxu8+EDLujh6RENmNKAIdA=;
        b=tuBWshZWnLFfUv+QJWXRDTK97aW1LjsOeWYr+cMLXzSrY21qYCcwwwocz0JI/nUD6U
         OQ9CXI6neqfGaRAnFLJbciOROHL0eeDLa9O2IaTnrQ64NLze1wZdiMpTWw9RgjR/aHgJ
         yx/mF+Vncm84Xv9KURdrFP/ziqzyMne3tn5ZvVZcJUzZ8XZnRI9YEtm+Fks5S1zyGXqc
         ydRvVRXyaX8gJeFt44xH4e+FG05KduEW4whfWtT7IMZqyNBIjgBLZ/lcWeQH229t7BC0
         bZRUVtYQgOybyK1EYW3HyUjCKlzdtPRwmAs3kcRbhf9Utnt0W38VoRmMg/p3ty8Ei8Px
         fBTw==
X-Gm-Message-State: AOJu0YxHf+vgyjYB7dVCsFTV5Ah/AgYq703Vk9v4Je3Lp7JlQxeZtB+U
	dfPTgzbvq9/rVB+pqQ3Loscd3PN3NaN+u36UHAZ/RKUSVlg+VsV+l+4Dfq2xndIzqVZlSQsTiHt
	8
X-Google-Smtp-Source: AGHT+IH0TUtZSUx8CLEoiLGDoB1Ed1skajr8MCNJZPdyJt6lWp6pdTVfCyqQLLleBF6ZIjVBKKvJ8g==
X-Received: by 2002:a05:600c:3b9c:b0:40e:aec7:8f55 with SMTP id n28-20020a05600c3b9c00b0040eaec78f55mr891340wms.114.1705950232165;
        Mon, 22 Jan 2024 11:03:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a57c:4d56:a1d0:e701? ([2001:8b0:aba:5f3c:a57c:4d56:a1d0:e701])
        by smtp.gmail.com with ESMTPSA id y3-20020adfee03000000b003368c8d120fsm14501487wrn.7.2024.01.22.11.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 11:03:51 -0800 (PST)
Message-ID: <8157e567182f3b802404f1a3d95f82fd21f8c0ce.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perl: Fix perl-module-* being ignored via
 COMPLEMENTARY_GLOB
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: william.lyu@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2024 19:03:51 +0000
In-Reply-To: <20240122154919.42591-1-William.Lyu@windriver.com>
References: <20240122154919.42591-1-William.Lyu@windriver.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 19:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194190

On Mon, 2024-01-22 at 07:49 -0800, Lyu, William via
lists.openembedded.org wrote:
> From: William Lyu <William.Lyu@windriver.com>
>=20
> When perl-modules is added via COMPLEMENTARY_GLOB, all perl-module-*
> packages recommended by perl-modules are ignored due to the defined
> behavior of COMPLEMENTARY_GLOB.
>=20
> This patch changes the relationship between perl-modules and all of its
> perl-module-* from RRECOMMENDS to RDEPENDS. This makes sense as
> perl-modules should represent the collection of all optional
> perl-module-* packages. After this patch, perl-modules itself is being
> RRECOMMENDED instead of the individual perl-module-* packages
> perl-modules represents.
>=20
> Signed-off-by: William Lyu <William.Lyu@windriver.com>
> ---
>  meta/recipes-devtools/perl/perl_5.38.2.bb | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb b/meta/recipes-dev=
tools/perl/perl_5.38.2.bb
> index a9d684cfc5..5037816f89 100644
> --- a/meta/recipes-devtools/perl/perl_5.38.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.38.2.bb
> @@ -306,8 +306,8 @@ ALTERNATIVE_PRIORITY =3D "40"
>  ALTERNATIVE:${PN}-doc =3D "Thread.3"
>  ALTERNATIVE_LINK_NAME[Thread.3] =3D "${mandir}/man3/Thread.3"
> =20
> -# Create a perl-modules package recommending all the other perl
> -# packages (actually the non modules packages and not created too)
> +# Create a perl-modules package that represents the collection of all th=
e
> +# other perl packages (actually the non modules packages and not created=
 too).
>  ALLOW_EMPTY:${PN}-modules =3D "1"
>  PACKAGES +=3D "${PN}-modules "
> =20
> @@ -322,11 +322,16 @@ python split_perl_packages () {
>      do_split_packages(d, libdir, r'.*linux/([^\/].*)\.(pm|pl|e2x)', '${P=
N}-module-%s', 'perl module %s', recursive=3DTrue, allow_dirs=3DFalse, matc=
h_path=3DTrue, prepend=3DFalse)
>      do_split_packages(d, libdir, r'(^(?!(CPAN\/|CPANPLUS\/|Module\/|unic=
ore\/|.*linux\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s=
', recursive=3DTrue, allow_dirs=3DFalse, match_path=3DTrue, prepend=3DFalse=
)
> =20
> -    # perl-modules should recommend every perl module, and only the
> +    # perl-modules should runtime-depend on every perl module, and only =
the
>      # modules. Don't attempt to use the result of do_split_packages() as=
 some
>      # modules are manually split (eg. perl-module-unicore).
>      packages =3D filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGE=
S').split())
> -    d.setVar(d.expand("RRECOMMENDS:${PN}-modules"), ' '.join(packages))
> +    d.setVar(d.expand("RDEPENDS:${PN}-modules"), ' '.join(packages))
> +
> +    # As perl-modules depends on all other, potentially non-existent, pe=
rl
> +    # packages, we allow these packages to be empty to prevent build err=
ors.
> +    for pkg in d.getVar(d.expand("RDEPENDS:${PN}-modules")).split():
> +        d.setVar(d.expand("ALLOW_EMPTY:" + pkg), "1")
> =20
>      # Read the pre-generated dependency file, and use it to set module d=
ependecies
>      for line in open(d.expand("${WORKDIR}") + '/perl-rdepends.txt').read=
lines():

Do you have some examples of these packages which don't exist?

I'd like to understand why they don't exist and perhaps not have them
listed in PACKAGES in the first place. Creating a load of empty/useless
packages with ALLOW_EMPTY seems a bit pointless/sad.

Cheers,

Richard




