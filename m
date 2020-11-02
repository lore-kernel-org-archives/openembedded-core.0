Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web11.30097.1604317719241411726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 03:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=dk5a/L6W;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=5683388e5=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1604317719; x=1635853719;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PFe1SWksQMfojY6AV1EU7UntBIF7PHFQ8+JJfTt+p68=;
  b=dk5a/L6WbNLKy3TCI3XwptfKcbzU/mVg/xj4gNp6RG7trkS8d5SFLJts
   TordoQZcafKSRSjGuobD+Ae7sEF3s4FAYvvxQHnfseNABwQI7wvPI+bSm
   5btrKb3KEGb3iyBpqXo6BAk0EFsZQsdxoA83s4mEb+RKSDa6TZUWP2BTY
   Y=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 02 Nov 2020 12:48:36 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw5.muc with ESMTP/TLS;
 02 Nov 2020 12:48:36 +0100
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp) ([160.48.96.48])
 by esabb1.muc with ESMTP/TLS; 02 Nov 2020 12:48:36 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10l.europe.bmw.corp
 (160.48.96.48) with Microsoft SMTP Server (TLS;
 Mon, 2 Nov 2020 12:48:36 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.007; Mon, 2
 Nov 2020 12:48:36 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>, <nicolas.dechesne@linaro.org>,
	<vkraleti@codeaurora.org>
Subject: Re: [OE-core] [PATCH 0/2] Example of how prebuilt binaries and locked sstate could work
Thread-Topic: [OE-core] [PATCH 0/2] Example of how prebuilt binaries and
 locked sstate could work
Thread-Index: AQHWsE4XUleYl3qrgUepjT/rwe4Stam0e/4AgAAYjoCAABZDAA==
Date: Mon, 2 Nov 2020 11:48:36 +0000
Message-ID: <20201102114834.GT1246345@korppu>
References: <20201101125302.350160-1-richard.purdie@linuxfoundation.org>
 <20201102090100.GS1246345@korppu>
 <f6eefc135edfb68788e1151d71035ef085fcfd6f.camel@linuxfoundation.org>
In-Reply-To: <f6eefc135edfb68788e1151d71035ef085fcfd6f.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7B91469E34A3404697C2A808993E0FA3@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2020 at 10:28:53AM +0000, Richard Purdie wrote:
> On Mon, 2020-11-02 at 09:01 +0000, Mikko.Rapeli@bmw.de wrote:
> > Hi,
> >=20
> > On Sun, Nov 01, 2020 at 12:53:00PM +0000, Richard Purdie wrote:
> > > At the Yocto Project Summit, there was some talk about how prebuilt
> > > binaries could
> > > be better supported. There was some discussion about how "locked
> > > sstate" could=20
> > > actually handle this quite neatly. I thought I'd have a look at
> > > that and came up=20
> > > with a few patches to illustrate what I was talking about.
> >=20
> > Interesting, thanks for bringing this up also on mailing list!
> >=20
> > How could one implement a variant where source recipe vs. pre-
> > compiled
> > binary build would be chosen based on access rights to a git tree in
> > SRC_URI?
>=20
> That gets hard since it would have to determine that at parse time. If
> you have to check that for each repository, its going to slow things
> down quite a bit. It would end up needing to be written into
> immediately expanded python which set a variable to switch between the
> include files.
>=20
> Definitely possible, particularly if you write out some kind of cache
> but its not going to be particularly neat.

Yep, so doing a check before bitbake build and then setting a local.conf
variable based on result is what would work then, and is what we do.

Another detail worth mentioning is the use binary packages generated from s=
ource
build which only get fetched and extracted in binary build.

Cheers,

-Mikko=
