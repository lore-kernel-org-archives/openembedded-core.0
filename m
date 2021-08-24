Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.36714.1629794543257166307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 01:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=TWg5T0d9;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 62AB280612;
	Tue, 24 Aug 2021 10:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1629794540;
	bh=JrypeEHSsKqx3EvNIig/IDQpfzjbglJJTH51UFR//mo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TWg5T0d9Tcc+2MYuEh2ngEzYiYrbcA0t0b0Jd7+RDgY/MVbq3o1yV8b8HwtjNgoTr
	 JRRQumg9pa2oXNEjI3x86K0M+UBpPd9SnWsGgwwRNmGD5MLSH4r4IEK8IsWMWviAVI
	 BEF3s/snrFMV7n5x8MRdsEeMlseqLwsUF6harPTZzIHGctoE9QXEtNQ6e2ASGQuBiS
	 mJFxHdGeZMe4JZRDIeGSGVymI1x6qaqJ7LHZZstNoenmnCelgqhjP7BVYi0lBDjZnd
	 XWMlV9nDolXCXiaQ5AZveOEWjLf15iZcL6alawDsr+/UVV21jBEf0elDRQfzx7DPSM
	 Rd9+W9AtP+66A==
Date: Tue, 24 Aug 2021 10:42:13 +0200
From: "?ukasz Majewski" <lukma@denx.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the oe-core
 layer  <openembedded-core@lists.openembedded.org>, Adhemerval Zanella
 <adhemerval.zanella@linaro.org>
Subject: Re: [OE-core] [PATCH 2/2] glibc: ptest: Add support for running glibc test suite with ptest
Message-ID: <20210824104213.6be82b74@ktm>
In-Reply-To: <34041d492af033ff34a273e07057ea9c767cabf7.camel@linuxfoundation.org>
References: <20210823150853.2817-1-lukma@denx.de>
	<20210823150853.2817-2-lukma@denx.de>
	<ada9987d-399b-7a73-2aa5-c09dcca41fb3@gmail.com>
	<20210823202414.731c6749@ktm>
	<CAMKF1srLFY_R4KX3gG3hZMhZNtjSN8D4mEp0Wwr78Se9RE_20g@mail.gmail.com>
	<20210823220926.37d87121@ktm>
	<CAMKF1sqKH=RiOn-WVp_=ZQmLnSJ43VUUfKyv+E1KR9bCn01j3Q@mail.gmail.com>
	<20210824093601.768c0c05@ktm>
	<34041d492af033ff34a273e07057ea9c767cabf7.camel@linuxfoundation.org>
Organization: denx.de
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-Groupsio-MsgNum: 155212
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/NHBsXGN+hvkUL9Y4B_KkxoD"; protocol="application/pgp-signature"

--Sig_/NHBsXGN+hvkUL9Y4B_KkxoD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> On Tue, 2021-08-24 at 09:36 +0200, ?ukasz Majewski wrote:
> > Hi Khem,
> >  =20
> > > On Mon, Aug 23, 2021 at 1:09 PM Lukasz Majewski <lukma@denx.de>
> > > wrote: =20
> > > >=20
> > > > On Mon, 23 Aug 2021 12:52:44 -0700
> > > > Khem Raj <raj.khem@gmail.com> wrote:
> > > >   =20
> > > > > On Mon, Aug 23, 2021 at 11:24 AM Lukasz Majewski
> > > > > <lukma@denx.de> wrote:
> > > > >   =20
> > > > > > Hi Khem,
> > > > > >   =20
> > > > > > > On 8/23/21 8:08 AM, ?ukasz Majewski wrote:   =20
> > > > > > > > This patch introduces new recipe - namely 'glibc-tests',
> > > > > > > > which builds and installs glibc test suite to OE/Yocto
> > > > > > > > built image.
> > > > > > > >=20
> > > > > > > > It reuses code from already available 'glibc-testsuite'
> > > > > > > > recipe, which is run with 'bitbake glibc-testsuite -c
> > > > > > > > check' and uses qemu to execute remotely (via SSH)
> > > > > > > > tests on some emulated machine.
> > > > > > > >=20
> > > > > > > > This recipe installs eligible tests on some rootfs
> > > > > > > > image. Afterwards, either all of them or only time
> > > > > > > > related subset, those tests can be executed on the real
> > > > > > > > hardware, to facilitate validation of this platform
> > > > > > > > with for example Y2038 problem compliance.
> > > > > > > >=20
> > > > > > > > By default all tests are executed, with 'ptest-runner
> > > > > > > > glibc-tests'. To test only time related subset - one
> > > > > > > > needs to call: cd /usr/lib/glibc-tests/ptest/; rm
> > > > > > > > run-ptest; \ ln -s run-ptest-time run-ptest; cd -;
> > > > > > > > ptest-runner glibc-tests
> > > > > > > >=20
> > > > > > > > To facilitate debugging, source files are provided by
> > > > > > > > default with the unstripped debugging symbols. Such
> > > > > > > > approach would reduce the already complex recipe (as it
> > > > > > > > inherits base glibc one), so there is no need to also
> > > > > > > > install *-dbg and *-src packages.   =20
> > > > > > >=20
> > > > > > >=20
> > > > > > > does it have to be a separate recipe I wonder if we can
> > > > > > > have it built as part of glibc itself controlled via
> > > > > > > ptest knob   =20
> > > > > >=20
> > > > > > I've followed the glibc-testsuite recipe to provide tests
> > > > > > for ptest. Test creation is similar to it, but doesn't
> > > > > > require QEMU run (tests are executed on the HW).
> > > > > >=20
> > > > > > Another rationale was to have some kind of "features"
> > > > > > separation in different file (liked glibc-mtrace), which is
> > > > > > easier to maintain and review.
> > > > > >=20
> > > > > > Last but not least - separate recipe (and built binaries)
> > > > > > allow some kind of magic with selection of used test
> > > > > > programs (this may be useful if one would like to have
> > > > > > different sets of tests in different packages)   =20
> > > > >=20
> > > > > That=E2=80=99s seems ok I think the names are quite confusing now=
 not
