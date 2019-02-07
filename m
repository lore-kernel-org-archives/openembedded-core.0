Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D71B6B436
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 19:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D83F8185AE;
	Thu,  7 Feb 2019 20:21:02 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Ll80Xbha740T; Thu,  7 Feb 2019 20:21:01 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id B73CC182D7;
	Thu,  7 Feb 2019 20:21:01 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A477A1E07A;
	Thu,  7 Feb 2019 20:21:01 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 988B31E079;
	Thu,  7 Feb 2019 20:21:01 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu,  7 Feb 2019 20:21:01 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 8B862E0D;
	Thu,  7 Feb 2019 20:21:01 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 7 Feb 2019 20:21:01 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Thu, 7 Feb 2019 20:21:01 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V2] glibc-locale: Rewrite do_install using
	install utility instead of cp
Thread-Index: AdS/GkECXwmxxtvPR+6flUGcnoKI7g==
Date: Thu, 7 Feb 2019 19:21:01 +0000
Message-ID: <5001df4948a34c9fb6475d3339c20433@XBOX04.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH V2] glibc-locale: Rewrite do_install using install utility instead of cp
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
X-List-Received-Date: Thu, 07 Feb 2019 19:21:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 7 februari 2019 19:04
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH V2] glibc-locale: Rewrite do_install using
> install utility instead of cp
>=20
> This has been a constant source of trouble for build failures due to
> host-user-contaminated QA
> errors of sort
>=20
> ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-
> es+valencia/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by uid
> 3004, which is the same as the user running bitbake. This may be due to
> host contamination [host-user-contaminated]
>=20
> So far we have tried to mould cp command into not carrying the build
> user permissions into install area but it is never entirely fixed since
> the issue keeps popping up in various scenes
>=20
> This patch replaces use of cp with install utility and specifies
> install
> mode for files explcitly
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Turn the common install loop into a shell function ( Thanks Peter
> Kjellerstedt)
>  meta/recipes-core/glibc/glibc-locale.inc | 43 ++++++++++++------------
>  1 file changed, 21 insertions(+), 22 deletions(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core=
/glibc/glibc-locale.inc
> index 6384f9cbf1..c51fa482a9 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -71,28 +71,27 @@ FILES_localedef =3D "${bindir}/localedef"
>=20
>  LOCALETREESRC =3D "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
>=20
> -do_install () {
> -	mkdir -p ${D}${bindir} ${D}${datadir}
> -	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> -		cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESRC}/${bind=
ir}/* ${D}${bindir}
> -	fi
> -	if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
> -		mkdir -p ${D}${localedir}
> -		cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESRC}/${loca=
ledir}/* ${D}${localedir}
> -	fi
> -	if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
> -		mkdir -p ${D}${libdir}
> -		if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> -			cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESRC}/${lib=
dir}/gconv ${D}${libdir}
> -		fi
> -		if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> -			cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESRC}/${dat=
adir}/i18n ${D}${datadir}
> -		fi
> -	fi
> -	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> -		cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESRC}/${data=
dir}/locale ${D}${datadir}
> -	fi
> -	cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESRC}/SUPPORT=
ED ${WORKDIR}
> +copy_locale_files() {
> +        local dir=3D$1 mode=3D$2
> +
> +        [ -e "${LOCALETREESRC}$dir" ] || return 0
> +
> +        for d in . $(find "${LOCALETREESRC}$dir" -type d -printf '%P ');=
 do
> +                install -d ${D}$dir/$d
> +                find "${LOCALETREESRC}$dir/$d" -maxdepth 1 -type f \
> +                     -exec install -m $mode -t "${D}$dir/$d" {} \;
> +        done
> +}
> +
> +do_install() {
> +        copy_locale_files ${bindir} 0755
> +        copy_locale_files ${localedir} 0644
> +        if [ ${PACKAGE_NO_GCONV} -eq 0 ]; then
> +                copy_locale_files ${libdir}/gconv 0755
> +                copy_locale_files ${datadir}/i18n 0644
> +        fi
> +        copy_locale_files ${datadir}/locale 0644
> +        install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
>  }
>=20
>  inherit libc-package
> --
> 2.20.1

Except for that you turned all the tabs into spaces, it looks fine.

//Peter


