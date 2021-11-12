Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BEDC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 08:48:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.13100.1636706926364820937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 00:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=ppNGu9uU;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7406682F65;
	Fri, 12 Nov 2021 09:48:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1636706924;
	bh=gnzprrymr2daIoAd7Wn9jIe/qxnkfeckmrY4mponWMA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ppNGu9uULJbpPAvNJtD5GBnIkMbA/x0jwR3THGhGg5XRET31pZklROlzXsfT4YYKe
	 6IP6KNY3xai0S6tnMhRdvHG3XBpPAqYqXP1EpZ3pcbOh2q3H45IdC0rqajGL2z1qrI
	 ej/qWvDkvCctZNiVy9CLP4J5WVZqXbL2fIm1rXrUl0sn/Ed9cYcRxNWWG3smX5T6gI
	 LRqqVy+0Qm8rF2+wXJ4d6A34uYBMa0XL0I5aE5lZDOIB+hkFHrR+1hmOsiLu64RDmO
	 GGotxgbLFoGueQHaWuDHiOjyBWwC5GgO2hIRj2mKBuAQawPissuGUeGZaZP7gPD/uy
	 d2uIjXxUHBdOQ==
Date: Fri, 12 Nov 2021 09:48:42 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
 <raj.khem@gmail.com>
Cc: Nathan Rossi <nathan@nathanrossi.com>, Adhemerval Zanella
 <adhemerval.zanella@linaro.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Lee Chee Yang <chee.yang.lee@intel.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] glibc: ptest: Add running glibc time related test
 suite (Y2038) with ptest
Message-ID: <20211112094842.1a636a88@ktm>
In-Reply-To: 
 <023667d47dfa5b3e08858b06596d15986cdc26c2.camel@linuxfoundation.org>
References: <20211109152851.8137-1-lukma@denx.de>
	<CAMKF1srQjFZ4DfGGVsV47SS0ma1LewE24Luwgtw-FwcCsOU_DQ@mail.gmail.com>
	<023667d47dfa5b3e08858b06596d15986cdc26c2.camel@linuxfoundation.org>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/DWJ7yb=SE4f0tlqYffyFJLa"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 08:48:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158211

--Sig_/DWJ7yb=SE4f0tlqYffyFJLa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Richard, Khem