> > > > > that it was not so much better before but now we have
> > > > > glibc-tests and glibc-testsuites which do same things but in
> > > > > very different way maybe glibc-testsuite should be renamed to
> > > > > something like glibc-tests-crosd or some such   =20
> > > >=20
> > > > I think that glibc-testsuite_2.34.bb shall be renamed to
> > > > glibc-tests-qemu_2.34.bb as it is more descriptive.   =20
> > >=20
> > > is it only runnable in qemu ? I thought we could use a read board
> > > as well with IP address =20
> >=20
> > It looks like by default the QEMU is used in this recipe.=20
> >=20
> > This recipe provides custom check-test-wrapper, which can log
> > into remote board via ssh (when TOOLCHAIN_TEST_TARGET =3D "ssh").
> >=20
> > This looks a bit awkward for me, as the goal would be to run built
> > tests on target (exact) HW without the need of SSH.
> >=20
> > It is also easier to debug the code with the real HW. =20
>=20
> I'm a bit worried we're going around in circles with this. We did
> have a different form of tests a while back but I was told those
> didn't work well and they were replaced with the current setup which
> worked with the driver in the glibc source code.

I've looked into the glibc-testing.inc from SHA1:
0a42ae7f7ca8fcebe4630b701e50e2352f9b7c3b

There glibc tests were built and copied on the target via NFS.

> This was done around
> the time we added support for the other toolchain test suites
> (binutils+gcc).

I'm not familiar with the "binutils+gcc" issue, which was solved in the
past. Could you share any reference?

> We ended up with options to use full system qemu or
> user mode qemu emulation depending on the speed of the target (e.g.
> with kvm or not).

=46rom what I see in the recipe - you either run user mode QEMU by
default (at least when I do run it):

NOTE: make PARALLELMFLAGS=3D-j 8 SHELL=3D/bin/bash -i
QEMU_SYSROOT=3D/home/lukma/work/yocto/y2038/build/tmp/work/armv7at2hf-neon-=
poky-linux-gnueabi/glibc-testsuite/2.34-r0/recipe-sysroot
QEMU_OPTIONS=3Dqemu-arm -r 5.1.0  SSH_HOST=3Dlocalhost SSH_HOS T_USER=3Droot
SSH_HOST_PORT=3D2222
test-wrapper=3D/home/lukma/work/yocto/y2038/build/tmp/work/armv7at2hf-neon-=
poky-linux-gnueabi/glibc-testsuite/2.34-r0/check-test-wrapper
user check

Or you log to the board via SSH (the 'ssh' mode).

>=20
> Has this patchset been run with all the tests in glibc or just a
> subset?

This patch set allows running all tests [*], or (preferably in my use
case) only a time related ones. The latter is to validate Y2038 code,
which testing has two issues:

1. It cannot be tested with QEMU user mode [1]. Instead "linux
timespaces" were suggested, but it lacks support for CLOCK_REALTIME
manipulation for those tests [2].

2. Testing with SSH is possible, but is not as robust as expected (i.e.
imposes SSHD on the target board, and ETH connection).

>=20
> I'm always very nervous about having two ways to do similar things.

Technically, I just reuse the glibc-testsuite_2.34.bb to the point
where tests are _only_ built. Then I pack those binaries and install on
the target's rootfs to be run with ptest framework.

Such approach has several advantages:

- No need for SSH (which can hang, as you need sshfs in user space for
  the setup)

- Run on the real HW (and environment) with the same version of glibc
  on the real target.

- Sources and debugging symbols available on the target, so easier GDB
  debugging.

- Using ptest framework to execute tests

- Time related tests are "self contained", so could be executed without
  built data.

At least for Y2038 validation such approach seems more appealing.

>=20
> Cheers,
>=20
> Richard
>=20

Links:
[1] - https://www.mail-archive.com/qemu-discuss@nongnu.org/msg05898.html
[2] -
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2361284.html

Note:
[*] - some glibc tests rely on the built directory to provide correct
data/environment for execution. Time related tests are (and should be)
self contained, so those could be just executed as binaries.

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/NHBsXGN+hvkUL9Y4B_KkxoD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmEksOUACgkQAR8vZIA0
zr0Y9Qf+KojlPL+5vagD0gzS9ybmTrqXAvAHtX0qyxWulYQKpgE4kySP0BCTuUe0
MHfvZOVYXfZufyuthSv7nbXl/i5p+MuiRssz8Z2yVaGV7G/HiL6IG+rD+7SpWRXG
uobDwDpa4fsqTlOCwtx9J0LloKiBpc5UH4IqdN9TCB3TYJYTGe6Frpsyp0TuRnkx
EdFiWoTrw4RayNd6wDVDxIh2cU1Tyh6nLECNC1KguGdD5S9XiWKqiR0zNXjJ8som
Jz/dl686qpDwcoySXHZ2+2ZHF/dUrrKk4Wh/sstfi7BwI0fO43rJef+VFrEAObLS
0CdpEbhUyJ1gJYCQt7voY56A6jEdIQ==
=tzrT
-----END PGP SIGNATURE-----

--Sig_/NHBsXGN+hvkUL9Y4B_KkxoD--
