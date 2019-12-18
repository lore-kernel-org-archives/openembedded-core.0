Return-Path: <prvs=325539a752=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id F23F27FEBE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 00:16:10 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xBI0AeoX007478 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 18:16:11 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2wvx501gen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 18:16:11 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	xBI0GAVE025278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 18:16:10 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 17 Dec 2019 18:16:10 -0600
Received: from delcastillo3.natinst.com (172.18.68.32) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Tue, 17 Dec 2019 18:16:10 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Dec 2019 18:16:09 -0600
Message-ID: <20191218001609.3750899-3-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218001609.3750899-1-alejandro.delcastillo@ni.com>
References: <20191218001609.3750899-1-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-12-17_05:2019-12-17,2019-12-17 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
Subject: [PATCH 2/2] opkg: upgrade to version 0.4.2
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
X-List-Received-Date: Wed, 18 Dec 2019 00:16:11 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

- Drop open_inner.patch
- Drop opkg_archive.patch
- Remove "remove_test_binaries" function

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/recipes-devtools/opkg/opkg/open_inner.patch   | 46 ------------------
 meta/recipes-devtools/opkg/opkg/opkg_archive.patch | 54 ------------------=
----
 .../opkg/{opkg_0.4.1.bb =3D> opkg_0.4.2.bb}          | 18 ++------
 3 files changed, 3 insertions(+), 115 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/open_inner.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/opkg_archive.patch
 rename meta/recipes-devtools/opkg/{opkg_0.4.1.bb =3D> opkg_0.4.2.bb} (82%)

