Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web11.226.1610711217122450834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 03:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=ZZcGT3mk;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=642ee8af7=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1610711217; x=1642247217;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sP5zYqtC2rEyX6kAqKrzD3hAEk0dFvOBmUctKxiGI5A=;
  b=ZZcGT3mkOuKz7xkBIdfFzL2kbozvEu0XBoNnEGcCSBtvq8DscaeP+xUM
   zMeG37ciW7rPK0yb5dVhnVhurVrTZLzhuqUUuctLXt/VHScgOfmrs1sc8
   9YVSusbQ9SxFO1LFey7kGu9x6yyDZIKcXOl5Frq6oLKz8y9I3RewJ+/MR
   A=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 15 Jan 2021 12:46:54 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw3.muc with ESMTP/TLS;
 15 Jan 2021 12:46:53 +0100
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp) ([160.46.167.68])
 by esabb6.muc with ESMTP/TLS; 15 Jan 2021 12:46:53 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Fri, 15 Jan 2021 12:46:53 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Fri,
 15 Jan 2021 12:46:53 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][dunfell][gatesgarth][master] cairo: whitelist CVE-2013-0800
Thread-Topic: [OE-core] [PATCH][dunfell][gatesgarth][master] cairo: whitelist
 CVE-2013-0800
Thread-Index: AQHW6yvaqTzW5kk39U6bJnzyFfLYGqooeqOAgAAGfAA=
Date: Fri, 15 Jan 2021 11:46:53 +0000
Message-ID: <YAGArK89wZmPcFLQ@korppu>
References: <20210115104714.36449-1-mikko.rapeli@bmw.de>
 <502f246c4bf113fb8ae4c6c3db0bc5c1b8ee23d4.camel@linuxfoundation.org>
In-Reply-To: <502f246c4bf113fb8ae4c6c3db0bc5c1b8ee23d4.camel@linuxfoundation.org>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <91DF4A179C73514E81BDF704B9917426@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 11:23:39AM +0000, Richard Purdie wrote:
> On Fri, 2021-01-15 at 12:47 +0200, Mikko Rapeli wrote:
> > It affects only cairo embedded into Firefox.
> >=20
> > https://security-tracker.debian.org/tracker/CVE-2013-0800
> >=20
> > "The description is misleading: Firefox embeds a copy of Cairo, the int=
erdiff
> > shows the respective change at mozilla-esr17/gfx/cairo/cairo/src/cairo-=
image-surface.c
> > Apparently the forked copy has changed, the code isn't present in vanil=
la Cairo"
> >=20
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> > =A0meta/recipes-graphics/cairo/cairo_1.16.0.bb | 3 +++
> > =A01 file changed, 3 insertions(+)
> >=20
> > diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes=
-graphics/cairo/cairo_1.16.0.bb
> > index 8663dec404..29088ab0d6 100644
> > --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > @@ -29,6 +29,9 @@ SRC_URI =3D "http://cairographics.org/releases/cairo-=
${PV}.tar.xz \
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0file://CVE-2019-6462.patch \
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0"
> > =A0
> >=20
> >=20
> >=20
> > +# Affects only embedded cairo in Firefox
> > +CVE_CHECK_WHITELIST +=3D "CVE-2013-0800"
> > +
>=20
> That sounds a lot like we should send a CPE change upstream to classify
> it as firefox rather than cairo?

Ok, I sent an email to cpe_dictionary@nist.gov for removal of
"cpe:2.3:a:cairographics:cairo:-:*:*:*:*:*:*:*" from CVE-2013-0800 data cit=
ing
the Debian details.

I hope this was the correct way to do this.

Cheers,

-Mikko=
