Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9969B60024
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 12:41:15 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id n3so23944885wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 04:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rWQEmNRIWih24HCJlVF22a74YsuRTdsMn0ppL6+0QUw=;
	b=jfn7AV1dhRaHutwNTJAS7vEkNFmfecyXuj5Sy6FHGtc4rRPOyK0Tg6swRcKgcporzl
	TNyMGD434ZnSnM2Soz1/nGjFfqjgpfkWpy5cEFjqnrfsDJwdUxs8zuVN5pO5D9BK+ydB
	ehLn7F/AaVmUveRn1H2kcIe8bkx1D7YwaxkL1GWqsqaCd9YA3i1UmJnwIIWyYJZK+brt
	DjyfbpARS9hs55d4TivHt3/RITtTjVmY9xlO17QXjMEvdVJdYqjV3PUDFVlLeZN8NJAa
	HznXgVg6PVkwPXOISOqEHyoZG+agg+8cix0hv0tRHEyjQi2bR2Pclh6cdqBOPAE9nmME
	upzQ==
X-Received: by 10.180.205.163 with SMTP id lh3mr4007182wic.63.1422535275996;
	Thu, 29 Jan 2015 04:41:15 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i4sm10315897wje.20.2015.01.29.04.41.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jan 2015 04:41:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 29 Jan 2015 13:41:18 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20150129124118.GA2443@jama>
References: <1421597533-7850-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1421597533-7850-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [dizzy][PATCH] package.bbclass: Fix support for private libs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Jan 2015 12:41:20 -0000
X-Groupsio-MsgNum: 61807
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2015 at 05:12:13PM +0100, Martin Jansa wrote:
> * n is a tuple since this commit:
>   commit d3aa7668a9f001044d0a0f1ba2de425a36056102
>   Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>   Date:   Mon Jul 7 18:41:23 2014 +0100
>   Subject package.bbclass: Improve shlibs needed data structure
>=20
>   since then 'n in private_libs' was always false and private libs
>   were always processed
> * this is bad when we have libfoo in private libs, but also some package
>   providing libfoo, that way we ship own libfoo.so, but together with
>   runtime dependency on package providing libfoo

ping

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/package.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 96d7fd9..4685cd2 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1572,7 +1572,7 @@ python package_do_shlibs() {
>              # /opt/abc/lib/libfoo.so.1 and contains /usr/bin/abc dependi=
ng on system library libfoo.so.1
>              # but skipping it is still better alternative than providing=
 own
>              # version and then adding runtime dependency for the same sy=
stem library
> -            if private_libs and n in private_libs:
> +            if private_libs and n[0] in private_libs:
>                  bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' =
% (pkg, n[0]))
>                  continue
>              if n[0] in shlib_provider.keys():
> --=20
> 2.2.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTKKm4ACgkQN1Ujt2V2gBxFKwCggSgk/WPX+uq+KZjyvCwFeO9Y
xf0An1CC6AdBebCnQMgTTFvVcTZx9vgA
=5wr5
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
