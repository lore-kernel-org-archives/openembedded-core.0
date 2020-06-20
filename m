Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.9083.1592652609102150083
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2020 04:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=QYrZgo/N;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2731; q=dns/txt; s=axis-central1;
  t=1592652609; x=1624188609;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=iopKrpPPHNJYpmmfxRltuv2K192TsUYxHDau0GJecMU=;
  b=QYrZgo/NRbrkFpvzuir0IiH6P8XtTpIb9dc6T6pEGXLSLMEOalMmzqpG
   E1/XbT3yiOsMceaOXd1wf1f+CIy0TcJVQnl6GP73E4BmtacCEaEhKliz1
   XkydMNwc6snz+oCZpQjivyVGbb07LHE5RW4/NauoFzrf8i2YsP8OZqHaO
   HSWqFfLVK00lBB/A5KPqXFQKnq0TIi5ovW2EuxMHPknHPQkKYdTK3PUyC
   VIaSwlJx1NStS8riQmP2Wp8/gsoUaZnlmOWURJhgKSeG6bAKhnZbFuMIa
   lk2HADWxehu1PttGmbr1RtN04/E2MolFVHaEzHa4uZEW2bWthW2wOGgIb
   Q==;
IronPort-SDR: hpAKD3NFdFMFg0/+XkQl28RDP53f3zns98mkKhL9Yd7+fzbBIJOoBxVLIbU/xfAvQIJz9k4HbX
 fbpDUIjXwgIBoDy7ks/aMdMDzdCb7Z900JBtlEc6lwB0LyeMk3n3xNmq6uHCPNm1BqROPZa9uN
 nKHQnE42U9hIMvch4PsZk3NWkGB/DbYJbGBWpkG+7YkPvUm0ZK8guiIbcO0ecrVczljS3tZgVW
 lqd2/44UVfWtTCCJcx2QvuHasyqzsaceJAlNm+VhZYfmRuq9y0nQ+o9+FzHWcUKEw1NwmQoBrB
 FxA=
X-IronPort-AV: E=Sophos;i="5.75,258,1589234400"; 
   d="scan'208";a="10018576"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] apr-util: make gdbm optional
Thread-Topic: [OE-core] [PATCH 1/2] apr-util: make gdbm optional
Thread-Index: AQHWRJBjT8KWgkNzVkaOt9hrJnz2qqjhX4vA
Date: Sat, 20 Jun 2020 11:30:07 +0000
Message-ID: <c141fa7dcd3f4cbf8dd75d8590eb71ce@XBOX03.axis.com>
References: <20200617101552.23867-1-alex.kanavin@gmail.com>
In-Reply-To: <20200617101552.23867-1-alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 17 juni 2020 12:16
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> Subject: [OE-core] [PATCH 1/2] apr-util: make gdbm optional
>=20
> This helps with gpl3-free builds.
>=20
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-support/apr/apr-util_1.6.1.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-su=
pport/apr/apr-util_1.6.1.bb
> index 3896c924f0..0dd8f025e8 100644
> --- a/meta/recipes-support/apr/apr-util_1.6.1.bb
> +++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Apache Portable Runtime (APR) companion library"
>  HOMEPAGE =3D "http://apr.apache.org/"
>  SECTION =3D "libs"
> -DEPENDS =3D "apr expat gdbm"
> +DEPENDS =3D "apr expat"
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
>=20
> @@ -23,7 +23,6 @@ EXTRA_OECONF =3D "--with-apr=3D${STAGING_BINDIR_CROSS}/=
apr-1-config \
>  		--without-odbc \
>  		--without-pgsql \
>  		--with-dbm=3Dgdbm \
> -		--with-gdbm=3D${STAGING_DIR_HOST}${prefix} \
>  		--without-sqlite2 \
>  		--with-expat=3D${STAGING_DIR_HOST}${prefix}"
>=20
> @@ -66,10 +65,11 @@ do_install_append_class-target() {
>  	       -e 's,APU_BUILD_DIR=3D.*,APR_BUILD_DIR=3D,g' ${D}${bindir}/apu-1=
-config
>  }
>=20
> -PACKAGECONFIG ??=3D "crypto"
> +PACKAGECONFIG ??=3D "crypto gdbm"

Since I assume this is not the only place where it is needed to disable a=20
feature to achieve a GPL-3.0 free build, maybe we should introduce a distro=
=20
feature to control them? E.g.:

PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'allow-gpl3', =
'gdbm', '', d)} \
                   crypto"

This would make it a lot easier for anyone who wants to disable the use of=
=20
GPL-3.0 code as they would not have to go searching through the recipes for=
=20
these kind of features to disable.

>  PACKAGECONFIG[ldap] =3D "--with-ldap,--without-ldap,openldap"
>  PACKAGECONFIG[crypto] =3D "--with-openssl=3D${STAGING_DIR_HOST}${prefix}=
 --with-crypto,--without-crypto,openssl"
>  PACKAGECONFIG[sqlite3] =3D "--with-sqlite3=3D${STAGING_DIR_HOST}${prefix=
},--without-sqlite3,sqlite3"
> +PACKAGECONFIG[gdbm] =3D "--with-gdbm=3D${STAGING_DIR_HOST}${prefix},--wi=
thout-gdbm,gdbm"
>=20
>  #files ${libdir}/apr-util-1/*.so are not symlinks but loadable modules t=
hus they are packaged in ${PN}
>  FILES_${PN}     +=3D "${libdir}/apr-util-1/apr*${SOLIBS} ${libdir}/apr-u=
til-1/apr*${SOLIBSDEV}"
> --
> 2.27.0

//Peter

