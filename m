Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id 8F8D37C083
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 22:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 17:04:33 -0500
Message-Id: <20190114220433.14356-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Subject: [PATCH] openssl: move c_rehash pkg to avoid perl dep
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
X-List-Received-Date: Mon, 14 Jan 2019 22:04:26 -0000
Content-Transfer-Encoding: quoted-printable

Perl and its dependencies have a decent footprint impact.  On my
xz compressed filesystem:

634880: /usr/lib/libperl.so.5.24.4

Put c_rehash in the openssl-misc package so the dependency can be
avoided where it isn't needed.

Change-Id: Iae9bccabfb1c8cfa1401ca6785abc39713d3fdf0
Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/r=
ecipes-connectivity/openssl/openssl_1.1.1a.bb
index 5c4e69cfb7..7d26654921 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -190,14 +190,13 @@ FILES_libcrypto =3D "${libdir}/libcrypto${SOLIBS}"
 FILES_libssl =3D "${libdir}/libssl${SOLIBS}"
 FILES_openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf"
 FILES_${PN}-engines =3D "${libdir}/engines-1.1"
-FILES_${PN}-misc =3D "${libdir}/ssl-1.1/misc"
+FILES_${PN}-misc =3D "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
 FILES_${PN} =3D+ "${libdir}/ssl-1.1/*"
 FILES_${PN}_append_class-nativesdk =3D " ${SDKPATHNATIVE}/environment-se=
tup.d/openssl.sh"
=20
 CONFFILES_openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf"
=20
 RRECOMMENDS_libcrypto +=3D "openssl-conf"
-RDEPENDS_${PN}-bin =3D "perl"
 RDEPENDS_${PN}-misc =3D "perl"
 RDEPENDS_${PN}-ptest +=3D "openssl-bin perl perl-modules bash python"
=20
--=20
2.20.1

