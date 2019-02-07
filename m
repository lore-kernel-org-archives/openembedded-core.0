Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA8576C10B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 11:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 07FA418399;
	Thu,  7 Feb 2019 12:44:40 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id kbg8ORf33SIk; Thu,  7 Feb 2019 12:44:39 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id F06C1182C8;
	Thu,  7 Feb 2019 12:44:38 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB5E11E089;
	Thu,  7 Feb 2019 12:44:38 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFF2A1E088;
	Thu,  7 Feb 2019 12:44:38 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu,  7 Feb 2019 12:44:38 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id B41EC280C;
	Thu,  7 Feb 2019 12:44:38 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 7 Feb 2019 12:44:38 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 7 Feb 2019 12:44:38 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Thu, 7 Feb 2019 12:44:38 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] glibc-locale: Rewrite do_install using install
	utility instead of cp
Thread-Index: AQHUvn0j5x35NcJPuUCVBP0vNMsmO6XUI1+Q
Date: Thu, 7 Feb 2019 11:44:38 +0000
Message-ID: <58853c532317426d98d4b4a641a87780@XBOX04.axis.com>
References: <20190207003537.7135-1-raj.khem@gmail.com>
In-Reply-To: <20190207003537.7135-1-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] glibc-locale: Rewrite do_install using install	utility instead of cp
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
X-List-Received-Date: Thu, 07 Feb 2019 11:44:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 7 februari 2019 01:36
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] glibc-locale: Rewrite do_install using
> install utility instead of cp
>=20
> This has been a constant source of trouble for build failures due to
> host-user-contaminated QA errors of sort
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
> This patch replaces use of cp with install utility and specifies=20
> install mode for files explcitly
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-locale.inc | 44 ++++++++++++++----------
>  1 file changed, 25 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core=
/glibc/glibc-locale.inc
> index 6384f9cbf1..9b256a5108 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -72,27 +72,33 @@ FILES_localedef =3D "${bindir}/localedef"
>  LOCALETREESRC =3D "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
>=20
>  do_install () {
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
> +        install -d ${D}${bindir}
> +        find "${LOCALETREESRC}/${bindir}" -maxdepth 1 -type f \
> +        -exec install -m 0755 -t "${D}${bindir}" {} \;
> +
> +        for d in . $(find "${LOCALETREESRC}/${localedir}" -type d -print=
f '%P ') ; do
> +                install -d "${D}${localedir}/$d"
> +                find "${LOCALETREESRC}/${localedir}/$d" -maxdepth 1 -typ=
e f \
> +                -exec install -m 0644 -t "${D}${localedir}/$d" {} \;
> +        done
>  	if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
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
> +                for d in . $(find "${LOCALETREESRC}/${libdir}/gconv" -ty=
pe d -printf '%P ') ; do
> +                        install -d "${D}${libdir}/gconv/$d"
> +                        find "${LOCALETREESRC}/${libdir}/gconv/$d" -maxd=
epth 1 -type f \
> +                        -exec install -m 0755 -t "${D}${libdir}/gconv/$d=
" {} \;
> +                done
> +                for d in . $(find "${LOCALETREESRC}/${datadir}/i18n" -ty=
pe d -printf '%P ') ; do
> +                        install -d "${D}${datadir}/i18n/$d"
> +                        find "${LOCALETREESRC}/${datadir}/i18n/$d" -maxd=
epth 1 -type f \
> +                        -exec install -m 0644 -t "${D}${datadir}/i18n/$d=
" {} \;
> +                done
>  	fi
> -	cp -R --no-dereference --preserve=3Dmode,links ${LOCALETREESRC}/SUPPORT=
ED ${WORKDIR}
> +        for d in . $(find "${LOCALETREESRC}/${datadir}/locale" -type d -=
printf '%P ') ; do
> +                install -d "${D}${datadir}/locale/$d"
> +                find "${LOCALETREESRC}/${datadir}/locale/$d" -maxdepth 1=
 -type f \
> +                -exec install -m 0644 -t "${D}${datadir}/locale/$d" {} \=
;
> +        done
> +	install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
>  }
>=20
>  inherit libc-package
> --
> 2.20.1

May I suggest using a help function to simplify the code a lot:

copy_locale_files() {
	local dir=3D$1 mode=3D$2

	[ -e "${LOCALETREESRC}$dir" ] || return 0

	for d in . $(find "${LOCALETREESRC}$dir" -type d -printf '%P '); do
		install -d ${D}$dir/$d
		find "${LOCALETREESRC}$dir/$d" -maxdepth 1 -type f \
		     -exec install -m $mode -t "${D}$dir/$d" {} \;
	done
}

do_install() {
	copy_locale_files ${bindir} 0755
	copy_locale_files ${localedir} 0644
	if [ ${PACKAGE_NO_GCONV} -eq 0 ]; then
		copy_locale_files ${libdir}/gconv 0755
		copy_locale_files ${datadir}/i18n 0644
	fi
	copy_locale_files ${datadir}/locale 0644
	install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
}

The code above is untested, but I think I got it reasonably correct.=20
Also note that I have restored the indentation to use tabs, and=20
turned the access to the ${PACKAGE_NO_GCONV} variable into a=20
simple variable instead of using d.getVar().

//Peter


