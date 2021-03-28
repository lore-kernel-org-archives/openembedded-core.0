Received: from smtp2-2.goneo.de (smtp2-2.goneo.de [85.220.129.34])
 by mx.groups.io with SMTP id smtpd.web09.14380.1616973440345863912
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Mar 2021 16:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: lemonage.de, ip: 85.220.129.34, mailfrom: poeschel@lemonage.de)
Received: from lem-wkst-02.lemonage (hq.lemonage.de [87.138.178.34])
	by smtp2.goneo.de (Postfix) with ESMTPSA id A7F53203F4B4;
	Mon, 29 Mar 2021 01:17:17 +0200 (CEST)
Date: Mon, 29 Mar 2021 01:17:12 +0200
From: "Lars Poeschel" <poeschel@lemonage.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lib/oe/utils: ignore stderr while checking compiler version
Message-ID: <20210328231712.muk4entctj23sb6b@lem-wkst-02.lemonage>
References: <20210327014118.2874876-1-poeschel@lemonage.de>
 <5d8f977d40c22d068dd8aa23e8d1f145752aebd7.camel@linuxfoundation.org>
 <20210328022502.q76akgphxyuf2o5l@lem-wkst-02.lemonage>
 <20210328043504.GA14886@denix.org>
 <64353810c852fb6e27d8b088f694b9aa9dc987c4.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <64353810c852fb6e27d8b088f694b9aa9dc987c4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 28, 2021 at 09:31:17AM +0100, Richard Purdie wrote:
> On Sun, 2021-03-28 at 00:35 -0400, Denys Dmytriyenko wrote:
> > On Sun, Mar 28, 2021 at 04:25:02AM +0200, Lars Poeschel wrote:
> > > On Sat, Mar 27, 2021 at 01:54:11PM +0000, Richard Purdie wrote:
> > > > On Sat, 2021-03-27 at 02:41 +0100, Lars Poeschel wrote:
> > > > > From: Lars Poeschel <poeschel@lemonage.de>
> > > > >=20
> > > > > The functions for checking the C compiler version call the comp=
iler with
> > > > > the --version argument and capture stdout and stderr to extract=
 the
> > > > > version information from that. This does not work if something =
goes
> > > > > wrong for the compiler and it then prints some warning to stder=
r. The
> > > > > following regex will certainly fail in that case.
> > > > > It is better to just concentrate on stdout where the real versi=
on is
> > > > > printed to and ignore stderr. So we have a chance to get a vers=
ion info
> > > > > even if a waring or error happened.
> > > > >=20
> > > > > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> > > > > ---
> > > > > =A0meta/lib/oe/utils.py | 4 ++--
> > > > > =A01 file changed, 2 insertions(+), 2 deletions(-)
> > > >=20
> > > > What kind of warning/error would a compiler generate that we shou=
ld=A0
> > > > ignore here? This seems a little odd...
> > >=20
> > > Well, to be more specific: It seems to come from the shell, that th=
en
> > > invokes the compiler. Nevertheless it is stored in the output varia=
ble.
> > > In my case it contains:
> > > /nix/store/9ywr69qi622lrmx5nn88gk8jpmihy0dz-bash-4.4-p23/bin/sh: wa=
rning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
> > > /nix/store/9ywr69qi622lrmx5nn88gk8jpmihy0dz-bash-4.4-p23/bin/bash: =
warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
> >=20
> > It is common to prefix command invocations with LC_ALL=3DC to avoid s=
uch issues.
> > For example:
> >=20
> > https://git.openembedded.org/openembedded-core/tree/scripts/lib/recip=
etool/append.py#n151
> > > helptext =3D subprocess.check_output('LC_ALL=3DC %s --help' % comma=
nd, shell=3DTrue).decode('utf-8')
>=20
> We have:
>=20
> meta/conf/bitbake.conf:export LC_ALL =3D "en_US.UTF-8"
>=20
> so if this is showing warnings, the rest of the build isn't going to be=
=A0
> great either.

Well this may depend on what your expectations to a great build are.
With the small patch I proposed it at least builds me images that I can
run on my target. Does that qualify ? Would that justify the patch ?
I know building with nix is not a first class, maybe not even a second cl=
ass
supported platform. And I know about the recommended locale.
I am willing to work out another solution, if you can point me in the
right direction.

> Why en_US.UTF-8? We need a utf-8 locale for python and a C utf-8 locale=
=A0
> isn't standard. en_US is as close to standard across distros as we can =
get.

Thanks for the explanation.

> Adding LC_ALL=3DC everywhere isn't the right solution, we're certainly =
not=A0
> prefxixing every shell command execution with that.

Besides that: I tried it and it does not work. It only gets me rid of the
second of the two warnings.

Regards,
Lars
