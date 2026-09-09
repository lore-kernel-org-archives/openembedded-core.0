Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61372C79FBD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 15:19:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15092.1788967152392334106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 08:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=lyxMOZCF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06FAB1691
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Sep 2026 08:19:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 766843FA32
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Sep 2026 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788967151; bh=lniSAjNG3ab5xldvyP9xympAstvCZGns4p5E6BT57SI=;
	h=From:To:Subject:Date:From;
	b=lyxMOZCFdyD7GNHe/RBEks6qeBxIoYYTaV7bVzQJBGa5fQEEwYqwe7J0qNeItbosH
	 UxsWwpgq9T2bgRMbgiCIae4b7k5oZsdWOypsayGXEo5kKcf/FiXwyzSBrxjy6PP5q5
	 WRVf21k5cMd/D8o+NuYz5+79o180bSJKxKZAkpvA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] classes/setuptools: use tomllib instead of regex to parse pyproject.toml
Date: Wed,  9 Sep 2026 16:19:05 +0100
Message-ID: <20260909151906.3417094-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 15:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245478

BitBake now vendors in tomli[1] for when the host Python is older than
3.11 so doesn't have tomllib. Rewrite the pyproject.toml parsing from
regexs to tomllib.

Also ensure that the functions in setuptools3 and setuptools_legacy are
identical, as they had diverged.

[1] bitbake 69810e0c0a ("lib/bb/_vendor: resync to add tomli")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/setuptools3.bbclass       | 24 +++++++++++----
 .../classes-recipe/setuptools3_legacy.bbclass | 29 ++++++++++++++-----
 2 files changed, 40 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recip=
e/setuptools3.bbclass
index b0e4ab5208c..8e0fdff9e9d 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -13,19 +13,31 @@ SETUPTOOLS_BUILD_ARGS ?=3D ""
 SETUPTOOLS_SETUP_PATH ?=3D "${S}"
=20
 python do_check_backend() {
+    """
+    Check if this package has a pyproject.toml that specifies a PEP517 b=
uild backend, so should be
+    using a different build class.
+    """
+
     if "pep517-backend" in (d.getVar("INSANE_SKIP") or "").split():
         return
=20
-    import re
+    try:
+        import tomllib
+    except ImportError:
+        import bb._vendor_tomli as tomllib
+
     filename =3D d.expand("${SETUPTOOLS_SETUP_PATH}/pyproject.toml")
     if os.path.exists(filename):
-        for line in open(filename):
-            match =3D re.match(r"build-backend\s*=3D\s*\W([\w.]+)\W", li=
ne)
-            if not match: continue
+        with open(filename, "rb") as f:
+            toml =3D tomllib.load(f)
=20
-            msg =3D f"inherits setuptools3 but has pyproject.toml with {=
match[1]}, use the correct class"
+        try:
+            backend =3D toml["build-system"]["build-backend"]
+            msg =3D f"inherits setuptools3 but has pyproject.toml specif=
ying backend {backend}, use the correct class"
             oe.qa.handle_error("pep517-backend", msg, d)
-    oe.qa.exit_if_errors(d)
+            oe.qa.exit_if_errors(d)
+        except KeyError:
+            return
 }
 addtask check_backend after do_patch before do_configure
=20
diff --git a/meta/classes-recipe/setuptools3_legacy.bbclass b/meta/classe=
s-recipe/setuptools3_legacy.bbclass
index 6b51b9796bc..102d0827538 100644
--- a/meta/classes-recipe/setuptools3_legacy.bbclass
+++ b/meta/classes-recipe/setuptools3_legacy.bbclass
@@ -31,16 +31,31 @@ SETUPTOOLS_PYTHON:class-native =3D "nativepython3"
 SETUPTOOLS_SETUP_PATH ?=3D "${S}"
=20
 python do_check_backend() {
-    import re
+    """
+    Check if this package has a pyproject.toml that specifies a PEP517 b=
uild backend, so should be
+    using a different build class.
+    """
+
+    if "pep517-backend" in (d.getVar("INSANE_SKIP") or "").split():
+        return
+
+    try:
+        import tomllib
+    except ImportError:
+        import bb._vendor_tomli as tomllib
+
     filename =3D d.expand("${SETUPTOOLS_SETUP_PATH}/pyproject.toml")
     if os.path.exists(filename):
-        for line in open(filename):
-            match =3D re.match(r"build-backend\s*=3D\s*\W([\w.]+)\W", li=
ne)
-            if not match: continue
+        with open(filename, "rb") as f:
+            toml =3D tomllib.load(f)
=20
-            msg =3D f"inherits setuptools3_legacy but has pyproject.toml=
 with {match[1]}, use the correct class"
-            if "pep517-backend" not in (d.getVar("INSANE_SKIP") or "").s=
plit():
-                oe.qa.handle_error("pep517-backend", msg, d)
+        try:
+            backend =3D toml["build-system"]["build-backend"]
+            msg =3D f"inherits setuptools3_legacy but has pyproject.toml=
 specifying backend {backend}, use the correct class"
+            oe.qa.handle_error("pep517-backend", msg, d)
+            oe.qa.exit_if_errors(d)
+        except KeyError:
+            return
 }
 addtask check_backend after do_patch before do_configure
=20
--=20
2.43.0


