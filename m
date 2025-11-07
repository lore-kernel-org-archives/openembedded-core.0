Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947E7CD1288
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:15:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11176.1762521330137628356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=MxWs2K3O;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C3DF74E41596;
	Fri,  7 Nov 2025 13:15:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B71B606A6;
	Fri,  7 Nov 2025 13:15:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0197118525D9;
	Fri,  7 Nov 2025 14:15:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762521328; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yjQMTFDRqvt249qh/UJA356++r9VLDac8ztWKC7lOwY=;
	b=MxWs2K3O4V4ab22jqCTiiruH3cnHFi19+wI4AzBw+NCO2jrhtoP46rvm4MAm5NNSnUextw
	F34Y7r2vb+bky7U8nB0Cye829lhLZcDAcXa3kVMfKqsTT31XvgcZEPKdoXVrA+o2zo6oFW
	szq5g4fLfaf2SPZz9kQo5i1y++h+gHrFRa+SberfmDqohUvRc6kaVpg3g2mYblOi3McAFJ
	rxbNRTPiQDI8Z6gl2Z59F5bck0yyAVMdvjNc7ayOZKqP+Oh3rG1YyzCpFVEsKYLT8wTxgc
	+2KBMfax+CFx4WeF7tijdvV7HnOZ8bFVtZvs5M8DVOfPeN6dr8tUrQLXtpxVdw==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [scarthgap v4 15/17] spdx30_tasks: adapt CVE handling to new cve-check API
Date: Fri,  7 Nov 2025 14:14:49 +0100
Message-ID: <20251107131502.3857600-16-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226051

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

Changes to cve-check (see poky commit fb3f440b7d8,
"cve-check: annotate CVEs during analysis") modified the
get_patched_cves() API to return a set of CVE IDs instead of a
dictionary of CVE metadata.

The SPDX 3 backport still expected a dictionary and attempted to call
.items(), leading to:

    AttributeError: 'set' object has no attribute 'items'

This patch updates the SPDX3 code to iterate directly over the CVE IDs
and use `oe.cve_check.decode_cve_status()` to retrieve the mapping,
detail, and description for each CVE. This restores compatibility with
the updated CVE API and matches the behavior of SPDX3 handling on
Walnascar.

A warning is logged if a CVE has missing or unknown status.

Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.=
com>
---
 meta/lib/oe/spdx30_tasks.py | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index f6e6e545dc..6b0aa137c4 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -502,34 +502,29 @@ def create_spdx(d):
     cve_by_status =3D {}
     if include_vex !=3D "none":
         patched_cves =3D oe.cve_check.get_patched_cves(d)
-        for cve, patched_cve in patched_cves.items():
-            decoded_status =3D {
-                "mapping": patched_cve["abbrev-status"],
-                "detail": patched_cve["status"],
-                "description": patched_cve.get("justification", None)
-            }
+        for cve_id in patched_cves:
+            mapping, detail, description =3D oe.cve_check.decode_cve_sta=
tus(d, cve_id)
+
+            if not mapping or not detail:
+                bb.warn(f"Skipping {cve_id} =E2=80=94 missing or unknown=
 CVE status")
+                continue
=20
             # If this CVE is fixed upstream, skip it unless all CVEs are
             # specified.
             if (
                 include_vex !=3D "all"
-                and "detail" in decoded_status
-                and decoded_status["detail"]
-                in (
-                    "fixed-version",
-                    "cpe-stable-backport",
-                )
+                and "detail" in ("fixed-version", "cpe-stable-backport")
             ):
-                bb.debug(1, "Skipping %s since it is already fixed upstr=
eam" % cve)
+                bb.debug(1, "Skipping %s since it is already fixed upstr=
eam" % cve_id)
                 continue
=20
-            spdx_cve =3D build_objset.new_cve_vuln(cve)
+            spdx_cve =3D build_objset.new_cve_vuln(cve_id)
             build_objset.set_element_alias(spdx_cve)
=20
-            cve_by_status.setdefault(decoded_status["mapping"], {})[cve]=
 =3D (
+            cve_by_status.setdefault(mapping, {})[cve_id] =3D (
                 spdx_cve,
-                decoded_status["detail"],
-                decoded_status["description"],
+                detail,
+                description,
             )
=20
     cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getV=
ar("CVE_VERSION"))
--=20
2.43.0


