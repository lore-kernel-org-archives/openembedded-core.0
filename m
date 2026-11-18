Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2513.1795024070896778860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 09:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=A0LjRSQv;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32E8B1655
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:47:47 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CCC3C3F632
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795024070; bh=sW+e3/PJdGcQHxPhUGe/7rQSVZQSjyDV2mrT93fgUwc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=A0LjRSQvxJvYTRlSz5VxF0yHeQFyyAkWwIWYKREgs+15crCb2gEKQA+drhAqeLSaw
	 FBsfaNt4zwNe8MczNC5tc1pR3beDEVU6jykLf5JbyAmK9Ww0MJ/jED8uEGIK1zNG4/
	 v3vxNAJgCi4SsriqrwPM2Sw50VuNPDyKxjlRxRi4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3: merge -stringold to -core
Date: Wed, 18 Nov 2026 17:47:43 +0000
Message-ID: <20261118174744.2483235-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118174744.2483235-1-ross.burton@arm.com>
References: <20261118174744.2483235-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 17:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250576
Content-Type: text/plain; charset="utf-8"

The "stringold" module isn't actually "old", it's the original string
module with utility methods and templating code.

It's not deprecated and is small, so merge it into -core, add a RPROVIDES
to preserve existing dependencies, and refresh the manifest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json      | 39 +++++--------------
 1 file changed, 10 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 902f7c31475..f0192365f4a 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -111,8 +111,7 @@
             "io",
             "logging",
             "netclient",
-            "numbers",
-            "stringold"
+            "numbers"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/asyncio",
@@ -189,7 +188,8 @@
         "rprovides": [
             "compression",
             "fcntl",
-            "pkgutil"
+            "pkgutil",
+            "stringold"
         ],
         "rdepends": [],
         "skip_depends": {
@@ -325,6 +325,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/sre_constants.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_parse.py",
             "${libdir}/python${PYTHON_MAJMIN}/stat.py",
+            "${libdir}/python${PYTHON_MAJMIN}/string",
             "${libdir}/python${PYTHON_MAJMIN}/stringprep.py",
             "${libdir}/python${PYTHON_MAJMIN}/struct.py",
             "${libdir}/python${PYTHON_MAJMIN}/subprocess.py",
@@ -537,8 +538,7 @@
             "netclient",
             "numbers",
             "pprint",
-            "shell",
-            "stringold"
+            "shell"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
@@ -598,7 +598,6 @@
             "numbers",
             "pprint",
             "shell",
-            "stringold",
             "unittest"
         ],
         "files": [
@@ -616,8 +615,7 @@
             "io",
             "math",
             "mime",
-            "netclient",
-            "stringold"
+            "netclient"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/email",
@@ -722,7 +720,6 @@
             "io",
             "netserver",
             "pickle",
-            "stringold",
             "threading"
         ],
         "files": [
@@ -739,8 +736,7 @@
             "io",
             "math",
             "mime",
-            "netclient",
-            "stringold"
+            "netclient"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
@@ -874,8 +870,7 @@
             "email",
             "io",
             "math",
-            "mime",
-            "stringold"
+            "mime"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/base64.py",
@@ -1064,17 +1059,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/statistics.*.p=
yc"
         ]
     },
-    "stringold": {
-        "summary": "Common string operations",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/string",
-            "${libdir}/python${PYTHON_MAJMIN}/string/__pycache__"
-        ],
-        "cached": []
-    },
     "syslog": {
         "summary": "Python syslog interface",
         "rdepends": [
@@ -1145,8 +1129,7 @@
             "logging",
             "netclient",
             "numbers",
-            "pprint",
-            "stringold"
+            "pprint"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/unittest",
@@ -1174,8 +1157,7 @@
             "compression",
             "core",
             "logging",
-            "shell",
-            "stringold"
+            "shell"
         ],
         "files": [
             "${bindir}/pyvenv*",
@@ -1209,7 +1191,6 @@
             "netserver",
             "numbers",
             "pydoc",
-            "stringold",
             "xml"
         ],
         "files": [
--=20
2.43.0

