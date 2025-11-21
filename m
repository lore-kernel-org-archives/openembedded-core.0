Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605EACFA765
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 09:54:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8128.1763718863830456257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 01:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=aM9HRrNH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B2B5A4E41831;
	Fri, 21 Nov 2025 09:54:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E31C60719;
	Fri, 21 Nov 2025 09:54:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DE4F10371E72;
	Fri, 21 Nov 2025 10:54:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763718860; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aNFpnBgx3JJViawSSGTaVre9fnpGJum+lDJ7dZAPmmQ=;
	b=aM9HRrNHX3wFQ0On8H/b/qXgef5EHIR4tXsUwTLES6AYqZKBd7ST+UrjpdmKTJs5rowoa1
	H2QexNGz1kYkFbyphLtyeCKRi2K/h3sU3YbuzUZjUh3FIBAcQaV6Blg2Jrycu2NRHqAiMZ
	VpiY9bUYzY/sUmE5drQAzmeBZ0aLpv9Eunink+jGsaH/VYb8ufpK3emxxbV/rha6AaoJRm
	B5S4HCC1wqHJICaJy7b3It0HCvQd22Vsbtt+xd0rc5XEk5OuhVG8dOO+/UXo40hY3l3FQ2
	9M/BxI45kP3IAcpgxHZ9GV/6GtDxNR0MHDPNwOHeyTJpPdfF6rvcUUzHXU/EiQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com,
	miquel.raynal@bootlin.com,
	antonin.godard@bootlin.com,
	kamel.bouhara@bootlin.com,
	pascal.eberhard@se.com,
	jpewhacker@gmail.com
Subject: [scarthgap v2 1/5] spdx30: provide all CVE_STATUS, not only Patched status
Date: Fri, 21 Nov 2025 10:54:09 +0100
Message-ID: <20251121095415.288301-2-benjamin.robin@bootlin.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121095415.288301-1-benjamin.robin@bootlin.com>
References: <20251121095415.288301-1-benjamin.robin@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 09:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226658

In scarthgap, the `oe.cve_check.get_patched_cves()` method only returns
CVEs with a "Patched" status. We want to retrieve all annotations,
including those with an "Ignored" status. Therefore, to avoid modifying
the current API, we integrate the logic for retrieving all CVE_STATUS
values =E2=80=8B=E2=80=8Bdirectly into `spdx30_task`.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
---
 meta/lib/oe/spdx30_tasks.py | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 8115088ab8ef..e6f2beb06f4e 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -452,6 +452,22 @@ def set_purposes(d, element, *var_names, force_purpo=
ses=3D[]):
     ]
=20
=20
+def _get_cves_info(d):
+    patched_cves =3D oe.cve_check.get_patched_cves(d)
+    for cve_id in (d.getVarFlags("CVE_STATUS") or {}):
+        mapping, detail, description =3D oe.cve_check.decode_cve_status(=
d, cve_id)
+        if not mapping or not detail:
+            bb.warn(f"Skipping {cve_id} =E2=80=94 missing or unknown CVE=
 status")
+            continue
+        yield cve_id, mapping, detail, description
+        patched_cves.discard(cve_id)
+
+    # decode_cve_status is decoding CVE_STATUS, so patch files need to b=
e hardcoded
+    for cve_id in patched_cves:
+        # fix-file-included is not available in scarthgap
+        yield cve_id, "Patched", "backported-patch", None
+
+
 def create_spdx(d):
     def set_var_field(var, obj, name, package=3DNone):
         val =3D None
@@ -501,20 +517,7 @@ def create_spdx(d):
     # Add CVEs
     cve_by_status =3D {}
     if include_vex !=3D "none":
-        patched_cves =3D oe.cve_check.get_patched_cves(d)
-        for cve_id in patched_cves:
-            # decode_cve_status is decoding CVE_STATUS, so patch files n=
eed to be hardcoded
-            if cve_id in (d.getVarFlags("CVE_STATUS") or {}):
-                mapping, detail, description =3D oe.cve_check.decode_cve=
_status(d, cve_id)
-            else:
-                mapping =3D "Patched"
-                detail =3D "backported-patch"  # fix-file-included is no=
t available in scarthgap
-                description =3D None
-
-            if not mapping or not detail:
-                bb.warn(f"Skipping {cve_id} =E2=80=94 missing or unknown=
 CVE status")
-                continue
-
+        for cve_id, mapping, detail, description in _get_cves_info(d):
             # If this CVE is fixed upstream, skip it unless all CVEs are
             # specified.
             if (
--=20
2.51.2


