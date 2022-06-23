Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F4EC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 17:42:55 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7.1656006169164681290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 10:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CIzKe6Uv;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 i67-20020a1c3b46000000b003a03567d5e9so320339wma.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 10:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DwNIcVgBt11iictCUS/e5nxI/qGE0N7snB7dLNtYzGo=;
        b=CIzKe6UvxyS84Pyoznisee9jiHdVfyTfH4El2UkgEzkA4JxfheuQG0EcrtDm/xEYDr
         hDkeUnMLxys7Qc1SNWNkt32aNkgNsHg74zWjV8o4b9NU2ZC8tJVOHjSvs1PxLs+5gxCJ
         k9CPfMbMD795BmBnZbL9ixMePPr+2j1mzhR6N1U51lqt27wQ1m2l0YC//CAGx8qjE+HO
         eFnZWdHY59nf/MegVntb6seU5QNxmzfaS89CW+e6XD0D1c/K30yTXOggq76xM4CVcFWL
         BVRjS5TXFzqr7Tzp+oBIYzBJ8YWlvvEjZuzjAmvxcjRXrR/bCXkhk0+B3lYJ0uRtYOCw
         269w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DwNIcVgBt11iictCUS/e5nxI/qGE0N7snB7dLNtYzGo=;
        b=ci25xfFf0MdqGVl3mgin+ZCoa09qDu728WU041di/CQejKqVbvC2R86v0guLdcawsf
         WDZd3+kybf8FNFttE3YDPSJfKfML4xu32PZ7BBFwjDrENeKlNGHiSzndaCxfKAZyJN/4
         MR1vOylYivUclxbEy/jJTfN/R51ylMx83T7QD9wLaPGVvaWz3RKmKRu2Qm3AglB6JbsM
         S5+I81F1XFtmTBeLveWtjCuO4cTs8Blz5HKp1tZVvj+Eeh74AnlgvrmZ/Tza1uHgDbqQ
         jZTA1TZIOf9M7JiKGO12cUqLUKcyG6kyn5WaQ7Tr4wUK8H8UUz5XvjIrY1UxELmNaG4I
         8/hQ==
X-Gm-Message-State: AJIora9wtJT+mCW/ftiBfQ/GQYVOfUOYqz7MqXugZ7k5aIzuaHiVOGfu
	rw1ruWWYvw0hjwAIyMsfRurb/uZzeH65Vg==
X-Google-Smtp-Source: 
 AGRyM1sXue/Zc/eLCMwFfgMARkZdOfnVZ4uTbBzCZ2H6X8R6wVeIV6Y+msj4uXK44jgxu7waeWYX7A==
X-Received: by 2002:a7b:cb4b:0:b0:39c:49dd:b2cc with SMTP id
 v11-20020a7bcb4b000000b0039c49ddb2ccmr5488833wmj.123.1656006167214;
        Thu, 23 Jun 2022 10:42:47 -0700 (PDT)
Received: from localhost.localdomain ([80.215.178.159])
        by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c418700b003a0279f5935sm28066wmh.9.2022.06.23.10.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 10:42:46 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/2] cve-check: add support for Ignored CVEs
Date: Thu, 23 Jun 2022 19:42:29 +0200
Message-Id: <20220623174230.1495034-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 17:42:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167281

Ignored CVEs aren't patched, but do not apply in our configuration
for some reason. Up till now they were only partially supported
and reported as "Patched".

This patch adds separate reporting of Ignored CVEs. The variable
CVE_CHECK_REPORT_PATCHED now manages reporting of both patched
and ignored CVEs.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry-picked from c773102d4828fc4ddd1024f6115d577e23f1afe4)
---
 meta/classes/cve-check.bbclass | 41 ++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 894cebaaa4..d0f6970db8 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -47,7 +47,9 @@ CVE_CHECK_MANIFEST_JSON ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
+# Report Patched or Ignored/Whitelisted CVEs
 CVE_CHECK_REPORT_PATCHED ??= "1"
+
 CVE_CHECK_SHOW_WARNINGS ??= "1"
 
 # Provide text output
@@ -142,7 +144,7 @@ python do_cve_check () {
             bb.fatal("Failure in searching patches")
         whitelisted, patched, unpatched, status = check_cves(d, patched_cves)
         if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
-            cve_data = get_cve_info(d, patched + unpatched)
+            cve_data = get_cve_info(d, patched + unpatched + whitelisted)
             cve_write_data(d, patched, unpatched, whitelisted, cve_data, status)
     else:
         bb.note("No CVE database found, skipping CVE check")
@@ -315,6 +317,7 @@ def check_cves(d, patched_cves):
     suffix = d.getVar("CVE_VERSION_SUFFIX")
 
     cves_unpatched = []
+    cves_ignored = []
     cves_status = []
     cves_in_recipe = False
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
@@ -349,8 +352,7 @@ def check_cves(d, patched_cves):
 
             if cve in cve_whitelist:
                 bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
-                # TODO: this should be in the report as 'whitelisted'
-                patched_cves.add(cve)
+                cves_ignored.append(cve)
                 continue
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
@@ -362,9 +364,13 @@ def check_cves(d, patched_cves):
                 cves_in_recipe = True
 
             vulnerable = False
+            ignored = False
+
             for row in conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor)):
                 (_, _, _, version_start, operator_start, version_end, operator_end) = row
                 #bb.debug(2, "Evaluating row " + str(row))
+                if cve in cve_whitelist:
+                    ignored = True
 
                 if (operator_start == '=' and pv == version_start) or version_start == '-':
                     vulnerable = True
@@ -397,13 +403,16 @@ def check_cves(d, patched_cves):
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
@@ -412,7 +421,7 @@ def check_cves(d, patched_cves):
 
     conn.close()
 
-    return (list(cve_whitelist), list(patched_cves), cves_unpatched, cves_status)
+    return (list(cves_ignored), list(patched_cves), cves_unpatched, cves_status)
 
 def get_cve_info(d, cves):
     """
@@ -450,6 +459,8 @@ def cve_write_data_text(d, patched, unpatched, whitelisted, cve_data):
     include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
     exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
 
+    report_all = d.getVar("CVE_CHECK_REPORT_PATCHED") == "1"
+
     if exclude_layers and layer in exclude_layers:
         return
 
@@ -457,7 +468,7 @@ def cve_write_data_text(d, patched, unpatched, whitelisted, cve_data):
         return
 
     # Early exit, the text format does not report packages without CVEs
-    if not patched+unpatched:
+    if not patched+unpatched+whitelisted:
         return
 
     nvd_link = "https://nvd.nist.gov/vuln/detail/"
@@ -467,13 +478,16 @@ def cve_write_data_text(d, patched, unpatched, whitelisted, cve_data):
 
     for cve in sorted(cve_data):
         is_patched = cve in patched
-        if is_patched and (d.getVar("CVE_CHECK_REPORT_PATCHED") != "1"):
+        is_ignored = cve in whitelisted
+
+        if (is_patched or is_ignored) and not report_all:
             continue
+
         write_string += "LAYER: %s\n" % layer
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
-        if cve in whitelisted:
+        if is_ignored:
             write_string += "CVE STATUS: Whitelisted\n"
         elif is_patched:
             write_string += "CVE STATUS: Patched\n"
@@ -550,6 +564,8 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
     include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
     exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
 
+    report_all = d.getVar("CVE_CHECK_REPORT_PATCHED") == "1"
+
     if exclude_layers and layer in exclude_layers:
         return
 
@@ -576,10 +592,11 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
 
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


