Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 15AAA71985
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 11:46:10 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40gvh3261fz1qwCD;
	Wed,  9 May 2018 13:46:11 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40gvh31Hvwz1qql0;
	Wed,  9 May 2018 13:46:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id CSw6LlNUrLKS; Wed,  9 May 2018 13:46:07 +0200 (CEST)
X-Auth-Info: bOyS+jLCq8R4gDzY37PTydFmUFMrF8dqJbUF6UJO/0I=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed,  9 May 2018 13:46:07 +0200 (CEST)
Date: Wed, 9 May 2018 13:45:41 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Marek Vasut <marex@denx.de>, Stefano Babic <sbabic@denx.de>
Message-ID: <20180509134541.3f19e435@jawa>
In-Reply-To: <0266546b-7978-59db-14dc-4cea87b87e74@denx.de>
References: <20180427145139.30732-1-lukma@denx.de>
	<fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
	<cef99ffe-3f4e-547d-318e-a7bc60ebdb2b@denx.de>
	<2a2d73fb-edec-f179-8693-6efb0942a979@denx.de>
	<6135f505-9afd-3428-4275-8a5a961559cb@denx.de>
	<5835447d-e8fb-dd1a-5d13-1561e475758f@denx.de>
	<20180503201515.5d205adb@jawa>
	<0266546b-7978-59db-14dc-4cea87b87e74@denx.de>
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
X-List-Received-Date: Wed, 09 May 2018 11:46:11 -0000
X-Groupsio-MsgNum: 111150
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/FAG_=mduW+Yz=L/J_658ME9";
	protocol="application/pgp-signature"

--Sig_/FAG_=mduW+Yz=L/J_658ME9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marek, Stefano,

> On 05/03/2018 08:15 PM, Lukasz Majewski wrote:
> > Hi Marek, Stefano,
> >  =20
> >> On 05/03/2018 06:50 PM, Stefano Babic wrote: =20
> >>> On 03/05/2018 18:36, Marek Vasut wrote:   =20
> >>>> On 05/03/2018 06:28 PM, Stefano Babic wrote:   =20
> >>>>> On 27/04/2018 17:07, Marek Vasut wrote:   =20
> >>>>>> On 04/27/2018 04:51 PM, Lukasz Majewski wrote:   =20
> >>>>>>> This commit provides the ability to generate u-boot
> >>>>>>> environment(s) as images, which afterwards can be used to
> >>>>>>> produce image (with wic) for flashing (eMMC or SPI-NOR).
> >>>>>>>
> >>>>>>> This change removes the need to run "env default" during
> >>>>>>> production phase, as proper environment (including redundant
> >>>>>>> one) is already stored on persistent memory (the CRC is also
> >>>>>>> correct).
> >>>>>>>
> >>>>>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>   =20
> >>>>>>
> >>>>>> If your default env is correct, why do you need this ? I can
> >>>>>> see some use with non-default env, but then that can be
> >>>>>> wrapped into a separate recipe.
> >>>>>>   =20
> >>>>>
> >>>>> A use case is when the environment must be changed from user
> >>>>> space. fw_setenv will report the CRC error and it needs the
> >>>>> default environment to add changes. The default environment is
> >>>>> linked together to fw_setenv, but this prohibites to use
> >>>>> fw_setenv for multiple boards and must be explicitely built for
> >>>>> that machine and with the same sources as u-boot (at least, they
> >>>>> must share the same CONFIG_EXTRA_ENV). If the default
> >>>>> environment is extracted, we could have a general (distro ?)
> >>>>> fw_setenv.   =20
> >>>>
> >>>> I think in that case, the real solution is to either build
> >>>> fw_setenv per machine    =20
> >>>
> >>> This is how we try to do now, fw_setenv is built per machine but
> >>> it is enough that u-boot-fw-utils is built in a different version
> >>> as u-boot to get a mess.   =20
> >>
> >> Well yes, if you mix and match packages, it becomes a mess. Isn't
> >> that to be expected ?
> >> =20
> >>>> OR fix fw_setenv to take env defaults from a file or
> >>>> somesuch ?   =20
> >>>
> >>> Right, I interprete this patch as a step in this direction. This
> >>> patch generates a default that can be used as input for
> >>> fw_setenv.   =20
> >>
> >> It generates environment images which can be written -- on certain
> >> specific setups -- into the flash. It doesn't generate any sort of
> >> input for the fw_setenv to my knowledge ?
> >> =20
> >=20
> > I think that it would be great if:
> >=20
> > 1. We would have this code as a separate recipe - as suggested by
> > Marek and Stefano already. This recipe would end up as a package to
> > be installed on the rootfs

I've looked a bit more on the topic, and I do have some further
questions:

1. It seems like u-boot is compiled at least twice - once when
do_comiple() is invoked in u-boot.inc (here we support multiple
configs, and targets) and in u-boot-fw-utils (also u-boot-mkimage
compiles u-boot for sandbox_defconfig).

It seems like the synchronization of the built package (and envs) is
ensured with u-boot-common_2018.03.inc package.=20

2. It seems like it would be feasible to have a separate recipe -
u-boot-envs_2018.03.bb [*] which would:

	- Use u-boot-env.txt provided as an external file (from e.g.
	  SRC +=3D "./file/u-boot-env.txt"). This is the approach similar
	  to
	  https://github.com/webosose/meta-webosose/blob/master/meta-webos-raspber=
rypi/recipes-bsp/u-boot/u-boot-env.bb

	- If above input *.txt file is not present then get the envs
	  extracted from built u-boot.=20

The main question for above item - how and where to extract this file?

	- The most feasible would be to extend do_compile of u-boot.inc
	  to run get_default_envs.sh script there (as it builds all
	  the kind of u-boot variants/binaries).

	- Then "export" those generated *.txt files to [*] recipe.
	  What would be the best way?

	  Via ${DEPLOYDIR} ? Install it on /boot directory (exported by
	  u-boot) ?=20

> >=20
> > 2. As input I would use default_envs.txt (or any other name) -
> > either extracted from u-boot build or provided from external file
> >=20
> > 3. For now I do use mkenvimage -> and I do have env image [*] to be
> > flashed on the board. =20
>=20
> Sounds about good. I think this approach fails with NAND, so be
> careful there.
>=20
> > However, I do wonder if for the default fw_setenv envs we could:
> >=20
> > - modify fw_setenv to read (and store) [*] when no correct default
> > env is available =20
> Or add some build-time option to build it with blank default env. Then
> you can apply your file-based approach, the setenv would be
> board-agnostic and it should do I guess ?
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/FAG_=mduW+Yz=L/J_658ME9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlry32UACgkQAR8vZIA0
zr29dgf/R7m1KZOvPY56QSLO53YGIYfbMSyj/GpBNABCB1upyV9O6z86Awixju2x
CRb5Jtw5EddM4lm7PgDBFpOXm3YfnLlZG8AwHUYoqacALA1QulF1naB3T7N6D4/k
YEJM48J1Vj8cRJWIUgWTCn7l8WBq834/opqFw2lsokqVetQmrugS6W4fY3EzRhDX
PO/HcEBUxtB+VKaMdewXBP/+Wk7XUI/ssCxcuF7Le0Ir+wm18Ss2yu5RJLjlO3ZV
ZUhUo6AgAVjVsffu41G2JOXAD3uLPYDc21dNjSesAr4nPCSjS3Aoh0WPbneHvR9A
hYycyhprbu9EyWn2b7+2QBHd9XdxDA==
=B+EN
-----END PGP SIGNATURE-----

--Sig_/FAG_=mduW+Yz=L/J_658ME9--
