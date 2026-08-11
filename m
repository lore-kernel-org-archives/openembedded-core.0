Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B5BC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 22:28:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1356.1786487277545413296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 15:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DXghB2TE;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B74AF1516
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 15:27:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B7F53F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 15:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786487276; bh=TcwfxNpwXBD0Agwf07Ld66R5iZAyxAJYFEaoIFJGjiE=;
	h=From:To:Subject:Date:From;
	b=DXghB2TEkRCVxS1nyiYegeVsoVObKzvtWcWT5BjW38/shH2EAgvynMc14pulImDwl
	 dojguhmzbh9uu8jPfERoZVG1kJ6EaSUd8+D8zAUBgJ2QcM3kDuPf2EJUHYUqYTQ5A9
	 k6meejtBIQHoBWyegm/b07I7KmkmrJzMujia7I1I=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipes: add python3-wheel-native dependency where required
Date: Tue, 11 Aug 2026 23:27:52 +0100
Message-ID: <20260811222752.4065164-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 22:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243223

Some packages have a spurious wheel build-dependency. This is almost
certainly not actually needed, but until it is removed upstream we need
to add it to DEPENDS now that the packaging classes don't pull it in.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb            | 2 +-
 meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb      | 2 ++
 .../python/python3-license-expression_30.4.4.bb                 | 2 +-
 meta/recipes-devtools/python/python3-mako_1.3.12.bb             | 2 ++
 meta/recipes-devtools/python/python3-pycparser_3.0.bb           | 2 ++
 meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb       | 2 ++
 .../python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb      | 2 ++
 meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb            | 2 +-
 8 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb b/meta/=
recipes-devtools/python/python3-bcrypt_5.0.0.bb
index 6397ecd8182..51b7edef8cf 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
@@ -3,7 +3,7 @@ LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8f7bb094c7232b058c7e9f2e431f3=
89c"
 HOMEPAGE =3D "https://pypi.org/project/bcrypt/"
=20
-DEPENDS +=3D "python3-cffi-native"
+DEPENDS +=3D "python3-cffi-native python3-wheel-native"
 LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-fuse-ld=
=3Dbfd', '', d)}"
=20
 SRC_URI[sha256sum] =3D "f748f7c2d6fd375cc93d3fba7ef4a9e3a092421b8dbf34d8=
d4dc06be9492dfdd"
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb b=
/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
index 70ae7877a1f..09dbbf741a7 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
@@ -15,6 +15,8 @@ SRC_URI +=3D " \
=20
 SRC_URI[sha256sum] =3D "d8d6091753d0669db3c90c5e5b346cb37c72f3dd9378c841=
3acb1fd5da63f7ea"
=20
+DEPENDS +=3D "python3-wheel-native"
+
 RDEPENDS:${PN} +=3D " \
     python3-attrs \
     python3-compression \
diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4=
.4.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
index 7300853b441..5751542cb33 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] =3D "73448f0aacd8d0808895bdc4b2c8e01a8=
d67646e4188f887375398c761
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 PYPI_PACKAGE =3D "license_expression"
=20
-DEPENDS +=3D "python3-setuptools-scm-native"
+DEPENDS +=3D "python3-setuptools-scm-native python3-wheel-native"
=20
 RDEPENDS:${PN} +=3D "\
     python3-booleanpy \
diff --git a/meta/recipes-devtools/python/python3-mako_1.3.12.bb b/meta/r=
ecipes-devtools/python/python3-mako_1.3.12.bb
index b2c1a8dad8d..f70398f2c21 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.12.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
@@ -10,6 +10,8 @@ inherit pypi python_setuptools_build_meta ptest-python-=
pytest
=20
 SRC_URI[sha256sum] =3D "9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b9=
42088b7fd7af550a"
=20
+DEPENDS +=3D "python3-wheel-native"
+
 RDEPENDS:${PN} =3D "python3-html \
                   python3-markupsafe \
                   python3-misc \
diff --git a/meta/recipes-devtools/python/python3-pycparser_3.0.bb b/meta=
/recipes-devtools/python/python3-pycparser_3.0.bb
index c17be9b2d4d..ea7b7cc14b5 100644
--- a/meta/recipes-devtools/python/python3-pycparser_3.0.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
@@ -9,6 +9,8 @@ inherit pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
+DEPENDS +=3D "python3-wheel-native"
+
 RDEPENDS:${PN}:class-target +=3D "\
     python3-netclient \
 "
diff --git a/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb b/=
meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb
index 7de70942a97..474b5cdece4 100644
--- a/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "4c48f78f62ab596c679086084d0dd1325=
4ae4f3d6c72a83ffdf5ebdef8
=20
 inherit pypi python_setuptools_build_meta
=20
+DEPENDS +=3D "python3-wheel-native"
+
 RDEPENDS:${PN} +=3D " \
     python3-numbers \
 "
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfco=
nverter_2.1.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-svg=
2pdfconverter_2.1.0.bb
index ec5d4c8c9ad..6b5350f46cb 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter=
_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter=
_2.1.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "9756e82d5f3bf11629ffcbafb1f8a1092=
d3bb4789e33494032cdce9a9c
=20
 inherit pypi python_setuptools_build_meta
=20
+DEPENDS +=3D "python3-wheel-native"
+
 PYPI_PACKAGE =3D "sphinxcontrib_svg2pdfconverter"
=20
 RDEPENDS:${PN} =3D "python3-sphinx"
diff --git a/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb b/meta/=
recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
index 4092b3e8b7c..3b51a453b99 100644
--- a/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
+++ b/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE =3D "qemu_qmp"
=20
 SRC_URI[sha256sum] =3D "a3c25d871fab549122b2340810de1f99481002c942a21324=
76b062aacdbf6e92"
=20
-DEPENDS +=3D "python3-setuptools-scm-native"
+DEPENDS +=3D "python3-setuptools-scm-native python3-wheel-native"
=20
 RDEPENDS:${PN} +=3D "python3-core python3-asyncio"
=20
--=20
2.43.0


