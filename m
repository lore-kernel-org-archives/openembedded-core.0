Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6897C71151
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 13:16:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10179.1749820585421779591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 06:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B985B1C0A
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BDC903F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] oe/license_finder: add first_only argument to find_licenses()
Date: Fri, 13 Jun 2025 14:16:14 +0100
Message-ID: <20250613131620.221912-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613131620.221912-1-ross.burton@arm.com>
References: <20250613131620.221912-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218605

It may be desired to find only the "top-level" license file instead of
every potential candidate, so add a first_only argument (defaulting to
False to preserve existing behaviour) to return just the first license
found.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/license_finder.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/license_finder.py b/meta/lib/oe/license_finder.p=
y
index d5030c033e7..96961658e8b 100644
--- a/meta/lib/oe/license_finder.py
+++ b/meta/lib/oe/license_finder.py
@@ -191,12 +191,18 @@ def crunch_license(licfile):
     return md5val, lictext
=20
=20
-def find_license_files(srctree):
+def find_license_files(srctree, first_only=3DFalse):
+    """
+    Search srctree for files that look like they could be licenses.
+    If first_only is True, only return the first file found.
+    """
     licspecs =3D ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', =
'[Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp=
]l-v10']
     skip_extensions =3D (".html", ".js", ".json", ".svg", ".ts", ".go", =
".sh")
     licfiles =3D []
     for root, dirs, files in os.walk(srctree):
-        for fn in files:
+        # Sort files so that LICENSE is before LICENSE.subcomponent, whi=
ch is
+        # meaningful if first_only is set.
+        for fn in sorted(files):
             if fn.endswith(skip_extensions):
                 continue
             for spec in licspecs:
@@ -204,6 +210,8 @@ def find_license_files(srctree):
                     fullpath =3D os.path.join(root, fn)
                     if not fullpath in licfiles:
                         licfiles.append(fullpath)
+                        if first_only:
+                            return licfiles
=20
     return licfiles
=20
@@ -233,8 +241,8 @@ def match_licenses(licfiles, srctree, d):
     return licenses
=20
=20
-def find_licenses(srctree, d):
-    licfiles =3D find_license_files(srctree)
+def find_licenses(srctree, d, first_only=3DFalse):
+    licfiles =3D find_license_files(srctree, first_only)
     licenses =3D match_licenses(licfiles, srctree, d)
=20
     # FIXME should we grab at least one source file with a license heade=
r and add that too?
--=20
2.43.0


