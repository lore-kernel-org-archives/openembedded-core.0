Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlHDg-0002U2-17
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 10:45:16 +0100
Received: by eaao13 with SMTP id o13so520252eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 01:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fDxg80ph/kZv0IiNuoC0smUlcCYr1urbLWx1DR7+RWE=;
	b=fCHFWCVqXiKwSpQDbvpLAGJRoJD3YkjxgK0QEa9ThVu9VbJw38YxaAq0dvpN8TQFzs
	4G2hTzCANWHv4Wwiju6N6qvZDqHWxibBlmTHrwWyz9X1ZguUXAOge3YQ5ZHJu2b4mzf6
	CyDn3vdblgs+S7b3Q3F/HhFAdRdrxLAjHQyWc=
Received: by 10.213.23.3 with SMTP id p3mr664491ebb.2.1326361065358;
	Thu, 12 Jan 2012 01:37:45 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x43sm17319500eef.8.2012.01.12.01.37.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 01:37:44 -0800 (PST)
Date: Thu, 12 Jan 2012 10:37:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120112093732.GA3452@jama.jama.net>
References: <1326225078-18652-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1326225078-18652-1-git-send-email-kergoth@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] ncurses-native: install to libdir, not base_libdir
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
X-List-Received-Date: Thu, 12 Jan 2012 09:45:16 -0000
X-Groupsio-MsgNum: 15862
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2012 at 01:51:18PM -0600, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> For target, both base_libdir and libdir in sysroot can be used, as we pass
> --sysroot to the toolchain. For native, we don't do this, and we also onl=
y add
> -L<sysroot>/${libdir}, not -L<sysroot>/${base_libdir}, resulting in other
> native recipes (like readline-native) failing to find the ncurses librari=
es.
>=20
> readline-native only built successfully on hosts where it could fall back=
 to
> their ncurses/termcap rather than the one in the sysroot.

Fixes issues I'm seeing while rebuilding from scratch, thanks!

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-core/ncurses/ncurses.inc |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
> index 8321d7b..43303b7 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://ncurses/base/version.c;begin=
line=3D1;endline=3D27;md5=3Dcbc
>  SECTION =3D "libs"
>  DEPENDS =3D "ncurses-native"
>  DEPENDS_virtclass-native =3D ""
> -INC_PR =3D "r3"
> +INC_PR =3D "r4"
> =20
>  inherit autotools binconfig multilib_header
> =20
> @@ -26,8 +26,8 @@ ENABLE_WIDEC ?=3D "true"
>  # builds.
>  BUILD_CPPFLAGS +=3D "-D_GNU_SOURCE"
> =20
> -# tic from the -native build cannot run without setting this explicitly
> -BUILD_LDFLAGS_virtclass-native +=3D "-Wl,-rpath,${base_libdir}"
> +# natives don't generally look in base_libdir
> +base_libdir_virtclass-native =3D "${libdir}"
> =20
>  # Helper function for do_configure to allow multiple configurations
>  # $1 the directory to run configure in
> --=20
> 1.7.8.rc4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8OqdwACgkQN1Ujt2V2gByIdQCglmXQSkmrR9+N/VJvwgpyanLa
3rMAn3PUxUOjf9QWvbRlhNQdqjC1s/gB
=L1ZQ
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
