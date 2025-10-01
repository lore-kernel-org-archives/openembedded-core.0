Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7637CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 15:59:26 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.832.1759334364271333248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 08:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QsV4KptQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.170, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d71bcab69so612687b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 08:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759334363; x=1759939163; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WegX5ijV88AIzKzhFpbjKOZ7B0NKG2kgdex5Ex1+rOc=;
        b=QsV4KptQaYTjHZHRB1hq47d65A2rVlGenrF04KFPCSubWv0qiNgfVqHAJ8SyeYsCU1
         MUpOSE6vBOn0Gsw3MBaeVTkYZfgw0r/G+0dvbL1LVv5cVq5Pl+uuj7DrF5/r4WSEIG2a
         K7BHf0hjImzOtxo1VgBMAdhxP5a+RJ+Ts79uWMwlihCwwiBl+7bqFNW/tlOfRf9PcJBs
         yoUT2Dsqg4asInUGYP+QbPi8PFszMbkUcB9nmxHxiHmh+OzyfmdheGpnQEu23lWLFZGZ
         K6Ic1YZJEFWLdiv8Pm4QjR1W4rlMCxXPc3a+SvJIWUyqGKFmcnvojtnJd0TeUMSsnrtA
         ra1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759334363; x=1759939163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WegX5ijV88AIzKzhFpbjKOZ7B0NKG2kgdex5Ex1+rOc=;
        b=upp0yda/PoYIcszvClFn2ptcK2USUp+XRyZnV9Akkqiv8c8pAZ/6gwVhM5udyHLaVV
         uJUojjwoDJgu/K0itBSe3AkYbeSxNiUWeGzUkRFFpMKs2lGMrujYSuNXDzJVchlcSXXu
         svADCd0A8jJt8a0CFqNLh96ZXB7SODaaE2Y83BP22Fnc+wLbE3jLNbPEgrIGF6PgSg9c
         omsDxXeoeFSgd5gjB4JwTEJ+FuEmvK1e8IcN295iiYAn2pW4ku66hHN4IiGhTsjXp6dY
         SRiXmil3DGVKfErCjB8XaXDg0AHcLguuj3xwYkJtBPrcgnTx/tp2ul36FJREXw5/q/Pp
         C9Tw==
X-Gm-Message-State: AOJu0Yw7Gdbf6J39PRgKnoSYu9u1dg0yRuthTqxUGYHvMhGkzw6E83gS
	fDp4CN84UuvERExEJmzvRmF04BuGb/Xrc5BLqaRJ22Osci0Qu0g8hyjIRyX6pLMKWEd9ni6LmI7
	mRHlCPrw5LWHPAj/l8pxioqyvE1fYuMzRb5S6ZZx62A==
X-Gm-Gg: ASbGnctomQUrak15vpqwZxp4ZjYNL//UmVZJybo0s74reDrZUkOd/bwbq5KS7yh5ISI
	1tlxfcNvQv+TeXwIJ8dCOrcOzMyJ2sFgy2c8weRiLL9z2OEYQJuYb0K+4ap8uR2Z5nuq4GHPL7x
	KOarlckKkgaE2bIX1SMTWCLPVe0JH5PAQ/baLfUzB1PV7L/gIWrhgybPHWJ1/be7heVRCRgaBtn
	p8uLiugiBBE7OezHQ/1kBmAyEgEKgm6NOKqA4jGf6/rLzLx5/a4PTLIMaciP3Y=
X-Google-Smtp-Source: AGHT+IHV6HVnOmzH5GMMi5VXAob0AdY7q1epaSip5MkFaoNQlEm74twNYh0q7FaxX+X1SxkWORsVvS9QEweFZ9s3mnM=
X-Received: by 2002:a05:690e:2490:b0:633:b9eb:85e9 with SMTP id
 956f58d0204a3-63b6ff98eb2mr4744698d50.32.1759334363413; Wed, 01 Oct 2025
 08:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <fefec75a-d849-430a-a503-1369dee54671@gmail.com>
In-Reply-To: <fefec75a-d849-430a-a503-1369dee54671@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 1 Oct 2025 08:59:12 -0700
X-Gm-Features: AS18NWDpR49LyLOgQGBj57mUd77O4hL1lDngx4mSKcaFnsQTzLV21gbdWpN2nvY
Message-ID: <CAOSpxda8nVnM9Yxn13rGYHUZxczD_duoZkbU+f_HWBN7SKZUNQ@mail.gmail.com>
Subject: Re: [scarthgap][PATCH] vim: fix xxd-native RPROVIDES
To: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Cc: openembedded-core@lists.openembedded.org, denys@konsulko.com, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 15:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224310

On Sun, Sep 28, 2025 at 9:14=E2=80=AFAM Clayton Casciato
<majortomtosourcecontrol@gmail.com> wrote:
>
> BBCLASSEXTEND doesn't handle overrides with suffixed ${PN} for
> native class, e.g.:
>
> RPROVIDES:${PN}-xxd =3D "xxd"
>
> becomes:
>
> RPROVIDES:vim-native-xxd =3D "xxd-native"
>
> instead of:
>
> RPROVIDES:vim-xxd-native =3D "xxd-native"
>
> This results in "Nothing RPROVIDES xxd-native" error when
> something RDEPENDS on xxd-native because there's no such
> package as vim-native-xxd.
>
> Use ${BPN} and explicitly handle RPROVIDES.
>
> Since native class does not produce packages, other variables
> using :${PN}-xxd override don't matter. And nativesdk class
> is not affected, as it uses a prefix, not suffix.
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
> ---
> Sponsor: 21SoftWare LLC
>
> Patch from:
> https://lists.openembedded.org/g/openembedded-core/topic/109930389

Richard rejected this patch for master in the above thread, so I can't
take it for a stable release.

Steve

>
> Walnascar:
> e2fd81e221c2 ("native: Improve ${PN}-XXX package name handling")
>
>  meta/recipes-support/vim/vim_9.1.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/v=
im/vim_9.1.bb
> index fee9f055e9..8968b8cb07 100644
> --- a/meta/recipes-support/vim/vim_9.1.bb
> +++ b/meta/recipes-support/vim/vim_9.1.bb
> @@ -11,7 +11,9 @@ BBCLASSEXTEND =3D "native nativesdk"
>
>  PACKAGES =3D+ "${PN}-xxd"
>  FILES:${PN}-xxd =3D "${bindir}/xxd"
> -RPROVIDES:${PN}-xxd =3D "xxd"
> +RPROVIDES:${BPN}-xxd =3D "xxd"
> +RPROVIDES:${BPN}-xxd-native =3D "xxd-native"
> +RPROVIDES:nativesdk-${BPN}-xxd =3D "nativesdk-xxd"
>
>  ALTERNATIVE:${PN}-xxd =3D "xxd"
>  ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"

