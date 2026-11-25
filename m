Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45858.1795624779173812169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=h9pWHsVy;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE32C2F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:35 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 793AE3F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624778; bh=N+lwXwro1DSJ8XDYyka8mmimGiMosQIItRsrr6M00+w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h9pWHsVy6D1/YvPOsgwR23kiw9jZbOxRYqQ+z36G7E7lV7q2lOHMKB3EoyACjxAag
	 HJqEVndo2LymoUdEdxnnNLvUf+abAVEdHCYN61ZxJWJtAjkcUx5AxYwJ28BA6qxSfC
	 oHG3dtSgz68SxSaqzH6j6ucuPKL5DK8Dc0Utv+x0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/18] python3: merge -io into -core
Date: Wed, 25 Nov 2026 16:39:21 +0000
Message-ID: <20261125163927.1835785-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251223
Content-Type: text/plain; charset="utf-8"

A large amount of the standard library uses this, so there's no real
point in splitting it out.

Add a dependency exclude for tempfile -> compression, as tempfile
imports shutil which imports compression.  For now, compression can be
separated out as shutil's use of compression is optional.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json      | 60 +++++++------------
 1 file changed, 22 insertions(+), 38 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 91064f23e8e..68d0a1750f7 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -113,7 +113,6 @@
         "rdepends": [
             "core",
             "debugger",
-            "io",
             "logging",
             "numbers"
         ],
@@ -178,6 +177,7 @@
         "summary": "Python interpreter and core modules",
         "rprovides": [
             "fcntl",
+            "io",
             "math",
             "mime",
             "pkgutil",
@@ -194,6 +194,13 @@
                 "lzma",
                 "zlib",
                 "zstd"
+            ],
+            "tempfile": [
+                "compression",
+                "bz2",
+                "lzma",
+                "zlib",
+                "zstd"
             ]
         },
         "files": [
@@ -217,6 +224,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/_opcode_metadata.py",
             "${libdir}/python${PYTHON_MAJMIN}/_py_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/_py_warnings.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/pager.py",
             "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
@@ -275,6 +283,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubproce=
ss.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_random.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_socket.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ssl.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_typing.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
@@ -286,6 +296,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/parser.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/readline.*.so"=
,
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/select.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/termios.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/time.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/unicodedata.*.=
so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/xreadlines.*.s=
o",
@@ -325,9 +336,11 @@
             "${libdir}/python${PYTHON_MAJMIN}/site-packages/",
             "${libdir}/python${PYTHON_MAJMIN}/site.py",
             "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py",
+            "${libdir}/python${PYTHON_MAJMIN}/socket.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_compile.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_constants.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_parse.py",
+            "${libdir}/python${PYTHON_MAJMIN}/ssl.py",
             "${libdir}/python${PYTHON_MAJMIN}/stat.py",
             "${libdir}/python${PYTHON_MAJMIN}/string",
             "${libdir}/python${PYTHON_MAJMIN}/stringprep.py",
@@ -338,6 +351,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/sysconfig",
             "${libdir}/python${PYTHON_MAJMIN}/sysconfig.py",
             "${libdir}/python${PYTHON_MAJMIN}/tabnanny.py",
+            "${libdir}/python${PYTHON_MAJMIN}/tempfile.py",
             "${libdir}/python${PYTHON_MAJMIN}/textwrap.py",
             "${libdir}/python${PYTHON_MAJMIN}/this.py",
             "${libdir}/python${PYTHON_MAJMIN}/threading.py",
@@ -373,8 +387,7 @@
         "summary": "Python C types support",
         "rdepends": [
             "compression",
-            "core",
-            "io"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/ctypes",
@@ -420,7 +433,6 @@
             "asyncio",
             "compression",
             "core",
-            "io",
             "json",
             "logging",
             "numbers",
@@ -469,7 +481,6 @@
             "core",
             "debugger",
             "difflib",
-            "io",
             "json",
             "logging",
             "numbers",
@@ -485,8 +496,7 @@
         "summary": "Python email support",
         "rdepends": [
             "core",
-            "datetime",
-            "io"
+            "datetime"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/email",
@@ -539,22 +549,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/colorsys.py"
         ]
     },
-    "io": {
-        "summary": "Python low-level I/O",
-        "rdepends": [
-            "compression",
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_socket.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ssl.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/termios.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/socket.py",
-            "${libdir}/python${PYTHON_MAJMIN}/ssl.py",
-            "${libdir}/python${PYTHON_MAJMIN}/tempfile.py"
-        ]
-    },
     "json": {
         "summary": "Python JSON support",
         "rdepends": [
@@ -569,7 +563,6 @@
         "summary": "Python logging support",
         "rdepends": [
             "core",
-            "io",
             "netserver",
             "pickle",
             "threading"
@@ -583,8 +576,7 @@
         "rdepends": [
             "core",
             "datetime",
-            "email",
-            "io"
+            "email"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
@@ -621,7 +613,6 @@
             "html",
             "idle",
             "image",
-            "io",
             "json",
             "logging",
             "mailbox",
@@ -661,7 +652,6 @@
             "core",
             "crypt",
             "ctypes",
-            "io",
             "json",
             "mmap",
             "netclient",
@@ -680,8 +670,7 @@
             "core",
             "crypt",
             "datetime",
-            "email",
-            "io"
+            "email"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/ftplib.py",
@@ -700,8 +689,7 @@
     "netserver": {
         "summary": "Python Internet Protocol servers",
         "rdepends": [
-            "core",
-            "io"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
@@ -832,8 +820,7 @@
     "terminal": {
         "summary": "Python terminal controlling support",
         "rdepends": [
-            "core",
-            "io"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/pty.py",
@@ -886,7 +873,6 @@
             "asyncio",
             "core",
             "difflib",
-            "io",
             "logging",
             "numbers",
             "pprint"
@@ -899,8 +885,7 @@
     "unixadmin": {
         "summary": "Python Unix administration support",
         "rdepends": [
-            "core",
-            "io"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/getpass.py"
@@ -938,7 +923,6 @@
             "datetime",
             "email",
             "html",
-            "io",
             "netclient",
             "netserver",
             "numbers",
--=20
2.43.0

