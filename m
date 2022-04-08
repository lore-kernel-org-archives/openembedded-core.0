Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A73FC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5905.1649425104961787000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 06:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A61D4113E
	for <openembedded-core@lists.openembedded.org>;
 Fri,  8 Apr 2022 06:38:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 534B43F5A1
	for <openembedded-core@lists.openembedded.org>;
 Fri,  8 Apr 2022 06:38:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-cryptography: backport fix for leaky test
Date: Fri,  8 Apr 2022 14:38:21 +0100
Message-Id: <20220408133821.469964-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164160

The leaking test case has been fixed upstream, so backport the patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../fix-leak-metric.patch                     | 36 +++++++++++++++++++
 .../skip-leaky-test.patch                     | 19 ----------
 .../python/python3-cryptography_36.0.2.bb     |  2 +-
 3 files changed, 37 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/fix=
-leak-metric.patch
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography/ski=
p-leaky-test.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/fix-leak-m=
etric.patch b/meta/recipes-devtools/python/python3-cryptography/fix-leak-=
metric.patch
new file mode 100644
index 00000000000..904984f43d7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/fix-leak-metric.p=
atch
@@ -0,0 +1,36 @@
+Trigger hashlib initialisation so that the test_create_certificate_with_=
extensions
+test doesn't fail.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From dc989d563ab6a078651160e5e6d4ee3df8cb08d7 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Thu, 7 Apr 2022 03:15:09 -0400
+Subject: [PATCH] Added Ubuntu Jammy to CI (#7047)
+
+* Added Ubuntu Jammy to CI
+
+* try thing
+---
+ .github/workflows/ci.yml                      | 1 +
+ docs/installation.rst                         | 2 +-
+ tests/hazmat/backends/test_openssl_memleak.py | 3 +++
+ 3 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/tests/hazmat/backends/test_openssl_memleak.py b/tests/hazma=
t/backends/test_openssl_memleak.py
+index 835c9256a6..2605566bd5 100644
+--- a/tests/hazmat/backends/test_openssl_memleak.py
++++ b/tests/hazmat/backends/test_openssl_memleak.py
+@@ -82,8 +82,11 @@ def free(ptr, path, line):
+     assert result =3D=3D 1
+=20
+     # Trigger a bunch of initialization stuff.
++    import hashlib
+     from cryptography.hazmat.backends.openssl.backend import backend
+=20
++    hashlib.sha256()
++
+     start_heap =3D set(heap)
+=20
+     try:
diff --git a/meta/recipes-devtools/python/python3-cryptography/skip-leaky=
-test.patch b/meta/recipes-devtools/python/python3-cryptography/skip-leak=
y-test.patch
deleted file mode 100644
index 64248d57bd9..00000000000
--- a/meta/recipes-devtools/python/python3-cryptography/skip-leaky-test.p=
atch
+++ /dev/null
@@ -1,19 +0,0 @@
-Mark as test as expected-failure, OpenSSL is leaking memory.
-
-xfail not skip so we can remove this when OpenSSL doesn't leak anymore.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/tests/hazmat/backends/test_openssl_memleak.py b/tests/hazma=
t/backends/test_openssl_memleak.py
-index 835c9256..639f6ba2 100644
---- a/tests/hazmat/backends/test_openssl_memleak.py
-+++ b/tests/hazmat/backends/test_openssl_memleak.py
-@@ -466,6 +466,7 @@ class TestOpenSSLMemoryLeaks:
-             )
-         )
-=20
-+    @pytest.mark.xfail(reason=3D"has memory leaks")
-     def test_create_certificate_with_extensions(self):
-         assert_no_memory_leaks(
-             textwrap.dedent(
diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb =
b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
index cb3acdf7e28..9ef5ff39c82 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
@@ -16,7 +16,7 @@ SRC_URI +=3D " \
     file://check-memfree.py \
     file://0001-Cargo.toml-specify-pem-version.patch \
     file://0002-Cargo.toml-edition-2018-2021.patch \
-    file://skip-leaky-test.patch \
+    file://fix-leak-metric.patch \
 "
=20
 inherit pypi python_setuptools3_rust
--=20
2.25.1


