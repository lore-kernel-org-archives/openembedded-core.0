Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D675F8FA72
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 13:02:05 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28032.1776776516310638263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 06:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=X7Styb+0;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 64F4DC5C980
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 13:02:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1425F600D2
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 13:01:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 836F110460ABF;
	Tue, 21 Apr 2026 15:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776776513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=BYSGyo+iPZIQBUzXY2WoYHvUuW6X1OmcJO1e+I48On0=;
	b=X7Styb+0bBX2p0jOAHM+WDosJFjpBX1S20wRkxBvHznMP6nJrmYfm70BbUg5rQVHK74vOB
	W0ccXVZIw7CWk22XcqcTMmRfugS7aw9K8uz9j2Kxn4x1pNe386pi06mbfR2Yfbw5PoYI2Z
	RVE5/Fq8Ia5PJmkakRR77fau17i5p/KinDb8T6ks3O7TRyP5Odz/If+F6CKCVAr5vREZHg
	5BYKC+NOY4pMHASzMtrAt1XBXq7O4/Rc1Rtq35MUjsZbYm3RmALL7XIbCA2oisAV0YKJp+
	GzuSkohzglJ2FxF7bZuRjNA6536D+jDckVBhP8OYqkRuk0IY8FDn+lDff5wH9A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 21 Apr 2026 15:01:48 +0200
Subject: [PATCH v2] sbom-cve-check-common: print warnings on unpatched CVEs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-sbom-cve-check-warnings-v2-1-79ae1d2395be@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0K6dkzbEEBX3sOwaIcBRqUlLVYN4
 e4CHsDlS95/fxaRAlMU52wWgRJH9m4FfcgE9sZ1BNysLLTUhcy1gmj9AJgIsCe8w8sEx66LkMu
 qoVNZFhalWNdjoJbfe/la/zg+7Y1w2nKb0XOcfPjs10lt3v+XpEBB05ZVoYw00uLFej892B3RD
 6JeluULlTXWBdIAAAA=
X-Change-ID: 20260421-sbom-cve-check-warnings-408de9776bc0
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mQe3upDiDRmShlv4/neGfJ6zHkGiJJQkU/j1aEeu+RY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp53VANyA3jdlaoIPYnEKfgF7DD5tE5kv/72tAd
 ioe+/pCZgCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaed1QAAKCRDRgEFAKaOo
 NruTD/4t6gQDw+RP1rFSl3AaXUdSeeR+VVBZSP3tw3hUIGuoipPNdE7aXEkC/v7osjkl5fvNQ9E
 jc/xjZGvchsXIZgbZ6yfiNZtrQnsLkep40u/9rGWs+5X44dePjSNs3m6o/A60VNqCAtEvdoW+dh
 8wOB9Tjlql9PDwd5ZnVS5IxQthKtd7YlZsbAUk8gCBjqYiqFfD76xnVLFUx9s50Xh5eqtLUk9/+
 8TrvqJvtsRkQsdI6jdKNxyYnRdbUzdlirgA3TrzynGrrSPc5Rsiv+jGCk28MPesHQUdkR9iNOiS
 l3bJzPGDsfGsDkUfw6CcVNXsQVQl9KEQaG3kRh7vj+N1jQf9F44Lp5HJcW7YAWQL7vfdrmTfxYN
 +twA2XoLMyXFtXgH4h07hWPyd9QyDF04KU4r/qtr1FI6ITFSFitQheBwzeBdmRYlN04UWVi3Z86
 HA+G8XLvIOdJ8gsf30wWd5AieV/lB+8FZ21+yu4rdCOYWQtXvXPb8k2cd0wZk7ahC1aSEqiNh5R
 kBVbwZORx8AhVJJ9qKg2qltLdGDM7z9+jony8svAwj+ScBPZyHubGy3XvO2TbaIGTmxa12kbj3k
 BwGGmCOrQ6r0NkHjCqdFffIRGoyIZZ7j+rIVvLIRzBTy50knhJHhPI3H7nvQslA5gQnHpiyZ3DS
 jW2YTsFFf/zvwKg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 13:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235677

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
Changes in v2:
- Apply suggestions from Paul
- Link to v1: https://patch.msgid.link/20260421-sbom-cve-check-warnings-v1-1-df7861a0a0bc@bootlin.com
---
 meta/classes/sbom-cve-check-common.bbclass | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sbom-cve-check-common.bbclass
index 6963ad71c61..32c29a0ec2c 100644
--- a/meta/classes/sbom-cve-check-common.bbclass
+++ b/meta/classes/sbom-cve-check-common.bbclass
@@ -48,6 +48,32 @@ SBOM_CVE_CHECK_UPDATE_DB_DEPENDENCIES ?= " \
     sbom-cve-check-update-nvd-native:do_patch \
 "
 
+SBOM_CVE_CHECK_SHOW_WARNINGS ?= "1"
+SBOM_CVE_CHECK_SHOW_WARNINGS[doc] = "Show warning messages when unpatched CVEs are found. \
+Requires the SBOM_CVE_CHECK_EXPORT_CVECHECK report type to be enabled"
+
+def show_warnings_from_file(cvecheck_export_file):
+    import json
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
@@ -94,9 +120,13 @@ def run_sbom_cve_check(d, sbom_path, export_base_name, export_link_name=None):
         bb.error(f"sbom-cve-check failed: {e}")
         return
 
+    show_warnings = bb.utils.to_boolean(d.getVar("SBOM_CVE_CHECK_SHOW_WARNINGS"))
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


