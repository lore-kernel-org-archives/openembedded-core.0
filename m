Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10407.1794406654671610106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 06:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=t5GhxnJz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46E151576
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:17:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 009B53F632
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794406654; bh=PjezDP8Is/Gm3pYpRFh6npoigS8p78ivQsNhH4pAtf8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t5GhxnJzaYsHKsHmsBoN9SGAqDagpQ/v+RJsW2EQPY7t5FogJ9elsOAVUrh/As2+Y
	 Ok3eCfoRVcaAtakTQTUh1H6RpUEi6PgW8+8NxQZua3UAmxeZB4fXUJ/TTcFcUc+/SN
	 8b7R472WdxAjNFMwsF0SZvycyJ+8Sq2L2LS7U8PM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 6/6] python3: refresh manifest
Date: Wed, 11 Nov 2026 14:17:26 +0000
Message-ID: <20261111141726.1496785-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111141726.1496785-1-ross.burton@arm.com>
References: <20261111141726.1496785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 14:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250035
Content-Type: text/plain; charset="utf-8"

Add some dependency skips:

- the core imports in zipimport (->compression), but as importing of
  .zip files is relatively niche skip this dependency.
- shutil imports all of compression to determine what methods are
  available. Skip this dependency, packages which use
  shutil.make_archive() can depend on -compression. Notable, ensurepip
  needs to unpack a wheel.

Consolidate the compression files into -compression instead of being
spread across multiple packages.

Put _interpreters.so and _remote_debugging.so into the appropriate
packages, remove some previously installed libraries that are now
part of the interpreter, and refresh the dependencies.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json      | 72 ++++++++++++++-----
 .../python/python3_3.14.10.bb                 |  1 +
 2 files changed, 54 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 4cfbbf978d1..b2c83ef0e50 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -106,6 +106,7 @@
         "summary": "Python Asynchronous I/O",
         "rdepends": [
             "core",
+            "debugger",
             "io",
             "logging",
             "netclient",
@@ -154,16 +155,33 @@
             "core"
         ],
         "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/bz2.py",
