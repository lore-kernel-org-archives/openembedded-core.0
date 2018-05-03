Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id DD77D74A12
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 18:17:25 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40cNfG46Sqz1qtd6;
	Thu,  3 May 2018 20:17:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40cNfG3yZhz1qrfy;
	Thu,  3 May 2018 20:17:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id aeOm7QfmWx2K; Thu,  3 May 2018 20:17:25 +0200 (CEST)
X-Auth-Info: FGYRS+dI3At+l/CZgtQgjhkN+slPrdurbyCjHhiEIYE=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu,  3 May 2018 20:17:25 +0200 (CEST)
Date: Thu, 3 May 2018 20:17:19 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Stefano Babic <sbabic@denx.de>
Message-ID: <20180503201719.793caaab@jawa>
In-Reply-To: <05497147-e45a-1b11-e6d0-387de8fdee26@denx.de>
References: <20180427145139.30732-1-lukma@denx.de>
	<05497147-e45a-1b11-e6d0-387de8fdee26@denx.de>
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
X-List-Received-Date: Thu, 03 May 2018 18:17:26 -0000
X-Groupsio-MsgNum: 110959
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/AdFNwvyGvvK4ytMxaix78ia";
	protocol="application/pgp-signature"

--Sig_/AdFNwvyGvvK4ytMxaix78ia
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 3 May 2018 18:24:32 +0200
Stefano Babic <sbabic@denx.de> wrote:

> Hi Lukasz,
>=20
> On 27/04/2018 16:51, Lukasz Majewski wrote:
> > This commit provides the ability to generate u-boot environment(s)
> > as images, which afterwards can be used to produce image (with wic)
> > for flashing (eMMC or SPI-NOR).
> >=20
> > This change removes the need to run "env default" during production
> > phase, as proper environment (including redundant one) is already
> > stored on persistent memory (the CRC is also correct).
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >=20
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
> > ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS} +
> > +	# Generate redundant env image
> > +	${B}/tools/mkenvimage -r -s ${DEFAULT_ENVS_SIZE} -o
> > ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS} +
> > +	rm ${B}/${DEFAULT_ENVS}
> > +}
> > + =20
>=20
> Why do we need a separate task ? Is it not part of do_compile ?

The get_default_envs.sh script requires the build-in.o to be already
build. For that reason I've added a separate task, which goes just after
the do_compile for u-boot.

>=20
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
> > ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r +
> > +	rm ${B}/${UBOOT_ENVS_DEFAULT}
> > +	rm ${B}/${UBOOT_ENVS_DEFAULT}_r
> > +}
> > +
> > +addtask deploy_default_envs before do_deploy after
> > do_gen_default_envs=20
>=20
> I would like to see that the default environment is installed and
> delivered as (additional) package. I could then add it to my rootfs
> and use it to set up the environment in user space in case a CRC
> error is reported by the env tools.
>=20
> Regards,
> Stefano
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/AdFNwvyGvvK4ytMxaix78ia
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlrrUi8ACgkQAR8vZIA0
zr18/Qf+OehXBhbymN/pcMB1giPYwn66XZlV7lRB+Ynz0ALRAGZtkf/SaHIdDXm8
PvYZ+PRvE/G+hVnJrLkX6uDNFdPjhzT0tGykftCGd2BFKmVyOpjDW9MsDwE7wjPx
oPfFmGguwcqP/YzT/VfDIsg7C4oW/WfnOXk/aNKPYRhBz9aywFKgm6tK5aIp7FLR
I20eHS5Nt3Daxzc1ymr4Wx+cABIstSj/8QN2A77K3tXeFh31UBiMMTKbQ3P1fB/v
IUnfess9wZc58wfxvo0foFDuDLz6dP6YgSKjLNF77h8XDveV29EcINdFW5B8NnC3
Uv/DNOrreh7rJEbNkGypFamAHTcmiQ==
=P5Op
-----END PGP SIGNATURE-----

--Sig_/AdFNwvyGvvK4ytMxaix78ia--
