Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web11.5429.1611738764122820673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 01:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=V654ErYX;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=65489b36c=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1611738764; x=1643274764;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Yl8pE9Ul6OCupKt1TzbWGtzWT+AHGJNxgzhrT/ZEE8w=;
  b=V654ErYXTmzAVqt75moourtGyuabTIqEsXNlZwqxM3hUcGFgMCLps2Ps
   1PL4g0OOGxRvRJ+xX6u0R1rMWKjJ9Kgwsf7IiYOialfrceIZcjdj2uIh5
   ORFim8bBIxQb9BNF0pz0IvibZ+C9OBuwN5xxrAx92H67iEPEo1JSgnZDq
   A=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 27 Jan 2021 10:12:41 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw6.muc with ESMTP/TLS;
 27 Jan 2021 10:12:41 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp) ([160.46.167.67])
 by esabb4.muc with ESMTP/TLS; 27 Jan 2021 10:12:41 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Wed, 27 Jan 2021 10:12:40 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Wed,
 27 Jan 2021 10:12:41 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <chee.yang.lee@intel.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] openssl: set CVE_VERSION_SUFFIX
Thread-Topic: [OE-core] [PATCH 2/2] openssl: set CVE_VERSION_SUFFIX
Thread-Index: AQHW9ItwoQqUrNceCUa5DwmABpFxCqo7H0SA
Date: Wed, 27 Jan 2021 09:12:40 +0000
Message-ID: <YBEuh09lQvJAvmqv@korppu>
References: <20210127090354.25091-1-chee.yang.lee@intel.com>
 <20210127090354.25091-2-chee.yang.lee@intel.com>
In-Reply-To: <20210127090354.25091-2-chee.yang.lee@intel.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <26F7B8FD860E954DBCCD6696DBE9231B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2021 at 05:03:54PM +0800, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>=20
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/=
recipes-connectivity/openssl/openssl_1.1.1i.bb
> index 52e96b7831..9ff80b3d4f 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> @@ -230,6 +230,8 @@ BBCLASSEXTEND =3D "native nativesdk"
>  
>  CVE_PRODUCT =3D "openssl:openssl"
>  
> +CVE_VERSION_SUFFIX =3D "alphabetical"
> +

I have to say that I don't like this. I'd prefer automation
which works like dpkg --compare-versions:

       --compare-versions ver1 op ver2
              Compare version numbers, where op is a binary operator. dpkg=
 returns true (0) if the specified condition is satisfied,
              and  false  (1)  otherwise.  There  are two groups of operat=
ors, which differ in how they treat an empty ver1 or ver2.
              These treat an empty version as earlier than any version: lt=
 le eq ne ge gt. These treat an  empty  version  as  later
              than any version: lt-nl le-nl ge-nl gt-nl. These are provide=
d only for compatibility with control file syntax: < << <=3D
              =3D >=3D >> >. The < and > operators are obsolete and should=
 not be used, due to confusing semantics. To illustrate: 0.1 <
              0.1 evaluates to true.

Cheers,

-Mikko

>  # Only affects OpenSSL >=3D 1.1.1 in combination with Apache < 2.4.37
>  # Apache in meta-webserver is already recent enough
>  CVE_CHECK_WHITELIST +=3D "CVE-2019-0190"
> --=20
> 2.17.1
>=20

>=20
>=20
>=20
