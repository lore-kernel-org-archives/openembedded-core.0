Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id BDC7860110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 14:22:32 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40ZRZd0Fqqz1qtHl;
	Mon, 30 Apr 2018 16:22:33 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40ZRZc6xfHz1qqxG;
	Mon, 30 Apr 2018 16:22:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id aC0MzpP3_tQ1; Mon, 30 Apr 2018 16:22:30 +0200 (CEST)
X-Auth-Info: qTRM2gdlWAumCs6ZUpX2iRuut15ONDNrPs6Kibz6QZc=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 30 Apr 2018 16:22:30 +0200 (CEST)
Date: Mon, 30 Apr 2018 16:22:29 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20180430162229.62155473@jawa>
In-Reply-To: <CA+chaQdBDAXRA9i=eH67qTRK-cGZbtrNNEWN9XWkEyEF5b7xow@mail.gmail.com>
References: <20180427145139.30732-1-lukma@denx.de>
	<69bd71c5-a14a-2687-3f5d-52083043a131@prevas.dk>
	<CA+chaQf_r6ytw5VR3m4RgctcGpwmfxG=Q5NfvSgJCeB3tL4MQw@mail.gmail.com>
	<CA+chaQdBDAXRA9i=eH67qTRK-cGZbtrNNEWN9XWkEyEF5b7xow@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Stefan Agner <stefan.agner@toradex.com>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add {gen|deploy}_default_envs tasks to generate environment images
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
X-List-Received-Date: Mon, 30 Apr 2018 14:22:33 -0000
X-Groupsio-MsgNum: 110848
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/mXRNMbc/uiUw.GnE_0R5h9Q";
	protocol="application/pgp-signature"

--Sig_/mXRNMbc/uiUw.GnE_0R5h9Q
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Martin,

> And here is example how we're using it:
>=20
> https://github.com/webosose/meta-webosose/blob/master/meta-webos-raspberr=
ypi/recipes-bsp/u-boot/u-boot-env.bb
>=20
> To make it compatible with raspberrypi3 and raspberrypi3-64, I've
> updated it a bit to select correct IMAGETYPE and BOOTCMD based on the
> environment:
>=20
> do_compile() {
>     sed -e 's/@@KERNEL_IMAGETYPE@@/${KERNEL_IMAGETYPE}/' \
>         -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
>         "${WORKDIR}/uboot-env.txt.in" > "${WORKDIR}/uboot-env.txt"
>     uboot-mkenvimage -s 16384 -o uboot.env ${WORKDIR}/uboot-env.txt
> }
>=20

Thanks for sharing the code (and detailed explanation).

