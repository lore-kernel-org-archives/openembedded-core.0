Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6592B65D35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 13:53:23 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40YpzS2N5jz1qv37;
	Sun, 29 Apr 2018 15:53:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40YpzS1L9Xz1qqlF;
	Sun, 29 Apr 2018 15:53:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id YvAc9P74R2di; Sun, 29 Apr 2018 15:53:22 +0200 (CEST)
X-Auth-Info: XjjCP8cPqaYrqJkYowISb0gqb5TIf4G/ThM8npXyyRI=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 29 Apr 2018 15:53:22 +0200 (CEST)
Date: Sun, 29 Apr 2018 15:53:12 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Marek Vasut <marex@denx.de>
Message-ID: <20180429155312.56e0b987@jawa>
In-Reply-To: <39086351-ed53-3cf5-606e-3b17bd95d825@denx.de>
References: <20180427145139.30732-1-lukma@denx.de>
	<fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
	<20180427181521.1bc4095c@jawa>
	<39086351-ed53-3cf5-606e-3b17bd95d825@denx.de>
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
X-List-Received-Date: Sun, 29 Apr 2018 13:53:24 -0000
X-Groupsio-MsgNum: 110801
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/uV=BL6pC3xKIsOvXkk19loz";
	protocol="application/pgp-signature"

--Sig_/uV=BL6pC3xKIsOvXkk19loz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marek,

> On 04/27/2018 06:15 PM, Lukasz Majewski wrote:
> > Hi Marek,
> >=20
> > Thanks for prompt feedback.
> >  =20
> >> On 04/27/2018 04:51 PM, Lukasz Majewski wrote: =20
> >>> This commit provides the ability to generate u-boot environment(s)
> >>> as images, which afterwards can be used to produce image (with
> >>> wic) for flashing (eMMC or SPI-NOR).
> >>>
> >>> This change removes the need to run "env default" during
> >>> production phase, as proper environment (including redundant one)
> >>> is already stored on persistent memory (the CRC is also correct).
> >>>
> >>> Signed-off-by: Lukasz Majewski <lukma@denx.de>   =20
> >>
> >> If your default env is correct, why do you need this ?  =20
> >=20
> > Some users wants to have the working board (i.e. without any
> > warnings that CRC for envs is bad) after flashing the SPI-NOR/eMMC =20
>=20
> And the board is not working when it tells you your env is not
> populated?=20

It complains that CRC is wrong, which is true as without this patch
(and some wic adjustments) we don't have proper envs in expected
non-volatile area.

> Then maybe the board port is broken.

Then it proceeds with default envs - and boots.

>=20
> >> I can see some
> >> use with non-default env, but then that can be wrapped into a
> >> separate recipe. =20
> >=20
> > I can add this functionality as a separate recipe. This is v1, so
> > ideas are welcome. =20
>=20
> I think that only makes sense.

Ok.

>=20
> >>> ---
> >>> This patch depends on "u-boot: Upgrade to 2018.03 release"
> >>> https://patchwork.openembedded.org/patch/149998/
> >>> ---
> >>>  meta/recipes-bsp/u-boot/u-boot.inc | 35
> >>> +++++++++++++++++++++++++++++++++++ 1 file changed, 35
> >>> insertions(+)
> >>>
> >>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> >>> b/meta/recipes-bsp/u-boot/u-boot.inc index
> >>> c2bcf99840.cdd7703db9ea580308d4ebcd6d0ae3209b761daa.2796e503cf
> >>> 100644 --- a/meta/recipes-bsp/u-boot/u-boot.inc +++
> >>> b/meta/recipes-bsp/u-boot/u-boot.inc @@ -305,3 +305,38 @@
> >>> do_deploy () { }
> >>> =20
> >>>  addtask deploy before do_build after do_compile
> >>> +
> >>> +# Create new rules to extract default envs
> >>> +UBOOT_ENVS_DEFAULT ?=3D "uboot-envs-default"
> >>> +DEFAULT_ENVS ?=3D "u-boot-env-default.txt"
> >>> +DEFAULT_ENVS_SIZE ?=3D "65536"
> >>> +
> >>> +# Generate default environment
> >>> +do_gen_default_envs[doc] =3D "Generate image with default U-Boot
> >>> environment(s)" +do_gen_default_envs () {
> >>> +	${B}/source/scripts/get_default_envs.sh ${B} >
> >>> ${B}/${DEFAULT_ENVS} +
> >>> +	# Generate env image
> >>> +	${B}/tools/mkenvimage -s ${DEFAULT_ENVS_SIZE} -o
> >>> ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS}   =20
> >>
> >> Does this actually work during cross build , when mkenvimage
> >> architecture is different than host architecture ? =20
> >=20
> > Yes. This was tested. =20
>=20
> How can it work if this binary cannot be executed ? :)

