Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UUIQk-0003MU-2a
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 17:13:24 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 22 Apr 2013 16:55:39 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 3BA3C28C9AE;
	Mon, 22 Apr 2013 16:55:42 +0200 (CEST)
Date: Mon, 22 Apr 2013 16:55:42 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130422145542.GP15534@sestofb10.enea.se>
References: <1366641205-3891-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1366641205-3891-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glib-2.0: disable tests for native builds, and respect ptest for LSB
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2013 15:13:28 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ross Burton wrote:
> Without disabling the tests in the native build, glib-2.0-native will nee=
d
> libdbus-native to be present.  As we don't run the tests, disable them so=
 we
> don't have build failures due to missing dependencies.
>=20
> Also, the LSB override was missing PTEST_CONF so the same problem could h=
appen.
> After adding PTEST_CONF the LSB override is identical to the non-overridd=
en
> EXTRA_OECONF, so remove it.
>=20
> Finally, to be explicit, put --enable-module-tests in PTEST_CONF.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/glib-2.0/glib.inc |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index cb391a2..42c34c3 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -27,10 +27,9 @@ S =3D "${WORKDIR}/glib-${PV}"
> =20
>  CORECONF =3D "--disable-dtrace --disable-fam --disable-libelf --disable-=
systemtap"
> =20
> -PTEST_CONF =3D "${@base_contains('DISTRO_FEATURES', 'ptest', '', '--disa=
ble-modular-tests', d)}"
> +PTEST_CONF =3D "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-m=
odular-tests', '--disable-modular-tests', d)}"
>  EXTRA_OECONF =3D "--enable-included-printf=3Dno ${CORECONF} ${PTEST_CONF=
}"
> -EXTRA_OECONF_class-native =3D "${CORECONF} --disable-selinux"
> -EXTRA_OECONF_linuxstdbase =3D "--enable-included-printf=3Dno ${CORECONF}=
"
> +EXTRA_OECONF_class-native =3D "${CORECONF} --disable-selinux --disable-m=
odular-tests"
> =20
>  FILES_${PN} =3D "${libdir}/lib*${SOLIBS} ${datadir}/glib-2.0/schemas \
>                 ${datadir}/glib-2.0/gettext/mkinstalldirs ${datadir}/glib=
-2.0/gettext/po/Makefile.in.in"

Acked-By: Bj=F6rn Stenberg <bjst@enea.com>

--=20
Bj=F6rn


