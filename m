Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3914.1616906108565199018
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Mar 2021 21:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A339440BE8;
	Sun, 28 Mar 2021 04:35:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yidBe9zB0WpR; Sun, 28 Mar 2021 04:35:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 792B040AB7;
	Sun, 28 Mar 2021 04:35:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CCCEF174567; Sun, 28 Mar 2021 00:35:04 -0400 (EDT)
Date: Sun, 28 Mar 2021 00:35:04 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lib/oe/utils: ignore stderr while checking compiler version
Message-ID: <20210328043504.GA14886@denix.org>
References: <20210327014118.2874876-1-poeschel@lemonage.de>
 <5d8f977d40c22d068dd8aa23e8d1f145752aebd7.camel@linuxfoundation.org>
 <20210328022502.q76akgphxyuf2o5l@lem-wkst-02.lemonage>
MIME-Version: 1.0
In-Reply-To: <20210328022502.q76akgphxyuf2o5l@lem-wkst-02.lemonage>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 28, 2021 at 04:25:02AM +0200, Lars Poeschel wrote:
> On Sat, Mar 27, 2021 at 01:54:11PM +0000, Richard Purdie wrote:
> > On Sat, 2021-03-27 at 02:41 +0100, Lars Poeschel wrote:
> > > From: Lars Poeschel <poeschel@lemonage.de>
> > >=20
> > > The functions for checking the C compiler version call the compiler=
 with
> > > the --version argument and capture stdout and stderr to extract the
> > > version information from that. This does not work if something goes
> > > wrong for the compiler and it then prints some warning to stderr. T=
he
> > > following regex will certainly fail in that case.
> > > It is better to just concentrate on stdout where the real version i=
s
> > > printed to and ignore stderr. So we have a chance to get a version =
info
> > > even if a waring or error happened.
> > >=20
> > > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> > > ---
> > > =A0meta/lib/oe/utils.py | 4 ++--
> > > =A01 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > What kind of warning/error would a compiler generate that we should=A0
> > ignore here? This seems a little odd...
>=20
> Well, to be more specific: It seems to come from the shell, that then
> invokes the compiler. Nevertheless it is stored in the output variable.
> In my case it contains:
> /nix/store/9ywr69qi622lrmx5nn88gk8jpmihy0dz-bash-4.4-p23/bin/sh: warnin=
g: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
> /nix/store/9ywr69qi622lrmx5nn88gk8jpmihy0dz-bash-4.4-p23/bin/bash: warn=
ing: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)

It is common to prefix command invocations with LC_ALL=3DC to avoid such =
issues.
For example:

https://git.openembedded.org/openembedded-core/tree/scripts/lib/recipetoo=
l/append.py#n151
| helptext =3D subprocess.check_output('LC_ALL=3DC %s --help' % command, =
shell=3DTrue).decode('utf-8')


> gcc (GCC) 9.3.0
> Copyright (C) 2019 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is=
 NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURP=
OSE.

--=20
Denys
