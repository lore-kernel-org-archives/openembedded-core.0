Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69113CCA473
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:28:28 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.1301.1655854098258775971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dBl+Vj+z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id cv13so11713177pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gnN3h3zHwYtuqiKZN1HLUllZ4+/BKMwjU0os/Rp2Ph0=;
        b=dBl+Vj+zNnW+ZUJxcORmxcu0HB4oMrbF0TmLRFRrDd6pM2HgE9+XHQrLt5SIGXDsAp
         fGh1t2TNJ0GHiW55W01JedbzvjEd1tTxatwEufGsbEgRC+91mn695MRpJPULOHE95prR
         o+F8XdyZQd+iNTHvwRgi8SUtabzNFLE+QRfRSkdtAULiE+0Rt/cUgMr+2NuNwqK0nbYP
         HXt1J3alff1XrfNI86jzVrccrrTTFlgIznFcw6rNBSoSM948rWTQ5M+tcn0vOfgc9dxO
         8nydcoiCQCkaXU0fGG9Qj9T1GrFwaFS/ebrB6cSX9KUNOWb52TS4UzdzfeMvffcq7rl4
         Z1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gnN3h3zHwYtuqiKZN1HLUllZ4+/BKMwjU0os/Rp2Ph0=;
        b=JJQvbF7d/1r9aPN8EMswz08llKBmArUSWjHUPVtak5+vY9fg5Yq6OlRpL66glEf95T
         BBT7Zv1vQukE5ZrcJEwbnTpkXnAX+hWXfjwy8JjnTGxdRD+49h9zmENyHcBCXu8FN/Xe
         xkxQmMexpPeLCnu2Jpc5e1jyBV7G7DX6WPjnP104VdF4lkCBczmJFl2+xPx2NzwqIEtz
         LTZBcFvWRxqfDR1mL14AmKP443aWlwFJIBvbePy+MAURWqv1Lyg4uiUpCswCl2gtmH8O
         fwlhdpsAv2HxMafLtKEZf0u4nBp4UzB7FlBFgpNHzl8wcSph8J9YMrZk1GnmRXLhCl9o
         BlHA==
X-Gm-Message-State: AJIora+xkCxsrO1SPpf7PqpGFWra4hWM9nvPQrnncDYe6fD/2+FNQbWI
	sIOhHvBj9NWKSSHjlaTwv1U32D+9U3D3Yv0m
X-Google-Smtp-Source: 
 AGRyM1tPBnNvHviPXKmcKbsKCqeUp5ejKvxYqztyXlptYMAqGKa+GKRDYc/CGH1BwloiBILVnNUMzQ==
X-Received: by 2002:a17:902:b081:b0:16a:4266:b467 with SMTP id
 p1-20020a170902b08100b0016a4266b467mr2220441plr.172.1655854097103;
        Tue, 21 Jun 2022 16:28:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm11323565pla.83.2022.06.21.16.28.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:28:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/13] cve-check: add support for Ignored CVEs
Date: Tue, 21 Jun 2022 13:27:47 -1000
Message-Id: 
 <d76957e4257a3bf934bdb94d65aa43267b8d9766.1655848177.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655848177.git.steve@sakoman.com>
References: <cover.1655848177.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167191

From: Marta Rybczynska <rybczynska@gmail.com>

Ignored CVEs aren't patched, but do not apply in our configuration
for some reason. Up till now they were only partially supported
and reported as "Patched".

This patch adds separate reporting of Ignored CVEs. The variable
CVE_CHECK_REPORT_PATCHED now manages reporting of both patched
and ignored CVEs.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c773102d4828fc4ddd1024f6115d577e23f1afe4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


