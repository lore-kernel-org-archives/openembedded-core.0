Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.14543.1629896102284440934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 05:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=basYqZ6q;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629896102;
  x=1661432102;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZrqXtCkYyhKuuuan9kg7EB7WhRNyObwAYDorcXyMiTk=;
  b=basYqZ6qyZicd/1BEQtK7Xk3b9QoUZcrLxo0VVAD94dWmYgg9WbUcf2M
   4f8Kt3/KmWmElLTqgTYMJE8DHYrLF7pLO72W1QyBpZvcmvQNr2fgea44n
   JsGxJ0hvtx+IkjapqNnfvJsyXfH/74W/fwrZ5vyk7SHqbvMOqF+/4g7vp
   R6tO/5fJo6ScQfd85fWW2LB1PM+KN5zXdZVQbYQVdy8v2kSrDKu7IhlBm
   Ym9ZUkxgGGLV2ZD96urm2Nw+nlfVDrkyWnnUPE/QOhXxstw0/1MHVLzke
   Muk/eYslDrAL88g87dy7O2+zR42qpupmRmkDVmaqJa/7hm+g8vn101fYi
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Ross Burton
	<ross@burtonini.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] should "${D}${systemd_unitdir}/system" => "${D}${systemd_system_unitdir}"?
Thread-Topic: [OE-core] should "${D}${systemd_unitdir}/system" =>
 "${D}${systemd_system_unitdir}"?
Thread-Index: AQHXlAVuMNcMiMpzZEqJod3E/aMmSqt46EQAgAsrZICAACNEwA==
Date: Wed, 25 Aug 2021 12:54:58 +0000
Message-ID: <d555dff07d204fcda78e20c375424833@axis.com>
References: <74a0ce8a-7158-789-2e7a-b05d7937eed5@crashcourse.ca>
 <CAAnfSTunSXr2u5xjdj2-cVPFq0acHxn_SWE7hha8xXBNOYtx=g@mail.gmail.com>
 <37c93c88-37b0-27fd-8c25-b8edef979e73@crashcourse.ca>
In-Reply-To: <37c93c88-37b0-27fd-8c25-b8edef979e73@crashcourse.ca>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Robert P. J. Day
> Sent: den 25 augusti 2021 14:42
> To: Ross Burton <ross@burtonini.com>
> Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] should "${D}${systemd_unitdir}/system" =3D>
> "${D}${systemd_system_unitdir}"?
>=20
> On Wed, 18 Aug 2021, Ross Burton wrote:
>=20
> > No, yes.  systemd_system_unitdir is newer so it's used less.
> >
> > Ross
> >
> > On Wed, 18 Aug 2021 at 08:48, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
> > >
> > >
> > >   i've (so far) run across a small number of OE recipes that use the
> > > identifier "${D}${systemd_unitdir}/system", which appears(?) to be
> > > equivalent to "${D}${systemd_system_unitdir}". is there any potential
> > > functional difference, or should this be standardized?
>=20
>   please help me with basic REs ... i want to run a single perl
> command of the form
>=20
>   $ perl -pi -e 's|...|...|' $(all the relevant files)
>=20
> to change "${D}${systemd_unitdir}/system" ->
> "${D}${systemd_system_unitdir}"
>=20
> and then eyeball it afterwards to make sure it's sane, but i can't get
> the proper combination of quotes versus backslashes. i can generate
> the list of appropriate files with:
>=20
>   $ grep -rl '${systemd_unitdir}/system' *
>=20
> but it's the perl expression that is defeating me. help.
>=20
> rday

Just use sed, it's what it's there for:

sed -ri -e 's|\$\{systemd_unitdir\}/system|${systemd_system_unitdir}|g' **/=
*(.)

(the **/*(.) part only works if you use zsh, for bash you will have=20
to use find and xargs instead).

//Peter

