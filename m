Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYLZN-0004UK-M9
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 18:46:13 +0100
Received: by eaao14 with SMTP id o14so692809eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 09:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kvuTOrmMYkTQq3DSTHVt5tUOzOVBQxYzUkrNAwGbCJE=;
	b=bvygbTOW9wx9eDLFh6L/H175e+81jTgsLG4S1H0YXy8saqqZ00c+YFPQdaSZygVtEY
	bPWQE+1fvi4HSWa+f1HTSpf9vB+NBx8fvhr3Sx9xGy34n+VW8d4t3u4WujSvc79dP1xF
	eTZdjc6SCIerER3mFQ5AW/FHR4XQZCeI/PyS8=
Received: by 10.213.10.66 with SMTP id o2mr3739842ebo.135.1323279564366;
	Wed, 07 Dec 2011 09:39:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 17sm8325494eej.3.2011.12.07.09.39.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 09:39:23 -0800 (PST)
Date: Wed, 7 Dec 2011 18:39:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111207173910.GK3897@jama.jama.net>
References: <1323279247.30601.51.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1323279247.30601.51.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf/image.bbclass: Ensure images use the correct passwd/group files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Dec 2011 17:46:13 -0000
X-Groupsio-MsgNum: 13763
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tv3+oRj6D9L8lW+H"
Content-Disposition: inline

--Tv3+oRj6D9L8lW+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2011 at 05:34:07PM +0000, Richard Purdie wrote:
> We need pseudo to use the rootfs passwd/group files belonging to the
> rootfs when building images. This patch ensures that we use the rootfs
> files instead of those in the sysroot which can lead to incorrect file
> ownership issues.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 4642fa6..865d430 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -121,6 +121,8 @@ IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
> =20
>  LINGUAS_INSTALL =3D "${@" ".join(map(lambda s: "locale-base-%s" % s, d.g=
etVar('IMAGE_LINGUAS', 1).split()))}"
> =20
> +PSEUDO_PASSWD =3D "${IMAGE_ROOTFS}"
> +
>  do_rootfs[nostamp] =3D "1"
>  do_rootfs[dirs] =3D "${TOPDIR}"
>  do_rootfs[lockfiles] +=3D "${IMAGE_ROOTFS}.lock"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e80cc32..eeb1fc4 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -580,11 +580,12 @@ SRC_URI =3D "file://${FILE}"
> =20
>  # Use pseudo as the fakeroot implementation
>  PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
> +PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}"
>  export PSEUDO_DISABLED =3D "1"
>  #export PSEUDO_PREFIX =3D "${STAGING_DIR_NATIVE}${prefix_native}"
>  #export PSEUDO_BINDIR =3D "${STAGING_DIR_NATIVE}${bindir_native}"
>  #export PSEUDO_LIBDIR =3D "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pse=
udo/lib
> -FAKEROOTENV =3D "PSEUDO_PREFIX=3D${STAGING_DIR_NATIVE}${prefix_native} P=
SEUDO_LOCALSTATEDIR=3D${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=3D${STAGING_DIR=
_TARGET} PSEUDO_NOSYMLINKEXP=3D1 PSEUDO_DISABLED=3D0"
> +FAKEROOTENV =3D "PSEUDO_PREFIX=3D${STAGING_DIR_NATIVE}${prefix_native} P=
SEUDO_LOCALSTATEDIR=3D${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=3D${PSEUDO_PASS=
WD} PSEUDO_NOSYMLINKEXP=3D1 PSEUDO_DISABLED=3D0"
>  FAKEROOTNOENV =3D "PSEUDO_UNLOAD=3D1"
>  FAKEROOTDIRS =3D "${PSEUDO_LOCALSTATEDIR}"
>  PREFERRED_PROVIDER_virtual/fakeroot-native ?=3D "pseudo-native"
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Tv3+oRj6D9L8lW+H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7fpL4ACgkQN1Ujt2V2gByDoQCcDv22HVOQHU6WYUBLSYHBQI85
5GIAoLwMOECcN33hLh3RwkHgNUhjBJW5
=MIlL
-----END PGP SIGNATURE-----

--Tv3+oRj6D9L8lW+H--
