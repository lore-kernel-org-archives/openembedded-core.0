Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A575746D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 15:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 969A9184E2;
	Wed,  2 May 2018 17:18:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id dul_uaB67cJo; Wed,  2 May 2018 17:18:54 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8E48F184D8;
	Wed,  2 May 2018 17:18:54 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 543D21A08E;
	Wed,  2 May 2018 17:18:54 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 481651A08C;
	Wed,  2 May 2018 17:18:54 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed,  2 May 2018 17:18:54 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 3B7C623E8;
	Wed,  2 May 2018 17:18:54 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 2 May 2018 17:18:54 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Wed, 2 May 2018 17:18:54 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mike Crowe <mac@mcrowe.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCHv2] alsa-utils: Fix error when removing unwanted udev rules
Thread-Index: AQHT4hrUaGWZ6SWPIEm61vWrrRrmZaQcjNMw
Date: Wed, 2 May 2018 15:18:53 +0000
Message-ID: <d88052ce5de24a31894e911680f355be@XBOX02.axis.com>
References: <fb6ef50149364c4db6f17687bb90645a@XBOX02.axis.com>
	<20180502133803.37862-1-mac@mcrowe.com>
In-Reply-To: <20180502133803.37862-1-mac@mcrowe.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCHv2] alsa-utils: Fix error when removing unwanted udev rules
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
X-List-Received-Date: Wed, 02 May 2018 15:18:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Mike Crowe [mailto:mac@mcrowe.com]
> Sent: den 2 maj 2018 15:38
> To: openembedded-core@lists.openembedded.org
> Cc: Mike Crowe <mac@mcrowe.com>; Phil Blundell <pb@pbcl.net>; Peter Kjell=
erstedt <peter.kjellerstedt@axis.com>
> Subject: [PATCHv2] alsa-utils: Fix error when removing unwanted udev rule=
s
>=20
> If alsa-utils configure is not passed a --with-udev-rules-dir option then
> it defaults to using /lib/udev/rules.d. This meant that the hard-coded us=
e
> of ${D}/lib in do_install in 262e69c9c7acf0beb7bb6b96299e3c993c906434
> worked correctly to remove the unwanted rules.
>=20
> Subsequently, 0a4372705a030ca54ed420cdfec33d46ab93499c changed do_install
> to use ${nonarch_base_libdir}, claiming to fix this in the usrmerge case.
>=20
> This means that if udev is not present in PACKAGECONFIG and usrmerge is
> present in DISTRO_FEATURES then the alsa-utils build system will install
> the rules in ${D}/lib/udev/rules.d but do_install will attempt to remove
> ${D}/usr/lib, resulting in something like:
>=20
>  rmdir: failed to remove '.../tmp-glibc/work/i586-oe-linux/alsa-utils/1.1=
.5-r0/image/usr/lib': No such file or directory
>=20
> To fix this, let's just tell configure to install the rules in a specific
> known location when udev is disabled. This location can then easily be
> cleaned up in do_install without doing any harm if udev is enabled.
>=20
> Tested both with and without usrmerge in DISTRO_FEATURES and with and
> without udev in PACKAGECONFIG.
>=20
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> Cc: Phil Blundell <pb@pbcl.net>
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb b/meta/reci=
pes-multimedia/alsa/alsa-utils_1.1.5.bb
> index f2231f34f0..33215bf159 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb
> @@ -16,7 +16,7 @@ PACKAGECONFIG ??=3D "udev"
>  # or no alsabat at all.
>  PACKAGECONFIG[bat] =3D "--enable-bat,--disable-bat,fftwf"
>=20
> -PACKAGECONFIG[udev] =3D "--with-udev-rules-dir=3D`pkg-config --variable=
=3Dudevdir udev`/rules.d,,udev"
> +PACKAGECONFIG[udev] =3D "--with-udev-rules-dir=3D`pkg-config --variable=
=3Dudevdir udev`/rules.d,--with-udev-rules-dir=3D/unwanted/rules.d,udev"
>  PACKAGECONFIG[manpages] =3D "--enable-xmlto, --disable-xmlto, xmlto-nati=
ve docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
>=20
>  SRC_URI =3D "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-
> ${PV}.tar.bz2 \
> @@ -101,9 +101,8 @@ do_install() {
>  	rm ${D}${sbindir}/alsa-info.sh
>  	rm -f ${D}${sbindir}/alsabat-test.sh
>=20
> -	if ${@bb.utils.contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; =
then
> -		# This is where alsa-utils will install its rules if we don't tell it =
anything else.
> -		rm -rf ${D}${nonarch_base_libdir}/udev
> -		rmdir --ignore-fail-on-non-empty ${D}${nonarch_base_libdir}
> -	fi
> +	# If udev is disabled, we told configure to install the rules
> +	# in /unwanted, so we can remove them now. If udev is enabled,
> +	# then /unwanted won't exist and this will have no effect.
> +	rm -rf ${D}/unwanted
>  }
> --
> 2.11.0

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

//Peter


