Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1488C71157
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 13:16:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10182.1749820586691947776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 06:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 095101C0A
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D80E3F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] oe/license_finder: remove unused arguments in get_license_md5sums
Date: Fri, 13 Jun 2025 14:16:16 +0100
Message-ID: <20250613131620.221912-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613131620.221912-1-ross.burton@arm.com>
References: <20250613131620.221912-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218607

get_license_md5sums() has two optional arguments:

- static_only: if set, don't checksum the licenses in COMMON_LICENSE_DIR
- linenumbers: if set, the CSV file can contain begin/end/md5 values as
  used in LIC_FILES_CHKSUM.

Neither of these are used and complicate the logic, so remove them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/license_finder.py | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oe/license_finder.py b/meta/lib/oe/license_finder.p=
y
index 097b324c585..be03e5d0846 100644
--- a/meta/lib/oe/license_finder.py
+++ b/meta/lib/oe/license_finder.py
@@ -14,16 +14,16 @@ import bb
=20
 logger =3D logging.getLogger("BitBake.OE.LicenseFinder")
=20
-def get_license_md5sums(d, static_only=3DFalse, linenumbers=3DFalse):
+def get_license_md5sums(d):
     import bb.utils
     import csv
     md5sums =3D {}
-    if not static_only and not linenumbers:
-        # Gather md5sums of license files in common license dir
-        commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
-        for fn in os.listdir(commonlicdir):
-            md5value =3D bb.utils.md5_file(os.path.join(commonlicdir, fn=
))
-            md5sums[md5value] =3D fn
+
+    # Gather md5sums of license files in common license dir
+    commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
+    for fn in os.listdir(commonlicdir):
+        md5value =3D bb.utils.md5_file(os.path.join(commonlicdir, fn))
+        md5sums[md5value] =3D fn
=20
     # The following were extracted from common values in various recipes
     # (double checking the license against the license file itself, not =
just
@@ -34,14 +34,9 @@ def get_license_md5sums(d, static_only=3DFalse, linenu=
mbers=3DFalse):
         csv_path =3D os.path.join(path, 'files', 'license-hashes.csv')
         if os.path.isfile(csv_path):
             with open(csv_path, newline=3D'') as csv_file:
-                fieldnames =3D ['md5sum', 'license', 'beginline', 'endli=
ne', 'md5']
-                reader =3D csv.DictReader(csv_file, delimiter=3D',', fie=
ldnames=3Dfieldnames)
+                reader =3D csv.DictReader(csv_file, delimiter=3D',', fie=
ldnames=3D['md5sum', 'license'])
                 for row in reader:
-                    if linenumbers:
-                        md5sums[row['md5sum']] =3D (
-                            row['license'], row['beginline'], row['endli=
ne'], row['md5'])
-                    else:
-                        md5sums[row['md5sum']] =3D row['license']
+                    md5sums[row['md5sum']] =3D row['license']
=20
     return md5sums
=20
--=20
2.43.0


