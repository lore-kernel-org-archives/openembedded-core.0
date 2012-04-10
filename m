Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SHWje-0002pu-JT; Tue, 10 Apr 2012 10:47:34 +0200
Received: by wibhj13 with SMTP id hj13so2817020wib.6
	for <multiple recipients>; Tue, 10 Apr 2012 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JCy4Zqyizb1YtgEE840T/03QgYF7s5AgEWnGLWK0gjs=;
	b=GE+sToMGntY/nioz8VFAkylwixNnKgLrtIiFHzK/gThhJ35k+ZrvbiPriKOycJkyVj
	VHhlx1RFlXZz141Pm5hjbFNNyTCLFnW9oV22N3mAUm88/KctV4EwXLsFnvP0hfJIcxq3
	ehZPTKW8t5pswSBmnBV1YAcCVv70lF0VKp+dwRTnnWL+SJ3l5vBOn7aAV7FT+ZUixi7K
	osgNG7rSf2ylB10u4XWbciwdcE1DHwmNzRyBhM49QF9ZZmSQRQ6Y6x15YwAuB1Sxqg4b
	++S9q1fQhqjJfTuDMa5pD1aGkpiR7zCBTf47imeboa+usI3K3svbK/WTZ5ICsdSoSeHq
	pKCg==
Received: by 10.180.91.10 with SMTP id ca10mr4818756wib.17.1334047097162;
	Tue, 10 Apr 2012 01:38:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm58841541wib.0.2012.04.10.01.38.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 01:38:16 -0700 (PDT)
Date: Tue, 10 Apr 2012 10:38:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120410083815.GC3583@jama.jama.net>
References: <20120406001738.706A810217@opal>
MIME-Version: 1.0
In-Reply-To: <20120406001738.706A810217@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Gherzan : gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/ gdbm
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
X-List-Received-Date: Tue, 10 Apr 2012 08:47:34 -0000
X-Groupsio-MsgNum: 20483
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline

--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 06, 2012 at 12:17:38AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: e4d2ee00419f675ba8b7fb5d75256762253d8b32
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3De4d2ee00419f675ba8b7fb5d75256762253d8b32
>=20
> Author: Andrei Gherzan <andrei@gherzan.ro>
> Date:   Fri Mar 23 17:56:29 2012 +0200
>=20
> gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in incl=
ude/gdbm
>=20
> ndbm.h is needed by python for dbm module. This is why -enable-libgdbm-co=
mpat was added
> to configure.
> The second change is because python is looking for the gdbm headers in in=
clude/gdbm.
> The easiest way to solve this issue is to add symlinks in include/gdbm.
>=20
> [YOCTO #1937]
>=20
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>

This breaks every package in feed which depends on old package name
libgdbm4 (>=3D 1.10)

Because now there are 2 .so files in ${PN} and no LEAD_SONAME defined.

Are you going to=20

1) send PR bumps to all packages which depends on libgdbm4
   (e.g. apr-util python pulseaudio perl gst-plugins-good and probably more)
2) define LEAD_SONAME and bump PR in gdbm recipe
3) move -compat libs to ${PN}-compat or some other package name, so that
   old libgdbm4 still exists (and maybe + 1) because some people could
   build those with gdbm as dependency now)

Cheers,


>=20
> ---
>=20
>  meta/recipes-support/gdbm/gdbm_1.10.bb |   13 ++++++++++++-
>  1 files changed, 12 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb b/meta/recipes-suppor=
t/gdbm/gdbm_1.10.bb
> index 9b2fde4..26b8009 100644
> --- a/meta/recipes-support/gdbm/gdbm_1.10.bb
> +++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
> @@ -4,7 +4,7 @@ SECTION =3D "libs"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D241da1b9fe42e642cbb2c24d5e0c4=
d24"
> =20
> -PR =3D "r1"=20
> +PR =3D "r2"
> =20
>  SRC_URI =3D "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
> =20
> @@ -13,4 +13,15 @@ SRC_URI[sha256sum] =3D "23f8134c5b94bbfb06d756a6b78f07=
4fba6e6028cf2fe01341d40b26db
> =20
>  inherit autotools gettext lib_package
> =20
> +# Needed for dbm python module
> +EXTRA_OECONF =3D "-enable-libgdbm-compat"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +do_install_append () {
> +    # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let other=
 packages to find
> +    # these headers
> +    install -d ${D}${includedir}/gdbm
> +    ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
> +    ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
> +}
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+D8XcACgkQN1Ujt2V2gBwr3ACeIqQTo9bjIvwIjy7uhL+uwfq4
tMoAoLceZoM8ZIPhPO6jLEPc9i31PZ7Z
=X7RC
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--
