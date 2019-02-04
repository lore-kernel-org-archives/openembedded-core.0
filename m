Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA336C111
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 09:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9BA5D18401;
	Mon,  4 Feb 2019 10:04:41 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id oHWovuzzw8J6; Mon,  4 Feb 2019 10:04:40 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 280F9183EB;
	Mon,  4 Feb 2019 10:04:40 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1741A1E06C;
	Mon,  4 Feb 2019 10:04:40 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BCE61E06A;
	Mon,  4 Feb 2019 10:04:40 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon,  4 Feb 2019 10:04:40 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id F409023AF;
	Mon,  4 Feb 2019 10:04:39 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 4 Feb 2019 10:04:39 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Mon, 4 Feb 2019 10:04:39 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] timezone: refactor to simplify maint
Thread-Index: AQHUvAVWo14AQesAUku0qc92U0kBY6XPWJzA
Date: Mon, 4 Feb 2019 09:04:39 +0000
Message-ID: <1951a562133743da9babfcb55f7f5345@XBOX04.axis.com>
References: <1549228389-17737-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1549228389-17737-1-git-send-email-akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] timezone: refactor to simplify maint
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
X-List-Received-Date: Mon, 04 Feb 2019 09:04:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Armin Kuster
> Sent: den 3 februari 2019 22:13
> To: akuster808@gmail.com; openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] timezone: refactor to simplify maint
>=20
> move tzcode and tzdata-native into new dir
>=20
> Updates are now limited to the common include file.
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../timezone.inc}                                   | 21 +++++----------=
------
>  meta/recipes-extended/timezone/tzcode-native.bb     | 17 +++++++++++++++=
++
>  .../{tzdata/tzdata_2018i.bb =3D> timezone/tzdata.bb}  | 12 +-----------
>  3 files changed, 23 insertions(+), 27 deletions(-)
>  rename meta/recipes-extended/{tzcode/tzcode-native_2018i.bb =3D> timezon=
e/timezone.inc} (63%)
>  create mode 100644 meta/recipes-extended/timezone/tzcode-native.bb
>  rename meta/recipes-extended/{tzdata/tzdata_2018i.bb =3D> timezone/tzdat=
a.bb} (94%)
>=20
> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018i.bb b/meta/r=
ecipes-extended/timezone/timezone.inc
> similarity index 63%
> rename from meta/recipes-extended/tzcode/tzcode-native_2018i.bb
> rename to meta/recipes-extended/timezone/timezone.inc
> index f056370..38dadac 100644
> --- a/meta/recipes-extended/tzcode/tzcode-native_2018i.bb
> +++ b/meta/recipes-extended/timezone/timezone.inc
> @@ -1,10 +1,11 @@
> -# note that we allow for us to use data later than our code version
> -#
> -SUMMARY =3D "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
> +UMMARY =3D "Timezone data"

SUMMARY? ;)

> +HOMEPAGE =3D "http://www.iana.org/time-zones"
> +SECTION =3D "base"
>  LICENSE =3D "PD & BSD & BSD-3-Clause"
> -
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f53c43=
fba"
>=20
> +PV =3D "2018i"
> +
>  SRC_URI =3D" http://www.iana.org/time-zones/repository/releases/tzcode${=
PV}.tar.gz;name=3Dtzcode \
>             http://www.iana.org/time-zones/repository/releases/tzdata${PV=
}.tar.gz;name=3Dtzdata \
>             "
> @@ -16,15 +17,3 @@ SRC_URI[tzcode.sha256sum] =3D "aaacdb876ca6fb9d58e244b=
462cbc7578a496b1b10994381b4b
>  SRC_URI[tzdata.md5sum] =3D "b3f0a1a789480a036e58466cd0702477"
>  SRC_URI[tzdata.sha256sum] =3D "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c65=
50740587c6ac5a7108c00d9"
>=20
> -S =3D "${WORKDIR}"
> -
> -inherit native
> -
> -EXTRA_OEMAKE +=3D "cc=3D'${CC}'"
> -
> -do_install () {
> -        install -d ${D}${bindir}/
> -        install -m 755 zic ${D}${bindir}/
> -        install -m 755 zdump ${D}${bindir}/
> -        install -m 755 tzselect ${D}${bindir}/
> -}

//Peter


