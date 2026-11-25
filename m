Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45905.1795624778602355429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nlyabrKO;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49C8D2F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:35 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8C123F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624778; bh=nfr/GF3oviwRsd6bnxXxgAInhfm2DsNSOE1fNpEDlNA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nlyabrKOipHChJtOPCMnBFptYhOU1RhGI2eF6EEe3a3poUo69Ajf3Ld6DBonBh8Gf
	 1idLl9+eFiFGaLugxyfCUtHzhOqjPHmVZ/ntfRqhO2XLOZF3KF2lOd9eFxWG681vsA
	 xUFHMq0DNdnJtojY+PuDCuMUY/ZyNWk9pjKtpcXs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/18] python3: merge -math into -core
Date: Wed, 25 Nov 2026 16:39:20 +0000
Message-ID: <20261125163927.1835785-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251222
Content-Type: text/plain; charset="utf-8"

A large amount of the standard library uses this, so there's no real
point in splitting it out.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json      | 35 +++++--------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 6d6ee0c146c..91064f23e8e 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -178,6 +178,7 @@
         "summary": "Python interpreter and core modules",
         "rprovides": [
             "fcntl",
+            "math",
             "mime",
             "pkgutil",
             "stringold"
@@ -273,10 +274,12 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_math_integer.=
*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubproce=
ss.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_random.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_typing.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.so"=
,
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/cmath.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/grp.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/math.*.so",
@@ -307,6 +310,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
             "${libdir}/python${PYTHON_MAJMIN}/pyclbr.py",
             "${libdir}/python${PYTHON_MAJMIN}/quopri.py",
+            "${libdir}/python${PYTHON_MAJMIN}/random.py",
             "${libdir}/python${PYTHON_MAJMIN}/re",
             "${libdir}/python${PYTHON_MAJMIN}/re/_casefix.py",
             "${libdir}/python${PYTHON_MAJMIN}/re/_compiler.py",
@@ -370,8 +374,7 @@
         "rdepends": [
             "compression",
             "core",
-            "io",
-            "math"
+            "io"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/ctypes",
@@ -420,7 +423,6 @@
             "io",
             "json",
             "logging",
-            "math",
             "numbers",
             "pprint",
             "shell"
@@ -470,7 +472,6 @@
             "io",
             "json",
             "logging",
-            "math",
             "numbers",
             "pprint",
             "shell",
@@ -485,8 +486,7 @@
         "rdepends": [
             "core",
             "datetime",
-            "io",
-            "math"
+            "io"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/email",
@@ -543,8 +543,7 @@
         "summary": "Python low-level I/O",
         "rdepends": [
             "compression",
-            "core",
-            "math"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
@@ -585,24 +584,12 @@
             "core",
             "datetime",
             "email",
-            "io",
-            "math"
+            "io"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
         ]
     },
-    "math": {
-        "summary": "Python math support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_random.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/cmath.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/random.py"
-        ]
-    },
     "mmap": {
         "summary": "Python memory-mapped file support",
         "rdepends": [
@@ -638,7 +625,6 @@
             "json",
             "logging",
             "mailbox",
-            "math",
             "mmap",
             "multiprocessing",
             "netclient",
@@ -677,7 +663,6 @@
             "ctypes",
             "io",
             "json",
-            "math",
             "mmap",
             "netclient",
             "pickle",
@@ -696,8 +681,7 @@
             "crypt",
             "datetime",
             "email",
-            "io",
-            "math"
+            "io"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/ftplib.py",
@@ -829,7 +813,6 @@
         "summary": "Basic statistics module",
         "rdepends": [
             "core",
-            "math",
             "numbers"
         ],
         "files": [
--=20
2.43.0

