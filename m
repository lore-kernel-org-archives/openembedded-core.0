Received: from giant.haxx.se ([80.67.6.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjst@giant.haxx.se>) id 1S7TGi-00051m-9w
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 16:04:08 +0100
Received: from giant.haxx.se (localhost.localdomain [127.0.0.1])
	by giant.haxx.se (8.14.4/8.14.4/Debian-2) with ESMTP id q2DErCbm006517
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 13 Mar 2012 15:53:12 +0100
Received: (from bjst@localhost)
	by giant.haxx.se (8.14.4/8.14.4/Submit) id q2DErBlY006511;
	Tue, 13 Mar 2012 15:53:11 +0100
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 15:52:51 +0100
Message-Id: <1331650371-6055-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.9.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by giant.haxx.se id
	q2DErCbm006517
Subject: [PATCH] Add pigz as gzip-native alternative.
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
X-List-Received-Date: Tue, 13 Mar 2012 15:04:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

pigz, which stands for parallel implementation of gzip, is a fully functi=
onal replacement for gzip that exploits multiple processors and multiple =
cores to the hilt when compressing data. pigz was written by Mark Adler, =
and uses the zlib and pthread libraries.

This recipe adds pigz as an alternative provider of gzip-native. Pigz is =
much faster than gzip on multi-core machines.

Upstream-status: Pending
Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-extended/pigz/files/ldflags.patch |   11 +++++++++++
 meta/recipes-extended/pigz/pigz.inc            |   21 ++++++++++++++++++=
+++
 meta/recipes-extended/pigz/pigz_2.2.4.bb       |    9 +++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/pigz/files/ldflags.patch
 create mode 100644 meta/recipes-extended/pigz/pigz.inc
 create mode 100644 meta/recipes-extended/pigz/pigz_2.2.4.bb

diff --git a/meta/recipes-extended/pigz/files/ldflags.patch b/meta/recipe=
s-extended/pigz/files/ldflags.patch
new file mode 100644
index 0000000..534d280
--- /dev/null
+++ b/meta/recipes-extended/pigz/files/ldflags.patch
@@ -0,0 +1,11 @@
+--- pigz-2.2.4/Makefile.orig	2012-01-01 02:46:58.000000000 +0100
++++ pigz-2.2.4/Makefile	2012-03-09 08:47:40.025094863 +0100
+@@ -2,7 +2,7 @@
+ CFLAGS=3D-O3 -Wall -Wextra
+=20
+ pigz: pigz.o yarn.o
+-	$(CC) -o pigz pigz.o yarn.o -lpthread -lz
++	$(CC) $(LDFLAGS) -o pigz pigz.o yarn.o -lpthread -lz
+ 	ln -f pigz unpigz
+=20
+ pigz.o: pigz.c yarn.h
diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/=
pigz/pigz.inc
new file mode 100644
index 0000000..b501d7a
--- /dev/null
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -0,0 +1,21 @@
+SUMMARY =3D "A parallel implementation of gzip"
+DESCRIPTION =3D "pigz, which stands for parallel implementation of gzip,=
 is a \
+fully functional replacement for gzip that exploits multiple processors =
and \
+multiple cores to the hilt when compressing data. pigz was written by Ma=
rk \
+Adler, and uses the zlib and pthread libraries."
+HOMEPAGE =3D "http://zlib.net/pigz/"
+SECTION =3D "console/utils"
+LICENSE =3D "Zlib"
+
+SRC_URI =3D "http://zlib.net/pigz/pigz-${PV}.tar.gz \
+           file://ldflags.patch"
+
+PROVIDES +=3D "gzip-native"
+
+DEPENDS_virtclass-native =3D "zlib-native"
+
+do_install () {
+        install -d ${D}${bindir}
+        install ${B}/pigz ${D}${bindir}/gzip
+        install ${B}/unpigz ${D}${bindir}/gunzip
+}
diff --git a/meta/recipes-extended/pigz/pigz_2.2.4.bb b/meta/recipes-exte=
nded/pigz/pigz_2.2.4.bb
new file mode 100644
index 0000000..598bbe3
--- /dev/null
+++ b/meta/recipes-extended/pigz/pigz_2.2.4.bb
@@ -0,0 +1,9 @@
+require pigz.inc
+
+PR =3D "r0"
+
+BBCLASSEXTEND =3D "native"
+
+SRC_URI[md5sum] =3D "9df2a3c742524446fa4e797c17e8fd85"
+SRC_URI[sha256sum] =3D "7e7967c47f66c07be97cbfa25c8816b72f9d35258466ea31=
eddc7666c914160e"
+LIC_FILES_CHKSUM =3D "file://pigz.c;md5=3D53f47c097bbf11b937a421b1816a8d=
c5"
--=20
1.7.5.4