>=20
> On Mon, Apr 30, 2018 at 3:23 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > u-boot-mkimage already builds mkenvimage, you just need to install
> > it in do_install:
> >
> >     install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
> >     ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
> >
> > This is what we have in
> > recipes-bsp/u-boot/u-boot-mkimage_%.bbappend and it works fine.
> >
> > On Mon, Apr 30, 2018 at 8:50 AM, Martin Hundeb=C3=B8ll <mnhu@prevas.dk>
> > wrote:=20
> >> Hi Lukasz,
> >>
> >> On 2018-04-27 16:51, Lukasz Majewski wrote:
> >> =20
> >>> This commit provides the ability to generate u-boot
> >>> environment(s) as images, which afterwards can be used to produce
> >>> image (with wic) for flashing (eMMC or SPI-NOR).
> >>>
> >>> This change removes the need to run "env default" during
> >>> production phase,
> >>> as proper environment (including redundant one) is already stored
> >>> on persistent memory (the CRC is also correct).
> >>> =20
> >>
> >> I think we should create a separate recipe to install the native
> >> mkenvimage binary (e.g. u-boot-mkenvimage_%.bb) or update
> >> u-boot-mkimage_%.bb install it.
> >>
> >> Then a new recipe to create the environment images can depend on
> >> u-boot-mkenvimage-native.
> >>
> >> Also note the recently added upstream support for external
> >> environment definitions:
> >> http://git.denx.de/?p=3Du-boot.git;a=3Dcommit;h=3Df3d8f7dd73ac5dde
> >> 258eb786d4a01869395b56d7
> >>
> >> For our usecase we need the ability to generate environment images
> >> in yocto from such external definitions.
> >>
> >> // Martin
> >>
> >> =20
> >>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >>>
> >>> ---
> >>> This patch depends on "u-boot: Upgrade to 2018.03 release"
> >>> https://patchwork.openembedded.org/patch/149998/
> >>> ---
> >>>   meta/recipes-bsp/u-boot/u-boot.inc | 35
> >>> ++++++++++++++++++++++++++++++ +++++
> >>>   1 file changed, 35 insertions(+)
> >>>
> >>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> >>> b/meta/recipes-bsp/u-boot/u-boot.inc
> >>> index c2bcf99840..2796e503cf 100644
> >>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> >>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> >>> @@ -305,3 +305,38 @@ do_deploy () {
> >>>   }
> >>>     addtask deploy before do_build after do_compile
> >>> +
> >>> +# Create new rules to extract default envs
> >>> +UBOOT_ENVS_DEFAULT ?=3D "uboot-envs-default"
> >>> +DEFAULT_ENVS ?=3D "u-boot-env-default.txt"
> >>> +DEFAULT_ENVS_SIZE ?=3D "65536"
> >>> +
> >>> +# Generate default environment
> >>> +do_gen_default_envs[doc] =3D "Generate image with default U-Boot
> >>> environment(s)"
> >>> +do_gen_default_envs () {
> >>> +       ${B}/source/scripts/get_default_envs.sh ${B} >
> >>> ${B}/${DEFAULT_ENVS}
> >>> +
> >>> +       # Generate env image
> >>> +       ${B}/tools/mkenvimage -s ${DEFAULT_ENVS_SIZE} -o
> >>> ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS}
> >>> +
> >>> +       # Generate redundant env image
> >>> +       ${B}/tools/mkenvimage -r -s ${DEFAULT_ENVS_SIZE} -o
> >>> ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS}
> >>> +
> >>> +       rm ${B}/${DEFAULT_ENVS}
> >>> +}
> >>> +
> >>> +addtask gen_default_envs before do_deploy_default_envs after
> >>> do_compile +
> >>> +# Deploy default environment
> >>> +do_deploy_default_envs[doc] =3D "Copy images with default U-Boot
> >>> environment to deployment directory"
> >>> +do_deploy_default_envs () {
> >>> +       install -d ${DEPLOYDIR}
> >>> +
> >>> +       install ${B}/${UBOOT_ENVS_DEFAULT}
> >>> ${DEPLOYDIR}/${UBOOT_ENVS_DEFA ULT}
> >>> +       install ${B}/${UBOOT_ENVS_DEFAULT}_r
> >>> ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r
> >>> +
> >>> +       rm ${B}/${UBOOT_ENVS_DEFAULT}
> >>> +       rm ${B}/${UBOOT_ENVS_DEFAULT}_r
> >>> +}
> >>> +
> >>> +addtask deploy_default_envs before do_deploy after
> >>> do_gen_default_envs
> >>>
> >>> -- =20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> =20
> >
> > =20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/mXRNMbc/uiUw.GnE_0R5h9Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlrnJqUACgkQAR8vZIA0
zr1szQf8DygdXOiDhRZ/3Wzq8zQmfmUlYZJva1hkUm8ASKTZ2xFVlKOdBR4YZM7L
TM58l5RmzLfhR0PYP1cSbuGArqR0Jz/OmtPspsLHYuHXUiUDDVLZuK0BtAKXpSBO
3F4v0/Fq+AFOJ6UuyloIIBanGyJpyzFj3b7lHMMPDIulHLeab+4YuGlzopbh0lVX
WcIGJkMbu2o7P0eJDAV5gj/yYrVrRj0GDc81EHx6rLyLVfQOZ+P9Av2MeeCtUF6J
C2Ab0NxDqxqaaVnIwjR16GBgG6GiBsRCA3PQaV9kZcaOL1BUSmvG2paJaJTx08Pe
4rs5J1VlZQiazP8wJDOmqPJEu4U0Jw==
=yp5s
-----END PGP SIGNATURE-----

--Sig_/mXRNMbc/uiUw.GnE_0R5h9Q--
