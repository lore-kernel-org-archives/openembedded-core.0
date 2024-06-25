Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25D6C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 21:41:45 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.9666.1719351701126770957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 14:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hzb8vjGx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42138eadf64so51349335e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 14:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719351699; x=1719956499; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXNRLm8vGIqv0YuB5lIgtsgmZEecNOKo8z5fi4klRZ8=;
        b=hzb8vjGxgt5Dg/KLSgYAA0si+ViAyUcs2EJHQppZQ3Xa93zf5SrqI9qMSO0xt2Ydlc
         AAJ2A8iAHS+4N753ECVWXHbqRVufX9kZJKKrAiNB9YD4gP7hu4N4nAe/2uSJEuVSmDAk
         tCjQUntyDOt6MgLxlhh7vwuqTLyivHgkfSZXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719351699; x=1719956499;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NXNRLm8vGIqv0YuB5lIgtsgmZEecNOKo8z5fi4klRZ8=;
        b=PQ5v3Xvk2IVnTAb22LDzEuXJI5NubWwvekH20bhzbbucAaYf6jcMMHhhIJ7zKePoaC
         DyH4Q4Z/kHVtZxxT6tDX0jOsyy1MN/odljLBWIGhk9GaoCZJB512woi1o4w+zGfDosJS
         aEi7Gh68uQ+JXOnAPj26pWo6tTbCK/4zIXkYz0Nd7fgXAIEwnZ5NUp9Yh63fac3qFYHd
         ptAMKElLXFTeKBj/TsBtJUtH9sPVAYPkTzF+XTB5z0p1hd8wdF2ljUFmbRvKY4plAXZ+
         s90JgFPt3fsRcRBLt4RVShj+gOhykE0xtfFTejkJsiPg0HCkh54jRBEdg/pbaz+aeGK3
         XS/A==
X-Forwarded-Encrypted: i=1; AJvYcCXDYISVbUFfSwcfG8GWeNtflzcl6iuGEDCzsfg/TrHE/ysFqictxAl/76fEKdbU0CSS8A4ER2UsHZQJbgU18KGoRPmPBr1K1khnRWC5aVHey8iHgkmM7Wl4
X-Gm-Message-State: AOJu0YzjWK5jbJ9UHe1CuwG8bolvP6clwypv3evg8ghDfdNyDffQCVQ3
	fMEPkoNZL77X4WgtR+1O807SpmbZ67vaGObQyfq1/nXT2SPTTBZvcqTcwzcnPaA=
X-Google-Smtp-Source: AGHT+IGBlyfTv5BtSHjIoyNe7Wz74EMKifxeJjCouT3kQd26ZdntNc8Ptc25FvJtdRxMJGyPPtUN/A==
X-Received: by 2002:a05:600c:4b1a:b0:424:a7ec:e796 with SMTP id 5b1f17b1804b1-424a7ecee39mr12178765e9.17.1719351699386;
        Tue, 25 Jun 2024 14:41:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2e57:40a:d63d:89e7? ([2001:8b0:aba:5f3c:2e57:40a:d63d:89e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8245da9sm1976205e9.1.2024.06.25.14.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:41:39 -0700 (PDT)
Message-ID: <77c5ad08b533613dbc8d57fdf565d53a373160d2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package.bbclass: Add Requires.private field
 in package_do_pkgconfig()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sreejith.ravi087@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2024 22:41:38 +0100
In-Reply-To: <20240625191513.22142-1-sreejith.ravi087@gmail.com>
References: <20240625191513.22142-1-sreejith.ravi087@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 21:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201147

On Tue, 2024-06-25 at 19:15 +0000, Sreejith Ravi via lists.openembedded.org=
 wrote:
> Currently, the package_do_pkgconfig() only handles the "Requires" key
> field from the .pc file and ignores the "Requires.private" field while
> generating the dev dependency chain. This results in a broken dependency
> list and requires the installation of recommended packages to resolve
> the build dependencies when using the dev IPKs. This increases the
> hard disk space usage and download time and installs many unnecessary
> packages as part of the recommendations.
>=20
> This patch ensures that the "Requires.private" field is also considered
> when creating the dependency list for the dev IPKs. With this, the dev
> IPK will have the proper dependencies listed, eliminating the need to
> install recommended packages to resolve the build time dependencies.
>=20
> Example: usr/lib/pkgconfig/libical.pc
> ----------
> Libs: -L${libdir} -lical -licalss -licalvcal
> Libs.private: -lpthread
> Requires.private: icu-i18n
> ----------
> Depends field generated for libical-dev
> Depends: glib-2.0-dev, libical (=3D 3.0.7-r0)
> ------------
>=20
> When trying to resolve the build time dependency with libical
> package using =E2=80=9C-dev=E2=80=9D ipk generated, it will throw the bel=
ow error.
> -----------
> Package icu-i18n was not found in the pkg-config search path.
> Perhaps you should add the directory containing `icu-i18n.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'icu-i18n', required by 'libical', not found
> -----------
>=20
> This patch will fix the broken dependency list.
>=20
> -------
> libical-dev depends field generated with this patch
> Depends: glib-2.0-dev, icu-dev, libical (=3D 3.0.7-r0)
> -------
>=20
> Other examples of packages generated with broken dev dependency.
>=20
> libflac-dev : https://packages.debian.org/sid/libflac-dev
> Without patch:
> Depends: flac (=3D 1.3.3-r0), libflac, libflac++
> with patch:
> Depends: flac (=3D 1.3.3-r0), libflac, libflac++, libogg-dev
>=20
> libglib2.0-dev : https://packages.debian.org/buster/libglib2.0-dev
> without patch:
> Depends: libffi-dev, libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev
> with patch:
> Depends: libffi-dev, libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 util-linux-dev, zlib-dev
>=20
> Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
> ---
> =C2=A0meta/classes/package.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 67351b2510..084fe428e5 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -2182,7 +2182,7 @@ python package_do_pkgconfig () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 m:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 hdr =3D m.group(1)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 exp =3D pd.expand(m.group(2))
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if hdr =3D=3D 'Requires':
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if hdr =3D=3D 'Requires' or hdr =3D=3D 'Requires.private':
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgconfig_needed[pkg] +=3D ex=
p.replace(',', ' ').split()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m =
=3D var_re.match(l)
>=20


As I understand it, Requires.private are only needed for static linking
so shouldn't this dependency just be added to the -staticdev package?
The -dev package wouldn't contain a static library anyway. Did you have
static libraries enabled?

Cheers,

Richard



