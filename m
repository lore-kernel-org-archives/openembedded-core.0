Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id DE9CD6B2BC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 10:15:44 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so6604447eaj.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jan 2014 02:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GEsJ/IACA5Tc+Fg8OqycanWp/yX86uy43sPvOpgiyzY=;
	b=bXzzFG49IbIg8diZk8pK2Alu7T1HaDY0EiuV5axWrK3EexnIfO+r6zMkxUtiJl4xBp
	fDx8Yqzow/W9SvPNfoHe873VtObMvsLOxSenRNwTJcgaF5uPIzK5sd75q/jX+4ztImjP
	5Ni2y5oPkSZin4Vz3LvTCpQWcbQIqSdhnyJh7DEQO6JU8u9xfiJpWYrOy4Bfcd4lLYlA
	qJajpdxDr3c2s4amW7sX2Rr2rdCf6fXjKo51RSmSYNN3F/P5SI4OFDNN9Ck1FZs4Q7iy
	yH+kUOoFRj4+xXx1Bh81RRV1yCSmlm7g+4S86i3mlVyxEL2tVUX7LF4u/SjNrI6XsyNH
	dXDw==
X-Received: by 10.15.91.3 with SMTP id r3mr74221293eez.18.1388744145521;
	Fri, 03 Jan 2014 02:15:45 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm143625852eef.16.2014.01.03.02.15.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jan 2014 02:15:44 -0800 (PST)
Date: Fri, 3 Jan 2014 11:15:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: jackie.huang@windriver.com
Message-ID: <20140103101548.GB3707@jama>
References: <1388741852-17520-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1388741852-17520-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] guile: fix the depends for target recipes
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
X-List-Received-Date: Fri, 03 Jan 2014 10:15:46 -0000
X-Groupsio-MsgNum: 48577
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline

--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2014 at 05:37:32PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The depenency on guild-native and libatomics-ops is missing
> in multilib build, fix the depends with class-target.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-devtools/guile/guile_2.0.9.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb b/meta/recipes-de=
vtools/guile/guile_2.0.9.bb
> index 4c3fe28..cb7c72e 100644
> --- a/meta/recipes-devtools/guile/guile_2.0.9.bb
> +++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
> @@ -33,7 +33,7 @@ BBCLASSEXTEND =3D "native"
> =20
>  DEPENDS =3D "libunistring bdwgc gmp libtool libffi"
>  # add guile-native only to the target recipe's DEPENDS
> -DEPENDS +=3D "${@['guile-native libatomics-ops', ''][d.getVar('PN', True=
) !=3D 'guile']}"
> +DEPENDS_append_class-target +=3D "guile-native libatomics-ops"

Don't use _append together with +=3D, just add space before guile-native.

> =20
>  RDEPENDS_${PN}_append_libc-glibc_class-target =3D "glibc-gconv-iso8859-1"
> =20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLGjdQACgkQN1Ujt2V2gBwyVwCeLm+zNk3zJ/cYkhffzVHSg8c+
YbgAn1TBiLzB5g/3wF3LW/SIo/J8KFdE
=94xq
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
