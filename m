Return-Path: <anibal.limon@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EFFF1719FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 22:14:57 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 17 Nov 2016 14:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,655,1473145200"; 
	d="asc'?scan'208";a="32635771"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.143])
	([10.219.5.143])
	by fmsmga005.fm.intel.com with ESMTP; 17 Nov 2016 14:14:57 -0800
To: Linus Wallgren <linus.wallgren@scypho.com>,
	openembedded-core@lists.openembedded.org
References: <20161116163315.18662-1-linus.wallgren@scypho.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <582E2C46.9090605@linux.intel.com>
Date: Thu, 17 Nov 2016 16:16:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20161116163315.18662-1-linus.wallgren@scypho.com>
Subject: Re: [PATCH] apt-package: Include maintenance scripts
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
X-List-Received-Date: Thu, 17 Nov 2016 22:14:59 -0000
X-Groupsio-MsgNum: 89549
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ta4eXluuMVpqjAOkXTw1UmGx7JK0pMSLU"

--ta4eXluuMVpqjAOkXTw1UmGx7JK0pMSLU
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Your patch looks good, only missing one thing you need to conditional
those lines to only work when systemd is enabled in DISTRO_FEATURES, see
example:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-support/=
consolekit/consolekit_0.4.6.bb#n26

Thanks in advance,
	alimon


On 11/16/2016 10:33 AM, Linus Wallgren wrote:
> Apt can run multiple tasks daily, such as for example clean, update,
> autoclean, unattended-upgrades etc.
>=20
> [YOCTO #10669]
>=20
> Signed-off-by: Linus Wallgren <linus.wallgren@scypho.com>
> ---
>  meta/recipes-devtools/apt/apt-package.inc | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-d=
evtools/apt/apt-package.inc
> index a553aa2..38cd558 100644
> --- a/meta/recipes-devtools/apt/apt-package.inc
> +++ b/meta/recipes-devtools/apt/apt-package.inc
> @@ -32,13 +32,19 @@ FILES_${PN} =3D "${bindir}/apt-cdrom ${bindir}/apt-=
get \
>  	       ${bindir}/apt-config ${bindir}/apt-cache \
>  	       ${libdir}/apt ${libdir}/libapt*.so.* \
>  	       ${localstatedir} ${sysconfdir} \
> -	       ${libdir}/dpkg"
> +	       ${libdir}/dpkg \
> +	       ${systemd_unitdir}/system \
> +           "
>  FILES_${PN}-utils =3D "${bindir}/apt-sortpkgs ${bindir}/apt-extracttem=
plates"
>  FILES_${PN}-doc =3D "${@get_files_apt_doc(d, bb, d.getVar('apt-manpage=
s', True))} \
>  		   ${docdir}/apt"
>  FILES_${PN}-utils-doc =3D "${@get_files_apt_doc(d, bb, d.getVar('apt-u=
tils-manpages', True))}"
>  FILES_${PN}-dev =3D "${libdir}/libapt*.so ${includedir}"
> =20
> +inherit systemd
> +
> +SYSTEMD_SERVICE_${PN} =3D "apt-daily.timer"
> +
>  do_install () {
>  	set -x
>  	install -d ${D}${bindir}
> @@ -75,4 +81,11 @@ do_install () {
> =20
>  	install -d ${D}${includedir}/apt-pkg/
>  	install -m 0644 include/apt-pkg/*.h ${D}${includedir}/apt-pkg/
> +
> +    install -d ${D}${systemd_unitdir}/system/
> +    install -m 0644 ${S}/debian/apt.systemd.daily ${D}/usr/lib/apt/
> +    install -m 0644 ${S}/debian/apt-daily.service ${D}${systemd_unitdi=
r}/system/
> +    install -m 0644 ${S}/debian/apt-daily.timer ${D}${systemd_unitdir}=
/system/
> +    install -d ${D}${sysconfdir}/cron.daily/
> +    install -m 0755 ${S}/debian/apt.apt-compat.cron.daily ${D}${syscon=
fdir}/cron.daily/
>  }
>=20


--ta4eXluuMVpqjAOkXTw1UmGx7JK0pMSLU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYLixIAAoJEGJqcE9h3glgjqkP/2ecp86DCKKx4n0eP3DHKwtT
pG1mxdKBOHQNOm/lII6MoIaYT1sWE07bKtPYzkHVtUtveh7Yi5+xEjdt++fdfIBi
NctMNCnJPNy6dHtaaU6voA7QbgPPtTWC/MeLniPoFUdzO4H7jXzVyHUivFr/WxTm
7JlZyAWc459Db+4Vt+3zoHioAbC6EmyRpHpNlRpeS+gtSSCVARKcHwvNF9SbhtrM
M0Y8IG2qiXrhN23l4DkhIZ9yH0ywj2nj5xe93+rslWKdMuCP8QOPvVOHrdQkbyC1
FIsMl+mxHbddJQyyFJZpaSmxcNkXiwyJOZg0O5WbiL8+coNIDabREpbx0oMaEdl+
FjTUABA8Z8PkKMfORVZ5qP1YwAnvoNkglXJ3OGBNl0KEOg2iNprkgWKDPqZJqAwK
+IfqlPYIaHG9gQwFyc44BkPVfbPSZRMnbbCuPAlvwJgcWe77luKkVlnjqnSqOBeT
bRpq90KzfR0ex/LVBocJvub/bqLDj82KiegwSlHX+fRHA8YFXXILzIQPFyzxiH3u
Nl9zib7inqe0Xd3iIU/DtOGhokMtzlE8tzWrneRbEvwvtTEUr9KvTZO7jlvBs/Cr
xLBBTIMAGIo6VxGEVbtBZjrNoBzuZKEJkFFDV6bHJbouOa6/joUwAZmrSX2/rCNQ
D4OukpEI9Ehb0uVGWl2i
=Ppll
-----END PGP SIGNATURE-----

--ta4eXluuMVpqjAOkXTw1UmGx7JK0pMSLU--
