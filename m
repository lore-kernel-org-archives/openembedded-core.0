Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEC3C71159
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 13:16:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10096.1749820588015741745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 06:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F0EA1C0A
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 518393F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] oe/license_finder: rewrite license checksum loading, scan more licenses
Date: Fri, 13 Jun 2025 14:16:18 +0100
Message-ID: <20250613131620.221912-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613131620.221912-1-ross.burton@arm.com>
References: <20250613131620.221912-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218609

Rewrite the license checksum generation and loading of CSV files to be
clearer.

This also expands the scan of COMMON_LICENSE_DIR to include LICENSE_PATH,
which can be extended by layers to provide more license texts.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/license_finder.py | 65 ++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 36 deletions(-)

diff --git a/meta/lib/oe/license_finder.py b/meta/lib/oe/license_finder.p=
y
index cacb4cb19d6..1bdc39e1c53 100644
--- a/meta/lib/oe/license_finder.py
+++ b/meta/lib/oe/license_finder.py
@@ -11,24 +11,18 @@ import os
 import re
=20
 import bb
+import bb.utils
=20
 logger =3D logging.getLogger("BitBake.OE.LicenseFinder")
=20
-def get_license_md5sums(d):
-    import bb.utils
+def _load_hash_csv(d):
+    """
+    Load a mapping of (checksum: license name) from all files/license-ha=
shes.csv
+    files that can be found in the available layers.
+    """
     import csv
     md5sums =3D {}
=20
-    # Gather md5sums of license files in common license dir
-    commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
-    for fn in os.listdir(commonlicdir):
-        md5value =3D bb.utils.md5_file(os.path.join(commonlicdir, fn))
-        md5sums[md5value] =3D fn
-
-    # The following were extracted from common values in various recipes
-    # (double checking the license against the license file itself, not =
just
-    # the LICENSE value in the recipe)
-
     # Read license md5sums from csv file
     for path in d.getVar('BBPATH').split(':'):
         csv_path =3D os.path.join(path, 'files', 'license-hashes.csv')
@@ -41,28 +35,28 @@ def get_license_md5sums(d):
     return md5sums
=20
=20
-def crunch_known_licenses(d):
-    '''
-    Calculate the MD5 checksums for the crunched versions of all common
-    licenses. Also add additional known checksums.
-    '''
-   =20
-    crunched_md5sums =3D {}
+def _crunch_known_licenses(d):
+    """
+    Calculate the MD5 checksums for the original and "crunched" versions=
 of all
+    known licenses.
+    """
+    md5sums =3D {}
=20
-    commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
-    for fn in sorted(os.listdir(commonlicdir)):
-        md5value =3D crunch_license(os.path.join(commonlicdir, fn))
-        if md5value not in crunched_md5sums:
-            crunched_md5sums[md5value] =3D fn
-        elif fn !=3D crunched_md5sums[md5value]:
-            bb.debug(2, "crunched_md5sums['%s'] is already set to '%s' r=
ather than '%s'" % (md5value, crunched_md5sums[md5value], fn))
-        else:
-            bb.debug(2, "crunched_md5sums['%s'] is already set to '%s'" =
% (md5value, crunched_md5sums[md5value]))
+    lic_dirs =3D [d.getVar('COMMON_LICENSE_DIR')] + (d.getVar('LICENSE_P=
ATH') or "").split()
+    for lic_dir in lic_dirs:
+        for fn in os.listdir(lic_dir):
+            path =3D os.path.join(lic_dir, fn)
+            # Hash the exact contents
+            md5value =3D bb.utils.md5_file(path)
+            md5sums[md5value] =3D fn
+            # Also hash a "crunched" version
+            md5value =3D _crunch_license(path)
+            md5sums[md5value] =3D fn
=20
-    return crunched_md5sums
+    return md5sums
=20
=20
-def crunch_license(licfile):
+def _crunch_license(licfile):
     '''
     Remove non-material text from a license file and then calculate its
     md5sum. This works well for licenses that contain a copyright statem=
ent,
@@ -152,10 +146,9 @@ def find_license_files(srctree, first_only=3DFalse):
=20
=20
 def match_licenses(licfiles, srctree, d):
-    import bb
-    md5sums =3D get_license_md5sums(d)
-
-    crunched_md5sums =3D crunch_known_licenses(d)
+    md5sums =3D {}
+    md5sums.update(_load_hash_csv(d))
+    md5sums.update(_crunch_known_licenses(d))
=20
     licenses =3D []
     for licfile in sorted(licfiles):
@@ -163,8 +156,8 @@ def match_licenses(licfiles, srctree, d):
         md5value =3D bb.utils.md5_file(resolved_licfile)
         license =3D md5sums.get(md5value, None)
         if not license:
-            crunched_md5 =3D crunch_license(resolved_licfile)
-            license =3D crunched_md5sums.get(crunched_md5, None)
+            crunched_md5 =3D _crunch_license(resolved_licfile)
+            license =3D md5sums.get(crunched_md5, None)
             if not license:
                 license =3D 'Unknown'
                 logger.info("Please add the following line for '%s' to a=
 'license-hashes.csv' " \
--=20
2.43.0


