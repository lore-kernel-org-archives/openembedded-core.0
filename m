Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0250C3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 19:02:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18909.1721847714425864715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 12:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58D61FEC
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 12:02:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 760F43F766
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 12:01:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-jsonpointer: upgrade 2.4 -> 3.0.0
Date: Wed, 24 Jul 2024 20:01:36 +0100
Message-Id: <20240724190136.3819101-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 19:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202478

Also re-arrange the recipe to match conventional order.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ter_2.4.bb =3D> python3-jsonpointer_3.0.0.bb} | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_2.4.bb =3D> pyt=
hon3-jsonpointer_3.0.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb b/me=
ta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-jsonpointer_2.4.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb
index 062fa5243f9..0a23dc31002 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.0.0.bb
@@ -5,16 +5,18 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D32b15c84=
3b7a329130f4e266a281ebb3"
=20
 inherit pypi ptest setuptools3
=20
-SRC_URI[sha256sum] =3D "585cee82b70211fa9e6043b7bb89db6e1aa49524340dde8a=
d6b63206ea689d88"
+SRC_URI[sha256sum] =3D "2b2d729f2091522d61c3b31f82e11870f60b68f43fbc705c=
b76bf4b832af59ef"
=20
-RDEPENDS:${PN} +=3D " \
-    python3-json \
+SRC_URI +=3D " \
+	file://run-ptest \
 "
=20
-BBCLASSEXTEND =3D "native nativesdk"
+do_install_ptest() {
+	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
+}
=20
-SRC_URI +=3D " \
-	file://run-ptest \
+RDEPENDS:${PN} +=3D " \
+    python3-json \
 "
=20
 RDEPENDS:${PN}-ptest +=3D " \
@@ -23,6 +25,4 @@ RDEPENDS:${PN}-ptest +=3D " \
 	python3-unittest-automake-output \
 "
=20
-do_install_ptest() {
-	cp -f ${S}/tests.py ${D}${PTEST_PATH}/
-}
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


