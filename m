Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6D07D771
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 20:44:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 45wLfS40Qxz1rD9F;
	Fri, 26 Jul 2019 22:44:16 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 45wLfS3c68z1qqkH;
	Fri, 26 Jul 2019 22:44:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 4t8K40FOyMO5; Fri, 26 Jul 2019 22:44:15 +0200 (CEST)
X-Auth-Info: a8wFkLdZcnzQtqnrpNhYqpvL1iMhvrJnoKp5Kd1G5J8=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 26 Jul 2019 22:44:15 +0200 (CEST)
Date: Fri, 26 Jul 2019 22:44:08 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Stefano Babic <sbabic@denx.de>
Message-ID: <20190726224408.3d0b2e93@jawa>
In-Reply-To: <2d08f0f5-dda0-d21b-6b7b-d28d9ca728dd@denx.de>
References: <20190726074039.26753-1-lukma@denx.de>
	<2d08f0f5-dda0-d21b-6b7b-d28d9ca728dd@denx.de>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] u-boot: Generate default U-Boot environment images
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
X-List-Received-Date: Fri, 26 Jul 2019 20:44:17 -0000
X-Groupsio-MsgNum: 127227
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/3JGhzEJzl/gVE5KFk9Mv8lj";
	protocol="application/pgp-signature"

--Sig_/3JGhzEJzl/gVE5KFk9Mv8lj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

> Hi Lukasz,
>=20
> On 26/07/19 09:40, Lukasz Majewski wrote:
> > This change provides tasks to generate default U-Boot environment
> > images from built U-Boot (via. get_default_envs.sh script).
> >=20
> > Those images then can be used to generate wic images (with e.g.
> > eMMC layout). With such approach the end user doesn't see the "CRC
> > environment" error after the first boot.
> >=20
> > Moreover, those are built per MACHINE (as u-boot itself is) so then
> > could be used in SWUpdate scenarios with single tar'ed archive with
> > multiple MACHINE specific *.swu images. =20
>=20
> By working together with SWUpdate, I am just wondering why this is
> necessary. I guess that "default" U-Boot environment images means
> "initial" environment.=20

The main use case is with eMMC/SPI-NOR/NAND memory images produced with
*.wic files for different machines.

In this case - the whole layout of eMMC or SPI-NOR is flashed. With the
default images generated with this u-boot recipe modification it is
possible to create this layout with properly set environment images.

As a result from the first run of the flashed devices there is no "CRC
error" and default (in U-boot binary) envs are not used.

> The issue I think you see is if there is no
> environment in the storage and boards boot with the linked-in
> environment.

On my use case eMMC layouts for two MACHINEs are bundled together and
then updated by SWUpdate depending on the MACHINE.

> SWUpdate cannot find such as an environment.
>=20
> For that, there is a target in u-boot: make u-boot-initial-env.

Yes, I've noticed that it was added recently to U-Boot.

> This
> generates an ASCII file that can be used by SWUpdate if no environment
> is stored and U-Boot starts with the linked-in environemnt.=20
> It is
> enough to put this file into rootfs and to enable SWUpdate (and
> libubootenv) to use it.=20

And if we do have this ASCII file, shall the mkimage with some SWUpdate
script be run to generate default envs, which then would be stored to
eMMC/SPI-NOR to avoid after reset "CRC env read error" ?

> Create specific image to be stored into
> a .wic seems overkilling,

The advantages for such approach:

- I do have a single, per MACHINE *.wic file which I can write either
  via u-boot HUSH script or with SWUpdate and after reset I do have
  access to right envs (no adjustments needed).

- This is helpful for factory flashing.

- The correct *.wic image is created solely with OE/Yocto - no extra
  hacks needed.


> and it does not help if for some reason the
> board comes up without environment in the flash.

As I update the whole layout (including GPT/MBR, boot, rootfs, custom,
envs, etc) - all elements are updated.

(For incremental updates I can provide *.swu file with only fitImage or
rootfs).


In short:

What I need ?=20

I do need env images generated (with mkimage) during u-boot build, so I
can then use then during *.wic per machine image creation.

