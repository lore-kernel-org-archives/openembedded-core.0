Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23A1C71135
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 13:16:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10183.1749820587535028730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 06:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6CEC1C0A
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A98323F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] oe/license_finder: don't return the "crunched" license text in crunch_license
Date: Fri, 13 Jun 2025 14:16:17 +0100
Message-ID: <20250613131620.221912-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613131620.221912-1-ross.burton@arm.com>
References: <20250613131620.221912-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218608

crunch_license() will perform some basic text manipulation to try and
canonicalise the license texts. It also returns the new license text but
none of the callers use this, and as a slightly mangled version of the
original it has no real purpose.

Remove this return value and clean up the callers.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/license_finder.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/license_finder.py b/meta/lib/oe/license_finder.p=
y
index be03e5d0846..cacb4cb19d6 100644
--- a/meta/lib/oe/license_finder.py
+++ b/meta/lib/oe/license_finder.py
@@ -51,7 +51,7 @@ def crunch_known_licenses(d):
=20
     commonlicdir =3D d.getVar('COMMON_LICENSE_DIR')
     for fn in sorted(os.listdir(commonlicdir)):
-        md5value, lictext =3D crunch_license(os.path.join(commonlicdir, =
fn))
+        md5value =3D crunch_license(os.path.join(commonlicdir, fn))
         if md5value not in crunched_md5sums:
             crunched_md5sums[md5value] =3D fn
         elif fn !=3D crunched_md5sums[md5value]:
@@ -123,8 +123,7 @@ def crunch_license(licfile):
         md5val =3D m.hexdigest()
     except UnicodeEncodeError:
         md5val =3D None
-        lictext =3D ''
-    return md5val, lictext
+    return md5val
=20
=20
 def find_license_files(srctree, first_only=3DFalse):
@@ -164,15 +163,15 @@ def match_licenses(licfiles, srctree, d):
         md5value =3D bb.utils.md5_file(resolved_licfile)
         license =3D md5sums.get(md5value, None)
         if not license:
-            crunched_md5, lictext =3D crunch_license(resolved_licfile)
+            crunched_md5 =3D crunch_license(resolved_licfile)
             license =3D crunched_md5sums.get(crunched_md5, None)
-            if lictext and not license:
+            if not license:
                 license =3D 'Unknown'
                 logger.info("Please add the following line for '%s' to a=
 'license-hashes.csv' " \
                     "and replace `Unknown` with the license:\n" \
                     "%s,Unknown" % (os.path.relpath(licfile, srctree + "=
/.."), md5value))
-        if license:
-            licenses.append((license, os.path.relpath(licfile, srctree),=
 md5value))
+
+        licenses.append((license, os.path.relpath(licfile, srctree), md5=
value))
=20
     return licenses
=20
--=20
2.43.0


