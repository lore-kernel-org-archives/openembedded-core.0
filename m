Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE3178E21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 14:20:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 41wV805msRz1qx9d;
	Wed, 22 Aug 2018 16:20:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 41wV805Xkrz1tLNd;
	Wed, 22 Aug 2018 16:20:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id HB5zAML19iIA; Wed, 22 Aug 2018 16:20:47 +0200 (CEST)
X-Auth-Info: U9VouOXluZl5bQWB8Qal+VV0ZY0qLEnyLoV9WHiPwIg=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 22 Aug 2018 16:20:47 +0200 (CEST)
Date: Wed, 22 Aug 2018 16:20:40 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20180822162040.33304bef@jawa>
In-Reply-To: <dc51efd5-c251-5f66-15fc-dca2fd81c2d8@windriver.com>
References: <20180822134022.1067-1-lukma@denx.de>
	<5293a704-cd9d-9e94-dc78-631d02c4a67e@windriver.com>
	<20180822160515.72d37bb3@jawa>
	<dc51efd5-c251-5f66-15fc-dca2fd81c2d8@windriver.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 14:20:48 -0000
X-Groupsio-MsgNum: 115227
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/kQ37rFGX_dxYHmcRFYUTIPv";
	protocol="application/pgp-signature"

--Sig_/kQ37rFGX_dxYHmcRFYUTIPv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Aug 2018 10:13:33 -0400
Bruce Ashfield <bruce.ashfield@windriver.com> wrote:

> On 08/22/2018 10:05 AM, Lukasz Majewski wrote:
> > Hi Bruce,
> >  =20
> >> On 08/22/2018 09:40 AM, Lukasz Majewski wrote: =20
> >>> Without this patch it happens that do_populate_recipe_sysroot is
> >>> called just before do_compile (on multi core build machines).
> >>> This is way too late as the .config generated in
> >>> do_kernel_configme() is already broken.
> >>>
> >>> The problem is that do_kernel_configme() calls native's
> >>> merge_config.sh script which may call bison and arm-linux-*-gcc to
> >>> compile kconfig infrastructure to create base .config
> >>> (scripts/kconfig/conf  --allnoconfig Kconfig.)
> >>>
> >>> It turns out that we only got above binaries after
> >>> do_prepare_recipe_sysroot() is called.
> >>> If those binaries are not available, the merge_config.sh do not
> >>> generate base .config and without any error produces
> >>> malfunctioned .config. The build process continues and as a result
> >>> broken kernel is compiled.
> >>>
> >>> To reproduce:
> >>>
> >>> bitbake -c cleansstate virtual/kernel
> >>> bitbake -c kernel_metadata -v virtual/kernel
> >>> bitbake -c do_kernel_configme -v virtual/kernel
> >>> (one shall see broken .config in ${B}/.config)
> >>> bitbake -c do_populate_sysroot -v virtual/kernel
> >>> bitbake -c do_compile -v virtual/kernel
> >>>
> >>> (Poky) SHA1: bb91b2ae3ee5cf108aa2f9b78abb14d5aa00831d
> >>>
> >>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >>> ---
> >>>    meta/classes/kernel-yocto.bbclass | 1 +
> >>>    1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/meta/classes/kernel-yocto.bbclass
> >>> b/meta/classes/kernel-yocto.bbclass index 4ac3a39e47..19a3f2bc46
> >>> 100644 --- a/meta/classes/kernel-yocto.bbclass
> >>> +++ b/meta/classes/kernel-yocto.bbclass
> >>> @@ -276,6 +276,7 @@ do_kernel_metadata[depends] =3D
> >>> "kern-tools-native:do_populate_sysroot"
> >>> do_validate_branches[depends] =3D
> >>> "kern-tools-native:do_populate_sysroot" do_kernel_configme[dirs]
> >>> +=3D "${S} ${B}" +do_kernel_configme[depends] +=3D
> >>> "virtual/kernel:do_prepare_recipe_sysroot" =20
> >>
> >> On a closer look .. what branch is this from ? We already have a
> >> change that triggered breakage on 4.17+ that should fix this.
> >>
> >> i.e. commit ff1bdd75d50f0ebac3d599e461685ace29559a82 in oe-core,
> >> adds:
> >>
> >> ----------
> >>
> >>    do_kernel_metadata[depends] =3D
> >> "kern-tools-native:do_populate_sysroot"
> >> do_validate_branches[depends] =3D
> >> "kern-tools-native:do_populate_sysroot"
> >>
> >> +do_kernel_configme[depends] +=3D
> >> "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
> >> +do_kernel_configme[depends] +=3D
> >> "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
> >> +do_kernel_configme[depends] +=3D "bc-native:do_populate_sysroot
> >> bison-native:do_populate_sysroot"
> >>    do_kernel_configme[dirs] +=3D "${S} ${B}"
> >>    do_kernel_configme() {
> >>
> >> ----------
> >>
> >> Which I don't see in the context of your patch.
> >> =20
> >=20
> > I do use poky as in the commit message. =20
>=20
> Yes, I checked that .. but that isn't a useful part of a patch
> to oe-core.
>=20
> The kernel-yocto bbclass in that context is not the one in master, and
> if I run a --contains on that commit ID, I don't get an active
> branch.

I might have misunderstood something... apparently.

The changes which I did were to:

poky/meta/classes/kernel-yocto.bbclass

Is this a wrong place to add the fix?

>=20
> So the patch as it stands, cannot be applied to master (and I
> also checked master-next in case something snuck in that I
> missed) of oe-core or poky, so there's no way to work with it.
>=20
> Bruce
>=20
> >=20
> > Regarding the kernel - I do have my own recipe;
> > inherit kernel
> >=20
> > require
> > recipes-kernel/linux/linux-yocto.inc
> >=20
> >=20
> > And then I do have:
> > COMPATIBLE_MACHINE_display5 =3D "display5"
> >=20
> > KBUILD_DEFCONFIG_pn-linux-yocto-custom_display5 =3D
> > "imx6q_display5_defconfig"
> >=20
> > As the board is in mainline I just point to Linus tree.
> >  =20
> >> Bruce
> >> =20
> >>>    do_kernel_configme() {
> >>>    	set +e
> >>>   =20
> >>>     =20
> >> =20
> >=20
> >=20
> >=20
> >=20
> > Best regards,
> >=20
> > Lukasz Majewski
> >=20
> > --
> >=20
> > DENX Software Engineering GmbH,      Managing Director: Wolfgang
> > Denk HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > Germany Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email:
> > wd@denx.de=20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/kQ37rFGX_dxYHmcRFYUTIPv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlt9cTgACgkQAR8vZIA0
zr1RmggAtVNLwF9JNv3xBbR92x78sV/xiTfhatUhy+Y4D58aG8DGTZ2iIBHkHf+6
RusEXGWJwyvMSxaQg/+dJzzLSrjd4NTDRl89Ahh79jbA7J/rD6xB6VFm84RElfCr
kcVFsfuL/QiWiGaHcDupFw9Oxc6rj2CBD9wU6D1lwxQRfnhOYbyRMwfsp+PAqeZJ
e4xvM/qQlr6N0izk09/+FlGEt2nlqKAzh7ljYE+fRCcHf2MXsr1Rzhz6g8L1p3zr
qA+d+jcJcQA0sJubFz4tsVpk58TB+Nogt0mXiI7qr4dUHUJoZzstfKsg2fMEh0VL
F3pWkPX33Olp3ERLMcQVVV7yMg5zQA==
=TOLf
-----END PGP SIGNATURE-----

--Sig_/kQ37rFGX_dxYHmcRFYUTIPv--
