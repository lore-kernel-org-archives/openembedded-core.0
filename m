Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3E3610F5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 18:22:57 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id ty20so3281019lab.32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4Y5kJlS820EXBEz5xxaWaPZsIdViwerbY+py+ZCid2A=;
	b=lEJthq4ojyLE7q5uuTZEArmKl11iQbzkC1pKPMVrALfwP9x8EqNBdaKi3aPy55f0Ko
	aYOYFfA95Oa/OHWYjY8L1Rcmk23gr9BN4b7upyp+Drins1SRbUdIWf5EOQJ0eofTF6Nc
	rPSj39LfMSsswx279OmZnxzKM8JIAD5guBB/QH8MATrg0mmob9DlhSGJciPbEzpTJQSD
	rtA3X/OSxoY7Vh2iZE3GenRSz0D3CiihN0R0BM9k7qPUrIiv+YsYv3z6LxPfYsWda1iL
	afFAVqiK1DuqY63xakvsMVkEVlyXpA5cjQdQJ4F92hkSx3xASWafRursZ8EM4LECgYkq
	/p3A==
X-Received: by 10.112.30.39 with SMTP id p7mr18164497lbh.35.1408213378780;
	Sat, 16 Aug 2014 11:22:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x10sm7225940lal.13.2014.08.16.11.22.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Aug 2014 11:22:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 16 Aug 2014 20:22:56 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20140816182256.GD3660@jama>
References: <1406736276-25623-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1406736276-25623-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [RFC][PATCH] qemu.bbclass: add -r ${OLDEST_KERNEL} parameter
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
X-List-Received-Date: Sat, 16 Aug 2014 18:23:07 -0000
X-Groupsio-MsgNum: 56615
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Content-Disposition: inline

--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 06:04:36PM +0200, Martin Jansa wrote:
> * in some cases (e.g. with external toolchain which doesn't respect our
>   reasonably old version set in OLDEST_KERNEL) it's possible to have libc
>   which requires newer kernel than what we have on builders, qemu supports
>   -r param to use different uname than what's returned by host system.
> * change qemu_run_binary to pass -r ${OLDEST_KERNEL} and add the same to
>   QEMU_OPTIONS which are used by qemuwrapper-cross
> * maybe we should eventually convert all qemu_run_binary usages always in=
clude
>   qemuwrapper-cross dependency and always call qemu through that (it
>   seems very strange that qemu_target_binary is called from qemuwrapper
>   and for allarch recipes it can return qemu-allarch as qemu binary).
>=20
>   qemu_run_binary is used by:
>   meta/classes/gtk-immodules-cache.bbclass:            ${@qemu_run_binary=
(d, '$D', '${bindir}/gtk-query-immodules-$maj_ver.0')} \
>   meta/classes/qemu.bbclass:def qemu_run_binary(data, rootfs_path, binary=
):
>   meta/recipes-core/systemd/systemd_213.bb:         ${@qemu_run_binary(d,=
 '$D', '${base_bindir}/udevadm')} hwdb --update \
>   meta/recipes-graphics/pango/pango.inc:    ${@qemu_run_binary(d, '$D','$=
{bindir}/${MLPREFIX}pango-querymodules')} \
>=20
>   and qemuwrapper directly by:
>   scripts/postinst-intercepts/update_font_cache:PSEUDO_UNLOAD=3D1 qemuwra=
pper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D/${base_libdir}\
>   scripts/postinst-intercepts/update_pixbuf_cache:PSEUDO_UNLOAD=3D1 qemuw=
rapper -L $D -E LD_LIBRARY_PATH=3D$D/${libdir}:$D/${base_libdir}\

no comment?

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/qemu.bbclass | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>=20
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index abee8aa..b2cf85d 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -29,19 +29,20 @@ def qemu_run_binary(data, rootfs_path, binary):
> =20
>      libdir =3D rootfs_path + data.getVar("libdir", False)
>      base_libdir =3D rootfs_path + data.getVar("base_libdir", False)
> +    oldest_kernel =3D data.getVar("OLDEST_KERNEL", True)
> =20
> -    return "PSEUDO_UNLOAD=3D1 " + qemu_binary + " -L " + rootfs_path\
> +    return "PSEUDO_UNLOAD=3D1 " + qemu_binary + " -r " + oldest_kernel +=
 " -L " + rootfs_path\
>              + " -E LD_LIBRARY_PATH=3D" + libdir + ":" + base_libdir + " =
"\
>              + rootfs_path + binary
> =20
> -QEMU_OPTIONS =3D ""
> -QEMU_OPTIONS_iwmmxt    =3D "-cpu pxa270-c5"
> -QEMU_OPTIONS_armv6     =3D "-cpu arm1136"
> -QEMU_OPTIONS_armv7a    =3D "-cpu cortex-a8"
> -QEMU_OPTIONS_e500v2    =3D "-cpu e500v2"
> -QEMU_OPTIONS_e500mc    =3D "-cpu e500mc"
> -QEMU_OPTIONS_e5500     =3D "-cpu e5500"
> -QEMU_OPTIONS_e5500-64b =3D "-cpu e5500"
> -QEMU_OPTIONS_e6500     =3D "-cpu e6500"
> -QEMU_OPTIONS_e6500-64b =3D "-cpu e6500"
> -QEMU_OPTIONS_ppc7400   =3D "-cpu 7400"
> +QEMU_OPTIONS =3D "-r ${OLDEST_KERNEL}"
> +QEMU_OPTIONS_append_iwmmxt    =3D " -cpu pxa270-c5"
> +QEMU_OPTIONS_append_armv6     =3D " -cpu arm1136"
> +QEMU_OPTIONS_append_armv7a    =3D " -cpu cortex-a8"
> +QEMU_OPTIONS_append_e500v2    =3D " -cpu e500v2"
> +QEMU_OPTIONS_append_e500mc    =3D " -cpu e500mc"
> +QEMU_OPTIONS_append_e5500     =3D " -cpu e5500"
> +QEMU_OPTIONS_append_e5500-64b =3D " -cpu e5500"
> +QEMU_OPTIONS_append_e6500     =3D " -cpu e6500"
> +QEMU_OPTIONS_append_e6500-64b =3D " -cpu e6500"
> +QEMU_OPTIONS_append_ppc7400   =3D " -cpu 7400"
> --=20
> 2.0.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPvoYAACgkQN1Ujt2V2gBykSwCdEWzXZk7Q0Bk2e19SG9UeURBx
/60An0T1dUKUa0fhc1RufAt9xh7tLRh+
=wosN
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
