Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FD3C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:20:36 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.4628.1655299227282477276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dua3sjg9;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id v14so15362985wra.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QSoQvm+CssHRpq4WwZSumcROaSAFzwvNITToI5uezJk=;
        b=dua3sjg9l4r24oDtEX0ocxej6AOlsXIznoSkAk3P+/rm3BppXBV4TlPisnk+8p1tV1
         wYHkOe+XO0f5MFS9pSAOmDYwZfKxHxOufzu9EwHwG82RM9TS1EsKBX/PnerDEPVyFA2s
         uumEiQVdtZ/Sp2b3hrsWru+nv6RoAX8AAsMnZeSw26Bxa4ldvjWwZqkVrHmJQE6fxJ+a
         wHTq7IvOvRQXT1pulKCu5lFCmKpvWZo3xEKJUjcnT6YdpNnif3s2ze63/l4gEZrJNpZs
         2HNKIn6jArPhsinix7UGeaBBTQekVGG8MlNIYXuUWOkiOKFC5MaV1N4WQuqIN9iTZArk
         PU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QSoQvm+CssHRpq4WwZSumcROaSAFzwvNITToI5uezJk=;
        b=uXhjHtUU2rnNgGgpwhCYEXr/UnitcaRZbT6eGTIhgwu5YKcncM0uT+J8zEDQ+bTLoQ
         E0x1dz/X/5LQ5JVCGh4LfSntnR+0/1U/qTfXVNr5x4fKIkjBDiR75NrA/M5t/8Zvdsg7
         umKp+kUq062m3x7DhEugvaiCmZOu2YYlL+7sX/wVqAo5PT8InoyYUvUTnXPDF0ouWj3C
         yI5jgQEVmcQrY9gP+iu+2SUxZDXBY7dMtN9biWuwMO/vO/H8FGUR2kzOMknZ5fES5ymY
         XzguDXHT63CdAGnRdvK1MJnN2TE7Zj8MfTurpU2fqaVsjPvtAHCVJBIW4uO07HM90Brl
         MWcw==
X-Gm-Message-State: AJIora9GZAtMl8AvEs6oZZ2dYlpuGnrkCw2ezukvKQfKihHBM2dld3XO
	nuk6u1pJ3j9pgf5POkF6nzt0oG8lEUCorQ==
X-Google-Smtp-Source: 
 AGRyM1uHmR3ATC3zRxgQ7QOrX5cRFo/T9ret+bjNb4q3rv47H6BtLwsqFc6C6UYiWLi5z1WOQtl+RA==
X-Received: by 2002:adf:e691:0:b0:210:2d6a:8a82 with SMTP id
 r17-20020adfe691000000b002102d6a8a82mr10095442wrm.14.1655299225340;
        Wed, 15 Jun 2022 06:20:25 -0700 (PDT)
Received: from localhost.localdomain ([80.215.138.27])
        by smtp.gmail.com with ESMTPSA id
 l5-20020a05600c47c500b0039746638d6esm2226876wmo.33.2022.06.15.06.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 06:20:24 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH v2 1/2] cve-check: add support for Ignored CVEs
Date: Wed, 15 Jun 2022 15:20:11 +0200
Message-Id: <20220615132011.2432008-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:20:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166986

Ignored CVEs aren't patched, but do not apply in our configuration
for some reason. Up till now they were only partially supported
and reported as "Patched".

This patch adds separate reporting of Ignored CVEs. The variable
CVE_CHECK_REPORT_PATCHED now manages reporting of both patched
and ignored CVEs.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
Changes in v2:
    - fix JSON generation with CVE_CHECK_REPORT_PATCHED enabled/disabled
---
 meta/classes/cve-check.bbclass | 43 ++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 1b4910f737..50b9247f46 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -47,7 +47,9 @@ CVE_CHECK_MANIFEST_JSON ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
+# Report Patched or Ignored CVEs
 CVE_CHECK_REPORT_PATCHED ??= "1"
+
 CVE_CHECK_SHOW_WARNINGS ??= "1"
 
 # Provide text output
