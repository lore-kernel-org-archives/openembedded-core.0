Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA4ACFA765
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 09:54:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8130.1763718866009982324
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 01:54:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=OUGb7kds;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 807101A1C82;
	Fri, 21 Nov 2025 09:54:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5722B60719;
	Fri, 21 Nov 2025 09:54:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D20A710371B99;
	Fri, 21 Nov 2025 10:54:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763718863; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dTOUF5ZoILiTaQ8L/tu/O80mHkDv9FNtrmyrkVO+bnU=;
	b=OUGb7kdsyBlRkIk1mYx1vgJfxy0chSE6K0xwYUjP/nflnlHq03SvTmdy7PgFw5esjAoUcc
	9ii5HBGZLQiulTWT0sQqHqrGYt/2u1IfIJfIminL7cV8Q0u407zIjRS2zRNfrOYhUlatab
	8K2pToLm+pMusgzG1pfhew3uEIq5aI/lQYH4RoszYYIR6XlFuw+z5p2yILsFwsOLV3j9/t
	y3kVXb2VrjQCuiHk5Kxu68JtoiZQK+VPHDaHgMG4EuuFWjMCNTgtOGjKVMTu0AZ9yZfEmJ
	XY5QEahq+E4zASagTVhE3/w0TE1VH0zCCjFrHC/bG32+IWcoSGCTqmf+uEOOnQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com,
	miquel.raynal@bootlin.com,
	antonin.godard@bootlin.com,
	kamel.bouhara@bootlin.com,
	pascal.eberhard@se.com,
	jpewhacker@gmail.com,
	Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v2 3/5] cve-check: extract extending CVE_STATUS to library function
Date: Fri, 21 Nov 2025 10:54:11 +0100
Message-ID: <20251121095415.288301-4-benjamin.robin@bootlin.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121095415.288301-1-benjamin.robin@bootlin.com>
References: <20251121095415.288301-1-benjamin.robin@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 09:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226660

The same code for extending CVE_STATUS by CVE_CHECK_IGNORE and
CVE_STATUS_GROUPS is used on multiple places.
Create a library function to have the code on single place and ready for
reuse by additional classes.

Conflicts:
  meta/classes/cve-check.bbclass
  meta/lib/oe/cve_check.py

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45e18f4270d084d81c21b1e5a4a601ce975d8a77)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
---
 meta/classes/cve-check.bbclass | 17 ++---------------
 meta/classes/vex.bbclass       | 17 ++---------------
 meta/lib/oe/cve_check.py       | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
index d08c6ac670cf..f5bbaa5d159a 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -107,21 +107,8 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
 CVE_VERSION_SUFFIX ??=3D ""
=20
 python () {
-    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
-    cve_check_ignore =3D d.getVar("CVE_CHECK_IGNORE")
-    if cve_check_ignore:
-        bb.warn("CVE_CHECK_IGNORE is deprecated in favor of CVE_STATUS")
-        for cve in (d.getVar("CVE_CHECK_IGNORE") or "").split():
-            d.setVarFlag("CVE_STATUS", cve, "ignored")
-
-    # Process CVE_STATUS_GROUPS to set multiple statuses and optional de=
tail or description at once
-    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split(=
):
-        cve_group =3D d.getVar(cve_status_group)
-        if cve_group is not None:
-            for cve in cve_group.split():
-                d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_=
group, "status"))
-        else:
-            bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" %=
 cve_status_group)
+    from oe.cve_check import extend_cve_status
+    extend_cve_status(d)
 }
=20
 def generate_json_report(d, out_path, link_path):
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 73dd9338a1d5..c447b37db89b 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -76,21 +76,8 @@ python () {
     if bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skipping recipe: found incompatible c=
ombination of cve-check and vex enabled at the same time.")
=20
-    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
-    cve_check_ignore =3D d.getVar("CVE_CHECK_IGNORE")
-    if cve_check_ignore:
-        bb.warn("CVE_CHECK_IGNORE is deprecated in favor of CVE_STATUS")
-        for cve in (d.getVar("CVE_CHECK_IGNORE") or "").split():
-            d.setVarFlag("CVE_STATUS", cve, "ignored")
-
-    # Process CVE_STATUS_GROUPS to set multiple statuses and optional de=
tail or description at once
-    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split(=
):
-        cve_group =3D d.getVar(cve_status_group)
-        if cve_group is not None:
-            for cve in cve_group.split():
-                d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_=
group, "status"))
-        else:
-            bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" %=
 cve_status_group)
+    from oe.cve_check import extend_cve_status
+    extend_cve_status(d)
 }
=20
 def generate_json_report(d, out_path, link_path):
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index ed5c714cb8b9..7c09b7824215 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -243,3 +243,25 @@ def decode_cve_status(d, cve):
         status_mapping =3D "Unpatched"
=20
     return (status_mapping, detail, description)
+
+def extend_cve_status(d):
+    # do this only once in case multiple classes use this
+    if d.getVar("CVE_STATUS_EXTENDED"):
+        return
+    d.setVar("CVE_STATUS_EXTENDED", "1")
+
+    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
+    cve_check_ignore =3D d.getVar("CVE_CHECK_IGNORE")
+    if cve_check_ignore:
+        bb.warn("CVE_CHECK_IGNORE is deprecated in favor of CVE_STATUS")
+        for cve in (d.getVar("CVE_CHECK_IGNORE") or "").split():
+            d.setVarFlag("CVE_STATUS", cve, "ignored")
+
+    # Process CVE_STATUS_GROUPS to set multiple statuses and optional de=
tail or description at once
+    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split(=
):
+        cve_group =3D d.getVar(cve_status_group)
+        if cve_group is not None:
+            for cve in cve_group.split():
+                d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_=
group, "status"))
+        else:
+            bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" %=
 cve_status_group)
--=20
2.51.2


