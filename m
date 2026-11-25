Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45851.1795624774308760189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=c0Ccq9Fv;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE72E2F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:30 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78EB83F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624773; bh=FCSXXo54VnS1Nfrp3+klAhFRwluDm+7TqnR2b3DYjt8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c0Ccq9FvIsrBfUFKU3/gZqTv/1LKu00NT3SHD1xoHxoCC+zJH0LkDLFgy8rB2+BWq
	 qRPUxLjjf33ssBr4uj/rNwo27/a6lUtfgjobZRZEeAcwxzHnPlF9QDkShE7+aimzn5
	 Qp7qTkMrjRsp4NP5jw1Wb7iDpzHla2hQdR5iApqs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/18] python3: merge -stringold to -core
Date: Wed, 25 Nov 2026 16:39:13 +0000
Message-ID: <20261125163927.1835785-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251215
Content-Type: text/plain; charset="utf-8"

The "stringold" module isn't actually "old", it's the original string
module with utility methods and templating code.

It's not deprecated and is small, so merge it into -core, add a RPROVIDES
to preserve existing dependencies, and refresh the manifest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json      | 38 +++++--------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index e48de787b0d..36bde979b24 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -110,8 +110,7 @@
             "io",
             "logging",
             "netclient",
-            "numbers",
-            "stringold"
+            "numbers"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/asyncio",
@@ -173,7 +172,8 @@
         "summary": "Python interpreter and core modules",
         "rprovides": [
             "fcntl",
-            "pkgutil"
+            "pkgutil",
+            "stringold"
         ],
         "rdepends": [],
         "skip_depends": {
@@ -306,6 +306,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/sre_constants.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_parse.py",
             "${libdir}/python${PYTHON_MAJMIN}/stat.py",
+            "${libdir}/python${PYTHON_MAJMIN}/string",
             "${libdir}/python${PYTHON_MAJMIN}/stringprep.py",
             "${libdir}/python${PYTHON_MAJMIN}/struct.py",
             "${libdir}/python${PYTHON_MAJMIN}/subprocess.py",
@@ -401,8 +402,7 @@
             "netclient",
             "numbers",
             "pprint",
-            "shell",
-            "stringold"
+            "shell"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
@@ -454,7 +454,6 @@
             "numbers",
             "pprint",
             "shell",
-            "stringold",
             "unittest"
         ],
         "files": [
@@ -469,8 +468,7 @@
             "io",
             "math",
             "mime",
-            "netclient",
-            "stringold"
+            "netclient"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/email",
@@ -558,7 +556,6 @@
             "io",
             "netserver",
             "pickle",
-            "stringold",
             "threading"
         ],
         "files": [
@@ -574,8 +571,7 @@
             "io",
             "math",
             "mime",
-            "netclient",
-            "stringold"
+            "netclient"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
@@ -652,7 +648,6 @@
             "shell",
             "sqlite3",
             "statistics",
-            "stringold",
             "syslog",
             "terminal",
             "threading",
@@ -697,8 +692,7 @@
             "email",
             "io",
             "math",
-            "mime",
-            "stringold"
+            "mime"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/base64.py",
@@ -839,15 +833,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/statistics.py"
         ]
     },
-    "stringold": {
-        "summary": "Common string operations",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/string"
-        ]
-    },
     "syslog": {
         "summary": "Python syslog interface",
         "rdepends": [
@@ -907,8 +892,7 @@
             "logging",
             "netclient",
             "numbers",
-            "pprint",
-            "stringold"
+            "pprint"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/unittest",
@@ -931,8 +915,7 @@
             "compression",
             "core",
             "logging",
-            "shell",
-            "stringold"
+            "shell"
         ],
         "files": [
             "${bindir}/pyvenv*",
@@ -964,7 +947,6 @@
             "netserver",
             "numbers",
             "pydoc",
-            "stringold",
             "xml"
         ],
         "files": [
--=20
2.43.0

