Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3656ACE5;
	Fri, 18 Jul 2014 20:50:00 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so5063879wes.37
	for <multiple recipients>; Fri, 18 Jul 2014 13:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9JI0cZZr+l/ql9olABMASPV9uzt0X7twCx1jbD0hf90=;
	b=AmY0domX83HPehGJc5143oQTvfjycguV0n6u/Q1J9WQU13c9YhnEns8PfbzW/qf+6J
	ygW3dSchnczaEwn+DXMp9TuPMX0fsqIKL/NBz67TdXpSRx5H24OfJ7JjUizDiSIpPsa7
	2GIuHmKlVj8ekhGGyYiz6SOgkCklvZfFbOWCaa7ZvF1yQE5t/aUNCM3h3Udyh5wkwMU9
	V8bwuEMVR2qgULIDHtx2vjoqQO0Cv1+zuISU3mB2o+Gzkg8IJmHcqRuU+FAmSBkGLF68
	jJT28UDsTmyu/miRLGyKH53ePKGijnARAihslJvr+hiz4zFA3aU4IimL/mnxI2YxglEg
	I9Vg==
X-Received: by 10.180.75.230 with SMTP id f6mr36919033wiw.5.1405716600832;
	Fri, 18 Jul 2014 13:50:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ch5sm16797776wjb.18.2014.07.18.13.49.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jul 2014 13:49:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Jul 2014 22:50:12 +0200
To: openembedded-core@lists.openembedded.org,
	Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20140718205012.GT2433@jama>
References: <20140703164708.452165036A@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140703164708.452165036A@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : qemu: fix qemu-native pkg-config paths
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
X-List-Received-Date: Fri, 18 Jul 2014 20:50:05 -0000
X-Groupsio-MsgNum: 55228
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hN1XGyM8GoU8K2XL"
Content-Disposition: inline

--hN1XGyM8GoU8K2XL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 03, 2014 at 04:47:08PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 68a5ed337f8f7ee8e5bf55542ec82d786eb754db
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D68a5ed337f8f7ee8e5bf55542ec82d786eb754db
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Thu Jul  3 15:57:32 2014 +0300
>=20
> qemu: fix qemu-native pkg-config paths
>=20
> For qemu-native, the pkg-config paths do not
> include build host paths.

This breaks qemu-native builds on hosts without pkg-config.

pkg-config isn't in sanity.bbclass's SANITY_REQUIRED_UTILITIES
and this is first recipe which cannot use pkgconfig-native.

Please add test that it exists before forcing recipe to use it.

> This is an issue for libsdl for example, where SDL is
> used by qemu, but for qemu-native libsdl-native is not
> built, but assumed to be provided by the build host.
> Because pkg-config do not search for libsdl config files
> on the build host sysroot, the configure stage of qemu-native
> will fail because it will not find SDL as being installed.
> Usually, the isssue is masked by a functional sdl-config that
> will be interogated instead of pkg-config. However, on Build
> Appliance, sdl-config is deliberately made non-functional,
> so the issue manifests itself.
>=20
> The fix will create an extended PKG_CONFIG_PATH, which does
> include the build host sysroot paths for pkg-config.
>=20
> Fix for [YOCTO #6495].
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-devtools/qemu/qemu.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 076e8ad..611ee61 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -33,6 +33,10 @@ EXTRA_OECONF_class-nativesdk =3D "--target-list=3D${@g=
et_qemu_target_list(d)} --disa
>  export LIBTOOL=3D"${HOST_SYS}-libtool"
> =20
>  do_configure_prepend_class-native() {
> +	# Append build host pkg-config paths for native target since the host m=
ay provide sdl
> +	BHOST_PKGCONFIG_PATH=3D$(PATH=3D/usr/bin:/bin pkg-config --variable pc_=
path pkg-config)
> +	export PKG_CONFIG_PATH=3D$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
> +
>  	# Undo the -lX11 added by linker-flags.patch, don't assume that host ha=
s libX11 installed
>  	sed -i 's/-lX11//g' Makefile.target
>  }
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hN1XGyM8GoU8K2XL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPJiIQACgkQN1Ujt2V2gBz1QACcDmqxoHqbeD2NBhoJf2QmLAcx
GqgAnRqqO+eD+QeIWm0XzNaoczvLhfdv
=w0EA
-----END PGP SIGNATURE-----

--hN1XGyM8GoU8K2XL--
