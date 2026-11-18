Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2555.1795024071253577226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 09:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XXEuEvUz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4E241477
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:47:47 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6C4093F632
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795024070; bh=/l4xlPbxnNpbmPh4m68M2C0kIhGEy+iRqaQ+S/6mkc0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XXEuEvUzsLM92RgFyoHxYcEyQHJEMY9mm9b2SmPRH3K2dn28fhISYhEm7/skN9WW7
	 Asd3EpSgeg7f7bHh9IKX18Rq4MGJVe4VzOjn1SU4zS/gMqH8KsyAJA621Vq+il/zc/
	 SDCe8oK1xFZJ+zPd1cEupSUTmNOXl9qWXCcc+kMQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] python3: move base64 into -core
Date: Wed, 18 Nov 2026 17:47:44 +0000
Message-ID: <20261118174744.2483235-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118174744.2483235-1-ross.burton@arm.com>
References: <20261118174744.2483235-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 17:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250577
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
index f0192365f4a..c4ec0838341 100644
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
@@ -363,6 +363,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/annotationlib.=
*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc=
",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/code.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codecs.*.pyc",
@@ -535,7 +536,6 @@
             "json",
             "logging",
             "math",
-            "netclient",
             "numbers",
             "pprint",
             "shell"
@@ -594,7 +594,6 @@
             "json",
             "logging",
             "math",
-            "netclient",
             "numbers",
             "pprint",
             "shell",
@@ -614,8 +613,7 @@
             "datetime",
             "io",
             "math",
-            "mime",
-            "netclient"
+            "mime"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/email",
@@ -683,8 +681,7 @@
         "rdepends": [
             "compression",
             "core",
-            "math",
-            "netclient"
+            "math"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
@@ -735,8 +732,7 @@
             "email",
             "io",
             "math",
-            "mime",
-            "netclient"
+            "mime"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
@@ -873,7 +869,6 @@
             "mime"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/base64.py",
             "${libdir}/python${PYTHON_MAJMIN}/ftplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
             "${libdir}/python${PYTHON_MAJMIN}/http",
@@ -888,7 +883,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.py=
c",
@@ -1127,7 +1121,6 @@
             "difflib",
             "io",
             "logging",
-            "netclient",
             "numbers",
             "pprint"
         ],
--=20
2.43.0

