Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1A8C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 18:06:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.335.1640023574309238470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB0C46D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:06:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 829F53F774
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:06:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] python3: backport a fix so the test suite passes with
 OpenSSL 3.0.1
Date: Mon, 20 Dec 2021 18:05:58 +0000
Message-Id: <20211220180559.880221-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 18:06:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159893

The test suite makes incorrect assumptions about OpenSSL versions post-
3.0, so backport the fix for the test suite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...enSSL-version-check-for-3.0.1-GH-301.patch | 60 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.1.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-bpo-46114-F=
ix-OpenSSL-version-check-for-3.0.1-GH-301.patch

diff --git a/meta/recipes-devtools/python/python3/0001-bpo-46114-Fix-Open=
SSL-version-check-for-3.0.1-GH-301.patch b/meta/recipes-devtools/python/p=
ython3/0001-bpo-46114-Fix-OpenSSL-version-check-for-3.0.1-GH-301.patch
new file mode 100644
index 00000000000..6f4ceae1889
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-bpo-46114-Fix-OpenSSL-ver=
sion-check-for-3.0.1-GH-301.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 251d2eadc7f5b4042245709f41c38169a284e146 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Fri, 17 Dec 2021 07:38:11 -0800
+Subject: [PATCH] bpo-46114: Fix OpenSSL version check for 3.0.1 (GH-3017=
0)
+
+(cherry picked from commit 2985feac4e02d590bb78bcce9e30864be53280ac)
+
+Co-authored-by: Christian Heimes <christian@python.org>
+---
+ .github/workflows/build.yml                                 | 2 +-
+ Lib/test/test_ssl.py                                        | 6 +++++-
+ .../next/Tests/2021-12-17-14-46-19.bpo-46114.9iyZ_9.rst     | 1 +
+ Tools/ssl/multissltests.py                                  | 2 +-
+ 4 files changed, 8 insertions(+), 3 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Tests/2021-12-17-14-46-19.bpo-46114=
.9iyZ_9.rst
+
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index a485f7d4c3..873db6403d 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -539,7 +539,11 @@ def test_openssl_version(self):
+         self.assertLessEqual(status, 15)
+=20
+         libressl_ver =3D f"LibreSSL {major:d}"
+-        openssl_ver =3D f"OpenSSL {major:d}.{minor:d}.{fix:d}"
++        if major >=3D 3:
++            # 3.x uses 0xMNN00PP0L
++            openssl_ver =3D f"OpenSSL {major:d}.{minor:d}.{patch:d}"
++        else:
++            openssl_ver =3D f"OpenSSL {major:d}.{minor:d}.{fix:d}"
+         self.assertTrue(
+             s.startswith((openssl_ver, libressl_ver)),
+             (s, t, hex(n))
+diff --git a/Misc/NEWS.d/next/Tests/2021-12-17-14-46-19.bpo-46114.9iyZ_9=
.rst b/Misc/NEWS.d/next/Tests/2021-12-17-14-46-19.bpo-46114.9iyZ_9.rst
+new file mode 100644
+index 0000000000..6878cea032
+--- /dev/null
++++ b/Misc/NEWS.d/next/Tests/2021-12-17-14-46-19.bpo-46114.9iyZ_9.rst
+@@ -0,0 +1 @@
++Fix test case for OpenSSL 3.0.1 version. OpenSSL 3.0 uses ``0xMNN00PP0L=
``.
+diff --git a/Tools/ssl/multissltests.py b/Tools/ssl/multissltests.py
+index ba2663e9a3..8fe5b5d0c2 100755
+--- a/Tools/ssl/multissltests.py
++++ b/Tools/ssl/multissltests.py
+@@ -48,7 +48,7 @@
+=20
+ OPENSSL_RECENT_VERSIONS =3D [
+     "1.1.1l",
+-    "3.0.0"
++    "3.0.1"
+ ]
+=20
+ LIBRESSL_OLD_VERSIONS =3D [
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.10.1.bb b/meta/recipe=
s-devtools/python/python3_3.10.1.bb
index 6115ffe5b37..e7ae6871777 100644
--- a/meta/recipes-devtools/python/python3_3.10.1.bb
+++ b/meta/recipes-devtools/python/python3_3.10.1.bb
@@ -33,6 +33,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patc=
h \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-ma=
ste.patch \
+           file://0001-bpo-46114-Fix-OpenSSL-version-check-for-3.0.1-GH-=
301.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.25.1


