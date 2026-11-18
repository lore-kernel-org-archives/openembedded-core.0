Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2511.1795024069857778051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 09:47:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=hz/PUXHn;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00DD51477
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:47:46 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99E983F632
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795024068; bh=umpBLflRjeaga7TsnuGhxbrM1e4CT5Ts32J9K9o/BBA=;
	h=From:To:Subject:Date:From;
	b=hz/PUXHnP/UVz3NIiArPX1V0pjQKi8UaZKvA3RxRCaL42R23KOzqoaJXJVtLLmeMn
	 wH9SGYqcoXEpW9R7yq4kGEeJzdgdCPFYIe8/O4hc8rUWyEJV2H212jBmI98Q2JMSNS
	 5y+36MFHXssEj9tjQMd29F8OoXR7ymZpoIXQgphI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] python3: support setting RPROVIDES in the manifest
Date: Wed, 18 Nov 2026 17:47:41 +0000
Message-ID: <20261118174744.2483235-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 17:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250575
Content-Type: text/plain; charset="utf-8"

Allow modules to have a 'rprovides' key, that sets RPROVIDES for the
generated package.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/create_manifest3.py        | 23 ++++++++++++-------
 .../python/python3_3.14.10.bb                 |  9 ++++++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/m=
eta/recipes-devtools/python/python3/create_manifest3.py
index 9ce04fdd2aa..8ba51a2a0c3 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -229,9 +229,20 @@ for pypkg in old_manifest:
 # will RDEPEND on it
=20
 for pypkg in old_manifest:
+    # Handle special cases, we assume that when they were manually added
+    # to the manifest we knew what we were doing.
+    special_packages =3D ['misc', 'modules', 'dev', 'tests']
+    if pypkg in special_packages or 'staticdev' in pypkg:
+        print_indent('Passing %s package directly' % pypkg, 2)
+        new_manifest[pypkg] =3D old_manifest[pypkg]
+        if 'rprovides' not in new_manifest[pypkg]:
+            new_manifest[pypkg]['rprovides'] =3D []
+        continue
+
     # Use an empty dict as data structure to hold data for each package =
and fill it up
     new_manifest[pypkg] =3D {}
     new_manifest[pypkg]['summary'] =3D old_manifest[pypkg]['summary']
+    new_manifest[pypkg]['rprovides'] =3D old_manifest[pypkg].get('rprovi=
des', [])
     new_manifest[pypkg]['rdepends'] =3D []
     if "skip_depends" in old_manifest[pypkg]:
         new_manifest[pypkg]['skip_depends'] =3D old_manifest[pypkg]['ski=
p_depends']
@@ -248,14 +259,6 @@ for pypkg in old_manifest:
     print('Handling package %s' % pypkg)
     print('--------------------------')
=20
-    # Handle special cases, we assume that when they were manually added=
=20
-    # to the manifest we knew what we were doing.
-    special_packages =3D ['misc', 'modules', 'dev', 'tests']
-    if pypkg in special_packages or 'staticdev' in pypkg:
-        print_indent('Passing %s package directly' % pypkg, 2)
-        new_manifest[pypkg] =3D old_manifest[pypkg]
-        continue
-
     for filedep in old_manifest[pypkg]['files']:
         # We already handled core on the first pass, we can ignore it no=
w
         if pypkg =3D=3D 'core':
@@ -440,6 +443,10 @@ for pypkg in new_manifest:
     new_manifest[pypkg]['files'].sort()
     new_manifest[pypkg]['cached'].sort()
     new_manifest[pypkg]['rdepends'].sort()
+    new_manifest[pypkg]['rprovides'].sort()
+    # Remove empty sections
+    if not new_manifest[pypkg]['rprovides']:
+        new_manifest[pypkg].pop('rprovides')
=20
 # Create the manifest from the data structure that was built
 with open('python3-manifest.json.new','w') as outfile:
diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
index be4c50f6863..1f9d597eb69 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -441,6 +441,10 @@ python(){
         pypackage =3D pn + '-' + key + '-native'
         if pypackage not in rprovides:
               rprovides.append(pypackage)
+        for subkey in python_manifest[key].get('rprovides', ()):
+            pypackage =3D pn + '-' + subkey + '-native'
+            if pypackage not in rprovides:
+                rprovides.append(pypackage)
=20
     d.setVar('RPROVIDES:class-native', ' '.join(rprovides))
=20
@@ -474,6 +478,11 @@ python(){
                 value=3Dvalue.split('-', 1)[1]
             d.appendVar('RDEPENDS:' + pypackage, ' ' + pn + '-' + value)
=20
+        for value in python_manifest[key].get('rprovides', ()):
+            if '${PN}' in value:
+                value=3Dvalue.split('-', 1)[1]
+            d.appendVar('RPROVIDES:' + pypackage, ' ' + pn + '-' + value=
)
+
         for value in python_manifest[key].get('rrecommends', ()):
             if '${PN}' in value:
                 value=3Dvalue.split('-', 1)[1]
--=20
2.43.0

