Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DE7C55163
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32605.1771565685725808830
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YQ03jGXZ;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8570; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=59v3V0PQsdLO5SrkeNSw1SV59uGdGdcZlax8wCTr7NQ=;
  b=YQ03jGXZ6yU4dWJvSCxk5FQuTrLYdvqgkyxwhYXhXLGQJdeSe+UkmuRp
   gEEpb5HiM/+pMVsB1rAZXg5nxD+VNigMvE2DaVyZfJXa9OYKF7eYZkIKO
   8HDqp3s3m/87qBsfNh0aKz8TRnksKCF7Y5hv0mqD4zEdXf28lj7MWS2F4
   TdHLwEbiXdsLSiZ/VOZBgz3ZQIPv4A9PCSlewlipd+WcbvHiJbMT/7Rde
   faELTd5t2nML/1B441Fpp96Ux1pJKYlbF53UQS3fUv8Ne/o0Azx3uBxPv
   DESG5kGdAl7X63t53ms4pUrWCknr9aukFGVRfN7xcTJ6Qmfq4qpRjFJzK
   g==;
X-CSE-ConnectionGUID: IzvRV+LbQq2tes5OByco/w==
X-CSE-MsgGUID: Xewe+7nWRvmc5V7O8/dRNw==
X-IPAS-Result: =?us-ascii?q?A0BDBAC68Zdp/5L/Ja1aglmCSA9xX0JJlksDi2SSNoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0fAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZbAgEDMgFGECAxIAsrGYMCAYI6AzYCAadPgiyBAYJmg?=
 =?us-ascii?q?hbYRw2CUgELFAGBOIU8gnmFIFoahHonGxuBcoR9gh9CAYglBIIigQ6CAIZhB?=
 =?us-ascii?q?opoSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFh1MPiQV4boEgg?=
 =?us-ascii?q?RsDCxgNSBEsNxQbBD5uB44vP4I0ARUXYQErBU89Cj8jQA0wknGQFIIhoB1xC?=
 =?us-ascii?q?iiDdIwejz6FfBozhASUFZJSkk2GOY4JhAmSR4RogWg8gUcLB3AVgyIJSRkPj?=
 =?us-ascii?q?l+FQYNltRQiNTwCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:jWh3/q05mQ44HPyVOfbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzBWm
 GofCG/TOKzfYmOhc98gYI3k8htQv5fVnNY3GQtl3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 Lsen+WFYAX7g2QuajpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGLVMoB7Nb3uxOGDtS+
 OdFDxocZRfEmLfjqF67YrEEasULNsLnOsYb/3pn1zycVadgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUieC/FMEg9/5JYWnOq0nnDjWzZZs1mS46Ew5gA/ySQvj+C1a4uJI4XiqcN9rkuHq
 yGZ+VvDHBQRaeLA7mrC/kiKmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MskCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:/rtUeKr3FurtDYBNBAFpbL0aV5oseYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0EHMqySMbC/5vyKmTVR1L0bsb+6zJw=
X-Talos-CUID: 9a23:FjEBlGy/uFtmt7/vGgJYBgU1CN4fTD75xk7JeVO1EjtOYqyeThiPrfY=
X-Talos-MUID: 9a23:etXCUQopP/nV9eL24qMezwFvK8orvKKRMl4Imsg45O7UciBKHSjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="670039411"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 20E921800022C;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 6EA00CC8CF6; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 06/34] cve-check: remove the TEXT format support
Date: Thu, 19 Feb 2026 21:34:15 -0800
Message-Id: <20260220053443.3006180-6-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231461

From: Marta Rybczynska <rybczynska@gmail.com>

Remove the TEXT format support, as the JSON format offers more functions.
Users who do automation should have migrated already.

Support of both formats makes the code more complex than necessary.

Users can convert JSON files to TEXT files with cve-json-to-text.py
in scripts/

Backport Changes:
- The changes from commit [81e702c85c62] have been discarded.

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 05ef4f2a7b225c8d230eaca8d333ffb921729d79)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/classes/cve-check.bbclass | 118 +--------------------------------
 1 file changed, 1 insertion(+), 117 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 32fb9e8a5c..65d90dd420 100644
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
 
@@ -139,20 +131,11 @@ python cve_save_summary_handler () {
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
@@ -195,7 +178,6 @@ python cve_check_cleanup () {
     """
     Delete the file used to gather all the CVE information.
     """
-    bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
     bb.utils.remove(e.data.getVar("CVE_CHECK_SUMMARY_INDEX_PATH"))
 }
 
@@ -213,9 +195,6 @@ python cve_check_write_rootfs_manifest () {
     from oe.cve_check import cve_check_merge_jsons, update_symlinks
 
     if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
-        if os.path.exists(deploy_file):
-            bb.utils.remove(deploy_file)
         deploy_file_json = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
         if os.path.exists(deploy_file_json):
             bb.utils.remove(deploy_file_json)
@@ -235,19 +214,13 @@ python cve_check_write_rootfs_manifest () {
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
@@ -258,17 +231,6 @@ python cve_check_write_rootfs_manifest () {
 
     d.setVar("PN", save_pn)
 
-    if enable_text:
-        manifest_name = d.getVar("CVE_CHECK_MANIFEST")
-
-        with open(manifest_name, "w") as f:
-            f.write(text_data)
-
-        if link_name:
-            link_path = os.path.join(deploy_dir, "%s.cve" % link_name)
-            update_symlinks(manifest_name, link_path)
-        bb.plain("Image CVE report stored in: %s" % manifest_name)
-
     if enable_json:
         manifest_name_suffix = d.getVar("CVE_CHECK_MANIFEST_JSON_SUFFIX")
         manifest_name = d.getVar("CVE_CHECK_MANIFEST_JSON")
@@ -481,82 +443,6 @@ def get_cve_info(d, cve_data):
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
-            write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["NVD-scorev4"]
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
@@ -665,7 +551,5 @@ def cve_write_data(d, cve_data, status):
     Write CVE data in each enabled format.
     """
 
-    if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
-        cve_write_data_text(d, cve_data)
     if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
         cve_write_data_json(d, cve_data, status)