diff --git a/meta/recipes-devtools/opkg/opkg/open_inner.patch b/meta/recipe=
s-devtools/opkg/opkg/open_inner.patch
deleted file mode 100644
index 278e099e3a..0000000000
--- a/meta/recipes-devtools/opkg/opkg/open_inner.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From alejandro.delcastillo@ni.com Wed Nov 20 22:35:02 2019
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-To: <opkg-devel@googlegroups.com>, <richard.purdie@linuxfoundation.org>
-CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Subject: [opkg][PATCH 2/2] open_inner: add support for empty payloads
-Date: Wed, 20 Nov 2019 16:34:48 -0600
-Message-ID: <20191120223448.26522-3-alejandro.delcastillo@ni.com>
-X-Mailer: git-send-email 2.22.0
-In-Reply-To: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
-References: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
-MIME-Version: 1.0
-Content-Type: text/plain
-Content-Transfer-Encoding: 8bit
-
-Support for empty compressed payloads need to be explicitly enabled on=0D
-libarchive.=0D
-=0D
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>=0D
-
-Upstream-Status: Backport
----=0D
- libopkg/opkg_archive.c | 7 +++++++=0D
- 1 file changed, 7 insertions(+)=0D
-=0D
-diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c=0D
-index 0e9ccea..f19cece 100644=0D
---- a/libopkg/opkg_archive.c=0D
-+++ b/libopkg/opkg_archive.c=0D
-@@ -618,6 +618,13 @@ static struct archive *open_inner(struct archive *out=
er)=0D
-         goto err_cleanup;=0D
-     }=0D
- =0D
-+    r =3D archive_read_support_format_empty(inner);=0D
-+    if (r !=3D ARCHIVE_OK) {=0D
-+        opkg_msg(ERROR, "Empty format not supported: %s\n",=0D
-+                 archive_error_string(inner));=0D
-+        goto err_cleanup;=0D
-+    }=0D
-+=0D
-     r =3D archive_read_open(inner, data, NULL, inner_read, inner_close);=
=0D
-     if (r !=3D ARCHIVE_OK) {=0D
-         opkg_msg(ERROR, "Failed to open inner archive: %s\n",=0D
--- =0D
-2.22.0=0D
-=0D
-
diff --git a/meta/recipes-devtools/opkg/opkg/opkg_archive.patch b/meta/reci=
pes-devtools/opkg/opkg/opkg_archive.patch
deleted file mode 100644
index 3e1ebae953..0000000000
--- a/meta/recipes-devtools/opkg/opkg/opkg_archive.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From alejandro.delcastillo@ni.com Wed Nov 20 22:35:01 2019
-Return-Path: <richard.purdie+caf_=3Drpurdie=3Drpsys.net@linuxfoundation.or=
g>
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-To: <opkg-devel@googlegroups.com>, <richard.purdie@linuxfoundation.org>
-CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Subject: [opkg][PATCH 1/2] opkg_archive.c: avoid double free on uncompress
- error
-Date: Wed, 20 Nov 2019 16:34:47 -0600
-Message-ID: <20191120223448.26522-2-alejandro.delcastillo@ni.com>
-X-Mailer: git-send-email 2.22.0
-In-Reply-To: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
-References: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
-MIME-Version: 1.0
-Content-Type: text/plain
-Content-Transfer-Encoding: 8bit
-
-The open-inner function calls archive_read_open. On error,=0D
-archive_read_open calls inner_close, which also closes the outter=0D
-archive. On error, return NULL directly to avoid double free.=0D
-=0D
-
-Upstream-Status: Backport
-
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>=0D
----=0D
- libopkg/opkg_archive.c | 4 ++--=0D
- 1 file changed, 2 insertions(+), 2 deletions(-)=0D
-=0D
-diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c=0D
-index 3d87db1..0e9ccea 100644=0D
---- a/libopkg/opkg_archive.c=0D
-+++ b/libopkg/opkg_archive.c=0D
-@@ -622,7 +622,7 @@ static struct archive *open_inner(struct archive *oute=
r)=0D
-     if (r !=3D ARCHIVE_OK) {=0D
-         opkg_msg(ERROR, "Failed to open inner archive: %s\n",=0D
-                  archive_error_string(inner));=0D
--        goto err_cleanup;=0D
-+        return NULL;=0D
-     }=0D
- =0D
-     return inner;=0D
-@@ -683,7 +683,7 @@ static struct archive *extract_outer(const char *filen=
ame, const char *arname)=0D
- =0D
-     inner =3D open_inner(outer);=0D
-     if (!inner)=0D
--        goto err_cleanup;=0D
-+        return NULL;=0D
- =0D
-     return inner;=0D
- =0D
--- =0D
-2.22.0=0D
-=0D
-
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.4.2.bb
similarity index 82%
rename from meta/recipes-devtools/opkg/opkg_0.4.1.bb
rename to meta/recipes-devtools/opkg/opkg_0.4.2.bb
index 00ae9c74c2..66a74dc5ed 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.2.bb
@@ -5,7 +5,7 @@ HOMEPAGE =3D "http://code.google.com/p/opkg/"
 BUGTRACKER =3D "http://code.google.com/p/opkg/issues/list"
 LICENSE =3D "GPLv2+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19=
f \
-                    file://src/opkg.c;beginline=3D4;endline=3D18;md5=3D9f5=
a1ad5395378a807d6d591e2f92d25"
+                    file://src/opkg.c;beginline=3D4;endline=3D18;md5=3Dd62=
00b0f2b41dee278aa5fad333eecae"
=20
 DEPENDS =3D "libarchive"
=20
@@ -14,13 +14,11 @@ PE =3D "1"
 SRC_URI =3D "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV=
}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-ru=
n.patch \
-           file://opkg_archive.patch \
-           file://open_inner.patch \
            file://run-ptest \
 "
=20
-SRC_URI[md5sum] =3D "ba0c21305fc93b26e844981ef100dc85"
-SRC_URI[sha256sum] =3D "45ac1e037d3877f635d883f8a555e172883a25d3eeb7986c75=
890fdd31250a43"
+SRC_URI[md5sum] =3D "bd13e5dfc1c2536f0c7b2e15f795278e"
+SRC_URI[sha256sum] =3D "86887852c43457edfff9d8b6d9520f3f1cdd55f25eb600a6eb=
31e1c4e151e106"
=20
 # This needs to be before ptest inherit, otherwise all ptest files end pac=
kaged
 # in libopkg package if OPKGLIBDIR =3D=3D libdir, because default
@@ -47,16 +45,6 @@ PACKAGECONFIG[libsolv] =3D "--with-libsolv,--without-lib=
solv,libsolv"
 EXTRA_OECONF +=3D " --disable-pathfinder"
 EXTRA_OECONF_class-native =3D "--localstatedir=3D/${@os.path.relpath('${lo=
calstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=3D/${@os.path.relpath=
('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
=20
-# Release tarball has unused binaries on the tests folder, automatically c=
reated by automake.
-# For now, delete them to avoid packaging errors (wrong architecture)
-do_unpack_append () {
-    bb.build.exec_func('remove_test_binaries', d)
-}
-
-remove_test_binaries () {
-	rm ${WORKDIR}/opkg-${PV}/tests/libopkg_test*
-}
-
 do_install_append () {
 	install -d ${D}${sysconfdir}/opkg
 	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
--=20
2.11.0