> On Thu, 2021-11-11 at 05:51 -0800, Khem Raj wrote:
> > On Tue, Nov 9, 2021 at 7:29 AM Lukasz Majewski <lukma@denx.de>
> > wrote: =20
> > >=20
> > > This patch introduces new recipe - namely 'glibc-tests', which
> > > builds and installs time related (to check if Y2038 support
> > > works) glibc test suite to OE/Yocto built image.
> > >=20
> > > It reuses code from already available 'glibc-testsuite' recipe,
> > > which is run with 'bitbake glibc-testsuite -c check' and uses qemu
> > > to execute remotely (via SSH) tests on some emulated machine.
> > >=20
> > > This recipe installs time related glibc tests on some rootfs
> > > image. Afterwards, those tests can be executed on the real
> > > hardware, to facilitate validation of it with Y2038 problem
> > > compliance.
> > >=20
> > > To test time related subset - one needs to call:
> > > ptest-runner glibc-tests
> > > then change the date after Y2038 threshold for 32 bit systems:
> > > date -s "20 JAN 2038 18:00:00"
> > > and then run ptest-runner again.
> > >=20
> > > To facilitate debugging, source files are provided by default with
> > > the unstripped debugging symbols. Such approach would reduce the
> > > already complex recipe (as it inherits base glibc one), so there
> > > is no need to also install *-dbg and *-src packages.
> > >=20
> > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > >=20
> > > ---
> > > Changes for v4:
> > > - Add entry for 'glibc-tests' in the maintainers.inc file
> > > - Remove nativesdk from BBCLASSEXTEND as this resipe is not
> > > supposed to be the part of SDK
> > >=20
> > > Changes for v3:
> > > - Provide missing ${PN}-ptest for PACKAGES, PROVIDES and
> > >   RPROVIDES variables
> > >=20
> > > Changes for v2:
> > > - Just focus on time related set of tests as those can be run as
> > >   standalone
> > > - Reuse of already built tests (from glibc-tests.inc) and depoloy
> > >   them on the HW target.
> > > - Provide single 'run-ptest' script.
> > > - Update the recipe to run with newest poky's -master
> > > ---
> > >  meta/conf/distro/include/maintainers.inc      |   1 +
> > >  .../distro/include/ptest-packagelists.inc     |   1 +
> > >  meta/recipes-core/glibc/glibc-tests_2.34.bb   | 113
> > > ++++++++++++++++++ meta/recipes-core/glibc/glibc/run-ptest
> > > |  37 ++++++ 4 files changed, 152 insertions(+)
> > >  create mode 100644 meta/recipes-core/glibc/glibc-tests_2.34.bb
> > >  create mode 100755 meta/recipes-core/glibc/glibc/run-ptest
> > >=20
> > > diff --git a/meta/conf/distro/include/maintainers.inc
> > > b/meta/conf/distro/include/maintainers.inc index
> > > baec2bef4d..7104e091fc 100644 ---
> > > a/meta/conf/distro/include/maintainers.inc +++
> > > b/meta/conf/distro/include/maintainers.inc @@ -209,6 +209,7 @@
> > > RECIPE_MAINTAINER:pn-glibc =3D "Khem Raj <raj.khem@gmail.com>"
> > > RECIPE_MAINTAINER:pn-glibc-locale =3D "Khem Raj
> > > <raj.khem@gmail.com>" RECIPE_MAINTAINER:pn-glibc-mtrace =3D "Khem
> > > Raj <raj.khem@gmail.com>" RECIPE_MAINTAINER:pn-glibc-scripts =3D
> > > "Khem Raj <raj.khem@gmail.com>" +RECIPE_MAINTAINER:pn-glibc-tests
> > > =3D "Lukasz Majewski <lukma@denx.de>"
> > > RECIPE_MAINTAINER:pn-glibc-testsuite =3D "Khem Raj
> > > <raj.khem@gmail.com>" RECIPE_MAINTAINER:pn-glide =3D "Otavio
> > > Salvador <otavio.salvador@ossystems.com.br>"
> > > RECIPE_MAINTAINER:pn-gmp =3D "Khem Raj <raj.khem@gmail.com>" diff
> > > --git a/meta/conf/distro/include/ptest-packagelists.inc
> > > b/meta/conf/distro/include/ptest-packagelists.inc index
> > > 2e324f8da4..fd52fa72a4 100644 ---
> > > a/meta/conf/distro/include/ptest-packagelists.inc +++
> > > b/meta/conf/distro/include/ptest-packagelists.inc @@ -61,6 +61,7
> > > @@ PTESTS_FAST =3D "\ slang-ptest \ wayland-ptest \ zlib-ptest \
> > > +    glibc-tests-ptest \ =20
> >=20
> > this will break musl. So lets change this to
> >=20
> > PTESTS_FAST:append:libc-glibc =3D " glibc-tests-ptest" =20
>=20
> FWIW I tested a tweak in master-next for that...
>=20

Shall I prepare v5 with fix for that, or will you keep patches from
master-next (with your fix for this) ?

(I would prefer personally the latter option :-) ).

> Cheers,
>=20
> Richard
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/DWJ7yb=SE4f0tlqYffyFJLa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmGOKmoACgkQAR8vZIA0
zr2J2Qf+OjGt4ZpiZdy9Iz9xMoANNWUmweaW2fZWOyjCUy3TQOuBER83d5SwEAVL
gyXfktVkCX4I1Qdnf2zwlN+IZQbq+KhfvaqboumslfE0Xf+cQj2sfUplQKtj/M6Q
ca3PQE59bD33ktGyudOtDGia+PFjWOTC1N5yDc6DZez5h/9Tcm8wFeBsfG5AqIw6
4xT8UsRuZwxWS2gtuHyW95D5jnpHXvd7dLcEen8sObytQdhWn1GZJYbdIM8b3mkA
RgWyrx0JuiJAhsRNoMeU0QMXoV0oKy3zazyEdmdMmaV2H72/exXBVqSpL8mIpT08
mMruDHMYY9PimCo//49Ir0jfZDdCiQ==
=g5Je
-----END PGP SIGNATURE-----

--Sig_/DWJ7yb=SE4f0tlqYffyFJLa--

