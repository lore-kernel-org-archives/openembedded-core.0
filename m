Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGvxF-0000DJ-6o
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 20:03:25 +0200
Received: by wgbdq11 with SMTP id dq11so613719wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 10:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HbOAxM8TNSWQ9BIg01LkBxezl1Hcn2UctQ31aZW4uSo=;
	b=Izly/b+Op4kTyXsj4NmuOAEwobtbmj/m5KOD8reKVT4V2qoOLVKPkV1alnFV5qVyhg
	axJHOF4BEFF/yYtVpHQO7vO69ADWM+adMJmZUOX7HZGoIV8/9BwHjPFGcoGQ3nfrA1eB
	v2RnfiNBwc1pxDKD0gPD9XZfM+Fqwc3c/pTXUk7n3wGFKNm8TZX9zvVp7hxNj5S7mu93
	enYIAMjHxByvQjkDYU7+ZeSb+Wg0/7Dd/WC74zE+W88qbiUDRZng3ce039S9C4XosZLx
	/L9LpcRy420VcKOGpFdOP77hVDvRUkmJ2oFQv6OokdXTTNqDijojJmbSJIm1rSdAmJvz
	XPRg==
Received: by 10.180.78.40 with SMTP id y8mr2990908wiw.7.1348681832205;
	Wed, 26 Sep 2012 10:50:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm8179785wix.6.2012.09.26.10.50.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 10:50:30 -0700 (PDT)
Date: Wed, 26 Sep 2012 19:50:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20120926175038.GB19337@jama.jama.net>
References: <1348675707-24182-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1348675707-24182-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: fix -exa conflicts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 18:03:25 -0000
X-Groupsio-MsgNum: 29947
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 05:08:27PM +0100, Ross Burton wrote:
> Hopefully for good this time!
>=20
> The previous conflict of < ${PV} declares a conflict with all versions ol=
der
> than the version being built, which isn't right.
>=20
> This conflict was being declared in a .inc file which is being included by
> multiple recipes (xserver-psb in meta-intel, for example) so knowledge of=
 the
> exact version in which this change occured is only known by the .bb file =
itself.
> Recognise this and put the conflict in the .bb file itself.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc |    4 ++++
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc        |    1 -
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> index 35cb33a..a2d1bec 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> @@ -9,3 +9,7 @@ SRC_URI[md5sum] =3D "8796fff441e5435ee36a72579008af24"
>  SRC_URI[sha256sum] =3D "fa415decf02027ca278b06254ccfbcceba2a83c274140525=
7ebf749da4a73cf2"
> =20
>  PR =3D "r8"
> +
> +# This conflict needs to be here and not in the .inc so we know the exact
> +# version where the break was
> +RCONFLICTS_${PN}-module-exa =3D "${PN} (< 1.11.2-r5)"

This doesn't work if there is layer with PRINC or even more layers which
doesn't know about each other, see:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/03001=
4.html

Cheers,

> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
> index 643ca70..3ec38b7 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -66,7 +66,6 @@ PACKAGES =3D+ "${PN}-security-policy \
> =20
>  RRECOMMENDS_${PN} +=3D "${PN}-security-policy xkeyboard-config rgb xserv=
er-xf86-config"
>  RDEPENDS_${PN}-xvfb +=3D "xkeyboard-config"
> -RCONFLICTS_${PN}-module-exa =3D "${PN} (<${PV})"
> =20
>  FILES_${PN} =3D "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${l=
ibdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xor=
g/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.con=
f.d"
>  FILES_${PN}-dev +=3D "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules=
/*/*.la"
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBjQG4ACgkQN1Ujt2V2gBwvZQCfRE+kgAv+Rg6pmYEIIFYkjVMm
STwAnRmYDZP6x1ws+WYvVUoUGH+7y3Wp
=4tqX
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
