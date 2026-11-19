Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1882.1795105883268856444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 08:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=m//z9KJ8;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7036C1575
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:31:19 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 153863F673
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795105882; bh=FuKJesH0Mb4KnkYp4yVJYfatM5ZOdrV/CtoILlLq4qw=;
	h=From:To:Subject:Date:From;
	b=m//z9KJ80IYhmeLPS1YDq34ElvQDJkr8OXj9nN8WYcttBMmOiLc+nmsMFdjZZPW5M
	 CL3xjvdul8sKOjbP3dQPvIRhUZwfH4/7+Vq82x4PAoCjsSDlmQq/pjYEtuycWX6hh2
	 psKaI65OytshFtIFoK20GAUOHDCiwaPZOOIcbJKI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/6] python3: support setting RPROVIDES in the manifest
Date: Thu, 19 Nov 2026 16:31:12 +0000
Message-ID: <20261119163117.2242351-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 16:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250703
Content-Type: text/plain; charset="utf-8"

Allow modules to have a 'rprovides' key, that sets RPROVIDES for the
generated package.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/create_manifest3.py        | 23 ++++++++++++-------
 .../recipes-devtools/python/python3_3.15.2.bb |  9 ++++++++
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
diff --git a/meta/recipes-devtools/python/python3_3.15.2.bb b/meta/recipe=
s-devtools/python/python3_3.15.2.bb
index bfc783c9227..13d10face62 100644
--- a/meta/recipes-devtools/python/python3_3.15.2.bb
+++ b/meta/recipes-devtools/python/python3_3.15.2.bb
@@ -428,6 +428,10 @@ python(){
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
@@ -461,6 +465,11 @@ python(){
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

