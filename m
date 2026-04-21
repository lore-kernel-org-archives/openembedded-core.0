Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6306BF327CC
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:15:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18550.1776762940281282068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tkdYHPj5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B0CBD4E42A87
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:15:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88666600D2
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:15:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20CBC10460A47;
	Tue, 21 Apr 2026 11:15:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776762937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4USgh/yYftDRsPorOQ3v1GbWWoH/oT4Yf5mLnTT7cvI=;
	b=tkdYHPj5q5b1YCQaCwZdwQf1hwyQwOV0JrvrZE9yO7EizP8oy9+jhodUNcS5NaSd5/oWLP
	O+62DxLZA3p9RWaKNjNgnMYgZLeys6ibBtQ7X7iXDF/8WZqo2N3s8FdJJpcQ+ojkzGAno0
	C7AvBzvigwicceuYTdxcJwuKTKchC9IXPlS68EfpMvG8W/3DEZ2YjjATe4ClEm7CiXVjxo
	iuEF5/UqWv1l049QSDeCG2fypeSGLNk7/LYQoM6i/CI2m1dM354xisSGoN8Ik+yOG69vm0
	3YjxkmOynaJeTZ1NvWCm1DDZsIYqtEImZfW5qiwtZHIbxUKAitwP+f69TsfuFw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 21 Apr 2026 11:15:31 +0200
Subject: [PATCH] sbom-cve-check-common: print warnings on unpatched CVEs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-sbom-cve-check-warnings-v1-1-df7861a0a0bc@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJaQioVzEu6PADo7GYDqIJ4
 e5WXH6L91YyJIXRuVgpYVHTKWaUh4JkbOMA1i6bvPO1q3zJFqYHywKWEXLnd5uixsG4cscOp6a
 pgzjK9TOh189+vlz/tle4QebfjrbtC9qiHXh7AAAA
X-Change-ID: 20260421-sbom-cve-check-warnings-408de9776bc0
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LJ0/OUVjMGh2RM23DcHdSvWK22Q/MkMAqCsbXpCL0C8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp50A3QzEvNR24RwKJpzj2uPBbGdPncIjuuBdYu
 q/ICpbP9E6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaedANwAKCRDRgEFAKaOo
 NpApD/9B/CI/P3Y+b1Cgj8rfxU32YZRenmKEf6srH8BWT5C6iHVNNKfjNtWaYp+7jiHVesqMXNI
 tNUfdBuV3Fs0NmuB6sWjTO65lIdOKJGrFozB901OUCgVlV+TNCw8Co+2rhSUrYlB3o71xNz8cLS
 9BJoK2wyg083Jxq5l4j98jC60fpm8OXC9wMkRPEN9v9OdPzL07l/6N9EVRFjYBC4huOLJ0HHBLD
 YcD/DjCmfcnOChRch5B3bbed+Sx95yCCN9mWosGi/J6p5Wd25Wr4ZGD+AgNSp5LbNpNscSiZt+x
 UNz2MSLyoLYnj5wKUKAy5+FLrq1jr2FzuphhR3e9HXoN/nBl8RV14Af+Ei52Czu6QZyOmagHtsc
 fwrS6ZsTHqr7LDNnleG1LquMliU2dW09VvNugHXcMKCd4tNFV2BDoxVF1dwJz3d3bJszuiR0efX
 od3fPh0l6rpSvtie3g8q5Ui4RMhSufRBEbZwIjGCjjB9mS0GZDNACWNVKWN8gKlLnmcyOp+lYXb
 fyrk+EsyMykn+KVwR9NAwxnrnoZzp+IwB79wYymMKZ9ve01CGVukucvetcfjWo+NAKRixXPtUDN
 H3yYPRTnhDj1oaw9ieuBKntBf9797q1SggAJbD23qaJ6Yy3c8mb0sWe0y7oedv8HZj7ft6AYUqU
 drfcJl0ybcNf9jA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235606

The now removed cve-check class used to print warnings when CVEs with
status "Unpatched" were found. Add this feature to the
sbom-cve-check class with the same default value (enabled).

For now it only does so when the cvecheck report type is enabled. It may
be possible to do the same for the SPDX report type.

Sample output:

WARNING: core-image-minimal-1.0-r0 do_sbom_cve_check: busybox-1.37.0: Found unpatched CVEs: CVE-2024-58251
WARNING: core-image-minimal-1.0-r0 do_sbom_cve_check: expat-2.7.5: Found unpatched CVEs: CVE-2025-66382, CVE-2026-41080
WARNING: core-image-minimal-1.0-r0 do_sbom_cve_check: glibc-2.43+git: Found unpatched CVEs: CVE-2010-4756, CVE-2026-4046

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/classes/sbom-cve-check-common.bbclass | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sbom-cve-check-common.bbclass
index 6963ad71c61..d84416c8a50 100644
--- a/meta/classes/sbom-cve-check-common.bbclass
+++ b/meta/classes/sbom-cve-check-common.bbclass
@@ -48,6 +48,33 @@ SBOM_CVE_CHECK_UPDATE_DB_DEPENDENCIES ?= " \
     sbom-cve-check-update-nvd-native:do_patch \
 "
 
+SBOM_CVE_CHECK_SHOW_WARNINGS ?= "1"
+SBOM_CVE_CHECK_SHOW_WARNINGS[doc] = "Show warning messages when unpatched CVEs are found. \
+Requires the SBOM_CVE_CHECK_EXPORT_CVECHECK report type to be enabled"
+
+def show_warnings_from_file(cvecheck_export_file):
+    import json
+    report = {}
+
+    try:
+        with open(cvecheck_export_file, "r") as f:
+            report = json.load(f)
+    except (json.JSONDecodeError, UnicodeDecodeError) as e:
+        bb.error(f"Failed to open JSON report file {f}: {e}")
+        return
+
+    packages = report.get("package", [])
+    for package in packages:
+        unpatched = []
+        cves = package.get("issue", [])
+        for cve in cves:
+            if cve["status"] == "Unpatched":
+                unpatched.append(cve["id"])
+        if unpatched:
+            pname = package["name"]
+            version = package["version"]
+            bb.warn(f"{pname}-{version}: Found unpatched CVEs: {', '.join(unpatched)}")
+
 def run_sbom_cve_check(d, sbom_path, export_base_name, export_link_name=None):
     import os
     import bb
@@ -94,9 +121,13 @@ def run_sbom_cve_check(d, sbom_path, export_base_name, export_link_name=None):
         bb.error(f"sbom-cve-check failed: {e}")
         return
 
+    show_warnings = oe.utils.vartrue("SBOM_CVE_CHECK_SHOW_WARNINGS", True, False, d)
+
     for export_type, export_file, export_link in export_files:
         bb.note(f"sbom-cve-check exported: {export_file}")
         if export_link:
             update_symlinks(export_file, export_link)
+        if show_warnings and export_type == d.getVarFlag("SBOM_CVE_CHECK_EXPORT_CVECHECK", "type"):
+            show_warnings_from_file(export_file)
 
 

---
base-commit: 9a83f0878b6bacbc7b322cfec076b4e79ad7b8fb
change-id: 20260421-sbom-cve-check-warnings-408de9776bc0


