Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F29C5321E
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 13:11:02 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.15726.1724418658058182131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 06:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LUmkSFOS;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-201ee6b084bso16741755ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 06:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724418657; x=1725023457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryavwv2l65xq1Q+fmSzdUxgqrMWUxyImq5Yu0yFbz0s=;
        b=LUmkSFOSER+NTzs2MjvIt+j5NDozw2wYhmBnaorKs36XYGxh+qRONFIr7+uEZlLoFc
         cNkkZiLzwJxj0iHskFt9Q8CDPedeQasAb2KRJaqnwb+JFpQIvwEPM+BNTYIjf562M1mO
         H6kWBFDJFMQhMCk4QzemZtiUexwnxWtLT8H6vBF2U4VyVx0ExL4kAapC2JC0XjODy/5u
         +MpgCg6nSNOTGepAXgB580wRsjqT/WXwhtTKmB3s3vWhIpBkkWAn8DUenYBsDcF2+pEu
         CVkLi3IPx1uK0BqtJUqsJOlTV8XvtmkYML0kNDUBrkDo3VxKWMfcqquMLEAhcq4kuXLO
         C8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724418657; x=1725023457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryavwv2l65xq1Q+fmSzdUxgqrMWUxyImq5Yu0yFbz0s=;
        b=pk2Dz088opyh0FfUATBLuXzG65FdkD0n5H4au0mTdjUtXIf+qDKhXiq5yd68y/nulm
         BMkcI8wOOWp0RJgehkLNqXnoj5JLooBGAVobb3XOEHQWckt6Qubb8lCZeWLQXWHigmTf
         dkGWJfPgngQ50p2fTwYjOMnZvarQ4GdBY4z4UmIWzaUFjBEtquxig8xYyd0kCex5zv2Y
         9PBlXk/cWuqg+0gOPufhJ0MB+RUkmrn5kR1NP6MzadIugSQuWlVlO4WdH2NafFu08eU9
         MEVz4kPjgNJiQONBhRsh0MNgKevma/CvvMTvgDf5QOO5yBDYo/cjrcPLRbF+L81pCCqL
         oSow==
X-Gm-Message-State: AOJu0YzsTEccaIjl8CxfXLSiic7URP5gqrBIvevASwiiqfoahrar3P2o
	cEvunrOpjvk74dSAqQvsGmXvcjDot4MqAIVL6FVnOdwfVwnSqs72lZWL3Q==
X-Google-Smtp-Source: AGHT+IGtlclTZJhLGIylpjEEKARq2odUYy9OvdvOOf7j6t3hbU5c7pzS3GZbFZsarMsxDjFKXGoiJg==
X-Received: by 2002:a17:90a:9314:b0:2c8:ac1:d8c3 with SMTP id 98e67ed59e1d1-2d646d4bb42mr2255777a91.29.1724418656840;
        Fri, 23 Aug 2024 06:10:56 -0700 (PDT)
