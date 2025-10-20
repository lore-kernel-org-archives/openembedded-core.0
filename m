Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41524CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:10:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.12245.1760944228262797698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 00:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=G92uOJNq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EBD444E411D9;
	Mon, 20 Oct 2025 07:10:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1A92606D5;
	Mon, 20 Oct 2025 07:10:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91724102F2396;
	Mon, 20 Oct 2025 09:10:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760944221; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=J/TyRsPT5ieDRSNkvUoS227D+G6Ssyasp8n03WfOzR0=;
	b=G92uOJNq5mod/x0YBcn8mls38i655hEkP2T0ohJytPprQs+N/STbeUULwdew0J5HbWamj+
	1byRTTs/DtR1aJi11hoG3ly3JJ69HDp18NsJzmaCxeD5D8nLWJrsHep9GSx9msONoIPb98
	V+Ndh8rm2O92OXo7qmhqW3H5LUXCOoCRp9HWtCzEn7iJIBj5ThKa2sp3Ap0cdFeowxKaxw
	OwS+32sa0pduYey9ktPyT4GHTty8ltgEZDSAHWUy8cFVY4qdNUDdCIv3OA+yubU0Ix8CxH
	pr/mVQ99gOcPL3P/nv5scDxUo+7L6yDbE49xdaPtlhbFob0s4YZrUIb8wQvMFQ==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v2 04/11] lib/license: Move package license skip to library
Date: Mon, 20 Oct 2025 09:09:44 +0200
Message-ID: <20251020070952.942165-5-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225102

From: Joshua Watt <JPEWhacker@gmail.com>

Moves the code that skips packages with incompatible licenses to the
library code so that it can be called in other locations

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 86eb409e3c1b30110869ec5a0027ae2d48bbfe7f)
---
 meta/classes-global/base.bbclass | 35 ++++------------------------
 meta/lib/oe/license.py           | 39 ++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 31 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
index f764f3ee2f..ecf0fd711f 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -565,37 +565,10 @@ python () {
=20
         bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split(=
)
=20
-        check_license =3D False if pn.startswith("nativesdk-") else True
-        for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${=
TARGET_ARCH}",
-              "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
-              "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
-            if pn.endswith(d.expand(t)):
-                check_license =3D False
-        if pn.startswith("gcc-source-"):
-            check_license =3D False
-
-        if check_license and bad_licenses:
-            bad_licenses =3D oe.license.expand_wildcard_licenses(d, bad_=
licenses)
-
-            exceptions =3D (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") =
or "").split()
-
-            for lic_exception in exceptions:
-                if ":" in lic_exception:
-                    lic_exception =3D lic_exception.split(":")[1]
-                if lic_exception in oe.license.obsolete_license_list():
-                    bb.fatal("Obsolete license %s used in INCOMPATIBLE_L=
ICENSE_EXCEPTIONS" % lic_exception)
-
-            pkgs =3D d.getVar('PACKAGES').split()
-            skipped_pkgs =3D {}
-            unskipped_pkgs =3D []
-            for pkg in pkgs:
-                remaining_bad_licenses =3D oe.license.apply_pkg_license_=
exception(pkg, bad_licenses, exceptions)
-
-                incompatible_lic =3D oe.license.incompatible_license(d, =
remaining_bad_licenses, pkg)
-                if incompatible_lic:
-                    skipped_pkgs[pkg] =3D incompatible_lic
-                else:
-                    unskipped_pkgs.append(pkg)
+        pkgs =3D d.getVar('PACKAGES').split()
+        if pkgs:
+            skipped_pkgs =3D oe.license.skip_incompatible_package_licens=
es(d, pkgs)
+            unskipped_pkgs =3D [p for p in pkgs if p not in skipped_pkgs=
]
=20
             if unskipped_pkgs:
                 for pkg in skipped_pkgs:
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 83c2e47766..c1ae103b54 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -422,3 +422,42 @@ def check_license_format(d):
                     '%s: LICENSE value "%s" has an invalid separator "%s=
" that is not ' \
                     'in the valid list of separators (%s)' %
                     (pn, licenses, element, license_operator_chars), d)
+
+def skip_incompatible_package_licenses(d, pkgs):
+    if not pkgs:
+        return {}
+
+    pn =3D d.getVar("PN")
+
+    check_license =3D False if pn.startswith("nativesdk-") else True
+    for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARG=
ET_ARCH}",
+            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
+            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
+        if pn.endswith(d.expand(t)):
+            check_license =3D False
+    if pn.startswith("gcc-source-"):
+        check_license =3D False
+
+    bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
+    if not check_license or not bad_licenses:
+        return {}
+
+    bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
+
+    exceptions =3D (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").s=
plit()
+
+    for lic_exception in exceptions:
+        if ":" in lic_exception:
+            lic_exception =3D lic_exception.split(":")[1]
+        if lic_exception in obsolete_license_list():
+            bb.fatal("Obsolete license %s used in INCOMPATIBLE_LICENSE_E=
XCEPTIONS" % lic_exception)
+
+    skipped_pkgs =3D {}
+    for pkg in pkgs:
+        remaining_bad_licenses =3D apply_pkg_license_exception(pkg, bad_=
licenses, exceptions)
+
+        incompatible_lic =3D incompatible_license(d, remaining_bad_licen=
ses, pkg)
+        if incompatible_lic:
+            skipped_pkgs[pkg] =3D incompatible_lic
+
+    return skipped_pkgs
--=20
2.43.0


