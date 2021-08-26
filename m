Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.29828.1629980879147068026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 05:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=c8DFqXHj;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F2DD382A01;
	Thu, 26 Aug 2021 14:27:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1629980876;
	bh=d4d+aKMlMj7V9lV1blE1EWchvv+3BoCEpngc8on4TBI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c8DFqXHj/9rqo3TK0ZFFlUvq+p9WMNnPJgRMvh2emDzyWJwLR6K1AWwlJuDPQwY4z
	 yvX0k4UTnj+O/BoTRu9kFqmjUFCv5rzyd8hof0A0U+h9a9JudEOfyVbfdFvJ/Eg0Sz
	 4+dRQrBckxRFWJnQWZ+nCWlTiJzflM2GyQeLY67ITRtVfmDuaHkuAtym8+CfqHo6Z4
	 8jWJim3oVkTut1dDCqdNfBAwQQ9gQIBoB+weoF6kHcy+nBntwoYZe+kcBIBHPjmVTd
	 9cVZy8xUXJa1HQIogWRIcKRTobiVCtg9cH5h3InxkL9VEf3qGVdvvqJ1ehsDCVQtoj
	 evh+8giRS1apw==
Date: Thu, 26 Aug 2021 14:27:49 +0200
From: "?ukasz Majewski" <lukma@denx.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the oe-core
 layer  <openembedded-core@lists.openembedded.org>, Adhemerval Zanella
 <adhemerval.zanella@linaro.org>
Subject: Re: [OE-core] [PATCH 2/2] glibc: ptest: Add support for running glibc test suite with ptest
Message-ID: <20210826142749.51466c70@ktm>
In-Reply-To: <20210824104213.6be82b74@ktm>
References: <20210823150853.2817-1-lukma@denx.de>
	<20210823150853.2817-2-lukma@denx.de>
	<ada9987d-399b-7a73-2aa5-c09dcca41fb3@gmail.com>
	<20210823202414.731c6749@ktm>
	<CAMKF1srLFY_R4KX3gG3hZMhZNtjSN8D4mEp0Wwr78Se9RE_20g@mail.gmail.com>
	<20210823220926.37d87121@ktm>
	<CAMKF1sqKH=RiOn-WVp_=ZQmLnSJ43VUUfKyv+E1KR9bCn01j3Q@mail.gmail.com>
	<20210824093601.768c0c05@ktm>
	<34041d492af033ff34a273e07057ea9c767cabf7.camel@linuxfoundation.org>
	<20210824104213.6be82b74@ktm>
Organization: denx.de
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-Groupsio-MsgNum: 155354
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/ABhLr+kj1rhC4OfVzOsC3nK"; protocol="application/pgp-signature"

--Sig_/ABhLr+kj1rhC4OfVzOsC3nK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Richard, Khem,

