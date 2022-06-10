Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26DCC43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 14:02:59 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.27455.1654869769410167641
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 07:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UE26li9W;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id m24so1828387wrb.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PSdmk2CTOBMs4MSxt1wjXN4cndTyk7myAAhhxTa2jtI=;
        b=UE26li9WYWJSYZfi8nscqqsld7CnYRcOz0ARF3h5Q5EFQ2BCgIO9140H01dekPpFIK
         FtgyRJ++TzNovCq6bkGANxvWNtWcDYpxlA9DDG7/5mWrVkgmBc+9SZeWyBqMAburEUdr
         Qy9jEa/TnwxtEVqOEyb0vNUqPq/Z0IAXN6YewaitUfdsdPRvZ+SrboAE/IFoKAVO97uh
         ZjAsCexASJ9rVudvCLfo/TjpEZO/9Vwd8KZfetes8fbIi6P18s7DvKwxyS3CANBosCq7
         1nVQKxH5QdJGe8ytim10oMqGi4LXXOqIMhLzKCg5YCiefbozfuedf7tIpivsgdbhqssr
         d95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PSdmk2CTOBMs4MSxt1wjXN4cndTyk7myAAhhxTa2jtI=;
        b=NsNyL/mE6bpmUfroGDa1jOsnS/k64KkvYWUICac6apSOGD9+hYCvJDCijRssPthAWU
         G6X6VWo2+0KvCJg46tQSUlNSDgZHJ6L7d7f8WoY7oNEqW4z7qDlc3ThX1TKpymw9q3BX
         JHcc28nhkahxQY+MCPRJEqRBRs7mlOYTj/zENM6Owug1i9jVPgHTt2tiqKIFEXuLEegs
         giXLa3sZFgFJataFTkdUSQoR0NqteNoE6v/GGL1gJSXRkOrbrlSYQGUBDrVZVPPiaiir
         dVNvAKgkzBakry8mTPcfXQhym+eeadjiUpIhotmCvfPKw+vb7CXJ5HAHjcVoHkz9YlcY
         DeIg==
X-Gm-Message-State: AOAM531vrgFPfYqfs8YwWphOHM0trurNpzOP3T0l+vp3aqcOXDNHh/2l
	9UXs+OtPtBwVCq9mfTmcesQwYgvZFw0=
X-Google-Smtp-Source: 
 ABdhPJxWzkywZt7WvoBrUvGmQdOj1weF9rnexm2ae/l9MmR+gzJ0AhUAtgtvNIKrQfnr664sUOh7Bg==
X-Received: by 2002:a5d:5707:0:b0:219:e581:479e with SMTP id
 a7-20020a5d5707000000b00219e581479emr4156640wrv.643.1654869767334;
        Fri, 10 Jun 2022 07:02:47 -0700 (PDT)
Received: from localhost.localdomain ([80.215.138.221])
        by smtp.gmail.com with ESMTPSA id
 n123-20020a1c2781000000b0039c63f4bce0sm3187945wmn.12.2022.06.10.07.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 07:02:46 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH] cve-check: add support for Ignored CVEs
Date: Fri, 10 Jun 2022 16:02:37 +0200
Message-Id: <20220610140237.1684000-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 14:02:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166804

Ignored CVEs aren't patched, but do not apply in our configuration
for some reason. Up till now they were only partially supported
and reported as "Patched".

This patch adds separate reporting of Ignored CVEs. The variable
CVE_CHECK_REPORT_PATCHED now manages reporting of both patched
and ignored CVEs.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/classes/cve-check.bbclass | 43 ++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 1b4910f737..760e825a4c 100644
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
+        if (is_patched or is_ignored) and report_all:
             continue
-        if cve in ignored:
+        if is_ignored:
             status = "Ignored"
         elif is_patched:
             status = "Patched"
-- 
2.33.0


