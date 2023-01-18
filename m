Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EEAC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 09:58:43 +0000 (UTC)
Received: from dan.rpsys.net (dan.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.web10.11631.1674035918711373776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 01:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rpsys.net header.s=default header.b=CzWvRE19;
 spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1674035915; bh=WKaFXHlOXthmDmUAc4+4gDOCKgwmk6nTQxd7Cg6v29Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=CzWvRE19o6MeAnvQofuQntBblvtaZFYPlJuUm7b1vM2hv6L+yl9Kb8O/QnEZzMa+O
	 sDcta491Ht/U3UZXA7iRqIHvG5Ihxt4s4V6gXL1otSiX8emRQ4tFF8v90lyQQ6nLhc
	 ZZhwNat+WvaYgXDM5Whfwb2gq6LfT4IaO0sbetaJKL2dgSS9LDUGkWmevwd9rUP2JD
	 w62jqJUopXcS0bafSpL2mVeA3cR0kKLa77hevAR4BkJVOCteiAniWt089mdAi570dE
	 Zz8bS89V2/07NZt14SbHgt3Tub2lR7OQmcvAH6U010/YIVuglNQhY5REsxVslEeAOx
	 9YfxW8j/ZBEcQ==
Received: from [192.168.1.7] ([192.168.1.7])
	(authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPSA id 30I9wYTX598517
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 09:58:35 GMT
Message-ID: <5c5453881d07c9ecc2a01efaa5e23e2ca9ea3131.camel@rpsys.net>
Subject: Re: [OE-core] [PATCH 3/3] binutils: Delete gdb and supporting
 sources
From: Richard Purdie <rpurdie@rpsys.net>
To: Khem Raj <raj.khem@gmail.com>, Alejandro Hernandez <aehs29@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2023 09:58:34 +0000
In-Reply-To: <CAMKF1spHg5pOdF7TuS3keohjYUiQVdK6OJ6H6KgsS9ua0Twhqg@mail.gmail.com>
References: <20230115184358.2276696-1-raj.khem@gmail.com>
	 <20230115184358.2276696-3-raj.khem@gmail.com>
	 <CAHMutraaE2nSJWgVxFLDQXsCpyCmX941CYvdbtvUgL0fm7X6MQ@mail.gmail.com>
	 <CAMKF1spHg5pOdF7TuS3keohjYUiQVdK6OJ6H6KgsS9ua0Twhqg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at dan
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 09:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176082

On Wed, 2023-01-18 at 01:13 -0800, Khem Raj wrote:
> On Wed, Jan 18, 2023 at 12:47 AM Alejandro Hernandez <aehs29@gmail.com> w=
rote:
> >=20
> > Hey Khem,
> >=20
> > On Sun, 15 Jan 2023 at 11:44, Khem Raj <raj.khem@gmail.com> wrote:
> > >=20
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-devtools/binutils/binutils.inc | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >=20
> > > diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recip=
es-devtools/binutils/binutils.inc
> > > index 98acf0a222..2b38aeb62d 100644
> > > --- a/meta/recipes-devtools/binutils/binutils.inc
> > > +++ b/meta/recipes-devtools/binutils/binutils.inc
> > > @@ -140,6 +140,16 @@ export CC_FOR_BUILD =3D "LD_LIBRARY_PATH=3D ${BU=
ILD_CC}"
> > >=20
> > >  MULTIARCH :=3D "${@bb.utils.contains("DISTRO_FEATURES", "multiarch",=
 "yes", "no", d)}"
> > >  do_configure[vardeps] +=3D "MULTIARCH"
> > > +
> > > +addtask do_prepare_sources after do_patch before do_configure
> > > +
> > > +# Remove gdb and supporting source directories, they are detected by
> > > +# configure otherwise and demands additional gdb deps e.g. gmp, mpc,=
 mpfr
> > > +do_prepare_sources () {
> > > +       rm -rf ${S}/gdb ${S}/gdbserver ${S}/gdbsupport ${S}/gnulib \
> > > +       ${S}/libbacktrace ${S}/libdecnumber ${S}/readline ${S}/sim
> > > +}
> > > +
> >=20
> >=20
> > This seems to have been fixed upstream, I wonder if its better to backp=
ort that patch to 2.40 so it aligns properly with the --disable-gdb flag we=
 are passing:
> > https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D5fb=
0e308577143ceb313fde5538dc9ecb038f29f
> >=20
>=20
> Thanks yes its better to backport it, I will add it to v2.

I'm happier with that as I was worried how the other approach was going
to interact with the archiver and other code.

Thanks,

Richard

