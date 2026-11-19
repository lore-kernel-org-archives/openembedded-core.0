Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1883.1795105884074343000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 08:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cINPY80m;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CFF61C00
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:31:20 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 40ACD3F673
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795105883; bh=pIMaUrRXscRT7xvzZgZFTBjY18HqCob0AglWFiqRO7M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cINPY80mKnk47G4B5I57elbp8oro1Ak/bkCGVJ5wfaX2KuxQsMJXClr8QsXY6uH/D
	 viF59AsEg0M7hLDPyPxIcudZt8K+oZMB3weEkzqlYvYfI7yClS8SrKByF2zyGZYYpm
	 zMy5ADmm2pX3Rw2x5Kjrzr81mvsQXn0WemDyXDZI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/6] python3: merge -stringold to -core
Date: Thu, 19 Nov 2026 16:31:14 +0000
Message-ID: <20261119163117.2242351-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119163117.2242351-1-ross.burton@arm.com>
References: <20261119163117.2242351-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 16:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250705
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
index 347d7593339..901d71ec9ee 100644
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
@@ -188,7 +187,8 @@
         "rprovides": [
             "compression",
             "fcntl",
-            "pkgutil"
+            "pkgutil",
+            "stringold"
         ],
         "rdepends": [],
         "skip_depends": {
@@ -326,6 +326,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/sre_constants.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_parse.py",
             "${libdir}/python${PYTHON_MAJMIN}/stat.py",
+            "${libdir}/python${PYTHON_MAJMIN}/string",
             "${libdir}/python${PYTHON_MAJMIN}/stringprep.py",
             "${libdir}/python${PYTHON_MAJMIN}/struct.py",
             "${libdir}/python${PYTHON_MAJMIN}/subprocess.py",
@@ -539,8 +540,7 @@
             "netclient",
             "numbers",
             "pprint",
-            "shell",
-            "stringold"
+            "shell"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
@@ -600,7 +600,6 @@
             "numbers",
             "pprint",
             "shell",
-            "stringold",
             "unittest"
         ],
         "files": [
@@ -618,8 +617,7 @@
             "io",
             "math",
             "mime",
-            "netclient",
-            "stringold"
+            "netclient"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/email",
@@ -724,7 +722,6 @@
             "io",
             "netserver",
             "pickle",
-            "stringold",
             "threading"
         ],
         "files": [
@@ -741,8 +738,7 @@
             "io",
             "math",
             "mime",
-            "netclient",
-            "stringold"
+            "netclient"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
@@ -876,8 +872,7 @@
             "email",
             "io",
             "math",
-            "mime",
-            "stringold"
+            "mime"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/base64.py",
@@ -1072,17 +1067,6 @@
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
@@ -1153,8 +1137,7 @@
             "logging",
             "netclient",
             "numbers",
-            "pprint",
-            "stringold"
+            "pprint"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/unittest",
@@ -1182,8 +1165,7 @@
             "compression",
             "core",
             "logging",
-            "shell",
-            "stringold"
+            "shell"
         ],
         "files": [
             "${bindir}/pyvenv*",
@@ -1217,7 +1199,6 @@
             "netserver",
             "numbers",
             "pydoc",
-            "stringold",
             "xml"
         ],
         "files": [
--=20
2.43.0

