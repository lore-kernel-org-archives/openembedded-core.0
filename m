Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7148DC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:04:00 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.6376.1640012638970315527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:03:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d0TR5WhY;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id s1so15304993wra.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iLf5Sw51PMD/SoEnntsR68hRc31wCqVHVh3nGiL/Yfc=;
        b=d0TR5WhY9lmeLOH8oBbqxfJp3QekwOCFIlkH9PRddCpoBe21TntOanXG2W8ND1njPU
         gsfl1iElTIyVeCUT3oa4QGybVB1Pzyagzzx/r7hmzC1G5ddat7Q5nz0UMe+cleE+83xS
         O99zOq3HI0TGKXeMBIaGORYXPztdDU8jyq7zq/a9p4RWLuzvcUgwSHrcxmdoULr2y8S8
         oylGMl+ozilxJgEbIueLsUSClje75oqQqLGQFH8/PeSQv4eFRr1GsQn7nguB5KzzEZfw
         NXjIx38ZMzZD1BicXWab2ZnLDzRw7eqeyptw+EFeESxVtXd2MQSTeWBB2dUTLETIu9Ts
         i6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iLf5Sw51PMD/SoEnntsR68hRc31wCqVHVh3nGiL/Yfc=;
        b=bZzB8s7ldFtosePmqpuh13bjSPj+1/uF+7qQmMhmAgO43KCagaR/rcyWaoV/KHWyDm
         nMVAqN9Wwq4BDpqmHWgyT+U/t3lgpBysyvCCAHuCHl4UhZmJSodzfebW7cIpaL240vi5
         vkoBefebTMWRFXfIMVjypSfXWVtwBoCWX+eaAGrWOtY+XpYxRkiUhIGXAxRytefnpYsZ
         /+1Ev78K8mLQrqXRBTakKRfJpymGsgkbbuLkEimkdiptIC+lQk/290Rg7fkHJosFdyS6
         xpObgYzWrJrtAyVHPAOMuKAvvuo8E7i8QThy3fk4dLYATYaGvnQ/YpLalma8a8EcMIRa
         tk3A==
X-Gm-Message-State: AOAM530CuA5CKsExdFgu7KP8e5Lm69PFZCPLZTgI9NPaFoXqjboka38h
	cfseHN/MQOpoK6qDxvb6i/HojSpeXkg=
X-Google-Smtp-Source: 
 ABdhPJxvN5Kd3rfj9OksMCr9VQUHwkomw11ne9l0WqY/ZxjV+CKTrYKvwGT/7g6jAIyEhCr1FZg6gg==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr12808614wri.295.1640012637082;
        Mon, 20 Dec 2021 07:03:57 -0800 (PST)
Received: from localhost.localdomain ([80.215.138.28])
        by smtp.gmail.com with ESMTPSA id
 z11sm17282251wmf.9.2021.12.20.07.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:03:56 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [oe-core][PATCH v2] cve-check: add coverage statistics on recipes
 without CVEs
Date: Mon, 20 Dec 2021 16:03:47 +0100
Message-Id: <20211220150347.13577-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:04:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159873

Until now the CVE checker was giving information about CVEs found for
a product (or more products) contained in a recipe. However, there was
no easy way to find out which products or recipes have no CVEs. Having
no reported CVEs might mean there are simply none, but can also mean
a product name (CPE) mismatch.

This patch adds CVE_CHECK_COVERAGE option enabling a new type of
statistics. A new file (*.cves_coverage) shows if a recipe has any
CVEs found in the NVD database, and if so, for which products.

This option is expected to help with an identification of recipes with
mismatched CPEs, issues in the database and more.

An example entry:
LAYER: meta
PACKAGE NAME: libsdl2-native
PACKAGE VERSION: 2.0.14
CVES FOUND IN RECIPE: Yes
    PRODUCT: simple_directmedia_layer (Yes)
    PRODUCT: sdl (No)

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/classes/cve-check.bbclass | 115 ++++++++++++++++++++++++++++-----
 1 file changed, 99 insertions(+), 16 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 70d1988a70..c994701334 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -30,19 +30,26 @@ CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