Could you be more specific here?

I do follow normal u-boot recipe build. If mkenvimage is build in a
wrong way (as other tools) - then I suppose that the whole u-boot recipe
is broken.

The get_default_envs.sh script is prepared to use either native or
cross-compiled set of binutils (that thought I had in mind when I said
that it was tested).

>=20
> >>> +	# Generate redundant env image
> >>> +	${B}/tools/mkenvimage -r -s ${DEFAULT_ENVS_SIZE} -o
> >>> ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS}   =20
> >>
> >> Is redundant env always needed on all systems ? =20
> >=20
> > No, they are not. However, it shall not be a problem if it is build
> > anyway - user can adjust wic to only put primary env image. =20
>=20
> So many wasted CPU cycles for a feature barely anyone needs. Nope :)

I will try to craft some OE magic to make it not build when not
needed... :-)

>=20
> >>> +	rm ${B}/${DEFAULT_ENVS}
> >>> +}
> >>> +
> >>> +addtask gen_default_envs before do_deploy_default_envs after
> >>> do_compile +
> >>> +# Deploy default environment
> >>> +do_deploy_default_envs[doc] =3D "Copy images with default U-Boot
> >>> environment to deployment directory" +do_deploy_default_envs () {
> >>> +	install -d ${DEPLOYDIR}
> >>> +
> >>> +	install ${B}/${UBOOT_ENVS_DEFAULT}
> >>> ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}
> >>> +	install ${B}/${UBOOT_ENVS_DEFAULT}_r
> >>> ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r   =20
> >>
> >> Does this work with multiple machines  =20
> >=20
> > Unfortunately not.
> >=20
> > For multiple machines one needs to add ${target}, which would add
> > machine name into path:
> >=20
> > target=3D${MACHINE}_defconfig
> >=20
> > and change ${B} -> ${B}/${target}
> >=20
> >=20
> > I suppose, that I would need to adjust this script to be similar to
> > do_install() and do_compile() in this matter. =20
>=20
> Yep

Ok.

>=20
> >> or will it overwrite the
> >> deployed image ? =20
> >=20
> > As it is now - it will overwrite the image. =20
> Yep
>=20

Ok.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/uV=BL6pC3xKIsOvXkk19loz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlrlzkkACgkQAR8vZIA0
zr10LAf/UQs47bQKOu8RWGmKtEg0NB6cCDShBQ1GYkOlvjI7az5iAMYRy8IERMhb
ZmKYBtWfxSqXV0P1UdlSp80ALrahB11Pbks+j6mOnoSw7wTiQx0CX0V/h4b4eF+X
erntRKFu8YRiKykLaif2plJDZM/PfaDPJXAxtsAqW1m6Yuj9F4tGS3hTfynZqsG1
6a1vr1p8r7/mtb8O/cp5N4A5nTU4kFVjw9vyy+5sHa5qWiAHy1YHyjseG3SeQ5R9
xHuN/h2ERJG24oBR4x7iIBFHfrziI1O+dW9Q+paowQoVaLNWNMKiBW51Mtd7ULsc
1dgYWWSLEh/Yj6IPJ+iFj0/RvCDGmw==
=wvjS
-----END PGP SIGNATURE-----

--Sig_/uV=BL6pC3xKIsOvXkk19loz--
