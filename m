Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 39F337EF26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 09:20:46 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 45kDFC20xPz1rP0w;
	Wed, 10 Jul 2019 11:20:47 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 45kDFC1kmVz1qqkB;
	Wed, 10 Jul 2019 11:20:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id ZI_h3vUUE3tZ; Wed, 10 Jul 2019 11:20:45 +0200 (CEST)
X-Auth-Info: 9hCUIrg7lHH8tGVpDlRBtxPqVP3J5Yt9Fmt29rC/XIQ=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 10 Jul 2019 11:20:45 +0200 (CEST)
Date: Wed, 10 Jul 2019 11:20:39 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190710112039.34af3003@jawa>
In-Reply-To: <e0c10927a3092d4a09178a4398e140ca13a9c39a.camel@linuxfoundation.org>
References: <20190709142028.16845-1-lukma@denx.de>
	<e0c10927a3092d4a09178a4398e140ca13a9c39a.camel@linuxfoundation.org>
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
X-List-Received-Date: Wed, 10 Jul 2019 09:20:47 -0000
X-Groupsio-MsgNum: 126700
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/maYJuI0G53Ej=krmLUx7mRl";
	protocol="application/pgp-signature"

--Sig_/maYJuI0G53Ej=krmLUx7mRl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> On Tue, 2019-07-09 at 16:20 +0200, Lukasz Majewski wrote:
> > This change provides tasks to generate default U-Boot environment
> > images from built U-Boot (via. get_default_envs.sh script).
> >=20
> > Those images then can be used to generate wic images (with e.g.
> > eMMC layout). With such approach the end user doesn't see the "CRC
> > environment" error after the first boot.
> >=20
> > Moreover, those are built per MACHINE (as u-boot itself is) so then
> > could be used in SWUpdate scenarios with single tar'ed archive with
> > multiple MACHINE specific *.swu images.
> >=20
> > It is also possible to adjust the *_ENVS_* variables in machine
> > specific conf file.
> >=20
> > Test:
> > Newest master-next for poky repo - SHA1:
> > eb5b0a0b5e53a6e55a09e66489d3f24d0c6232ee MACHINE =3D
> > "beaglebone-yocto" in local.conf bitbake virtual/bootloader
> >=20
> >=20
> > As a result following links are available in deploy directory:
> > u-boot-env.img{_r}.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> >  meta/recipes-bsp/u-boot/u-boot.inc | 41
> > ++++++++++++++++++++++++++++++++++++++ 1 file changed, 41
> > insertions(+)
> >=20
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
> I'm not sure this second function/task is right.
>=20
> DEPLOYDIR is really "owned" by the do_deploy function. As such, if you
> rerun the deploy task, it should be recreated with the right content.
>=20
> By default I appreciate that deploy.bbclass doesn't wipe out the
> directory but it probably should to make it clear what the
> expectations are here.
>=20
> I don't think it would cause a real problem right now, until files
> changed names or something in one of these tasks, then you'd end up
> with files you didn't expect since nothing ever cleans this directory.
>=20
> Is there a reason we can't make this part of do_deploy and clean the
> directory at the start of do_deploy?

The only reason was to have more readable code - as it is easier to
read separate tasks.

Another issue is that this code shall probably be optional, so I would
need to make this feature somehow dependent on some flag ...

Any good suggestions? PACKAGECONFIG seems like a good starting point ?

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/maYJuI0G53Ej=krmLUx7mRl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl0lrecACgkQAR8vZIA0
zr1DgwgAwMBNk9kcrjguq6w+1cyfn7ZlwGvUzDJPZ+wf6TTB/9ErqKMOP5b1fur7
SszvhPIogdC8NEKJ77j7glNlk7aGodgkUWlVvstQi1vlBaFK29rULdpclGOLDcyZ
21a6FM4IONJmxY/+/qc5PzBjmBZuk822/9XQxVDV7GevpRTx1L4OftaQVTM5KAtm
LkSkiD3DjYrNf7xzbsMVBZsZbQ/AYZp3pyTdZDvro/IS4WYzM4GwEzpNYaKVaZdK
2yYx4tsqtQX8PIRE8khqA2+FIHDXx0VYhLnBYSOBsIU90GNZF/wSDBSw1p+1hxAb
/Age66eMxUTKIwnF8RTkkaeGzicthg==
=rnvP
-----END PGP SIGNATURE-----

--Sig_/maYJuI0G53Ej=krmLUx7mRl--
