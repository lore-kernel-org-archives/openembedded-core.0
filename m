Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 84D36776C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 20:30:52 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2017 13:30:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,160,1486454400"; 
	d="asc'?scan'208";a="67035027"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.117])
	([10.219.128.117])
	by orsmga004.jf.intel.com with ESMTP; 13 Mar 2017 13:30:53 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
	<a3fe53ae33e80c917e2897d49a91c191bb230616.1484667160.git.jose.a.lamego@linux.intel.com>
	<267c07ef-e6d0-7bf4-bcd1-b79ffa11844f@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <bab5d5a4-31d1-11dd-21a1-e1e5c290dd1f@linux.intel.com>
Date: Mon, 13 Mar 2017 14:30:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <267c07ef-e6d0-7bf4-bcd1-b79ffa11844f@linux.intel.com>
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
X-List-Received-Date: Mon, 13 Mar 2017 20:30:54 -0000
X-Groupsio-MsgNum: 94671
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="WduqVSme06S94J5tPVbG2X7iCjD9TERHT"

--WduqVSme06S94J5tPVbG2X7iCjD9TERHT
Content-Type: multipart/mixed; boundary="qp2hediNurdaO8hVkbKDikC0rgGmFQP3x";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <bab5d5a4-31d1-11dd-21a1-e1e5c290dd1f@linux.intel.com>
Subject: Re: [OE-core] [PATCH 1/3] distutils3.bbclass: add egg
 files/directories to python path
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
 <a3fe53ae33e80c917e2897d49a91c191bb230616.1484667160.git.jose.a.lamego@linux.intel.com>
 <267c07ef-e6d0-7bf4-bcd1-b79ffa11844f@linux.intel.com>
In-Reply-To: <267c07ef-e6d0-7bf4-bcd1-b79ffa11844f@linux.intel.com>

--qp2hediNurdaO8hVkbKDikC0rgGmFQP3x
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Ping

On 02/08/2017 04:30 PM, Jose Lamego wrote:
> Ping.
>=20
> On 01/17/2017 09:42 AM, Jose Lamego wrote:
>> Packages that use .egg files or directories for installation may
>> not be found when imported at the python3 interpreter.
>> .egg files/directories path must be included in a .pth file to
>> be appropriately included in python path.
>>
>> This change looks for .egg files/directories in sitepackages
>> and adds its path to a .pth file during package installation.
>> It ensures that any new package that uses .egg files/recipes
>> will be appropriately added to path by performing the check from
>> the distutils3 class.
>>
>> [YOCTO #8673]
>>
>> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
>> ---
>>  meta/classes/distutils3.bbclass | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3=
=2Ebbclass
>> index a6720c5..f8e2e2e 100644
>> --- a/meta/classes/distutils3.bbclass
>> +++ b/meta/classes/distutils3.bbclass
>> @@ -68,6 +68,16 @@ distutils3_do_install() {
>>              mv -f ${D}${datadir}/share/* ${D}${datadir}/
>>              rmdir ${D}${datadir}/share
>>          fi
>> +
>> +        # detect if .egg files/directories were created and add their=

>> +        # path to a .pth file
>> +        SHORT_PN=3D$(echo "${PN}" | sed 's/${PYTHON_PN}-//g')
>> +        if test -e ${D}${PYTHON_SITEPACKAGES_DIR}/${SHORT_PN}*.egg; t=
hen
>> +            EGG_NAME=3D$(basename $(find ${D}${PYTHON_SITEPACKAGES_DI=
R}/ \
>> +-name ${SHORT_PN}\*.egg))
>> +            echo "./${EGG_NAME}" > ${D}${PYTHON_SITEPACKAGES_DIR}/\
>> +${SHORT_PN}.pth
>> +        fi
>>  }
>>  distutils3_do_install[vardepsexclude] =3D "MACHINE"
>> =20
>>
>=20
>=20
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--qp2hediNurdaO8hVkbKDikC0rgGmFQP3x--

--WduqVSme06S94J5tPVbG2X7iCjD9TERHT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYxwF/AAoJEFJAtowlSEbn7lwH/29n4C684ZcJBJ95H7SeIShR
dkSLJZQel69miDIPpQ14WWiE30rZ8epqus8YRXEV0OXd55dFHtuqYhPxenXStVIX
N41AygJfspo1W3g3JKEdtoGPIMLmi6Mg12bC+342F/C8pODD7tWWZKFoFfj9Pl9J
VNwOuSqxjOcd0QhEvWyKGeW+JMElc8DtlRbZOddnl7co5M6QeG5MxHy/KTwlA9wl
JZMG3sE+U9MRSd1p0gAC3yKrzBz3ygNBcf+KaFwTCCZ/HXCrg21G16SGegcgczmX
fsV1O1aJ4lMjCCrbw7912l4vsoVayGGHZv8O73LxbFs8/j4UJXejBiFxMdKNE9U=
=F4l/
-----END PGP SIGNATURE-----

--WduqVSme06S94J5tPVbG2X7iCjD9TERHT--
