Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 881DB7CB9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 01:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 38AA4184EE;
	Wed, 27 Feb 2019 02:00:10 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id TtyME1fPIi_L; Wed, 27 Feb 2019 02:00:09 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3B28518507;
	Wed, 27 Feb 2019 02:00:09 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14DE41E06A;
	Wed, 27 Feb 2019 02:00:09 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 091E51E064;
	Wed, 27 Feb 2019 02:00:09 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 27 Feb 2019 02:00:08 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id F15762258;
	Wed, 27 Feb 2019 02:00:08 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 27 Feb 2019 02:00:08 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 27 Feb 2019 02:00:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Thread-Topic: [OE-core] [OE-Core][PATCH] openssl: move c_rehash pkg to avoid
	perl	dep
Thread-Index: AQHUrFUqeoEKavsAskmsLHhd9WEi8aXzFFSw
Date: Wed, 27 Feb 2019 01:00:08 +0000
Message-ID: <90b9b852a88544ce9762019e3aa98af7@XBOX04.axis.com>
References: <20190114220433.14356-1-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190114220433.14356-1-bradleyb@fuzziesquirrel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Xulin Sun <xulin.sun@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: move c_rehash pkg to avoid perl	dep
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2019 01:00:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Brad Bishop
> Sent: den 14 januari 2019 23:05
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [OE-Core][PATCH] openssl: move c_rehash pkg to avoid
> perl dep
>=20
> Perl and its dependencies have a decent footprint impact.  On my
> xz compressed filesystem:
>=20
> 634880: /usr/lib/libperl.so.5.24.4
>=20
> Put c_rehash in the openssl-misc package so the dependency can be
> avoided where it isn't needed.
>=20
> Change-Id: Iae9bccabfb1c8cfa1401ca6785abc39713d3fdf0
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> index 5c4e69cfb7..7d26654921 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> @@ -190,14 +190,13 @@ FILES_libcrypto =3D "${libdir}/libcrypto${SOLIBS}"
>  FILES_libssl =3D "${libdir}/libssl${SOLIBS}"
>  FILES_openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf"
>  FILES_${PN}-engines =3D "${libdir}/engines-1.1"
> -FILES_${PN}-misc =3D "${libdir}/ssl-1.1/misc"
> +FILES_${PN}-misc =3D "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
>  FILES_${PN} =3D+ "${libdir}/ssl-1.1/*"
>  FILES_${PN}_append_class-nativesdk =3D " ${SDKPATHNATIVE}/environment-
> setup.d/openssl.sh"
>=20
>  CONFFILES_openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf"
>=20
>  RRECOMMENDS_libcrypto +=3D "openssl-conf"
> -RDEPENDS_${PN}-bin =3D "perl"
>  RDEPENDS_${PN}-misc =3D "perl"
>  RDEPENDS_${PN}-ptest +=3D "openssl-bin perl perl-modules bash python"

There is a line at the end of the recipe, which was recently=20
added, that says:

MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"

I believe it should now be changed to:

MULTILIB_SCRIPTS =3D "${PN}-misc:${bindir}/c_rehash"

> --
> 2.20.1

//Peter