>=20
> Best regards,
> Stefano Babic
>=20
> >=20
> > The UBOOT_ENVS_SIZE must be defined in machine specific conf file
> > as well as it is also possible to adjust (optionally) the *_ENVS_*
> > variables.
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
> >=20
> > ---
> > Changes for v2:
> >=20
> > - Move the content of deploy_default_envs task to do_deploy
> > - Move the content of gen_default_envs task to do_compile
> > - Create the u-boot-env.img{r} conditionally, only when
> > UBOOT_ENVS_SIZE is defined
> > - Change the commit title to reflect changes done for v2
> > ---
> >  meta/recipes-bsp/u-boot/u-boot.inc | 34
> > ++++++++++++++++++++++++++++++++++ 1 file changed, 34 insertions(+)
> >=20
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> > b/meta/recipes-bsp/u-boot/u-boot.inc index 9a754fd09b..7ede2da0eb
> > 100644 --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -68,6 +68,13 @@ UBOOT_EXTLINUX_INSTALL_DIR ?=3D "/boot/extlinux"
> >  UBOOT_EXTLINUX_CONF_NAME ?=3D "extlinux.conf"
> >  UBOOT_EXTLINUX_SYMLINK ?=3D
> > "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"=20
> > +# U-Boot variables necessary for extracting default envs from
> > build U-Boot +DEFAULT_UBOOT_ENVS_FILE ?=3D "u-boot-env"
> > +DEFAULT_ENVS ?=3D "${DEFAULT_UBOOT_ENVS_FILE}.txt"
> > +UBOOT_ENVS_DEFAULT ?=3D
> > "${DEFAULT_UBOOT_ENVS_FILE}-${MACHINE}-${PV}-${PR}.img" +# The
> > UBOOT_ENVS_SIZE needs to defined in the <machine>.conf file +#
> > UBOOT_ENVS_SIZE =3D "65536" +
> >  # returns all the elements from the src uri that are .cfg files
> >  def find_cfgs(d):
> >      sources=3Dsrc_patches(d, True)
> > @@ -132,6 +139,19 @@ do_compile () {
> >          oe_runmake -C ${S} O=3D${B} ${UBOOT_MAKE_TARGET}
> >      fi
> > =20
> > +    # Generate default environment
> > +    if [ -n "${UBOOT_ENVS_SIZE}" ]
> > +    then
> > +        ${B}/source/scripts/get_default_envs.sh ${B} >
> > ${B}/${DEFAULT_ENVS} +
> > +        # Generate env image
> > +        ${B}/tools/mkenvimage -s ${UBOOT_ENVS_SIZE} -o
> > ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS} +
> > +        # Generate redundant env image
> > +        ${B}/tools/mkenvimage -r -s ${UBOOT_ENVS_SIZE} -o
> > ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS} +
> > +        rm ${B}/${DEFAULT_ENVS}
> > +    fi
> >  }
> > =20
> >  do_install () {
> > @@ -328,6 +348,20 @@ do_deploy () {
> >          ln -sf ${UBOOT_EXTLINUX_SYMLINK}
> > ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE} ln -sf
> > ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}
> > fi +
> > +    if [ -n "${UBOOT_ENVS_SIZE}" ]
> > +    then
> > +        install -d ${DEPLOYDIR}
> > +        install ${B}/${UBOOT_ENVS_DEFAULT}
> > ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}
> > +        install ${B}/${UBOOT_ENVS_DEFAULT}_r
> > ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r +
> > +        cd ${DEPLOYDIR}
> > +        ln -sf ${UBOOT_ENVS_DEFAULT} ${DEFAULT_UBOOT_ENVS_FILE}.img
> > +        ln -sf ${UBOOT_ENVS_DEFAULT}_r
> > ${DEFAULT_UBOOT_ENVS_FILE}.img_r +
> > +        rm ${B}/${UBOOT_ENVS_DEFAULT}
> > +        rm ${B}/${UBOOT_ENVS_DEFAULT}_r
> > +    fi
> >  }
> > =20
> >  addtask deploy before do_build after do_compile
> >  =20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/3JGhzEJzl/gVE5KFk9Mv8lj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl07ZhgACgkQAR8vZIA0
zr3M9Af8DFfk/YpB0k1wSOlOlCflzcQgD5Yt1qs5C/cIjV/NjyKftczknmuodgUp
X58v+vTlCZ9f3cudP4MATe4zMUDn3vjjyuvIDaI0RD/XvK7l5kJJRpR6+fKvTgUR
JGlHC1MfJuXGjOyZ7Y+seJ6D4YzdH90upMIfB7XjxB1+Tdj1foCWJ/K8Z4OC/ny8
oFkRLzX+tsN8eLc4matbampp9Ek1jgUXw20LjBGrg9pLsFbn4SUTqxIjyc4TV1M9
2515Bv+BG6eIFZOd1ldEz175yII2HSfjQX/9hBlwgduSfTi1r/3BI4QfMrwiDXfq
YSmw0a6eTk1CZsT9DlVSALq3RDi+Yw==
=+yQp
-----END PGP SIGNATURE-----

--Sig_/3JGhzEJzl/gVE5KFk9Mv8lj--