@@ -144,7 +146,7 @@ python do_cve_check () {
             bb.fatal("Failure in searching patches")
         ignored, patched, unpatched, status = check_cves(d, patched_cves)
         if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
-            cve_data = get_cve_info(d, patched + unpatched)
+            cve_data = get_cve_info(d, patched + unpatched + ignored)
             cve_write_data(d, patched, unpatched, ignored, cve_data, status)
     else:
         bb.note("No CVE database found, skipping CVE check")
@@ -258,6 +260,7 @@ def check_cves(d, patched_cves):
     suffix = d.getVar("CVE_VERSION_SUFFIX")
 
     cves_unpatched = []
+    cves_ignored = []
     cves_status = []
     cves_in_recipe = False
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
@@ -291,9 +294,8 @@ def check_cves(d, patched_cves):
             cve = cverow[0]
 
             if cve in cve_ignore:
-                bb.note("%s-%s has been ignored for %s" % (product, pv, cve))
-                # TODO: this should be in the report as 'ignored'
-                patched_cves.add(cve)
+                bb.note("%s-%s ignores %s" % (product, pv, cve))
+                cves_ignored.append(cve)
                 continue
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
@@ -305,9 +307,13 @@ def check_cves(d, patched_cves):
                 cves_in_recipe = True
 
             vulnerable = False
+            ignored = False
+
             for row in conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor)):
                 (_, _, _, version_start, operator_start, version_end, operator_end) = row
                 #bb.debug(2, "Evaluating row " + str(row))
+                if cve in cve_ignore:
+                    ignored = True
 
                 if (operator_start == '=' and pv == version_start) or version_start == '-':
                     vulnerable = True
@@ -340,13 +346,16 @@ def check_cves(d, patched_cves):
                         vulnerable = vulnerable_start or vulnerable_end
 
                 if vulnerable:
-                    bb.note("%s-%s is vulnerable to %s" % (pn, real_pv, cve))
-                    cves_unpatched.append(cve)
+                    if ignored:
+                        bb.note("%s is ignored in %s-%s" % (cve, pn, real_pv))
+                        cves_ignored.append(cve)
+                    else:
+                        bb.note("%s-%s is vulnerable to %s" % (pn, real_pv, cve))
+                        cves_unpatched.append(cve)
                     break
 
             if not vulnerable:
                 bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, cve))
-                # TODO: not patched but not vulnerable
                 patched_cves.add(cve)
 
         if not cves_in_product:
@@ -358,7 +367,7 @@ def check_cves(d, patched_cves):
     if not cves_in_recipe:
         bb.note("No CVE records for products in recipe %s" % (pn))
 
-    return (list(cve_ignore), list(patched_cves), cves_unpatched, cves_status)
+    return (list(cves_ignored), list(patched_cves), cves_unpatched, cves_status)
 
 def get_cve_info(d, cves):
     """
@@ -396,6 +405,8 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
     include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
     exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
 
+    report_all = d.getVar("CVE_CHECK_REPORT_PATCHED") == "1"
+
     if exclude_layers and layer in exclude_layers:
         return
 
@@ -403,7 +414,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         return
 
     # Early exit, the text format does not report packages without CVEs
-    if not patched+unpatched:
+    if not patched+unpatched+ignored:
         return
 
     nvd_link = "https://nvd.nist.gov/vuln/detail/"
@@ -413,13 +424,16 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
 
     for cve in sorted(cve_data):
         is_patched = cve in patched
-        if is_patched and (d.getVar("CVE_CHECK_REPORT_PATCHED") != "1"):
+        is_ignored = cve in ignored
+
+        if (is_patched or is_ignored) and not report_all:
             continue
+
         write_string += "LAYER: %s\n" % layer
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
-        if cve in ignored:
+        if is_ignored:
             write_string += "CVE STATUS: Ignored\n"
         elif is_patched:
             write_string += "CVE STATUS: Patched\n"
@@ -496,6 +510,8 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
     include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
     exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
 
+    report_all = d.getVar("CVE_CHECK_REPORT_PATCHED") == "1"
+
     if exclude_layers and layer in exclude_layers:
         return
 
@@ -522,10 +538,11 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
 
     for cve in sorted(cve_data):
         is_patched = cve in patched
+        is_ignored = cve in ignored
         status = "Unpatched"
-        if is_patched and (d.getVar("CVE_CHECK_REPORT_PATCHED") != "1"):
+        if (is_patched or is_ignored) and not report_all:
             continue
-        if cve in ignored:
+        if is_ignored:
             status = "Ignored"
         elif is_patched:
             status = "Patched"
-- 
2.33.0


