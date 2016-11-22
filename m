Return-Path: <anibal.limon@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7FDF1606B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 20:24:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 22 Nov 2016 12:24:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,682,1473145200"; 
	d="asc'?scan'208";a="789623010"
Received: from unknown (HELO [10.219.5.149]) ([10.219.5.149])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2016 12:24:56 -0800
To: Linus Wallgren <linus.wallgren@scypho.com>,
	openembedded-core@lists.openembedded.org
References: <68b087d8-d920-eb83-8b53-7e561fd419cb@opendreambox.org>
	<20161121205749.3306-1-linus.wallgren@scypho.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <5834AA03.2060405@linux.intel.com>
Date: Tue, 22 Nov 2016 14:26:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20161121205749.3306-1-linus.wallgren@scypho.com>
Subject: Re: [PATCHv2] apt-package: Include maintenance scripts
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
X-List-Received-Date: Tue, 22 Nov 2016 20:24:58 -0000
X-Groupsio-MsgNum: 89682
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="dFc4owVrLPdVf5cCSFTuTjRRnr4p3X75r"

--dFc4owVrLPdVf5cCSFTuTjRRnr4p3X75r
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 11/21/2016 02:57 PM, Linus Wallgren wrote:
> Apt can run multiple tasks daily, such as for example clean, update,
> autoclean, unattended-upgrades etc.
>=20
> [YOCTO #10669]
>=20
> Signed-off-by: Linus Wallgren <linus.wallgren@scypho.com>
Acked-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> ---
>  meta/recipes-devtools/apt/apt-package.inc | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-d=
evtools/apt/apt-package.inc
> index a553aa2..c17048a 100644
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
> +	install -d ${D}${systemd_unitdir}/system/
> +	install -m 0644 ${S}/debian/apt.systemd.daily ${D}/usr/lib/apt/
> +	install -m 0644 ${S}/debian/apt-daily.service ${D}${systemd_unitdir}/=
system/
> +	install -m 0644 ${S}/debian/apt-daily.timer ${D}${systemd_unitdir}/sy=
stem/
> +	install -d ${D}${sysconfdir}/cron.daily/
> +	install -m 0755 ${S}/debian/apt.apt-compat.cron.daily ${D}${sysconfdi=
r}/cron.daily/
>  }
>=20


--dFc4owVrLPdVf5cCSFTuTjRRnr4p3X75r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYNKoIAAoJEGJqcE9h3glg/G4P/1bruh7BHy7JQrG9L5595DFk
M9JhNBiQlSO/4m/ZVb9/MecxnF1QOcIu2vauqgVT0F1r019GGhc6bSe6XPbuZkMQ
dvGZZcwOXXNaw6Atw7RXfFVj81sZUpOKSENZob8afpCaojnbz6H9qTXOAk5/ZDlL
8iexWVXUbHTsWW9ezJJZOTgGQs+1rXSV+Tp3MKG1QbpmaKE1kV1vGXh9Nboz0ogY
WiO1RgzZ9EDeB93jWXXIQtpoN5ReSk05b5XKyo23MYBo21F6QjX3ED+Z3R6nHHOm
asi+pRACOeYABKjry1Nex3qwerFNjb9uhH7tdxb1yr8r3CKoPPQJJUb3pvkzUbsV
EDfaPrAPEZoNMBKnZDfaRqFfzpWmfZrBt13ZT8zeAvkJtWfuukI/M5aM26UUQnd8
rdfYFjGLY6k+P5MrzGcWuNNd9Fq3Y1PwWOvebI3dEmPF9R9qG3p6lA5xXdLFkjrQ
rmBdC/V93luhDQNHWHTJCDW5Oe29vverVTj44+Y63jZMqgkKqVpZ5NHa8EnB5Y5k
XbYc76F6cPysbe9RsXa0aIZfeAbzUAcYB/yVngoqqcSncQQcLcTrC348Z+GTkTxj
z/BmDA4+BGhDUlo3cW2ML+T/u6sjfUtaFr5Ja8Kz5BnTFzfs83wn4PEWkFKO85fY
Qta8XB6Yf703KXRCzUpN
=5TfO
-----END PGP SIGNATURE-----

--dFc4owVrLPdVf5cCSFTuTjRRnr4p3X75r--
