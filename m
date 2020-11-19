Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web11.6625.1605775616954185463
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 00:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=CVm/95Mi;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=585f5ef5f=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1605775616; x=1637311616;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eBvTnRugjvLy5PG8ojvUm7L0rTKy4vR4TL852y6K17E=;
  b=CVm/95Mis4pkJM9b1ir3+zj/+qI8I82v7nJcBdgKz4yfZK6uxFkqcGfi
   mKlxpIxAXIn1tXmiZw3YjHM2uqWAGtwREFmiwgg/Vaw3yeen+4URIQROl
   mo0conUbN0A+R6T967osnSwiRIM/r5W+a70eOZ6M6hGUHtFrOft5USb5x
   8=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 19 Nov 2020 09:46:54 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw3.muc with ESMTP/TLS;
 19 Nov 2020 09:46:54 +0100
Received: from smucm33j.bmwgroup.net (HELO smucm33j.europe.bmw.corp) ([160.46.167.66])
 by esabb1.muc with ESMTP/TLS; 19 Nov 2020 09:46:53 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33j.europe.bmw.corp
 (160.46.167.66) with Microsoft SMTP Server (TLS;
 Thu, 19 Nov 2020 09:46:53 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.007; Thu,
 19 Nov 2020 09:46:53 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <steve@sakoman.com>
CC: <anuj.mittal@intel.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] cups: whitelist CVE-2018-6553
Thread-Topic: [OE-core] cups: whitelist CVE-2018-6553
Thread-Index: AQHWvb8v3lGpikj54Eq19XIILtiIgKnOgKYAgAAEYACAAI/FAA==
Date: Thu, 19 Nov 2020 08:46:53 +0000
Message-ID: <20201119084652.GW1246345@korppu>
References: <20201118152522.20849-1-steve@sakoman.com>
 <8df909f90903613c2aa74e2b43dec9d747b5330a.camel@intel.com>
 <CAOSpxdZWBUh3UCDLoAgOgZvpgCBD6SGvRETcgjx2HHfKUuh_NQ@mail.gmail.com>
In-Reply-To: <CAOSpxdZWBUh3UCDLoAgOgZvpgCBD6SGvRETcgjx2HHfKUuh_NQ@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3ED40AEFDCDAA7448581F84092C44319@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 02:12:18PM -1000, Steve Sakoman wrote:
> On Wed, Nov 18, 2020 at 1:56 PM Mittal, Anuj <anuj.mittal@intel.com> wrot=
e:
> >
> > On Wed, 2020-11-18 at 05:25 -1000, Steve Sakoman wrote:
> > > This an Ububtu specific issue:
> > >
> > > The CUPS AppArmor profile incorrectly confined the dnssd backend
> > > due to use of hard links. A local attacker could possibly use this
> > > issue to escape confinement. This flaw affects versions prior to
> > > 2.2.7-1ubuntu2.1 in Ubuntu 18.04 LTS, prior to 2.2.4-7ubuntu3.1
> > > in Ubuntu 17.10, prior to 2.1.3-4ubuntu0.5 in Ubuntu 16.04 LTS,
> > >  and prior to 1.7.2-0ubuntu1.10 in Ubuntu 14.04 LTS
> >
> > It doesn't affect the default configuration but someone in theory could
> > have extended the recipe to have AppArmor support and then it might be
> > vulnerable?
>=20
> I suppose if someone implemented AppArmor support and botched it in the
> same way as it was in Ubuntu, then yes they would have the same vulnerabi=
lity!
>=20
> > Since this CVE is sort of distro specific and not package specific,
> > should this be part of recipe or the poky distro meta data?
>=20
> I'm open for suggestions.  There are many ways people can take our
> standard recipes and implement a horribly insecure image. IMHO
> this is one of the more unlikely paths that someone would take :-)
>=20
> But if the community feels this is best in the poky distro metadata I hav=
e no
> issue with that.

I'd keep this CVE whitelist in cups recipe. CVEs details apply to an unmodi=
fied
poky version of the recipe. bbappends and other layers can do really weird =
things
including removing patches and downgrading SW versions which would also res=
ult
in bad CVE data overall but we can't possibly detect those cases inside the
recipe in poky or even distro configuration. Only way to be sure, is to rev=
iew all
bbappends to recipes from all layers in product configurations. Devil is in
the details.

Cheers,

-Mikko=
