Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com [68.232.139.62])
 by mx.groups.io with SMTP id smtpd.web10.6856.1586328164482044111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 23:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=bSd9BMK2;
 spf=pass (domain: bmw.de, ip: 68.232.139.62, mailfrom: prvs=360c08544=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1586328164; x=1617864164;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=C3TfuMuv3TqC7N3Rp4W0p3J+kpQ8/Gje5ARgxLiy9Rs=;
  b=bSd9BMK2lbBx0AzqgjqUy7Oo7qsnMX4F26JPipGdOpSXCC4VzjoWPLvY
   cXSDXME1APdl/Wx2u/wmNBuYi5rGo7TZjrHG1j15QvchUziBJexYpTNQu
   j2g1HXJmwa1EDZYigmupEEEjkh4eX8IunQwZVgYpWofwt7QreDlaN+kTN
   c=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 08 Apr 2020 08:42:35 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw5.muc with ESMTP/TLS;
 08 Apr 2020 08:42:34 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp) ([160.48.96.48])
 by esabb3.muc with ESMTP/TLS; 08 Apr 2020 08:42:35 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10l.europe.bmw.corp
 (160.48.96.48) with Microsoft SMTP Server (TLS;
 Wed, 8 Apr 2020 08:42:34 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005; Wed, 8
 Apr 2020 08:42:34 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <ankur.tyagi85@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Including vendor's pre-built binary in image
Thread-Topic: [OE-core] Including vendor's pre-built binary in image
Thread-Index: AQHWDUhxt9j9gr4UsEG6t/GLw0bBzahupauA
Date: Wed, 8 Apr 2020 06:42:34 +0000
Message-ID: <20200408064233.GE104502@korppu>
References: <CADySD0GO0510UjoSWx=sK9oiyCFCJanB7-C7Ph6y62BtOmfNXA@mail.gmail.com>
In-Reply-To: <CADySD0GO0510UjoSWx=sK9oiyCFCJanB7-C7Ph6y62BtOmfNXA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D3551C32EC95C1438C085A2F46FC63F7@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 08, 2020 at 01:52:47PM +1200, Ankur Tyagi wrote:
> Hi,
>=20
> I am sure this is not being discussed for first time and I tried
> all suggested solution in previous emails but none worked hence I am ask=
ing
> again.
>=20
> Trying to include a pre-built binary from vendor in my image but getting
> following QA error:
>=20
> ERROR: my-recipe-1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool contai=
ned
> in package my-recipe requires libstdc++.so.6(CXXABI_1.3), but no provide=
rs
> found in RDEPENDS_my-recipe ? [file-rdeps]
> ERROR: my-recipe -1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool
> contained in package my-recipe requires libstdc++.so.6(GLIBCXX_3.4), but=
 no
> providers found in RDEPENDS_my-recipe ? [file-rdeps]
> ERROR: my-recipe -1.0-r0 do_package_qa: QA run found fatal errors. Pleas=
e
> consider fixing them.
> ERROR: my-recipe -1.0-r0 do_package_qa: Function failed: do_package_qa
>=20
> I have tried following in my-recipe_1.0.bb but error still persists
> RDEPENDS_${PN} +=3D "libstdc++6"

This shared library comes from gcc-runtime recipe and libstdc++ binary pac=
kage
(before name manglings). buildhistory helps with cases like this.

I would write recipes for all binaries and make sure all QA checks are pas=
sing
with them. Best way is to get vendors to compile with your SDK.

Cheers,

-Mikko

>=20
> How can I fix this?
>=20
> thanks
> Ankur

>=20
