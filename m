Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RgAwM-00007j-RK
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 09:02:21 +0100
Received: by wibhq7 with SMTP id hq7so6213899wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 23:55:04 -0800 (PST)
Received: by 10.180.96.72 with SMTP id dq8mr76084119wib.10.1325145304589;
	Wed, 28 Dec 2011 23:55:04 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id m30sm7016301wbo.18.2011.12.28.23.55.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 23:55:03 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <42ae58f20c3f62753fc41d798d271e4f8cf6a188.1325115066.git.dvhart@linux.intel.com>
Date: Thu, 29 Dec 2011 08:55:02 +0100
Message-Id: <5E60E0D6-BB14-42A9-AFF2-016DA7FF5034@dominion.thruhere.net>
References: <cover.1325115066.git.dvhart@linux.intel.com>
	<42ae58f20c3f62753fc41d798d271e4f8cf6a188.1325115066.git.dvhart@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] eglibc: Only add eglibc-utils to PACKAGES if wchar is supported
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
X-List-Received-Date: Thu, 29 Dec 2011 08:02:21 -0000
X-Groupsio-MsgNum: 14899
Content-Type: multipart/signed;
	boundary="Apple-Mail=_299AA5CB-958D-4645-BD08-5F32BFE901AC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_299AA5CB-958D-4645-BD08-5F32BFE901AC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 29 dec. 2011, om 00:38 heeft Darren Hart het volgende geschreven:

> eglibc-utils RDEPENDS on bash which requires gettext which requires
> wchar support. If wchar support is not included in DISTRO_FEATURES,
> gettext will fail to compile.

What code in there actually depends on bash and can't we fix it to work =
with stock sh?

>=20
> By removing eglibc-utils from the PACKAGES listing, bitbake doesn't
> try to build the dependency chain.
>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
> meta/recipes-core/eglibc/eglibc-package.inc |    6 +++++-
> 1 files changed, 5 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc =
b/meta/recipes-core/eglibc/eglibc-package.inc
> index 020f558..ab62654 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -20,7 +20,11 @@ USE_LDCONFIG ?=3D "1"
> PKGSUFFIX =3D ""
> PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
>=20
> -PACKAGES =3D "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} =
nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils =
eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic =
${PN}-dev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} =
libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
> +PACKAGES =3D "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} =
nscd${PKGSUFFIX} ldd${PKGSUFFIX} eglibc-extra-nss${PKGSUFFIX} =
eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-doc =
libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} =
${PN}-pcprofile libsotruss${PKGSUFFIX}"
> +
> +# eglibc-utils rdepends on bash which depends on gettext which =
requires wchar
> +# support. Only include it in the PACKAGES list if we can build the =
RDEPENDS.
> +PACKAGES +=3D ${@base_contains('DISTRO_FEATURES', =
'libc-posix-clang-wchar', '${PN}-utils', '', d)}
>=20
> # The ld.so in this eglibc supports the GNU_HASH
> RPROVIDES_${PN} =3D "glibc${PKGSUFFIX} rtld(GNU_HASH)"
> --=20
> 1.7.6.4
>=20


--Apple-Mail=_299AA5CB-958D-4645-BD08-5F32BFE901AC
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk78HNkACgkQMkyGM64RGpFvlwCeOI15HpyqpW/72+IHZgest52C
zxYAn0jTU7Ldf0spopIouurW/C3zuodl
=Qx2i
-----END PGP SIGNATURE-----

--Apple-Mail=_299AA5CB-958D-4645-BD08-5F32BFE901AC--
