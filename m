Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7F88674A12
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 18:15:28 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40cNc06TCGz1qtd6;
	Thu,  3 May 2018 20:15:28 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40cNc063kbz1qrfy;
	Thu,  3 May 2018 20:15:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id AcYsJKnvfJk9; Thu,  3 May 2018 20:15:27 +0200 (CEST)
X-Auth-Info: XYTWlko4ErREypjF/wQybg/NTqW5j7FYU2vrlT76BGk=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu,  3 May 2018 20:15:27 +0200 (CEST)
Date: Thu, 3 May 2018 20:15:15 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Marek Vasut <marex@denx.de>, Stefano Babic <sbabic@denx.de>
Message-ID: <20180503201515.5d205adb@jawa>
In-Reply-To: <5835447d-e8fb-dd1a-5d13-1561e475758f@denx.de>
References: <20180427145139.30732-1-lukma@denx.de>
	<fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
	<cef99ffe-3f4e-547d-318e-a7bc60ebdb2b@denx.de>
	<2a2d73fb-edec-f179-8693-6efb0942a979@denx.de>
	<6135f505-9afd-3428-4275-8a5a961559cb@denx.de>
	<5835447d-e8fb-dd1a-5d13-1561e475758f@denx.de>
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
X-List-Received-Date: Thu, 03 May 2018 18:15:28 -0000
X-Groupsio-MsgNum: 110958
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/qW5iq2JKG27+nz5+gAS7387";
	protocol="application/pgp-signature"

--Sig_/qW5iq2JKG27+nz5+gAS7387
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marek, Stefano,

> On 05/03/2018 06:50 PM, Stefano Babic wrote:
> > On 03/05/2018 18:36, Marek Vasut wrote: =20
> >> On 05/03/2018 06:28 PM, Stefano Babic wrote: =20
> >>> On 27/04/2018 17:07, Marek Vasut wrote: =20
> >>>> On 04/27/2018 04:51 PM, Lukasz Majewski wrote: =20
> >>>>> This commit provides the ability to generate u-boot
> >>>>> environment(s) as images, which afterwards can be used to
> >>>>> produce image (with wic) for flashing (eMMC or SPI-NOR).
> >>>>>
> >>>>> This change removes the need to run "env default" during
> >>>>> production phase, as proper environment (including redundant
> >>>>> one) is already stored on persistent memory (the CRC is also
> >>>>> correct).
> >>>>>
> >>>>> Signed-off-by: Lukasz Majewski <lukma@denx.de> =20
> >>>>
> >>>> If your default env is correct, why do you need this ? I can see
> >>>> some use with non-default env, but then that can be wrapped into
> >>>> a separate recipe.
> >>>> =20
> >>>
> >>> A use case is when the environment must be changed from user
> >>> space. fw_setenv will report the CRC error and it needs the
> >>> default environment to add changes. The default environment is
> >>> linked together to fw_setenv, but this prohibites to use
> >>> fw_setenv for multiple boards and must be explicitely built for
> >>> that machine and with the same sources as u-boot (at least, they
> >>> must share the same CONFIG_EXTRA_ENV). If the default environment
> >>> is extracted, we could have a general (distro ?) fw_setenv. =20
> >>
> >> I think in that case, the real solution is to either build
> >> fw_setenv per machine  =20
> >=20
> > This is how we try to do now, fw_setenv is built per machine but it
> > is enough that u-boot-fw-utils is built in a different version as
> > u-boot to get a mess. =20
>=20
> Well yes, if you mix and match packages, it becomes a mess. Isn't that
> to be expected ?
>=20
> >> OR fix fw_setenv to take env defaults from a file or somesuch ? =20
> >=20
> > Right, I interprete this patch as a step in this direction. This
> > patch generates a default that can be used as input for fw_setenv. =20
>=20
> It generates environment images which can be written -- on certain
> specific setups -- into the flash. It doesn't generate any sort of
> input for the fw_setenv to my knowledge ?
>=20

I think that it would be great if:

1. We would have this code as a separate recipe - as suggested by Marek
and Stefano already. This recipe would end up as a package to be
installed on the rootfs

2. As input I would use default_envs.txt (or any other name) - either
extracted from u-boot build or provided from external file

3. For now I do use mkenvimage -> and I do have env image [*] to be
flashed on the board.

However, I do wonder if for the default fw_setenv envs we could:

- modify fw_setenv to read (and store) [*] when no correct default env
  is available

I must check if fw_setenv handles images generated by mkenvimage (or
boot.src [1] generated by mkimage).


[1] - <u-boot repo>/board/samsung/common/bootscripts/autoboot.cmd

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/qW5iq2JKG27+nz5+gAS7387
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlrrUbMACgkQAR8vZIA0
zr2OYwgAoCtwWssaMvFAgD+BX4ANBgC+HYYbtF4U53mDu/3SJNwPIOWp9sZjSrwh
G3zk7quWFbC6aDBAoUw/OlxFGPir3rcxbEG13OMnRwxgjPbq5sgmZOCG9D4Mrpp9
19KbeIiaxZ0LAJhtPwaU/6YS0lVPe+bPSDHaozxENxKSB4pWulDJV9ZAIYzqOBmZ
NM7rSrpbHc8qfCUM8/b3hKYH2T2bSiwq5CtPYkClwGllDOVGmSigsmzuHMoG1Qe/
m2/ep1LKsxF9FF8SYI1VMwBMswGI6AJ5r0AHPjvNbQEkjhARPX2MGjWIcMC/nWRt
v6Ke467lc2qz0BQdTIkNSGFzdOs60Q==
=RFd7
-----END PGP SIGNATURE-----

--Sig_/qW5iq2JKG27+nz5+gAS7387--
