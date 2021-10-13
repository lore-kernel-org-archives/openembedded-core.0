Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08516C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 09:35:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.5851.1634117752138402208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 02:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=eXxWs/M3;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 608E683121;
	Wed, 13 Oct 2021 11:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1634117748;
	bh=YVKOpLs9glKxwYSBvIT/CAMsGULxS3gpTK/Rp4xb4P8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eXxWs/M3pxaAXir/VvfTm4H0GLW/mX82mEkaK2xhdC8pzYVrm+N3yVu22OXRF8M2k
	 YWYoKic4kn7oRCWtfasDfahAu4mIOrT/DxtDiY3xOfF/jHjHaXX9zgiAv1meSojI22
	 exO4OhBXNhxYyVVKXzRlEx/EYfzlDCLzyka61vppVmjwyvLbncCuCO8Notg0cZxFF5
	 7ZVOmwCeKxNoVzku5+TuG2OBiIIFC/O309g6x0OVifXVDnI7jd23JFZ0CLA8M/CKu+
	 rULbXdVFJY1zT66AyCnbbxKrVTeXk2bqwE2UB4J5A3xtJJ5uYEGlyaT7X8IA3IxW3o
	 I6TwaKKL1xF5g==
Date: Wed, 13 Oct 2021 11:35:42 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Nathan Rossi <nathan@nathanrossi.com>, Khem Raj <raj.khem@gmail.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, Patches and discussions
 about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RESEND 2/2] glibc: ptest: Add support for running glibc
 test suite with ptest
Message-ID: <20211013113542.1c518bc7@ktm>
In-Reply-To: 
 <e34be048ff6e037547bc7e0baf1c6d9f7d4e3e56.camel@linuxfoundation.org>
References: <20210930104357.3906-1-lukma@denx.de>
	<20210930104357.3906-2-lukma@denx.de>
	<20211013103522.3f15e078@ktm>
	<e34be048ff6e037547bc7e0baf1c6d9f7d4e3e56.camel@linuxfoundation.org>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/8+PS6yWiFQWPLpUfHud6nx."; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 09:35:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156894

--Sig_/8+PS6yWiFQWPLpUfHud6nx.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> On Wed, 2021-10-13 at 10:35 +0200, Lukasz Majewski wrote:
> > Dear Community,
> >  =20
> > > This patch introduces new recipe - namely 'glibc-tests', which
> > > builds and installs glibc test suite to OE/Yocto built image.
> > >=20
> > > It reuses code from already available 'glibc-testsuite' recipe,
> > > which is run with 'bitbake glibc-testsuite -c check' and uses qemu
> > > to execute remotely (via SSH) tests on some emulated machine.
> > >=20
> > > This recipe installs eligible tests on some rootfs image.
> > > Afterwards, either all of them or only time related subset, those
> > > tests can be executed on the real hardware, to facilitate
> > > validation of this platform with for example Y2038 problem
> > > compliance.
> > >=20
> > > By default all tests are executed, with 'ptest-runner
> > > glibc-tests'. To test only time related subset - one needs to
> > > call: cd /usr/lib/glibc-tests/ptest/; rm run-ptest; \
> > > ln -s run-ptest-time run-ptest; cd -; ptest-runner glibc-tests
> > >=20
> > > To facilitate debugging, source files are provided by default with
> > > the unstripped debugging symbols. Such approach would reduce the
> > > already complex recipe (as it inherits base glibc one), so there
> > > is no need to also install *-dbg and *-src packages.
> > >  =20
> >=20
> > Gentle ping on this patch set. =20
>=20
> We're in the middle of trying to make a release. This change needs to
> wait until after that. We're starting to work through that backlog
> but easier things will go first.
>

Thanks for the update.
=20
> FWIW I'm still very reticent to add in two code paths doing similar
> things so am not entirely sure we will be able to take this :(
>=20

As fair as I understand those recipes (glibc related) - there are the
same binaries built once for the target machine.

Then those binaries are either run with QEMU or bundled into separate
package and then installed and run on a _real_ HW.

To even keep things more clear - I can just provide v2 of this patch,
which will only test time related API (as I do know that those
can be executed as standalone binaries) and state that it is meant for
Y2038 compliance testing.

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

--Sig_/8+PS6yWiFQWPLpUfHud6nx.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmFmqG4ACgkQAR8vZIA0
zr0HkAf/ZA4zjNZVgVWD+Ccm+a2MR4n/tu6akegcQZqxHkUxToE559jqgaRSKGv4
Z+NxMJm6f2Oj7nqHnTWxHV7qA2NxIW+HQQfaXh+s6g0WUqDWYclBa/S3OhgDTgfd
QJva1MGCiQVO8AevwEcxzZywFFaZcRthLzjgvS5Q7KY9hkW+tAhxbwelsckTvuaT
I0cuKOM04NP+GulHCXZm0xnmYvNGsjOcnvDRfVOFzoflgod3SuIHM0MsH4RsbLjR
2AIi1cS6ouSxAcOB91qdq6XN48NeylIHvCYRWr66Vmzeqwb6IaZ54xHlOeENChuY
nmEsLceaxC0V3Tm1g4Sw4oNTYj43mw==
=HU8I
-----END PGP SIGNATURE-----

--Sig_/8+PS6yWiFQWPLpUfHud6nx.--

