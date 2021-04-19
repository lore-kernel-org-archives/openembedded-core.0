Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web09.5260.1618814404075916131
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 23:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=bWGLmEan;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=736b5af68=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1618814404; x=1650350404;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bHX0/ITSD5VHkBfQIaNb3eZiE8dGQfqMNa8v+8568r4=;
  b=bWGLmEanyKCwmEOWAoHu005eUAePJI10Va9uESYh7IJ9LLDf6OlR0f99
   WSQyj6UoWPA3777w+DIOr1AxtLAZdZ4nIyuAay/xxMGrzm/G8Ra6SSkZr
   zwsjpI+kGOdGkbXbcGgGVtPJo3AdmUreVfGvLVy9xW4GjmhPPDOQkPHt3
   k=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 19 Apr 2021 08:40:01 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw4.muc with ESMTP/TLS;
 19 Apr 2021 08:40:01 +0200
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp) ([160.46.167.68])
 by esabb5.muc with ESMTP/TLS; 19 Apr 2021 08:40:01 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Mon, 19 Apr 2021 08:40:00 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.012; Mon,
 19 Apr 2021 08:40:00 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <raj.khem@gmail.com>
CC: <openembedded-core@lists.openembedded.org>, <andrei@gherzan.ro>
Subject: Re: [OE-core] [PATCH] ca-certificates: Fix openssl runtime cert dependencies
Thread-Topic: [OE-core] [PATCH] ca-certificates: Fix openssl runtime cert
 dependencies
Thread-Index: AQHXNKWoy+Ro9nE9uEGNTdqQYt0HWKq7QtCA
Date: Mon, 19 Apr 2021 06:40:00 +0000
Message-ID: <YH0lv7n57pN7rsN7@korppu>
References: <20210418225310.1624909-1-raj.khem@gmail.com>
In-Reply-To: <20210418225310.1624909-1-raj.khem@gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0B59595548D2324E9C73CC3BF3A42A43@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Apr 18, 2021 at 03:53:10PM -0700, Khem Raj wrote:
> With commit dc778c70449ee5401b5a24ad18b22b88338c47c5, dependency was
> moved to openssl-bin which in itself was a fine change, but dropping
> dependency on openssl too should have been kept along, dropping this
> meant that openssl binary wont be able to validate secure connections as
> the CApath files wont be installed, which infact are required for
> openssl bins to work, following call e.g. fails
>=20
> $ openssl s_client -connect google.com:443

This sounds a lot like a ptest or selftest? Maybe using
some yocto server instead of google though.

Cheers,

-Mikko

> ....
> New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
> Server public key is 256 bit
> Secure Renegotiation IS NOT supported
> Compression: NONE
> Expansion: NONE
> No ALPN negotiated
> Early data was not sent
> Verify return code: 20 (unable to get local issuer certificate)
> ....
>=20
> The local issuer certs are not found in default location
> /usr/lib/ssh-1.1/certs, this dir and its content is installed by openssl=
 package
> therefore re-add the dependency on openssl
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  .../ca-certificates/ca-certificates_20210119.bb             | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_202101=
19.bb b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
> index 888a235c1a..7dcc86fdc1 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
> @@ -83,8 +83,8 @@ do_install_append_class-native () {
>      SYSROOT=3D"${D}${base_prefix}" ${D}${sbindir}/update-ca-certificate=
s
>  }
>  
> -RDEPENDS_${PN}_class-target =3D "openssl-bin"
> -RDEPENDS_${PN}_class-native =3D "openssl-native"
> -RDEPENDS_${PN}_class-nativesdk =3D "nativesdk-openssl-bin"
> +RDEPENDS_${PN}_append_class-target =3D " openssl-bin openssl"
> +RDEPENDS_${PN}_append_class-native =3D " openssl-native"
> +RDEPENDS_${PN}_append_class-nativesdk =3D " nativesdk-openssl-bin nativ=
esdk-openssl"
>  
>  BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 2.31.1
>=20

>=20
>=20
>=20