+CVE_CHECK_COVERAGE_FILE = "${T}/cves_coverage.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
+CVE_CHECK_COVERAGE_TMP_FILE ?= "${TMPDIR}/cves_coverage"
 CVE_CHECK_SUMMARY_DIR ?= "${LOG_DIR}/cve"
 CVE_CHECK_SUMMARY_FILE_NAME ?= "cve-summary"
 CVE_CHECK_SUMMARY_FILE ?= "${CVE_CHECK_SUMMARY_DIR}/${CVE_CHECK_SUMMARY_FILE_NAME}"
+CVE_CHECK_COVERAGE_SUMMARY_FILE_NAME ?= "cve-coverage-summary"
 
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
 CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
+CVE_CHECK_COVERAGE_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cves_coverage"
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
 CVE_CHECK_REPORT_PATCHED ??= "1"
 
+#Report packages without CVEs (no issues or wrong product name)
+CVE_CHECK_COVERAGE ??= "1"
+
 # Whitelist for packages (PN)
 CVE_CHECK_PN_WHITELIST ?= ""
 
@@ -64,7 +71,6 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
 CVE_VERSION_SUFFIX ??= ""
 
 python cve_save_summary_handler () {
-    import shutil
     import datetime
 
     cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
@@ -74,17 +80,13 @@ python cve_save_summary_handler () {
     bb.utils.mkdirhier(cvelogpath)
 
     timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
-    cve_summary_file = os.path.join(cvelogpath, "%s-%s.txt" % (cve_summary_name, timestamp))
-
-    if os.path.exists(cve_tmp_file):
-        shutil.copyfile(cve_tmp_file, cve_summary_file)
 
-        if cve_summary_file and os.path.exists(cve_summary_file):
-            cvefile_link = os.path.join(cvelogpath, cve_summary_name)
+    save_status_file(d, cve_tmp_file, cvelogpath, cve_summary_name, timestamp)
 
-            if os.path.exists(os.path.realpath(cvefile_link)):
-                os.remove(cvefile_link)
-            os.symlink(os.path.basename(cve_summary_file), cvefile_link)
+    if (d.getVar("CVE_CHECK_COVERAGE") == "1"):
+        cve_tmp_file = d.getVar("CVE_CHECK_COVERAGE_TMP_FILE")
+        cve_summary_name = d.getVar("CVE_CHECK_COVERAGE_SUMMARY_FILE_NAME")
+        save_status_file(d, cve_tmp_file, cvelogpath, cve_summary_name, timestamp)
 }
 
 addhandler cve_save_summary_handler
@@ -101,10 +103,12 @@ python do_cve_check () {
             patched_cves = get_patched_cves(d)
         except FileNotFoundError:
             bb.fatal("Failure in searching patches")
-        whitelisted, patched, unpatched = check_cves(d, patched_cves)
+        whitelisted, patched, unpatched, status = check_cves(d, patched_cves)
         if patched or unpatched:
             cve_data = get_cve_info(d, patched + unpatched)
-            cve_write_data(d, patched, unpatched, whitelisted, cve_data)
+            cve_write_data(d, patched, unpatched, whitelisted, cve_data, status)
+        else:
+            cve_write_data(d, [], [], [], {}, status)
     else:
         bb.note("No CVE database found, skipping CVE check")
 
@@ -119,6 +123,7 @@ python cve_check_cleanup () {
     Delete the file used to gather all the CVE information.
     """
     bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
+    bb.utils.remove(e.data.getVar("CVE_CHECK_COVERAGE_TMP_FILE"))
 }
 
 addhandler cve_check_cleanup
@@ -152,6 +157,23 @@ python cve_check_write_rootfs_manifest () {
                 os.remove(manifest_link)
             os.symlink(os.path.basename(manifest_name), manifest_link)
             bb.plain("Image CVE report stored in: %s" % manifest_name)
+
+    if os.path.exists(d.getVar("CVE_CHECK_COVERAGE_TMP_FILE")):
+        bb.note("Writing rootfs CVE status")
+        deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
+        link_name = d.getVar("IMAGE_LINK_NAME")
+        manifest_name = d.getVar("CVE_CHECK_COVERAGE_MANIFEST")
+        cve_tmp_file = d.getVar("CVE_CHECK_COVERAGE_TMP_FILE")
+
+        shutil.copyfile(cve_tmp_file, manifest_name)
+
+        if manifest_name and os.path.exists(manifest_name):
+            manifest_link = os.path.join(deploy_dir, "%s.cves_coverage" % link_name)
+            # If we already have another manifest, update symlinks
+            if os.path.exists(os.path.realpath(manifest_link)):
+                os.remove(manifest_link)
+            os.symlink(os.path.basename(manifest_name), manifest_link)
+            bb.plain("Image CVE status stored in: %s" % manifest_name)
 }
 
 ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
@@ -168,17 +190,20 @@ def check_cves(d, patched_cves):
     suffix = d.getVar("CVE_VERSION_SUFFIX")
 
     cves_unpatched = []
+    cves_status = [False, []]
+    cves_found_recipe = False
+
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
     products = d.getVar("CVE_PRODUCT").split()
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
     if not products:
-        return ([], [], [])
+        return ([], [], [], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
     # If the recipe has been whitelisted we return empty lists
     if pn in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
-        return ([], [], [])
+        return ([], [], [], [])
 
     cve_whitelist = d.getVar("CVE_CHECK_WHITELIST").split()
 
@@ -188,6 +213,7 @@ def check_cves(d, patched_cves):
 
     # For each of the known product names (e.g. curl has CPEs using curl and libcurl)...
     for product in products:
+        cves_found_product = False
         if ":" in product:
             vendor, product = product.split(":", 1)
         else:
@@ -206,6 +232,13 @@ def check_cves(d, patched_cves):
                 bb.note("%s has been patched" % (cve))
                 continue
 
+            # Write status once only for each product
+            if not cves_found_product:
+                cves_status[0] = True
+                cves_status[1].append([product, True])
+                cves_found_product = True
+                cves_found_recipe = True
+
             vulnerable = False
             for row in conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor)):
                 (_, _, _, version_start, operator_start, version_end, operator_end) = row
@@ -251,9 +284,32 @@ def check_cves(d, patched_cves):
                 # TODO: not patched but not vulnerable
                 patched_cves.add(cve)
 
+        if not cves_found_product:
+            bb.note("No CVE records found for product %s, pn %s" % (product, pn))
+            cves_status[1].append([product, False])
+
     conn.close()
 
-    return (list(cve_whitelist), list(patched_cves), cves_unpatched)
+    if not cves_found_recipe:
+        bb.note("No CVE records for products in recipe %s" % (pn))
+
+    return (list(cve_whitelist), list(patched_cves), cves_unpatched, cves_status)
+
+
+def save_status_file(d, tmp_file, logpath, summary_name, timestamp):
+    import shutil
+
+    summary_file = os.path.join(logpath, "%s-%s.txt" % (summary_name, timestamp))
+
+    if os.path.exists(tmp_file):
+        shutil.copyfile(tmp_file, summary_file)
+
+        if summary_file and os.path.exists(summary_file):
+            file_link = os.path.join(logpath, summary_name)
+
+            if os.path.exists(os.path.realpath(file_link)):
+                os.remove(file_link)
+            os.symlink(os.path.basename(summary_file), file_link)
 
 def get_cve_info(d, cves):
     """
@@ -277,7 +333,7 @@ def get_cve_info(d, cves):
     conn.close()
     return cve_data
 
-def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
+def cve_write_data(d, patched, unpatched, whitelisted, cve_data, status):
     """
     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
     CVE manifest if enabled.
@@ -343,3 +399,30 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
 
             with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
                 f.write("%s" % write_string)
+
+    if (d.getVar("CVE_CHECK_COVERAGE") == "1") and status:
+        cve_status_file = d.getVar("CVE_CHECK_COVERAGE_FILE")
+
+        write_string = ""
+        bb.utils.mkdirhier(os.path.dirname(cve_status_file))
+
+        write_string += "LAYER: %s\n" % layer
+        write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
+        write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
+        write_string += "CVES FOUND IN RECIPE: %s\n" % ("No" if status[0] == False else "Yes")
+
+        for st in status[1]:
+            write_string += "    PRODUCT: %s (%s)\n" % (st[0], "No" if st[1] == False else "Yes")
+
+        write_string += "\n"
+
+        with open(cve_status_file, "w") as f:
+            bb.note("Writing file %s with status" % cve_status_file)
+            f.write(write_string)
+
+        if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
+            cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+            bb.utils.mkdirhier(cvelogpath)
+
+            with open(d.getVar("CVE_CHECK_COVERAGE_TMP_FILE"), "a") as f:
+                f.write("%s" % write_string)
-- 
2.33.0


