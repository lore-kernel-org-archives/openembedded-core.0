Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11832.1604491941228576502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 04:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC24D1474
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2020 04:12:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 574F93F719
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2020 04:12:20 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] json-glib: use PACKAGECONFIG for tests
Date: Wed,  4 Nov 2020 12:12:15 +0000
Message-Id: <20201104121217.4013924-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

json-glib 1.6 has an option to enable or disable the tests, so use that
instead of a do_install_append.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/json-glib/json-glib_1.6.0.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb b/meta/recip=
es-gnome/json-glib/json-glib_1.6.0.bb
index 82f983f3c5b..59b0609900b 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
@@ -23,13 +23,9 @@ SRC_URI +=3D "file://run-ptest \
             file://0001-json-glib-json-enum-types.c.in-fix-build-reprodu=
cibi.patch"
 SRC_URI[archive.sha256sum] =3D "0d7c67602c4161ea7070fab6c5823afd9bd7f7bc=
955f652a50d3753b08494e73"
=20
+PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)}"
 PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native x=
mlto-native"
-
-do_install_append() {
-	if ! ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; t=
hen
-		rm -rf ${D}${datadir}/installed-tests ${D}${libexecdir}
-	fi
-}
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.25.1

