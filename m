Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E8FC30658
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 13:37:20 +0000 (UTC)
Received: from dan.rpsys.net (dan.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.web11.26940.1719409030611596209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 06:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rpsys.net header.s=default header.b=llafWrXZ;
 spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1719409028; bh=2BXuNQiRHQ8vuyfG5I0mUIgRA39gjGAaWIa44z0IGxM=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=llafWrXZdK0oAkfIk7OdX3lRlqBhPjJQjftpR1vHV6H2g2A/nWPZ3Dp1C12JbS90I
	 UXpz7hZRjF7ro8HnA2N8Ff9vp7RzwncTOHLykUzr6qem4Gf7OL3FhbO1BCf5wHbepc
	 MGhIsIXmuDOwEPwc7aCAaELbWAql6+Bt+yftymYuzNP/op1AXiP02s2jvxrGs2LcCl
	 ROJPYptM7DZIhBvSc7jGaUf/qV4MnGe2qB2wbvoEiCQbqYM7xO7gIzosGbZZD94dli
	 vPVFn/h7+nN7IBz5tApuQoZHrxoOdCTBTgkVa4udDNSEPBL4S8b0C4lUdau9YHJGLQ
	 3MGy1ICVnI7mQ==
Received: from [192.168.1.8] ([192.168.1.8])
	(authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPSA id 45QDb6qE4060374
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:37:07 +0100
Message-ID: <6e13e5817b8c4dc5afe99642f06198359447854a.camel@rpsys.net>
Subject: Re: [OE-core] [PATCH] package.bbclass: Add Requires.private field
 in package_do_pkgconfig()
From: Richard Purdie <rpurdie@rpsys.net>
To: sreejith.ravi087@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2024 14:37:06 +0100
In-Reply-To: <20240625191513.22142-1-sreejith.ravi087@gmail.com>
References: <20240625191513.22142-1-sreejith.ravi087@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.11 at dan
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 13:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201164

On Tue, 2024-06-25 at 19:15 +0000, Sreejith Ravi via
lists.openembedded.org wrote:
> Currently, the package_do_pkgconfig() only handles the "Requires" key
> field from the .pc file and ignores the "Requires.private" field
> while
> generating the dev dependency chain. This results in a broken
> dependency
> list and requires the installation of recommended packages to resolve
> the build dependencies when using the dev IPKs. This increases the
> hard disk space usage and download time and installs many unnecessary
> packages as part of the recommendations.
>=20
> This patch ensures that the "Requires.private" field is also
> considered
> when creating the dependency list for the dev IPKs. With this, the
> dev
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
> diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
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
=A0=C2=A0=C2=A0 if hdr =3D=3D 'Requires' or hdr =3D=3D
> 'Requires.private':
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgconfig_needed[pkg] +=3D
> exp.replace(',', ' ').split()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m =
=3D var_re.match(l)
>=20

Unfortunately this patch fails to apply. This is not a patch against
master and obviously hasn't need tested there.

Cheers,

Richard