> Hi Richard,
>=20
> > On Tue, 2021-08-24 at 09:36 +0200, ?ukasz Majewski wrote: =20
> > > Hi Khem,
> > >    =20
> > > > On Mon, Aug 23, 2021 at 1:09 PM Lukasz Majewski <lukma@denx.de>
> > > > wrote:   =20
> > > > >=20
> > > > > On Mon, 23 Aug 2021 12:52:44 -0700
> > > > > Khem Raj <raj.khem@gmail.com> wrote:
> > > > >     =20
> > > > > > On Mon, Aug 23, 2021 at 11:24 AM Lukasz Majewski
> > > > > > <lukma@denx.de> wrote:
> > > > > >     =20
> > > > > > > Hi Khem,
> > > > > > >     =20
> > > > > > > > On 8/23/21 8:08 AM, ?ukasz Majewski wrote:     =20
> > > > > > > > > This patch introduces new recipe - namely
> > > > > > > > > 'glibc-tests', which builds and installs glibc test
> > > > > > > > > suite to OE/Yocto built image.
> > > > > > > > >=20
> > > > > > > > > It reuses code from already available
> > > > > > > > > 'glibc-testsuite' recipe, which is run with 'bitbake
> > > > > > > > > glibc-testsuite -c check' and uses qemu to execute
> > > > > > > > > remotely (via SSH) tests on some emulated machine.
> > > > > > > > >=20
> > > > > > > > > This recipe installs eligible tests on some rootfs
> > > > > > > > > image. Afterwards, either all of them or only time
> > > > > > > > > related subset, those tests can be executed on the
> > > > > > > > > real hardware, to facilitate validation of this
> > > > > > > > > platform with for example Y2038 problem compliance.
> > > > > > > > >=20
> > > > > > > > > By default all tests are executed, with 'ptest-runner
> > > > > > > > > glibc-tests'. To test only time related subset - one
> > > > > > > > > needs to call: cd /usr/lib/glibc-tests/ptest/; rm
> > > > > > > > > run-ptest; \ ln -s run-ptest-time run-ptest; cd -;
> > > > > > > > > ptest-runner glibc-tests
> > > > > > > > >=20
> > > > > > > > > To facilitate debugging, source files are provided by
> > > > > > > > > default with the unstripped debugging symbols. Such
> > > > > > > > > approach would reduce the already complex recipe (as
> > > > > > > > > it inherits base glibc one), so there is no need to
> > > > > > > > > also install *-dbg and *-src packages.     =20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > does it have to be a separate recipe I wonder if we can
> > > > > > > > have it built as part of glibc itself controlled via
> > > > > > > > ptest knob     =20
> > > > > > >=20
> > > > > > > I've followed the glibc-testsuite recipe to provide tests
> > > > > > > for ptest. Test creation is similar to it, but doesn't
> > > > > > > require QEMU run (tests are executed on the HW).
> > > > > > >=20
> > > > > > > Another rationale was to have some kind of "features"
> > > > > > > separation in different file (liked glibc-mtrace), which
> > > > > > > is easier to maintain and review.
> > > > > > >=20
> > > > > > > Last but not least - separate recipe (and built binaries)
> > > > > > > allow some kind of magic with selection of used test
> > > > > > > programs (this may be useful if one would like to have
> > > > > > > different sets of tests in different packages)     =20
> > > > > >=20
> > > > > > That=E2=80=99s seems ok I think the names are quite confusing n=
ow
> > > > > > not that it was not so much better before but now we have
> > > > > > glibc-tests and glibc-testsuites which do same things but in
> > > > > > very different way maybe glibc-testsuite should be renamed
> > > > > > to something like glibc-tests-crosd or some such     =20
> > > > >=20
> > > > > I think that glibc-testsuite_2.34.bb shall be renamed to
> > > > > glibc-tests-qemu_2.34.bb as it is more descriptive.     =20
> > > >=20
> > > > is it only runnable in qemu ? I thought we could use a read
> > > > board as well with IP address   =20
> > >=20
> > > It looks like by default the QEMU is used in this recipe.=20
> > >=20
> > > This recipe provides custom check-test-wrapper, which can log
> > > into remote board via ssh (when TOOLCHAIN_TEST_TARGET =3D "ssh").
> > >=20
> > > This looks a bit awkward for me, as the goal would be to run built
> > > tests on target (exact) HW without the need of SSH.
> > >=20
> > > It is also easier to debug the code with the real HW.   =20
> >=20
> > I'm a bit worried we're going around in circles with this. We did
> > have a different form of tests a while back but I was told those
> > didn't work well and they were replaced with the current setup which
> > worked with the driver in the glibc source code. =20
>=20
> I've looked into the glibc-testing.inc from SHA1:
> 0a42ae7f7ca8fcebe4630b701e50e2352f9b7c3b
>=20
> There glibc tests were built and copied on the target via NFS.
>=20
> > This was done around
> > the time we added support for the other toolchain test suites
> > (binutils+gcc). =20
>=20
> I'm not familiar with the "binutils+gcc" issue, which was solved in
> the past. Could you share any reference?
>=20
> > We ended up with options to use full system qemu or
> > user mode qemu emulation depending on the speed of the target (e.g.
> > with kvm or not). =20
>=20
> From what I see in the recipe - you either run user mode QEMU by
> default (at least when I do run it):
>=20
> NOTE: make PARALLELMFLAGS=3D-j 8 SHELL=3D/bin/bash -i
> QEMU_SYSROOT=3D/home/lukma/work/yocto/y2038/build/tmp/work/armv7at2hf-neo=
n-poky-linux-gnueabi/glibc-testsuite/2.34-r0/recipe-sysroot
> QEMU_OPTIONS=3Dqemu-arm -r 5.1.0  SSH_HOST=3Dlocalhost SSH_HOS T_USER=3Dr=
oot
> SSH_HOST_PORT=3D2222
> test-wrapper=3D/home/lukma/work/yocto/y2038/build/tmp/work/armv7at2hf-neo=
n-poky-linux-gnueabi/glibc-testsuite/2.34-r0/check-test-wrapper
> user check
>=20
> Or you log to the board via SSH (the 'ssh' mode).
>=20
> >=20
> > Has this patchset been run with all the tests in glibc or just a
> > subset? =20
>=20
> This patch set allows running all tests [*], or (preferably in my use
> case) only a time related ones. The latter is to validate Y2038 code,
> which testing has two issues:
>=20
> 1. It cannot be tested with QEMU user mode [1]. Instead "linux
> timespaces" were suggested, but it lacks support for CLOCK_REALTIME
> manipulation for those tests [2].
>=20
> 2. Testing with SSH is possible, but is not as robust as expected
> (i.e. imposes SSHD on the target board, and ETH connection).
>=20
> >=20
> > I'm always very nervous about having two ways to do similar things.
> > =20
>=20
> Technically, I just reuse the glibc-testsuite_2.34.bb to the point
> where tests are _only_ built. Then I pack those binaries and install
> on the target's rootfs to be run with ptest framework.
>=20
> Such approach has several advantages:
>=20
> - No need for SSH (which can hang, as you need sshfs in user space for
>   the setup)
>=20
> - Run on the real HW (and environment) with the same version of glibc
>   on the real target.
>=20
> - Sources and debugging symbols available on the target, so easier GDB
>   debugging.
>=20
> - Using ptest framework to execute tests
>=20
> - Time related tests are "self contained", so could be executed
> without built data.
>=20
> At least for Y2038 validation such approach seems more appealing.
>=20