Received: from localhost.localdomain ([193.33.57.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb905f25sm6322381a91.16.2024.08.23.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 06:10:56 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH 2/2] cve-check: remove the TEXT format support
Date: Fri, 23 Aug 2024 15:10:34 +0200
Message-ID: <20240823131034.1580972-2-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240823131034.1580972-1-marta.rybczynska@ygreky.com>
References: <20240823131034.1580972-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 13:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203690

Remove the TEXT format support, as the JSON format offers more functions.
Users who do automation should have migrated already.

Support of both formats makes the code more complex than necessary.

Users can convert JSON files to TEXT files with cve-json-to-text.py
in scripts/

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 meta/classes/cve-check.bbclass | 116 +--------------------------------
 1 file changed, 1 insertion(+), 115 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0d7c8a5835..a5104f210b 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -36,20 +36,15 @@ CVE_CHECK_DB_DIR ?= "${STAGING_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
-CVE_CHECK_LOG ?= "${T}/cve.log"
-CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
 CVE_CHECK_SUMMARY_DIR ?= "${LOG_DIR}/cve"
 CVE_CHECK_SUMMARY_FILE_NAME ?= "cve-summary"
-CVE_CHECK_SUMMARY_FILE ?= "${CVE_CHECK_SUMMARY_DIR}/${CVE_CHECK_SUMMARY_FILE_NAME}"
 CVE_CHECK_SUMMARY_FILE_NAME_JSON = "cve-summary.json"
 CVE_CHECK_SUMMARY_INDEX_PATH = "${CVE_CHECK_SUMMARY_DIR}/cve-summary-index.txt"
 
 CVE_CHECK_LOG_JSON ?= "${T}/cve.json"
 
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
-CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
 CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
-CVE_CHECK_MANIFEST ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.cve"
 CVE_CHECK_MANIFEST_JSON_SUFFIX ?= "json"
 CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.${CVE_CHECK_MANIFEST_JSON_SUFFIX}"
 CVE_CHECK_COPY_FILES ??= "1"
@@ -60,9 +55,6 @@ CVE_CHECK_REPORT_PATCHED ??= "1"
 
 CVE_CHECK_SHOW_WARNINGS ??= "1"
 
-# Provide text output
-CVE_CHECK_FORMAT_TEXT ??= "1"
-
 # Provide JSON output
 CVE_CHECK_FORMAT_JSON ??= "1"
 
@@ -152,20 +144,11 @@ python cve_save_summary_handler () {
     import datetime
     from oe.cve_check import update_symlinks
 
-    cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
-
     cve_summary_name = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
     cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
     bb.utils.mkdirhier(cvelogpath)
 
     timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
-    cve_summary_file = os.path.join(cvelogpath, "%s-%s.txt" % (cve_summary_name, timestamp))
-
-    if os.path.exists(cve_tmp_file):
-        shutil.copyfile(cve_tmp_file, cve_summary_file)
-        cvefile_link = os.path.join(cvelogpath, cve_summary_name)
-        update_symlinks(cve_summary_file, cvefile_link)
-        bb.plain("Complete CVE report summary created at: %s" % cvefile_link)
 
     if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
         json_summary_link_name = os.path.join(cvelogpath, d.getVar("CVE_CHECK_SUMMARY_FILE_NAME_JSON"))
@@ -206,7 +189,6 @@ python cve_check_cleanup () {
     """
     Delete the file used to gather all the CVE information.
     """
-    bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
     bb.utils.remove(e.data.getVar("CVE_CHECK_SUMMARY_INDEX_PATH"))
 }
 
@@ -224,9 +206,6 @@ python cve_check_write_rootfs_manifest () {
     from oe.cve_check import cve_check_merge_jsons, update_symlinks
 
     if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
-        if os.path.exists(deploy_file):
-            bb.utils.remove(deploy_file)
         deploy_file_json = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
         if os.path.exists(deploy_file_json):
             bb.utils.remove(deploy_file_json)
@@ -246,19 +225,13 @@ python cve_check_write_rootfs_manifest () {
     json_data = {"version":"1", "package": []}
     text_data = ""
     enable_json = d.getVar("CVE_CHECK_FORMAT_JSON") == "1"
-    enable_text = d.getVar("CVE_CHECK_FORMAT_TEXT") == "1"
 
     save_pn = d.getVar("PN")
 
     for pkg in recipies:
-        # To be able to use the CVE_CHECK_RECIPE_FILE variable we have to evaluate
+        # To be able to use the CVE_CHECK_RECIPE_FILE_JSON variable we have to evaluate
         # it with the different PN names set each time.
         d.setVar("PN", pkg)
-        if enable_text:
-            pkgfilepath = d.getVar("CVE_CHECK_RECIPE_FILE")
-            if os.path.exists(pkgfilepath):
-                with open(pkgfilepath) as pfile:
-                    text_data += pfile.read()
 
         if enable_json:
             pkgfilepath = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
@@ -269,16 +242,6 @@ python cve_check_write_rootfs_manifest () {
 
     d.setVar("PN", save_pn)
 
-    if enable_text:
-        link_path = os.path.join(deploy_dir, "%s.cve" % link_name)
-        manifest_name = d.getVar("CVE_CHECK_MANIFEST")
-
-        with open(manifest_name, "w") as f:
-            f.write(text_data)
-
-        update_symlinks(manifest_name, link_path)
-        bb.plain("Image CVE report stored in: %s" % manifest_name)
-
     if enable_json:
         manifest_name_suffix = d.getVar("CVE_CHECK_MANIFEST_JSON_SUFFIX")
         link_path = os.path.join(deploy_dir, "%s.%s" % (link_name, manifest_name_suffix))
@@ -488,81 +451,6 @@ def get_cve_info(d, cve_data):
         cursor.close()
     conn.close()
 
-def cve_write_data_text(d, cve_data):
-    """
-    Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
-    CVE manifest if enabled.
-    """
-
-    cve_file = d.getVar("CVE_CHECK_LOG")
-    fdir_name  = d.getVar("FILE_DIRNAME")
-    layer = fdir_name.split("/")[-3]
-
-    include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
-    exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
-
-    report_all = d.getVar("CVE_CHECK_REPORT_PATCHED") == "1"
-
-    if exclude_layers and layer in exclude_layers:
-        return
-
-    if include_layers and layer not in include_layers:
-        return
-
-    # Early exit, the text format does not report packages without CVEs
-    if not len(cve_data):
-        return
-
-    nvd_link = "https://nvd.nist.gov/vuln/detail/"
-    write_string = ""
-    unpatched_cves = []
-    bb.utils.mkdirhier(os.path.dirname(cve_file))
-
-    for cve in sorted(cve_data):
-        if not report_all and (cve_data[cve]["abbrev-status"] == "Patched" or cve_data[cve]["abbrev-status"] == "Ignored"):
-            continue
-        write_string += "LAYER: %s\n" % layer
-        write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
-        write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
-        write_string += "CVE: %s\n" % cve
-        write_string += "CVE STATUS: %s\n" % cve_data[cve]["abbrev-status"]
-
-        if 'status' in cve_data[cve]:
-            write_string += "CVE DETAIL: %s\n" % cve_data[cve]["status"]
-        if 'justification' in cve_data[cve]:
-            write_string += "CVE DESCRIPTION: %s\n" % cve_data[cve]["justification"]
-
-        if "NVD-summary" in cve_data[cve]:
-            write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["NVD-summary"]
-            write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["NVD-scorev2"]
-            write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["NVD-scorev3"]
-            write_string += "VECTOR: %s\n" % cve_data[cve]["NVD-vector"]
-            write_string += "VECTORSTRING: %s\n" % cve_data[cve]["NVD-vectorString"]
-
-        write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
-        if cve_data[cve]["abbrev-status"] == "Unpatched":
-            unpatched_cves.append(cve)
-
-    if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
-        bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
-
-    with open(cve_file, "w") as f:
-        bb.note("Writing file %s with CVE information" % cve_file)
-        f.write(write_string)
-
-    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
-        bb.utils.mkdirhier(os.path.dirname(deploy_file))
-        with open(deploy_file, "w") as f:
-            f.write(write_string)
-
-    if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
-        cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
-        bb.utils.mkdirhier(cvelogpath)
-
-        with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
-            f.write("%s" % write_string)
-
 def cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file):
     """
     Write CVE information in the JSON format: to WORKDIR; and to
@@ -670,7 +558,5 @@ def cve_write_data(d, cve_data, status):
     Write CVE data in each enabled format.
     """
 
-    if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
-        cve_write_data_text(d, cve_data)
     if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
         cve_write_data_json(d, cve_data, status)
-- 
2.43.0


