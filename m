Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW9Dr-0004Co-1I
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 17:10:56 +0100
Received: by mail-ey0-f175.google.com with SMTP id d13so2372676eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 08:04:15 -0800 (PST)
Received: by 10.14.9.149 with SMTP id 21mr214110eet.108.1322755452569;
	Thu, 01 Dec 2011 08:04:12 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z54sm18876715eeh.5.2011.12.01.08.04.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 08:04:11 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111201160100.GD32202@jama.jama.net>
Date: Thu, 1 Dec 2011 17:04:11 +0100
Message-Id: <F24C29C8-6AC4-47DF-BADB-02AFE6B16C0E@dominion.thruhere.net>
References: <1322754516-32720-1-git-send-email-koen@dominion.thruhere.net>
	<20111201160100.GD32202@jama.jama.net>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] zlib 1.2.5: install pkgconfig file, needed for e.g. modern webkit
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
X-List-Received-Date: Thu, 01 Dec 2011 16:10:56 -0000
X-Groupsio-MsgNum: 13457
Content-Type: multipart/signed;
	boundary="Apple-Mail=_92F9A70A-D144-4375-AD31-5458836AF560";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_92F9A70A-D144-4375-AD31-5458836AF560
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

/me puts on dunce cap

Op 1 dec. 2011, om 17:01 heeft Martin Jansa het volgende geschreven:

> On Thu, Dec 01, 2011 at 04:48:36PM +0100, Koen Kooi wrote:
>> Upstream has grown cmake support which would allow us to dump the OE =
autotools hack, but the cmakefile doesn't install the .pc file either =
and breaks with zlib-native
>>=20
>> Also remove unused site config file
>=20
> ^^ this is not true anymore..
>=20
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-core/zlib/zlib_1.2.5.bb |   18 ++++++++++++++++--
>> 1 files changed, 16 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/zlib/zlib_1.2.5.bb =
b/meta/recipes-core/zlib/zlib_1.2.5.bb
>> index bca400c..b5756d9 100644
>> --- a/meta/recipes-core/zlib/zlib_1.2.5.bb
>> +++ b/meta/recipes-core/zlib/zlib_1.2.5.bb
>> @@ -7,12 +7,12 @@ LICENSE =3D "Zlib"
>> LIC_FILES_CHKSUM =3D =
"file://zlib.h;beginline=3D4;endline=3D23;md5=3D084e9c30e4e6272c3b057b13c6=
467f3d"
>>=20
>> DEPENDS =3D "libtool-cross"
>> -PR =3D "r1"
>> +PR =3D "r3"
>>=20
>> SRC_URI =3D "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
>>            file://configure.ac \
>>            file://Makefile.am \
>> -	   file://fix.inverted.LFS.logic.patch"
>> +           file://fix.inverted.LFS.logic.patch"
>>=20
>> SRC_URI[md5sum] =3D "be1e89810e66150f5b0327984d8625a0"
>> SRC_URI[sha256sum] =3D =
"239aead2f22f16bfcfa6a6a5150dcbd6d6f2e4d1eaa8727b5769ea014120b307"
>> @@ -24,4 +24,18 @@ do_configure_prepend () {
>> 	cp ${WORKDIR}/Makefile.am ${S}/
>> }
>>=20
>> +do_install_append () {
>> +	sed \
>> +		-e 's:@prefix@:${prefix}:' \
>> +		-e 's:@exec_prefix@:${exec_prefix}:' \
>> +		-e 's:@libdir@:${libdir}:' \
>> +		-e 's:@sharedlibdir@:${libdir}:' \
>> +		-e 's:@includedir@:${includedir}:' \
>> +		-e 's:@VERSION@:${PV}:' \
>> +		zlib.pc.in > zlib.pc
>> +
>> +	install -d ${D}${libdir}/pkgconfig
>> +	install -m 0644 zlib.pc ${D}${libdir}/pkgconfig/
>> +}
>> +
>> BBCLASSEXTEND =3D "native nativesdk"
>> --=20
>> 1.7.2.5
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


--Apple-Mail=_92F9A70A-D144-4375-AD31-5458836AF560
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XpXsACgkQMkyGM64RGpGF6QCeO5X4f8lNN8aQpB80P89loSx/
R+YAn2QvTQ3MzKBqiWAMUNR3yXFl8aLa
=QiOa
-----END PGP SIGNATURE-----

--Apple-Mail=_92F9A70A-D144-4375-AD31-5458836AF560--
