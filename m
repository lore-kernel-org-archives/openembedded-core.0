Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3363.1794863080929399304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 13:04:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=mLes1tT+;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A43C1684
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 13:04:37 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C9D883F632
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 13:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794863080; bh=r03nds7YNldaMs9JxDuszhb4mie/DW/7A24MrV05NG4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mLes1tT+TWERtwL1kmy5H4JAPinE1PSt4B27VZuseALpJLzXlwrRR5L4HZ0QgwU7u
	 5ATwsozdbGdgjJplZ2NA9meJ8L3ssCG0FR97N6vtI5ZX08MACWoQBhIOZcib4ibhir
	 fWV8u95WmtJGpB1W4IUsGG3eNSP6L4kWytqwaTZE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] python3: no need to use an OrderedDict
Date: Mon, 16 Nov 2026 21:04:32 +0000
Message-ID: <20261116210435.4161338-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116210435.4161338-1-ross.burton@arm.com>
References: <20261116210435.4161338-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 21:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250377
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
index 765f93ddc66..bebee315f94 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -410,7 +410,7 @@ py_package_preprocess () {
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
@@ -422,7 +422,7 @@ python(){
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

