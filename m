Received: from smtp23.4emm.com ([69.18.222.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1RmbFg-0003b7-7K
	for Openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 02:20:48 +0100
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB23.4emm.local ([::1]) with mapi id 14.01.0289.001; Sun, 15 Jan 2012
	20:12:07 -0500
From: James Limbouris <james@digitalmatter.com.au>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] ghostscript: build cups filters
Thread-Index: AQHMz3iHzcqSOD6Xd0S93MgYszc6HJYOOJMQ
Date: Mon, 16 Jan 2012 01:12:06 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF040C6A85@MBX20.4emm.local>
References: <1326184668-14332-1-git-send-email-james@digitalmatter.com.au>
In-Reply-To: <1326184668-14332-1-git-send-email-james@digitalmatter.com.au>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [PATCH] ghostscript: build cups filters
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jan 2012 01:20:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: James Limbouris [mailto:james@digitalmatter.com.au]
> Sent: Tuesday, 10 January 2012 4:38 PM
> To: Openembedded-core@lists.openembedded.org
> Cc: James Limbouris
> Subject: [PATCH] ghostscript: build cups filters
>=20
> Cups filters are no longer built by default. Since ghostscript already de=
pends
> on cups, build the filters and package them as ghostscript-cups.
>=20
> Ghostscript uses the cups-config script from the oe sysroots to determine=
 some
> of the target install paths, as well as to determine the linker path. The=
 config
> script gives out paths pointing to the sysroot, so some of the paths need=
ed to
> be adjusted in the Makefile.
>=20
> Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> ---
>  .../ghostscript/ghostscript_9.04.bb                |   29 ++++++++++++++=
++---
>  1 files changed, 24 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
> b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
> index 7178524..80d363f 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
> @@ -15,7 +15,7 @@ SECTION =3D "console/utils"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dd151214b3131251dfc9d858593acbd24"
>=20
> -PR =3D "r2"
> +PR =3D "r3"
>=20
>  DEPENDS =3D "ghostscript-native tiff jpeg fontconfig cups"
>  DEPENDS_virtclass-native =3D ""
> @@ -34,7 +34,8 @@ SRC_URI_virtclass-native =3D "${SRC_URI_BASE}"
>  SRC_URI[md5sum] =3D "9c2fb4af1eb609d09dba5bb0fa76173a"
>  SRC_URI[sha256sum] =3D
> "f1e333738c41c3bf2b47ceb9806abb8045bcdc7353002c32736150425a7c1ef4"
>=20
> -EXTRA_OECONF =3D "--without-x --with-system-libtiff --without-jbig2dec -=
-
> without-jasper --with-fontpath=3D${datadir}/fonts"
> +EXTRA_OECONF =3D "--without-x --with-system-libtiff --without-jbig2dec -=
-
> without-jasper \
> +                --with-fontpath=3D${datadir}/fonts --with-install-cups"
>=20
>  # This has been fixed upstream but for now we need to subvert the check =
for
> time.h
>  # http://bugs.ghostscript.com/show_bug.cgi?id=3D692443
> @@ -60,6 +61,14 @@ do_configure_append () {
>  			cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i
> obj/aux/$i
>  		done
>  	fi
> +
> +	# replace cups paths from sysroots/.../usr/bin/crossscripts/cups-config
> with target paths
> +	# CUPSDATA is compiled into a utility, and CUPSSERVERBIN is used as
> an install path
> +	CUPSSERVERBIN=3D${exec_prefix}/lib/cups          # /usr/lib NOT libdir
> +	CUPSDATA=3D${datadir}/cups
> +
> +	sed -e "s#^CUPSSERVERBIN=3D.*#CUPSSERVERBIN=3D${CUPSSERVERBIN}#"
> -i Makefile
> +	sed -e "s#^CUPSDATA=3D.*#CUPSDATA=3D${CUPSDATA}#" -i Makefile
>  }
>=20
>  do_install_append () {
> @@ -67,9 +76,7 @@ do_install_append () {
>      cp -r Resource ${D}${datadir}/ghostscript/${PV}/
>      cp -r iccprofiles ${D}${datadir}/ghostscript/${PV}/
>=20
> -    if [ -f ${D}${sysconfdir}/cups ]; then
> -        chown -R root:lp ${D}${sysconfdir}/cups
> -    fi
> +    chown -R root:lp ${D}${sysconfdir}/cups
>  }
>=20
>  python do_patch_virtclass-native () {
> @@ -95,3 +102,15 @@ BBCLASSEXTEND =3D "native"
>  # Ghostscript install tool 'instcopy' tries to remove already created
>  # directories during install and parallel make causes problems.
>  PARALLEL_MAKEINST=3D""
> +
> +PACKAGES =3D+ "${PN}-cups"
> +
> +FILES_${PN}-dbg +=3D "${exec_prefix}/lib/cups/filter/.debug"
> +
> +FILES_${PN}-cups +=3D "${exec_prefix}/lib/cups/filter/gstoraster \
> +                     ${exec_prefix}/lib/cups/filter/pstopxl \
> +                     ${datadir}/cups \
> +                     ${sysconfdir}/cups \
> +                     "
> +
> +RDEPENDS_${PN}-cups =3D ${PN}
> --
> 1.7.3.4

Ping?



