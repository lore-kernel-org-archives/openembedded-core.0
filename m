Received: from smtp1.goneo.de (smtp1.goneo.de [85.220.129.30])
 by mx.groups.io with SMTP id smtpd.web10.3078.1616898322090576089
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Mar 2021 19:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: lemonage.de, ip: 85.220.129.30, mailfrom: poeschel@lemonage.de)
Received: from lem-wkst-02.lemonage (hq.lemonage.de [87.138.178.34])
	by smtp1.goneo.de (Postfix) with ESMTPSA id EBBE2203C4EA;
	Sun, 28 Mar 2021 04:25:09 +0200 (CEST)
Date: Sun, 28 Mar 2021 04:25:02 +0200
From: "Lars Poeschel" <poeschel@lemonage.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lib/oe/utils: ignore stderr while checking compiler version
Message-ID: <20210328022502.q76akgphxyuf2o5l@lem-wkst-02.lemonage>
References: <20210327014118.2874876-1-poeschel@lemonage.de>
 <5d8f977d40c22d068dd8aa23e8d1f145752aebd7.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <5d8f977d40c22d068dd8aa23e8d1f145752aebd7.camel@linuxfoundation.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 27, 2021 at 01:54:11PM +0000, Richard Purdie wrote:
> On Sat, 2021-03-27 at 02:41 +0100, Lars Poeschel wrote:
> > From: Lars Poeschel <poeschel@lemonage.de>
> >=20
> > The functions for checking the C compiler version call the compiler w=
ith
> > the --version argument and capture stdout and stderr to extract the
> > version information from that. This does not work if something goes
> > wrong for the compiler and it then prints some warning to stderr. The
> > following regex will certainly fail in that case.
> > It is better to just concentrate on stdout where the real version is
> > printed to and ignore stderr. So we have a chance to get a version in=
fo
> > even if a waring or error happened.
> >=20
> > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> > ---
> > =A0meta/lib/oe/utils.py | 4 ++--
> > =A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> What kind of warning/error would a compiler generate that we should=A0
> ignore here? This seems a little odd...

Well, to be more specific: It seems to come from the shell, that then
invokes the compiler. Nevertheless it is stored in the output variable.
In my case it contains:
/nix/store/9ywr69qi622lrmx5nn88gk8jpmihy0dz-bash-4.4-p23/bin/sh: warning:=
 setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
/nix/store/9ywr69qi622lrmx5nn88gk8jpmihy0dz-bash-4.4-p23/bin/bash: warnin=
g: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
gcc (GCC) 9.3.0
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is N=
O
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E.

Regards,
Lars
