Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A148CCA485
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:42 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.27166.1656606216402472160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8DtQoWy2;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 23so18953274pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=e6wUicbCzBRXLTxl+aXUFZrzQsg/V5unHiyl3pyt7/8=;
        b=8DtQoWy2YxgJBbnGPCBijEExZSLQJ3DOJjlVeLPP6Qzd3pihb8YTtmYFYe2hoiBqvX
         e1f+Yki4PaZYLxK1qNUdCth2GDWcRkWK7R6c3TTKL0SIs+KZ1om0Tu+KcqqiHzfqpPfl
         8Xwl3v/iKX1n9cmSdTMYzpXQLNP9vACvcIhuX/juXb+OhBOHRuMI68yOUH0VYm/Mtny0
         xOhcY9dgsOTGq++59bpZ3pvah0R70me3Oliu4cgn+LaJnHbLuud6Xei+RviHml2kc9b0
         LVw8+hMjdo2LKBrPNdNYy2w7TvuLR5bD6GUwOCWPTQdAqF2amL9HNbv240bnROwey/EL
         ul9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e6wUicbCzBRXLTxl+aXUFZrzQsg/V5unHiyl3pyt7/8=;
        b=EZzZcqV7zd0edDhYEpZYPARvW/gRNTqG5lOpEYQiG083fTrT1NeWS/sztZ34Nh941Q
         yoMtw23i/E32y2P2U51VNMy9aAPz2EvTuaKu5Qr/9aeGHhIb2Hx3eYF2cLJ0GhPhodAv
         eOWJcOD5QEpMqeQ7GgGgwHS9A2+WlVjq9B8X9G/F54LwdgpftH5xARgB4W2bmvLUDjfV
         sCTKkxwCDU99QKRQAX8his0LQPlxDU9yAUXsT0l6S8elzo+5Q7dnbANOrIU4CIsyrjJr
         Bk8MiE1z7pv2mUBuj1M3U/cG6VBiaRKgIGJYjRjf7aOF6uZzobWNx8Y7z+35hWPTAojg
         S/JQ==
X-Gm-Message-State: AJIora/cn/ZiiMrF96PUA5xDFNzklg7NuLKufjEnba36utZeEwbIe9gb
	gQbT4vNJ0QKMU+YK+h0JnzAjjL2Bagghk63Z
X-Google-Smtp-Source: 
 AGRyM1s9tIraAglUjjmeEBNwxqUsztet7cuUX/GMUyeYrKTOyQDbAtmRM684kYjnpADukPLB0ihpNg==
X-Received: by 2002:a63:a112:0:b0:40c:450e:b1ad with SMTP id
 b18-20020a63a112000000b0040c450eb1admr8468921pgf.493.1656606215191;
        Thu, 30 Jun 2022 09:23:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/12] cve-check: add support for Ignored CVEs
Date: Thu, 30 Jun 2022 06:23:05 -1000
Message-Id: 
 <14b3c0ca46a0aa97565a24b7a5116306237d7cfe.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656605800.git.steve@sakoman.com>
References: <cover.1656605800.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167421

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
(cherry-picked from c773102d4828fc4ddd1024f6115d577e23f1afe4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


