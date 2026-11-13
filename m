Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12533.1794580246262496718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 06:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XodCVdrC;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D17621516
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:30:42 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 741303F8C6
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794580245; bh=dRqjrlkIugelNY4J/Rc+qI8IBt2D5EJqd42zCVTDLLQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XodCVdrCpSBWyv9M/J08mM+UZgT3ZBYfe2+Avu3qb5YvH3AdY/SiL3Fr9ck71M+IU
	 qySZlyl/kSlv8ylhUoUNakainjgA9rlg1RNS230X2640IQDrERMw/t+h9tZru05a0v
	 4GKoWxe6z1YVpqoAxfK6iQHE8HrayPCAiPY6bI8w=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 5/5] python3: refresh manifest
Date: Fri, 13 Nov 2026 14:30:38 +0000
Message-ID: <20261113143038.1651404-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113143038.1651404-1-ross.burton@arm.com>
References: <20261113143038.1651404-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 14:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250180
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
 .../python/python3/python3-manifest.json      | 78 ++++++++++++++-----
 .../python/python3_3.14.10.bb                 |  1 +
 2 files changed, 58 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 50fdf5d0eae..0c91745e675 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -107,6 +107,7 @@
         "summary": "Python Asynchronous I/O",
         "rdepends": [
             "core",
+            "debugger",
             "io",
             "logging",
             "netclient",
@@ -165,20 +166,39 @@
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
         ],
         "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bz2.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/lzma.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc"
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
@@ -193,22 +213,20 @@
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
@@ -250,10 +268,9 @@
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
@@ -269,10 +286,8 @@
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
@@ -283,6 +298,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/_local.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/_os.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/types.py",
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
@@ -341,7 +358,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc=
",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bz2.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/code.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codecs.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codeop.*.pyc",
@@ -367,7 +383,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/keyword.*.pyc"=
,
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/linecache.*.py=
c",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/locale.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/lzma.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ntpath.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/opcode.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc=
",
@@ -420,6 +435,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_abc.*=
.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_local=
.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_os.*.=
pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/types.=
*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_casefix.*.=
pyc",
             "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_compiler.*=
.pyc",
@@ -451,6 +468,7 @@
     "ctypes": {
         "summary": "Python C types support",
         "rdepends": [
+            "compression",
             "core",
             "io",
             "math"
@@ -482,8 +500,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
             "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
-            "${libdir}/python${PYTHON_MAJMIN}/datetime.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_datetime.*.so=
"
+            "${libdir}/python${PYTHON_MAJMIN}/datetime.py"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.py=
c",
@@ -505,13 +522,22 @@
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
         ],
         "cached": [
@@ -554,9 +580,17 @@
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
@@ -603,9 +637,7 @@
         "rdepends": [
             "core"
         ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so"
-        ],
+        "files": [],
         "cached": []
     },
     "gdbm": {
@@ -654,6 +686,7 @@
     "io": {
         "summary": "Python low-level I/O",
         "rdepends": [
+            "compression",
             "core",
             "math",
             "netclient"
@@ -818,10 +851,12 @@
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
@@ -853,6 +888,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
             "${libdir}/python${PYTHON_MAJMIN}/http",
             "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hmac.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
             "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
@@ -895,7 +931,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
             "${libdir}/python${PYTHON_MAJMIN}/decimal.py",
             "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*=
.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so"=
,
             "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
         ],
@@ -1004,8 +1039,7 @@
     "shell": {
         "summary": "Python shell-like functionality",
         "rdepends": [
-            "core",
-            "stringold"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
@@ -1150,8 +1184,10 @@
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
index 9c45f8e0c67..5ffab530c63 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -572,6 +572,7 @@ RDEPENDS:${PN}-tkinter +=3D "${@bb.utils.contains('PA=
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

