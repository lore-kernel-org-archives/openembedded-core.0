Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 12EED7918E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 14:05:23 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 41wTpD2KlDz1qwfQ;
	Wed, 22 Aug 2018 16:05:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 41wTpD23sYz1tLNZ;
	Wed, 22 Aug 2018 16:05:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id ZiVmOMB9wJVf; Wed, 22 Aug 2018 16:05:23 +0200 (CEST)
X-Auth-Info: 1lZNoaGGDJ/eHALcv/7kHdludmvjBci3XLqgzuqTibM=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 22 Aug 2018 16:05:23 +0200 (CEST)
Date: Wed, 22 Aug 2018 16:05:15 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20180822160515.72d37bb3@jawa>
In-Reply-To: <5293a704-cd9d-9e94-dc78-631d02c4a67e@windriver.com>
References: <20180822134022.1067-1-lukma@denx.de>
	<5293a704-cd9d-9e94-dc78-631d02c4a67e@windriver.com>
Organization: denx.de
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: yocto: Add dependency on do_prepare_recipe_sysroot
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
X-List-Received-Date: Wed, 22 Aug 2018 14:05:24 -0000
X-Groupsio-MsgNum: 115223
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/0vnKBIP9mGXfWdshAOh.SBE";
	protocol="application/pgp-signature"

--Sig_/0vnKBIP9mGXfWdshAOh.SBE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

> On 08/22/2018 09:40 AM, Lukasz Majewski wrote:
> > Without this patch it happens that do_populate_recipe_sysroot is
> > called just before do_compile (on multi core build machines).
> > This is way too late as the .config generated in
> > do_kernel_configme() is already broken.
> >=20
> > The problem is that do_kernel_configme() calls native's
> > merge_config.sh script which may call bison and arm-linux-*-gcc to
> > compile kconfig infrastructure to create base .config
> > (scripts/kconfig/conf  --allnoconfig Kconfig.)
> >=20
> > It turns out that we only got above binaries after
> > do_prepare_recipe_sysroot() is called.
> > If those binaries are not available, the merge_config.sh do not
> > generate base .config and without any error produces
> > malfunctioned .config. The build process continues and as a result
> > broken kernel is compiled.
> >=20
> > To reproduce:
> >=20
> > bitbake -c cleansstate virtual/kernel
> > bitbake -c kernel_metadata -v virtual/kernel
> > bitbake -c do_kernel_configme -v virtual/kernel
> > (one shall see broken .config in ${B}/.config)
> > bitbake -c do_populate_sysroot -v virtual/kernel
> > bitbake -c do_compile -v virtual/kernel
> >=20
> > (Poky) SHA1: bb91b2ae3ee5cf108aa2f9b78abb14d5aa00831d
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> >   meta/classes/kernel-yocto.bbclass | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/classes/kernel-yocto.bbclass
> > b/meta/classes/kernel-yocto.bbclass index 4ac3a39e47..19a3f2bc46
> > 100644 --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -276,6 +276,7 @@ do_kernel_metadata[depends] =3D
> > "kern-tools-native:do_populate_sysroot"
> > do_validate_branches[depends] =3D
> > "kern-tools-native:do_populate_sysroot" do_kernel_configme[dirs] +=3D
> > "${S} ${B}" +do_kernel_configme[depends] +=3D
> > "virtual/kernel:do_prepare_recipe_sysroot" =20
>=20
> On a closer look .. what branch is this from ? We already have a
> change that triggered breakage on 4.17+ that should fix this.
>=20
> i.e. commit ff1bdd75d50f0ebac3d599e461685ace29559a82 in oe-core, adds:
>=20
> ----------
>=20
>   do_kernel_metadata[depends] =3D
> "kern-tools-native:do_populate_sysroot" do_validate_branches[depends]
> =3D "kern-tools-native:do_populate_sysroot"
>=20
> +do_kernel_configme[depends] +=3D=20
> "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
> +do_kernel_configme[depends] +=3D=20
> "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
> +do_kernel_configme[depends] +=3D "bc-native:do_populate_sysroot=20
> bison-native:do_populate_sysroot"
>   do_kernel_configme[dirs] +=3D "${S} ${B}"
>   do_kernel_configme() {
>=20
> ----------
>=20
> Which I don't see in the context of your patch.
>=20

I do use poky as in the commit message.

Regarding the kernel - I do have my own recipe;
inherit kernel=20

require
recipes-kernel/linux/linux-yocto.inc                                       =
                                                                           =
                                                                           =
     =20


And then I do have:
COMPATIBLE_MACHINE_display5 =3D "display5"=20

KBUILD_DEFCONFIG_pn-linux-yocto-custom_display5 =3D
"imx6q_display5_defconfig"                                                 =
                                                                           =
                                      =20

As the board is in mainline I just point to Linus tree.

> Bruce
>=20
> >   do_kernel_configme() {
> >   	set +e
> >  =20
> >  =20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/0vnKBIP9mGXfWdshAOh.SBE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlt9bZsACgkQAR8vZIA0
zr0Uzwf/fSEZtjhRtbBfxdS7+6Zp9bGhv+SRPVatLD9idOvU9YMKCWFO1WMWgnVz
zmg/7Yee4yrh5SmtmWusxupeUO+JJvtL4vl5dFtuScmsikn+IUug8/b7hVeMjahx
YEpeRGf0JXtHZkeSoTOczBSkouQLes4ZOtfp2vAwywL4fSjmUx05dbx4ExSAP0QP
3Wo/FID+mtmj+AgBynxL4sujfHi+7RZlZrQGyM/RMy6XMeZQFn3tbeNbRiXBWx0H
EHiMftinlFtCJ7UQPE31XFXAJZnguUx3e/+DFNK3hm0GczLhq5qXgp2Cu68Z3j5J
0B03tiJ1sGxvwH+OLZAAI9FykdiCDQ==
=V1Rq
-----END PGP SIGNATURE-----

--Sig_/0vnKBIP9mGXfWdshAOh.SBE--
