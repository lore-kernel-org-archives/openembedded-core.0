Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1826.1795105884671122240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 08:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=dMXlTQRz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 372CF1575
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:31:21 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0F463F673
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795105884; bh=PMfl6A5b2b2Nmzu/wOUOGdVCjFneCUeIHvrHa7aQn0g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dMXlTQRzFGpcQGMYFu1mtWUCQXyLbnj0cFT9WzUP+0PhEr/hMCw4Lb8/BcQXZj2XY
	 lkDgjeOrexZ6y2GQFlzpgU/fKu2ixXS/9ILsM2S8mXzn7TTN9YYl6KzMhS3ouWpv6X
	 og9yhBlyKzCnqrk/IlpARTOKkDmBkHTZrSX2D4DU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/6] python3: move base64 into -core
Date: Thu, 19 Nov 2026 16:31:15 +0000
Message-ID: <20261119163117.2242351-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119163117.2242351-1-ross.burton@arm.com>
References: <20261119163117.2242351-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 16:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250706
Content-Type: text/plain; charset="utf-8"

There are a lot of dependencies on the netclient package (1.2MB) simply
for the base64 module (22K). Move this into core and refresh the
manifest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json        | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 901d71ec9ee..3a68fb003b9 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -110,7 +110,6 @@
             "debugger",
             "io",
             "logging",
-            "netclient",
             "numbers"
         ],
         "files": [
@@ -231,6 +230,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/annotationlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/argparse.py",
             "${libdir}/python${PYTHON_MAJMIN}/ast.py",
+            "${libdir}/python${PYTHON_MAJMIN}/base64.py",
             "${libdir}/python${PYTHON_MAJMIN}/bisect.py",
             "${libdir}/python${PYTHON_MAJMIN}/code.py",
             "${libdir}/python${PYTHON_MAJMIN}/codecs.py",
@@ -365,6 +365,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/annotationlib.=
*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc=
",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/code.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codecs.*.pyc",
@@ -537,7 +538,6 @@
             "json",
             "logging",
             "math",
-            "netclient",
             "numbers",
             "pprint",
             "shell"
@@ -596,7 +596,6 @@
             "json",
             "logging",
             "math",
-            "netclient",
             "numbers",
             "pprint",
             "shell",
@@ -616,8 +615,7 @@
             "datetime",
             "io",
             "math",
-            "mime",
-            "netclient"
+            "mime"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/email",
@@ -685,8 +683,7 @@
         "rdepends": [
             "compression",
             "core",
-            "math",
-            "netclient"
+            "math"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
@@ -737,8 +734,7 @@
             "email",
             "io",
             "math",
-            "mime",
-            "netclient"
+            "mime"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
@@ -875,7 +871,6 @@
             "mime"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/base64.py",
             "${libdir}/python${PYTHON_MAJMIN}/ftplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
             "${libdir}/python${PYTHON_MAJMIN}/http",
@@ -890,7 +885,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.py=
c",
@@ -1135,7 +1129,6 @@
             "difflib",
             "io",
             "logging",
-            "netclient",
             "numbers",
             "pprint"
         ],
--=20
2.43.0

