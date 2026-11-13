Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12535.1794580244877714797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 06:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=as0Z5h12;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68A031516
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:30:41 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0DCC93F673
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794580244; bh=cVWiwUJB/gqT0qk2iJ4Lgc5Tm3NkfmikIGPcje6+/5o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=as0Z5h12+niKUCykO69hNuA5qyBVqGNM91VtBIjMcjowSswLpJ/3L9atF+6/npoQB
	 cf7K5u6AWuNP2JvuvAySmYVFkkWM/FAh/zxexkhQr6uIzIOWV0OfUPGyBP9/ufemnH
	 00yPmSH0FIbEb9IBsZxE38rKEYUdhuJCYzBryn4A=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/5] python3: no need to use an OrderedDict
Date: Fri, 13 Nov 2026 14:30:36 +0000
Message-ID: <20261113143038.1651404-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113143038.1651404-1-ross.burton@arm.com>
References: <20261113143038.1651404-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 14:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250178
Content-Type: text/plain; charset="utf-8"

As of Python 3.7, standard dictionaries are sorted by insertion order.
As this stable order was the only reason for using OrderedDict, we can
switch to using a normal dictionary.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/create_manifest3.py | 7 +++----
 meta/recipes-devtools/python/python3_3.14.10.bb          | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/m=
eta/recipes-devtools/python/python3/create_manifest3.py
index 288d5ede3a2..6d3108e46f7 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -43,7 +43,6 @@ import sys
 import subprocess
 import json
 import os
-import collections
=20
 if '-d' in sys.argv:
     debugFlag =3D '-d'
@@ -60,7 +59,7 @@ for p in sys.path:
         nativelibfolder =3D p[:p.find(pivot)+len(pivot)]
=20
 # Empty dict to hold the whole manifest
-new_manifest =3D collections.OrderedDict()
+new_manifest =3D {}
=20
 # Check for repeated files, folders and wildcards
 allfiles =3D []
@@ -103,7 +102,7 @@ with open('python3-manifest.json') as manifest:
     manifest.seek(0)
     comments =3D manifest.read(json_start)
     manifest_str =3D manifest.read()
-    old_manifest =3D json.loads(manifest_str, object_pairs_hook=3Dcollec=
tions.OrderedDict)
+    old_manifest =3D json.loads(manifest_str)
=20
 #
 # First pass to get core-package functionality, because we base everythi=
ng on the fact that core is actually working
@@ -219,7 +218,7 @@ for pypkg in old_manifest:
=20
 for pypkg in old_manifest:
     # Use an empty dict as data structure to hold data for each package =
and fill it up
-    new_manifest[pypkg] =3D collections.OrderedDict()
+    new_manifest[pypkg] =3D {}
     new_manifest[pypkg]['summary'] =3D old_manifest[pypkg]['summary']
     new_manifest[pypkg]['rdepends'] =3D []
     new_manifest[pypkg]['files'] =3D []
diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
index d8ccd3c2cc2..9c45f8e0c67 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -404,7 +404,7 @@ py_package_preprocess () {
 INCLUDE_PYCS ?=3D "1"
=20
 python(){
-    import collections, json
+    import json
=20
     filename =3D os.path.join(d.getVar('THISDIR'), 'python3', 'python3-m=
anifest.json')
     # This python changes the datastore based on the contents of a file,=
 so mark
@@ -416,7 +416,7 @@ python(){
         json_start =3D manifest_str.find('# EOC') + 6
         manifest_file.seek(json_start)
         manifest_str =3D manifest_file.read()
-        python_manifest =3D json.loads(manifest_str, object_pairs_hook=3D=
collections.OrderedDict)
+        python_manifest =3D json.loads(manifest_str)
=20
     # First set RPROVIDES for -native case
     # Hardcoded since it cant be python3-native-foo, should be python3-f=
oo-native
--=20
2.43.0

