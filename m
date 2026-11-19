Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1825.1795105883621523549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 08:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=W8PmjOR6;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B62619F0
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:31:20 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4EE13F673
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795105883; bh=yhf6trOL/yriDpX0iPZKaDsDJeuJWrBO6ROyYLOaGr4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W8PmjOR6F22+i4VBarpwy3O3p4Q9g3R7MoPvti/KsFTC4NjwEPfGWYBTDm81hBKrI
	 aqwB2VbJjZJJ8bw85rYzW94JFoWc67fclDk4DSWpZzaaGyxPeg1Cn+2nXNGb/JeZlA
	 2uRpTrtI5tp2VOpkCLfNQV7XNuNHs01XYzwWjVeg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/6] python3: set RPROVIDES for fcntl and pkgutil instead of empty packages
Date: Thu, 19 Nov 2026 16:31:13 +0000
Message-ID: <20261119163117.2242351-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119163117.2242351-1-ross.burton@arm.com>
References: <20261119163117.2242351-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 16:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250704
Content-Type: text/plain; charset="utf-8"

The -fcntl and -pkgutil packages were previously separate but merged
into -core as they became mandatory dependencies.

The -fcntl package had a file in the manifest, but this was already
packaged into -core so the package was actually empty.

Instead of generating empty packages, we can now just RPROVIDE the old
name.

[1] pkgutil in oe-core e6ab9f16b92 ("python3: update to 3.8.1"),
    fcntl in oe-core 0b49c9aa312 ("python3: update 3.12.6 -> 3.13.0")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json      | 23 ++++---------------
 .../recipes-devtools/python/python3_3.15.2.bb |  2 --
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 5f9bfbdf0e7..347d7593339 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -185,6 +185,11 @@
     },
     "core": {
         "summary": "Python interpreter and core modules",
+        "rprovides": [
+            "compression",
+            "fcntl",
+            "pkgutil"
+        ],
         "rdepends": [],
         "skip_depends": {
             "core": [
@@ -634,14 +639,6 @@
         ],
         "cached": []
     },
-    "fcntl": {
-        "summary": "Python's fcntl interface",
-        "rdepends": [
-            "core"
-        ],
-        "files": [],
-        "cached": []
-    },
     "gdbm": {
         "summary": "Python GNU database support",
         "rdepends": [
@@ -810,7 +807,6 @@
             "doctest",
             "email",
             "ensurepip",
-            "fcntl",
             "html",
             "idle",
             "image",
@@ -826,7 +822,6 @@
             "netserver",
             "numbers",
             "pickle",
-            "pkgutil",
             "plistlib",
             "pprint",
             "profile",
@@ -963,14 +958,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shelve.*.pyc"
         ]
     },
-    "pkgutil": {
-        "summary": "Python package extension utility support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [],
-        "cached": []
-    },
     "plistlib": {
         "summary": "Generate and parse Mac OS X .plist files",
         "rdepends": [
diff --git a/meta/recipes-devtools/python/python3_3.15.2.bb b/meta/recipe=
s-devtools/python/python3_3.15.2.bb
index 13d10face62..61eabc07b54 100644
--- a/meta/recipes-devtools/python/python3_3.15.2.bb
+++ b/meta/recipes-devtools/python/python3_3.15.2.bb
@@ -480,9 +480,7 @@ python(){
     # Prepending so to avoid python-misc getting everything
     packages =3D newpackages + packages
     d.setVar('PACKAGES', ' '.join(packages))
-    d.setVar('ALLOW_EMPTY:${PN}-fcntl', '1')
     d.setVar('ALLOW_EMPTY:${PN}-modules', '1')
-    d.setVar('ALLOW_EMPTY:${PN}-pkgutil', '1')
=20
     if "pgo" in d.getVar("PACKAGECONFIG").split() and not bb.utils.conta=
ins('MACHINE_FEATURES', 'qemu-usermode', True, False, d):
         bb.fatal("pgo cannot be enabled as there is no qemu-usermode sup=
port for this architecture/machine")
--=20
2.43.0

