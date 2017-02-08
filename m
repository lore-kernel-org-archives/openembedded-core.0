Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E0487719B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 22:30:47 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 08 Feb 2017 14:30:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; 
	d="asc'?scan'208";a="62821922"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.117])
	([10.219.128.117])
	by fmsmga005.fm.intel.com with ESMTP; 08 Feb 2017 14:30:47 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
	<a3fe53ae33e80c917e2897d49a91c191bb230616.1484667160.git.jose.a.lamego@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <267c07ef-e6d0-7bf4-bcd1-b79ffa11844f@linux.intel.com>
Date: Wed, 8 Feb 2017 16:30:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <a3fe53ae33e80c917e2897d49a91c191bb230616.1484667160.git.jose.a.lamego@linux.intel.com>
Subject: Re: [PATCH 1/3] distutils3.bbclass: add egg files/directories to python path
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
X-List-Received-Date: Wed, 08 Feb 2017 22:30:48 -0000
X-Groupsio-MsgNum: 93046
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="bsNdoGdRhi0jJ3bDvJauRRWQ3pMQLhRp7"

--bsNdoGdRhi0jJ3bDvJauRRWQ3pMQLhRp7
Content-Type: multipart/mixed; boundary="wK9kxfLIq47K5WNMlqL5t2TSoTNEuGQf1";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <267c07ef-e6d0-7bf4-bcd1-b79ffa11844f@linux.intel.com>
Subject: Re: [OE-core] [PATCH 1/3] distutils3.bbclass: add egg
 files/directories to python path
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
 <a3fe53ae33e80c917e2897d49a91c191bb230616.1484667160.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <a3fe53ae33e80c917e2897d49a91c191bb230616.1484667160.git.jose.a.lamego@linux.intel.com>

--wK9kxfLIq47K5WNMlqL5t2TSoTNEuGQf1
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Ping.

On 01/17/2017 09:42 AM, Jose Lamego wrote:
> Packages that use .egg files or directories for installation may
> not be found when imported at the python3 interpreter.
> .egg files/directories path must be included in a .pth file to
> be appropriately included in python path.
>=20
> This change looks for .egg files/directories in sitepackages
> and adds its path to a .pth file during package installation.
> It ensures that any new package that uses .egg files/recipes
> will be appropriately added to path by performing the check from
> the distutils3 class.
>=20
> [YOCTO #8673]
>=20
> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
> ---
>  meta/classes/distutils3.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.=
bbclass
> index a6720c5..f8e2e2e 100644
> --- a/meta/classes/distutils3.bbclass
> +++ b/meta/classes/distutils3.bbclass
> @@ -68,6 +68,16 @@ distutils3_do_install() {
>              mv -f ${D}${datadir}/share/* ${D}${datadir}/
>              rmdir ${D}${datadir}/share
>          fi
> +
> +        # detect if .egg files/directories were created and add their
> +        # path to a .pth file
> +        SHORT_PN=3D$(echo "${PN}" | sed 's/${PYTHON_PN}-//g')
> +        if test -e ${D}${PYTHON_SITEPACKAGES_DIR}/${SHORT_PN}*.egg; th=
en
> +            EGG_NAME=3D$(basename $(find ${D}${PYTHON_SITEPACKAGES_DIR=
}/ \
> +-name ${SHORT_PN}\*.egg))
> +            echo "./${EGG_NAME}" > ${D}${PYTHON_SITEPACKAGES_DIR}/\
> +${SHORT_PN}.pth
> +        fi
>  }
>  distutils3_do_install[vardepsexclude] =3D "MACHINE"
> =20
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--wK9kxfLIq47K5WNMlqL5t2TSoTNEuGQf1--

--bsNdoGdRhi0jJ3bDvJauRRWQ3pMQLhRp7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYm5wXAAoJEFJAtowlSEbnR6QH/RDvysBLowLLyqebQ2mh2kSC
B2Nzsw33W1kBf0qevdRt1mjA96FjN9G+xmLq1OQF0XpUIJH3AWu/x2TWMs2Zb9Xu
ywkxq6zF9iK3keasFJbDlHwgITiD73lL/f4/jFUkS4UowgAGX+6GAekFKTVgy7lR
Z9t5ekxB/ZOmkaDTZQ3HXDBTRoAdT5AfViNs6AIUR3D749UAKF2YF6MaXohYnbFW
W7DnUKN7EOI4YnKUErNRPkBEGIczshdOP2Al/B8GMKbLNB5+Ui+Tptgtm00Ev0YN
0estDRZngZ9Ei1DGWKOs+EoqADrz/4Sxqr7haAQ/zkez98z+SZViO9ez0NBpIa0=
=LwBE
-----END PGP SIGNATURE-----

--bsNdoGdRhi0jJ3bDvJauRRWQ3pMQLhRp7--
