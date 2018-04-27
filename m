Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 433BA605BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 16:15:50 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40XfDl2xpVz1qx8s;
	Fri, 27 Apr 2018 18:15:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40XfDl1x25z1qqwt;
	Fri, 27 Apr 2018 18:15:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id T5XmwYXjCEhv; Fri, 27 Apr 2018 18:15:49 +0200 (CEST)
X-Auth-Info: sspa8vMqghP3gQLCBBU8Dg3iKITES4UsvbuA+WoXw/M=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 27 Apr 2018 18:15:49 +0200 (CEST)
Date: Fri, 27 Apr 2018 18:15:38 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Marek Vasut <marex@denx.de>
Message-ID: <20180427181521.1bc4095c@jawa>
In-Reply-To: <fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
References: <20180427145139.30732-1-lukma@denx.de>
	<fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
Organization: denx.de
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Stefan Agner <stefan.agner@toradex.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 27 Apr 2018 16:15:51 -0000
X-Groupsio-MsgNum: 110789
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/jIKrF+8gJ0yRTKm_2_UYQBa";
	protocol="application/pgp-signature"

--Sig_/jIKrF+8gJ0yRTKm_2_UYQBa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Thanks for prompt feedback.

> On 04/27/2018 04:51 PM, Lukasz Majewski wrote:
> > This commit provides the ability to generate u-boot environment(s)
> > as images, which afterwards can be used to produce image (with wic)
> > for flashing (eMMC or SPI-NOR).
> >=20
> > This change removes the need to run "env default" during production
> > phase, as proper environment (including redundant one) is already
> > stored on persistent memory (the CRC is also correct).
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de> =20
>=20
> If your default env is correct, why do you need this ?=20

Some users wants to have the working board (i.e. without any warnings
that CRC for envs is bad) after flashing the SPI-NOR/eMMC

> I can see some
> use with non-default env, but then that can be wrapped into a separate
> recipe.

I can add this functionality as a separate recipe. This is v1, so ideas
are welcome.

>=20
> > ---
> > This patch depends on "u-boot: Upgrade to 2018.03 release"
> > https://patchwork.openembedded.org/patch/149998/
> > ---
> >  meta/recipes-bsp/u-boot/u-boot.inc | 35
> > +++++++++++++++++++++++++++++++++++ 1 file changed, 35 insertions(+)
> >=20
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> > b/meta/recipes-bsp/u-boot/u-boot.inc index c2bcf99840..2796e503cf
> > 100644 --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -305,3 +305,38 @@ do_deploy () {
> >  }
> > =20
> >  addtask deploy before do_build after do_compile
> > +
> > +# Create new rules to extract default envs
> > +UBOOT_ENVS_DEFAULT ?=3D "uboot-envs-default"
> > +DEFAULT_ENVS ?=3D "u-boot-env-default.txt"
> > +DEFAULT_ENVS_SIZE ?=3D "65536"
> > +
> > +# Generate default environment
> > +do_gen_default_envs[doc] =3D "Generate image with default U-Boot
> > environment(s)" +do_gen_default_envs () {
> > +	${B}/source/scripts/get_default_envs.sh ${B} >
> > ${B}/${DEFAULT_ENVS} +
> > +	# Generate env image
> > +	${B}/tools/mkenvimage -s ${DEFAULT_ENVS_SIZE} -o
> > ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS} =20
>=20
> Does this actually work during cross build , when mkenvimage
> architecture is different than host architecture ?

Yes. This was tested.

>=20
> > +	# Generate redundant env image
> > +	${B}/tools/mkenvimage -r -s ${DEFAULT_ENVS_SIZE} -o
> > ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS} =20
>=20
> Is redundant env always needed on all systems ?

No, they are not. However, it shall not be a problem if it is build
anyway - user can adjust wic to only put primary env image.

>=20
> > +	rm ${B}/${DEFAULT_ENVS}
> > +}
> > +
> > +addtask gen_default_envs before do_deploy_default_envs after
> > do_compile +
> > +# Deploy default environment
> > +do_deploy_default_envs[doc] =3D "Copy images with default U-Boot
> > environment to deployment directory" +do_deploy_default_envs () {
> > +	install -d ${DEPLOYDIR}
> > +
> > +	install ${B}/${UBOOT_ENVS_DEFAULT}
> > ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}
> > +	install ${B}/${UBOOT_ENVS_DEFAULT}_r
> > ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r =20
>=20
> Does this work with multiple machines=20

Unfortunately not.

For multiple machines one needs to add ${target}, which would add
machine name into path:

target=3D${MACHINE}_defconfig

and change ${B} -> ${B}/${target}


I suppose, that I would need to adjust this script to be similar to
do_install() and do_compile() in this matter.

> or will it overwrite the
> deployed image ?

As it is now - it will overwrite the image.

>=20
>=20
> > +	rm ${B}/${UBOOT_ENVS_DEFAULT}
> > +	rm ${B}/${UBOOT_ENVS_DEFAULT}_r
> > +}
> > +
> > +addtask deploy_default_envs before do_deploy after
> > do_gen_default_envs=20
>=20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/jIKrF+8gJ0yRTKm_2_UYQBa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlrjTKoACgkQAR8vZIA0
zr1uzAgA4UaReWZm68+jM1XNhj3pC285Utbvco0qr0ZqDVqwmsaTtOvVKIt2UU81
IvBdf0dYe9Kh/OyXiqCaVhTEAQGWdayitDTFcqzgwORgND2WGpgfGbUmVZj9X7dW
kQarI1JuszBK09w/H1A15GfxdecZbnyE5IXG3l4uMPJVsuJOi+G7XYlFN05CX0XB
q8AjAZx24UXY8bz49Ih2FH8kZCLGoZ8kS9B8wUVeV+WO4GqpAv1zFwvfAiRFF9A0
NrlvY8MV1fc3CNB1+1xm5g7llrDDK91Q/OL6f/C7f3B/P0NOZ5GDOtLVnDWjzy5B
4Fu9L/h0pUXniLkMfplKftY17axLvQ==
=sCkK
-----END PGP SIGNATURE-----

--Sig_/jIKrF+8gJ0yRTKm_2_UYQBa--
