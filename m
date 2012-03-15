Received: from giant.haxx.se ([80.67.6.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjst@giant.haxx.se>) id 1S8698-0005je-RZ
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 09:34:54 +0100
Received: from giant.haxx.se (localhost.localdomain [127.0.0.1])
	by giant.haxx.se (8.14.4/8.14.4/Debian-2) with ESMTP id q2F8Q5sB014709
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 15 Mar 2012 09:26:05 +0100
Received: (from bjst@localhost)
	by giant.haxx.se (8.14.4/8.14.4/Submit) id q2F8Q57e014707;
	Thu, 15 Mar 2012 09:26:05 +0100
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 09:25:45 +0100
Message-Id: <1331799945-14172-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <22576197.WV0krj9sgO@helios>
References: <22576197.WV0krj9sgO@helios>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by giant.haxx.se id
	q2F8Q5sB014709
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
X-List-Received-Date: Thu, 15 Mar 2012 08:34:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

pigz, which stands for parallel implementation of gzip, is a fully functi=
onal replacement for gzip that exploits multiple processors and multiple =
cores to the hilt when compressing data. pigz was written by Mark Adler, =
and uses the zlib and pthread libraries.

This recipe adds pigz as an alternative gzip-native implementation only.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-extended/pigz/files/ldflags.patch |   17 +++++++++++++++++
 meta/recipes-extended/pigz/pigz.inc            |   21 ++++++++++++++++++=
+++
 meta/recipes-extended/pigz/pigz_2.2.4.bb       |    9 +++++++++
 3 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/pigz/files/ldflags.patch
 create mode 100644 meta/recipes-extended/pigz/pigz.inc
 create mode 100644 meta/recipes-extended/pigz/pigz_2.2.4.bb

diff --git a/meta/recipes-extended/pigz/files/ldflags.patch b/meta/recipe=
s-extended/pigz/files/ldflags.patch
new file mode 100644
index 0000000..928c3a5
--- /dev/null
+++ b/meta/recipes-extended/pigz/files/ldflags.patch
@@ -0,0 +1,17 @@
+Link using the bitbake LDFLAGS.
+
+Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
+
+Upstream-Status: Pending
+
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
index 0000000..acf1b71
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
+PROVIDES_virtclass-native +=3D "gzip-native"
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



