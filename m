Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com [68.232.133.150])
 by mx.groups.io with SMTP id smtpd.web11.18588.1592229319787211187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 06:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=NBg7Z7an;
 spf=pass (domain: bmw.de, ip: 68.232.133.150, mailfrom: prvs=428658508=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1592229320; x=1623765320;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Yz78w67KbAv6HaicE+FXVmbc39J9asDMStV352Lzpf8=;
  b=NBg7Z7anwZO6nE8I6i/ONhpzTNFm4af1HddXoST1/1eTMqV4UJ94koi3
   r+uo6jJ0tyC+jXEnMaA9KcakANKml9J0dDRsJGL+AfdZiYFTGf+ocU1oC
   7Chkn+2owvd6hifqQRrzokNWxl+hNNXLRrm6ez1BgG6deuNeLsdMdWf1A
   8=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 15 Jun 2020 15:55:17 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw1.muc with ESMTP/TLS;
 15 Jun 2020 15:55:16 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp) ([160.48.96.49])
 by esabb4.muc with ESMTP/TLS; 15 Jun 2020 15:55:12 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10m.europe.bmw.corp
 (160.48.96.49) with Microsoft SMTP Server (TLS;
 Mon, 15 Jun 2020 15:55:11 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Mon,
 15 Jun 2020 15:55:11 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <jlu@pengutronix.de>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] classes/buildhistory: capture package config
Thread-Topic: [OE-core][PATCH] classes/buildhistory: capture package config
Thread-Index: AQHWOX7XvTzy7i/qeUK+cOOLjswCgajZe/uAgAANeoCAABsxAA==
Date: Mon, 15 Jun 2020 13:55:11 +0000
Message-ID: <20200615135510.GJ108868@korppu>
References: <20200603081237.1959-1-jlu@pengutronix.de>
 <20200615112937.GF108868@korppu>
 <d14c6872c68aef73f26a0afdf90917d7b01665cc.camel@pengutronix.de>
In-Reply-To: <d14c6872c68aef73f26a0afdf90917d7b01665cc.camel@pengutronix.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DFE02B4275AE7B429105CCECDABC1134@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 15, 2020 at 02:17:51PM +0200, Jan L=FCbbe wrote:
> On Mon, 2020-06-15 at 11:29 +0000, Mikko.Rapeli@bmw.de wrote:
> > On Wed, Jun 03, 2020 at 10:12:37AM +0200, Jan Luebbe wrote:
> > > As the PACKAGECONFIG variable has a large influence on the
> > > resulting
> > > package sizes and dependencies, it's useful to capture it in the
> > > recipe-level buildhistory. This makes it straightforward to analyze
> > > the
> > > impact of PACKAGECONFIG changes on the resulting image size.
> >=20
> > Thanks, this is a good idea! I would print using full PACKAGECONFIG
> > name to avoid any confusion.
>=20
> Note that Richard has already merged this in master.
>=20
> I thought it was pretty clear when looking at if from the package
> context in the buildhistory. I wouldn't mind renaming it to
> PACKAGECONFIG, it there's agreement that it would be clearer.

Yes, to me it is also clear, but I find it better to be explicit and to avo=
id
duplication. Now someone needs to write to some manual that CONFIG in build=
history
recipe metadata means PACKAGECONFIG :) But I'm happy this in mastes as is t=
oo.

> > And this reminds me that DISTRO_FEATURES isn't logged into
> > buildhistory either afaik...
>=20
> Might be useful, but DISTRO_FEATURES is relatively high-level so
> there's usually not much details you can optimize.

Yes, but in most cases it directly influences PACKAGECONFIG in various reci=
pes.
At least I modify PACKAGECONFIG of many recipes, sometimes through DISTRO_F=
EATURES
and sometimes directly using bbappends. End results is not always clear and
I have to use 'bitbake -e' and manual inspection of installed files and fea=
tures
to verify results. Recording things to buildhistory would be nice.

Buildhistory is so usefull that I feel like it should contain all data pars=
ed by
bitbake...

Cheers,

-Mikko=
