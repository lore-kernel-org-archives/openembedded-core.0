Return-Path: <lukma@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD4D78F71
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:51:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 41wTVg5z3Pz1qyLW;
	Wed, 22 Aug 2018 15:51:55 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 41wTVg5lJ1z1tLNb;
	Wed, 22 Aug 2018 15:51:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id StW6oF63JowP; Wed, 22 Aug 2018 15:51:54 +0200 (CEST)
X-Auth-Info: f0b21slaYb1/k9NdKXW/bfANszZTHPCw+gkNdrJNhEc=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 22 Aug 2018 15:51:54 +0200 (CEST)
Date: Wed, 22 Aug 2018 15:51:41 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20180822155141.4f56ff85@jawa>
In-Reply-To: <446ed947-bbab-1bb6-4fad-e222af1fa662@windriver.com>
References: <20180822134022.1067-1-lukma@denx.de>
	<446ed947-bbab-1bb6-4fad-e222af1fa662@windriver.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 13:51:55 -0000
X-Groupsio-MsgNum: 115222
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/_3Hi/VjG2mg5rkqvlecEjhQ";
	protocol="application/pgp-signature"

--Sig_/_3Hi/VjG2mg5rkqvlecEjhQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

> On 08/22/2018 09:40 AM, Lukasz Majewski wrote:
> > Without this patch it happens that do_populate_recipe_sysroot is
> > called just before do_compile (on multi core build machines).
> > This is way too late as the .config generated in
> > do_kernel_configme() is already broken.
> >=20
> > The problem is that do_kernel_configme() calls native's
> > merge_config.sh script which may call bison and arm-linux-*-gcc to
> > compile kconfig infrastructure to create base .config
> > (scripts/kconfig/conf  --allnoconfig Kconfig.)
> >=20
> > It turns out that we only got above binaries after
> > do_prepare_recipe_sysroot() is called.
> > If those binaries are not available, the merge_config.sh do not
> > generate base .config and without any error produces
> > malfunctioned .config. The build process continues and as a result
> > broken kernel is compiled.
> >=20
> > To reproduce:
> >=20
> > bitbake -c cleansstate virtual/kernel
> > bitbake -c kernel_metadata -v virtual/kernel
> > bitbake -c do_kernel_configme -v virtual/kernel
> > (one shall see broken .config in ${B}/.config)
> > bitbake -c do_populate_sysroot -v virtual/kernel
> > bitbake -c do_compile -v virtual/kernel
> >  =20
>=20
> I already have a queue of changes for the 4.18 kernel that has a
> similar tweak.
>=20
> I'll double check the use case above, and if it isn't already
> fixed, I'll add this to my queue.

One more strange observation the merge_config.sh shall use -native
binaries (like bison, gcc, etc).

Unfortunately, in my case it depends on target ones (as we do have
CFLAGS =3D .... ARCH=3Darm ... merge_configs.sh).

The bitbake -g -u taskexp virtual/kernel shows however that we do
depend on native bison.

To provide target ones - I do need the do_prepare_recipe_sysroot() to
call before do_configure.

>=20
> Bruce
>=20
> > (Poky) SHA1: bb91b2ae3ee5cf108aa2f9b78abb14d5aa00831d
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> >   meta/classes/kernel-yocto.bbclass | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/classes/kernel-yocto.bbclass
> > b/meta/classes/kernel-yocto.bbclass index 4ac3a39e47..19a3f2bc46
> > 100644 --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -276,6 +276,7 @@ do_kernel_metadata[depends] =3D
> > "kern-tools-native:do_populate_sysroot"
> > do_validate_branches[depends] =3D
> > "kern-tools-native:do_populate_sysroot" do_kernel_configme[dirs] +=3D
> > "${S} ${B}" +do_kernel_configme[depends] +=3D
> > "virtual/kernel:do_prepare_recipe_sysroot" do_kernel_configme() {
> >   	set +e
> >  =20
> >  =20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/_3Hi/VjG2mg5rkqvlecEjhQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlt9am0ACgkQAR8vZIA0
zr0CMQf6Amb00i6qCTeg32OFk+xJQx0O/e9EdTFN6eaiFLJC4a6NooaT7RPPx5NW
4ZaATLMuY8W7XUYLf/e/8Cio8ptG2kbpGauPT3OQO+xOZ3ZEkmff4utfkEBnn8My
PTdHBZTSM+pmXv2ePZD7cHUJaHbSdpz/YSUgyueKfAoEZlZG2ycKVJRNKSbUbncf
H7/Jmva30OEiCtI22FgkGyx4lVRQCFoAdp65IyeSlVIVXvHm9DgZntWaDWxxiiqV
BOJ597NN4iEJYN+V5Sv3+PTdFkH6mlPkNAXrLPAQOnKyyvdfA32p8u+uFvHNYaLi
bosZhzYpbjepJQyvfoe5qgTbv6KGIg==
=1Jbk
-----END PGP SIGNATURE-----

--Sig_/_3Hi/VjG2mg5rkqvlecEjhQ--
