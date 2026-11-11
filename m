Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10228.1794406653518225283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 06:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VqT+lpXm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19B3F1576
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:17:30 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C913A3F632
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794406653; bh=qu+PONV4LU0aEx8bhaZi/o/C26CyFWm4Y5jOyBbSn1g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VqT+lpXmewUsAJONV5RPY6a4ooopmeudd2g3pR9g+w3hYk8Z96nI/4FV2UOGnCsl3
	 AZYViwIHLqP4SOZ0ebaMMEhEsAax1QDzRi9hKHjQd3Ejjwaqy0sFDONWN8SFbCXQts
	 0UkqC+4fv1q6fdtANIcXiwqElaVZHz0AzYNoMVTM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/6] python3: no need to use an OrderedDict
Date: Wed, 11 Nov 2026 14:17:24 +0000
Message-ID: <20261111141726.1496785-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111141726.1496785-1-ross.burton@arm.com>
References: <20261111141726.1496785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 14:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250033
Content-Type: text/plain; charset="utf-8"

As of Python 3.7, standard dictionaries are sorted by insertion order.
As this stable order was the only reason for using OrderedDict, we can
switch to using a normal dictionary.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/create_manifest3.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/m=
eta/recipes-devtools/python/python3/create_manifest3.py
index 5dda382de8f..029d9235c1a 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -37,7 +37,6 @@ import sys
 import subprocess
 import json
 import os
-import collections
=20
 if '-d' in sys.argv:
     debugFlag =3D '-d'
@@ -54,7 +53,7 @@ for p in sys.path:
         nativelibfolder =3D p[:p.find(pivot)+len(pivot)]
=20
 # Empty dict to hold the whole manifest
-new_manifest =3D collections.OrderedDict()
+new_manifest =3D {}
=20
 # Check for repeated files, folders and wildcards
 allfiles =3D []
@@ -91,7 +90,7 @@ with open('python3-manifest.json') as manifest:
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
@@ -195,7 +194,7 @@ for pypkg in old_manifest:
=20
 for pypkg in old_manifest:
     # Use an empty dict as data structure to hold data for each package =
and fill it up
-    new_manifest[pypkg] =3D collections.OrderedDict()
+    new_manifest[pypkg] =3D {}
     new_manifest[pypkg]['summary'] =3D old_manifest[pypkg]['summary']
     new_manifest[pypkg]['rdepends'] =3D []
     new_manifest[pypkg]['files'] =3D []
--=20
2.43.0