Do you have any more feedback regarding this patch?

> >=20
> > Cheers,
> >=20
> > Richard
> >  =20
>=20
> Links:
> [1] -
> https://www.mail-archive.com/qemu-discuss@nongnu.org/msg05898.html
> [2] -
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2361284.html
>=20
> Note:
> [*] - some glibc tests rely on the built directory to provide correct
> data/environment for execution. Time related tests are (and should be)
> self contained, so those could be just executed as binaries.
>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> lukma@denx.de




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/ABhLr+kj1rhC4OfVzOsC3nK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmEniMUACgkQAR8vZIA0
zr0Z+wgAyxcYvF+aBSychxMTauYdZwwwqLSuTzJKf9PAGrDdaPKD6lkQZGHKCdSW
4h865ch4YUwb2cyKFW1LZYfL5HSNL070uYhqqi4vvvm4DiTooUJUv0bQTWX5DAn+
OcezgLvfjzi7+zA4UjI4stwLqPeiZM9q6907HafhakoiwyZeTiaGs9OSeQEAoYZH
Eagfg4yfipVeYKmUlEcHf6eDPI4T7FBNr8myWky4AO+tjBumN9yGRV2yTZiTZOTI
9+g95kDiPMPoE5uWvxCXHxBqPXt7e3zvwZhupnUmC5xxz7sJ5YH+TNEDNG+qTG/a
HdiP0CousuY94k74khoUpWhrgtIIUg==
=Dw9B
-----END PGP SIGNATURE-----

--Sig_/ABhLr+kj1rhC4OfVzOsC3nK--
