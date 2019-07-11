Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 74BD860273
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 08:26:29 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 45kq0567Svz1rkr6;
	Thu, 11 Jul 2019 10:26:29 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 45kq055pYQz1qqkM;
	Thu, 11 Jul 2019 10:26:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id wDW_K-dfN_RS; Thu, 11 Jul 2019 10:26:28 +0200 (CEST)
X-Auth-Info: CsLsqG/L6//djCtBdZYtxr1NVHolTp/qKCfSdsfRKjs=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 11 Jul 2019 10:26:28 +0200 (CEST)
Date: Thu, 11 Jul 2019 10:26:27 +0200
From: Lukasz Majewski <lukma@denx.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190711102627.5da79564@jawa>
In-Reply-To: <55b42a36-6210-fc70-231f-db5bf033b5be@gmail.com>
References: <20190709142028.16845-1-lukma@denx.de>
	<55b42a36-6210-fc70-231f-db5bf033b5be@gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Provide tasks to generate default U-Boot environment(s) images
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
X-List-Received-Date: Thu, 11 Jul 2019 08:26:29 -0000
X-Groupsio-MsgNum: 126732
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/Oe3MZQxabr4TPxqueE.MYrW";
	protocol="application/pgp-signature"

--Sig_/Oe3MZQxabr4TPxqueE.MYrW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

> On 7/9/19 7:20 AM, Lukasz Majewski wrote:
> > This change provides tasks to generate default U-Boot environment
> > images from built U-Boot (via. get_default_envs.sh script).
> >
> > Those images then can be used to generate wic images (with e.g.
> > eMMC layout). With such approach the end user doesn't see the "CRC
> > environment" error after the first boot.
> >
> > Moreover, those are built per MACHINE (as u-boot itself is) so then
> > could be used in SWUpdate scenarios with single tar'ed archive with
> > multiple MACHINE specific *.swu images. =20
> I like this idea.
>=20
>=20
> >
> > It is also possible to adjust the *_ENVS_* variables in machine
> > specific conf file. =20
> Can you give an example on how that is done or what it would look
> like?

This code simply needs to have defined:

UBOOT_ENVS_SIZE in machine conf if two machines use different medium
for storing the envs (e.g. NAND vs SPI-NOR).

>=20
>=20
> I have been using this class I created a while back to do just that
>=20
> https://github.com/akuster/meta-odroid/blob/master/classes/uboot-boot-scr=
.bbclass

It seems like your class builds the envs from provided values.=20

Just a hint it is now possible with u-boot to "create" at build time
envs with data provided from a simple text file.

The patch here just extracts default envs from build u-boot.

Part of the wic script:

part u-boot-env --source rawcopy --sourceparams=3D"file=3Du-boot-env.img"
--ondisk mmcblk --no-table --align 1024=20

part u-boot-env-r --source rawcopy
--sourceparams=3D"file=3Du-boot-env.img_r" --ondisk mmcblk --no-table
--align
1032                                                                       =
                                                                           =
             =20


>=20
> - armin
>=20
> > Test:
> > Newest master-next for poky repo - SHA1:
> > eb5b0a0b5e53a6e55a09e66489d3f24d0c6232ee MACHINE =3D
> > "beaglebone-yocto" in local.conf bitbake virtual/bootloader
> >
> >
> > As a result following links are available in deploy directory:
> > u-boot-env.img{_r}.
> >
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> >  meta/recipes-bsp/u-boot/u-boot.inc | 41
> > ++++++++++++++++++++++++++++++++++++++ 1 file changed, 41
> > insertions(+)
> >
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> > b/meta/recipes-bsp/u-boot/u-boot.inc index 9a754fd09b..e0ccf1ce1f
> > 100644 --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -331,3 +331,44 @@ do_deploy () {
> >  }
> > =20
> >  addtask deploy before do_build after do_compile
> > +
> > +# Extract default envs from build U-Boot
> > +DEFAULT_UBOOT_ENVS_FILE ?=3D "u-boot-env"
> > +DEFAULT_ENVS ?=3D "${DEFAULT_UBOOT_ENVS_FILE}.txt"
> > +UBOOT_ENVS_DEFAULT ?=3D
> > "${DEFAULT_UBOOT_ENVS_FILE}-${MACHINE}-${PV}-${PR}.img"
> > +UBOOT_ENVS_SIZE ?=3D "65536" +
> > +# Generate default environment
> > +do_gen_default_envs[doc] =3D "Generate image with default U-Boot
> > environment(s)" +do_gen_default_envs () {
> > +    ${B}/source/scripts/get_default_envs.sh ${B} >
> > ${B}/${DEFAULT_ENVS} +
> > +    # Generate env image
> > +    ${B}/tools/mkenvimage -s ${UBOOT_ENVS_SIZE} -o
> > ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS} +
> > +    # Generate redundant env image
> > +    ${B}/tools/mkenvimage -r -s ${UBOOT_ENVS_SIZE} -o
> > ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS} +
> > +    rm ${B}/${DEFAULT_ENVS}
> > +}
> > +
> > +addtask gen_default_envs before do_deploy after do_compile
> > +
> > +# Deploy default environment
> > +do_deploy_default_envs[doc] =3D "Copy images with default U-Boot
> > environment to deployment directory" +do_deploy_default_envs () {
> > +
> > +     install -d ${DEPLOYDIR}
> > +
> > +     install ${B}/${UBOOT_ENVS_DEFAULT}
> > ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}
> > +     install ${B}/${UBOOT_ENVS_DEFAULT}_r
> > ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r +
> > +     cd ${DEPLOYDIR}
> > +     ln -sf ${UBOOT_ENVS_DEFAULT} ${DEFAULT_UBOOT_ENVS_FILE}.img
> > +     ln -sf ${UBOOT_ENVS_DEFAULT}_r
> > ${DEFAULT_UBOOT_ENVS_FILE}.img_r +
> > +     rm ${B}/${UBOOT_ENVS_DEFAULT}
> > +     rm ${B}/${UBOOT_ENVS_DEFAULT}_r
> > +}
> > +
> > +addtask deploy_default_envs before do_deploy after
> > do_gen_default_envs =20
>=20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/Oe3MZQxabr4TPxqueE.MYrW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl0m8rMACgkQAR8vZIA0
zr0o0Af8Ddt3QzQScADfrHw90YBQSLX32QIBR38sGVeWmESyxUTPY4cplqI+gkxs
8efeg2a8d8lmQwcD1/E58CdErHhecrkPOGF7ZNU7Jf9ztxeFiNEtGTqPPlZ1JqOf
95r2VKCPjPqyLm6sXHS4NbmB6eqaVXZnhft5WnFO4qKdQR7xxll6pgq12b8WmaiT
d62kgnP2Wo1RUmbAa+Afdhc9mVUOqFS0h65+ltk0UwizJ2Tx7GzCiXUCy+nt0FJU
eJCgrANbb6Zvrs6GqFXtFvzs4PlEMA3j7JwPtxyg3xJC1pY7Fxcco1I4T/88pech
ANBANPbDQJkXwqwShxQ6UVkkOKgoqw==
=XiIz
-----END PGP SIGNATURE-----

--Sig_/Oe3MZQxabr4TPxqueE.MYrW--
