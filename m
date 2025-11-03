Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7685CCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:27:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1523.1762187231293438922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 08:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=G7ck+Ht+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BCA2BC0D7B4
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 16:26:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FC4E60628;
	Mon,  3 Nov 2025 16:27:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66A8F10B501AE;
	Mon,  3 Nov 2025 17:27:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187228; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=J/TyRsPT5ieDRSNkvUoS227D+G6Ssyasp8n03WfOzR0=;
	b=G7ck+Ht+xaJCuGWnXg211Cfvi/akXWO6n73trTsek4yQTJeynvFgoQCJxj5SnMmF4UZ7dE
	ezKh4z/A+EqEeynLIKIohL11eHKf7u3JazYK+5WTUwAnaDsV8ky0h1HD3DTmNUJXPkp9HX
	FREzXw7Gao+h0DEn0Hx5EMHKWI4gXQdXt9a71G3G9+g31Q2txIRooeygi/DYC449R9Ca7o
	E7He0oG4Bgg23guJ8ya391dmDnQT6s5nIR4cpSMYB9IjwebA6aTcYqCq4/7YUR2d2wGaIc
	O37vPe6K1sonR+DGtQcYY751wT5SI0R1tpwNQrHQtj+OIAK2E3QOVao9fQaxrQ==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v3 05/16] lib/license: Move package license skip to library
Date: Mon,  3 Nov 2025 17:26:31 +0100
Message-ID: <20251103162654.1714239-6-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
References: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 16:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225672

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