+            "${libdir}/python${PYTHON_MAJMIN}/compression",
             "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bz2.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lzma.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/zlib.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lzma.py",
             "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/zipfile/",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/zipfile"
         ]
     },
     "core": {
         "summary": "Python interpreter and core modules",
-        "rdepends": ["compression"],
+        "rdepends": [],
+        "skip_depends": {
+            "core": [
+                "zipimport"
+            ],
+            "shutil": [
+                "compression",
+                "bz2",
+                "lzma",
+                "zlib",
+                "zstd"
+            ]
+        },
         "files": [
             "${bindir}/python${PYTHON_MAJMIN}",
             "${bindir}/python${PYTHON_MAJMIN}.real",
@@ -178,22 +196,20 @@
             "${libdir}/python${PYTHON_MAJMIN}/_bootlocale.py",
             "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/_colorize.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_compression.py",
             "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
             "${libdir}/python${PYTHON_MAJMIN}/_opcode_metadata.py",
             "${libdir}/python${PYTHON_MAJMIN}/_py_warnings.py",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/pager.py",
             "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py",
             "${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars*.json",
+            "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py",
             "${libdir}/python${PYTHON_MAJMIN}/_weakrefset.py",
             "${libdir}/python${PYTHON_MAJMIN}/abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/annotationlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/argparse.py",
             "${libdir}/python${PYTHON_MAJMIN}/ast.py",
             "${libdir}/python${PYTHON_MAJMIN}/bisect.py",
-            "${libdir}/python${PYTHON_MAJMIN}/bz2.py",
             "${libdir}/python${PYTHON_MAJMIN}/code.py",
             "${libdir}/python${PYTHON_MAJMIN}/codecs.py",
             "${libdir}/python${PYTHON_MAJMIN}/codeop.py",
@@ -235,10 +251,9 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/ti=
me.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/xr=
eadlines.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bisect.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bz2.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lzma.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpreters.=
*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubproce=
ss.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
@@ -254,10 +269,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/time.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/unicodedata.*.=
so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/xreadlines.*.s=
o",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/zlib.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/linecache.py",
             "${libdir}/python${PYTHON_MAJMIN}/locale.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lzma.py",
             "${libdir}/python${PYTHON_MAJMIN}/new.py",
             "${libdir}/python${PYTHON_MAJMIN}/ntpath.py",
             "${libdir}/python${PYTHON_MAJMIN}/opcode.py",
@@ -268,6 +281,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/_local.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/_os.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/types.py",
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
@@ -327,6 +342,7 @@
     "ctypes": {
         "summary": "Python C types support",
         "rdepends": [
+            "compression",
             "core",
             "io",
             "math"
@@ -356,8 +372,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
             "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
-            "${libdir}/python${PYTHON_MAJMIN}/datetime.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_datetime.*.so=
"
+            "${libdir}/python${PYTHON_MAJMIN}/datetime.py"
         ]
     },
     "db": {
@@ -373,13 +388,22 @@
     "debugger": {
         "summary": "Python debugger",
         "rdepends": [
+            "asyncio",
+            "compression",
             "core",
+            "io",
+            "json",
+            "logging",
+            "math",
+            "netclient",
+            "numbers",
             "pprint",
             "shell",
             "stringold"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_remote_debugg=
ing.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
         ]
     },
@@ -414,9 +438,17 @@
     "doctest": {
         "summary": "Python framework for running examples in docstrings"=
,
         "rdepends": [
+            "asyncio",
+            "compression",
             "core",
             "debugger",
             "difflib",
+            "io",
+            "json",
+            "logging",
+            "math",
+            "netclient",
+            "numbers",
             "pprint",
             "shell",
             "stringold",
@@ -456,9 +488,7 @@
         "rdepends": [
             "core"
         ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so"
-        ]
+        "files": []
     },
     "gdbm": {
         "summary": "Python GNU database support",
@@ -500,6 +530,7 @@
     "io": {
         "summary": "Python low-level I/O",
         "rdepends": [
+            "compression",
             "core",
             "math",
             "netclient"
@@ -645,10 +676,12 @@
     "multiprocessing": {
         "summary": "Python multiprocessing support",
         "rdepends": [
+            "compression",
             "core",
             "crypt",
             "ctypes",
             "io",
+            "json",
             "math",
             "mmap",
             "netclient",
@@ -679,6 +712,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
             "${libdir}/python${PYTHON_MAJMIN}/http",
             "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hmac.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
             "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
@@ -708,7 +742,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
             "${libdir}/python${PYTHON_MAJMIN}/decimal.py",
             "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*=
.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so"=
,
             "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
         ]
@@ -788,8 +821,7 @@
     "shell": {
         "summary": "Python shell-like functionality",
         "rdepends": [
-            "core",
-            "stringold"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
@@ -910,8 +942,10 @@
     "venv": {
         "summary": "Provides support for creating lightweight virtual en=
vironments with their own site directories, optionally isolated from syst=
em site directories.",
         "rdepends": [
+            "compression",
             "core",
             "logging",
+            "shell",
             "stringold"
         ],
         "files": [
diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
index 574b8e31d41..d7ddd5f404e 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -555,6 +555,7 @@ RDEPENDS:${PN}-tkinter +=3D "${@bb.utils.contains('PA=
CKAGECONFIG', 'tk', '${MLPREF
 RDEPENDS:${PN}-idle +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tk', '$=
{PN}-tkinter ${MLPREFIX}tcl', '', d)}"
 DEV_PKG_DEPENDENCY =3D ""
 RDEPENDS:${PN}-pydoc +=3D "${PN}-io"
+RDEPENDS:${PN}-ensurepip +=3D "${PN}-compression"
=20
 RDEPENDS:${PN}-tests:append:class-target =3D " ${MLPREFIX}bash"
 RDEPENDS:${PN}-tests:append:class-nativesdk =3D " ${MLPREFIX}bash"
--=20
2.43.0

