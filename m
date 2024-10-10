Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D40ECFC5EB
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 16:06:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.47648.1728576395417135287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 09:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BEEE497
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:07:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9809D3F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 09:06:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 08/11] insane: micro-optimise the sweep of pkgfiles
Date: Thu, 10 Oct 2024 17:06:20 +0100
Message-Id: <20241010160623.2880937-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010160623.2880937-1-ross.burton@arm.com>
References: <20241010160623.2880937-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 16:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205417

Don't actively do more work:

- Exit early if there are no packages being generated
- Don't iterate repeatedly when removing CONTROL and DEBIAN
- Extend a list with another list instead of appending item by item
- Remove unused variables

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index b165f111cec..05b8538940d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1084,13 +1084,8 @@ parse_test_matrix[vardepsexclude] =3D "ERROR_QA WA=
RN_QA"
=20
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
-    import subprocess
     import oe.packagedata
=20
-    bb.note("DO PACKAGE QA")
-
-    main_lic =3D d.getVar('LICENSE')
-
     # Check for obsolete license references in main LICENSE (packages ar=
e checked below for any changes)
     main_licenses =3D oe.license.list_licenses(d.getVar('LICENSE'))
     obsolete =3D set(oe.license.obsolete_license_list()) & main_licenses
@@ -1106,27 +1101,27 @@ python do_package_qa () {
     pn =3D d.getVar('PN')
=20
     # Scan the packages...
-    pkgdest =3D d.getVar('PKGDEST')
     packages =3D set((d.getVar('PACKAGES') or '').split())
+    # no packages should be scanned
+    if not packages:
+        return
=20
     global pkgfiles
     pkgfiles =3D {}
+    pkgdest =3D d.getVar('PKGDEST')
     for pkg in packages:
-        pkgfiles[pkg] =3D []
         pkgdir =3D os.path.join(pkgdest, pkg)
+        pkgfiles[pkg] =3D []
         for walkroot, dirs, files in os.walk(pkgdir):
             # Don't walk into top-level CONTROL or DEBIAN directories as=
 these
             # are temporary directories created by do_package.
             if walkroot =3D=3D pkgdir:
-                for control in ("CONTROL", "DEBIAN"):
-                    if control in dirs:
-                        dirs.remove(control)
-            for file in files:
-                pkgfiles[pkg].append(os.path.join(walkroot, file))
-
-    # no packages should be scanned
-    if not packages:
-        return
+                for removedir in ("CONTROL", "DEBIAN"):
+                    try:
+                        dirs.remove(removedir)
+                    except ValueError:
+                        pass
+            pkgfiles[pkg].extend((os.path.join(walkroot, f) for f in fil=
es))
=20
     import re
     # The package name matches the [a-z0-9.+-]+ regular expression
--=20
2.34.1


