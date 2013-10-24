Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id DF7EA6D319
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 11:41:03 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Thu, 24 Oct 2013 13:40:59 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 41E0128D243;
	Thu, 24 Oct 2013 13:40:59 +0200 (CEST)
From: <maxin.john@enea.com>
To: <raj.khem@gmail.com>, <sgw@linux.intel.com>
Date: Thu, 24 Oct 2013 13:40:56 +0200
Message-ID: <1382614856-4421-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <5268EFC6.2010007@linux.intel.com>
References: <5268EFC6.2010007@linux.intel.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH v2] pigz: bump to 2.3.1
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
X-List-Received-Date: Thu, 24 Oct 2013 11:41:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: "Maxin B. John" <maxin.john@enea.com>

Update pigz to latest release - 2.3.1
Drop ldflags.patch as it has been merged upstream

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-extended/pigz/files/ldflags.patch      |   19 ---------------=
----
 meta/recipes-extended/pigz/pigz.inc                 |    6 +-----
 .../pigz/{pigz_2.3.bb =3D> pigz_2.3.1.bb}             |    4 ++--
 3 files changed, 3 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-extended/pigz/files/ldflags.patch
 rename meta/recipes-extended/pigz/{pigz_2.3.bb =3D> pigz_2.3.1.bb} (55%)

diff --git a/meta/recipes-extended/pigz/files/ldflags.patch b/meta/recipes-=
extended/pigz/files/ldflags.patch
deleted file mode 100644
index 8e531cc..0000000
--- a/meta/recipes-extended/pigz/files/ldflags.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Link using the bitbake LDFLAGS.
-
-Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
-
-Upstream-Status: Pending
-
-Index: pigz-2.3/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- pigz-2.3.orig/Makefile
-+++ pigz-2.3/Makefile
-@@ -3,7 +3,7 @@ CFLAGS=3D-O3 -Wall -Wextra
-=20
-=20
- pigz: pigz.o yarn.o zopfli/deflate.o zopfli/blocksplitter.o zopfli/tree.o=
 zopfli/lz77.o zopfli/cache.o zopfli/hash.o zopfli/util.o zopfli/squeeze.o =
zopfli/katajainen.o
--	$(CC) -o pigz $^ -lpthread -lz
-+	$(CC) ${LDFLAGS} -o pigz $^ -lpthread -lz -lm
- 	ln -f pigz unpigz
-=20
- pigz.o: pigz.c yarn.h zopfli/deflate.h zopfli/util.h
diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pi=
gz/pigz.inc
index 5ceaef2..355fb2a 100644
--- a/meta/recipes-extended/pigz/pigz.inc
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -7,10 +7,7 @@ HOMEPAGE =3D "http://zlib.net/pigz/"
 SECTION =3D "console/utils"
 LICENSE =3D "Zlib"
=20
-PR =3D "r1"
-
-SRC_URI =3D "http://zlib.net/pigz/pigz-${PV}.tar.gz \
-           file://ldflags.patch"
+SRC_URI =3D "http://zlib.net/pigz/pigz-${PV}.tar.gz"
=20
 PROVIDES_class-native +=3D "gzip-native"
=20
@@ -33,4 +30,3 @@ ALTERNATIVE_${PN} =3D "gzip gunzip"
 ALTERNATIVE_LINK_NAME[gzip] =3D "${base_bindir}/gzip"
 ALTERNATIVE_LINK_NAME[gunzip] =3D "${base_bindir}/gunzip"
 ALTERNATIVE_PRIORITY =3D "80"
-
diff --git a/meta/recipes-extended/pigz/pigz_2.3.bb b/meta/recipes-extended=
/pigz/pigz_2.3.1.bb
similarity index 55%
rename from meta/recipes-extended/pigz/pigz_2.3.bb
rename to meta/recipes-extended/pigz/pigz_2.3.1.bb
index 724d00b..6e7c7f1 100644
--- a/meta/recipes-extended/pigz/pigz_2.3.bb
+++ b/meta/recipes-extended/pigz/pigz_2.3.1.bb
@@ -1,8 +1,8 @@
 require pigz.inc
 LIC_FILES_CHKSUM =3D "file://pigz.c;beginline=3D7;endline=3D21;md5=3Da21d4=
075cb00ab4ca17fce5e7534ca95"
=20
-SRC_URI[md5sum] =3D "042e3322534f2c3d761736350cac303f"
-SRC_URI[sha256sum] =3D "74bbd5962f9420549fc987ddd1ccda692ec2b29d2d612fbbe2=
6edf3fa348ff21"
+SRC_URI[md5sum] =3D "e803f8bc0770c7a5e96dccb1d2dd2aab"
+SRC_URI[sha256sum] =3D "629b0ce5422a3978f31742bf8275d0be2f84987140d18f390f=
1e3b4e46e0af54"
=20
 NATIVE_PACKAGE_PATH_SUFFIX =3D "/${PN}"
=20
--=20
1.7.10.4


