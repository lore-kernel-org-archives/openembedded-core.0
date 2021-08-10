Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.6141.1628591749898169471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 03:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uPRFGDc8;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id q11so7387988wrr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0oMWpNnTxXu1CTx8IOkZ/8FlW+IWHoxo4W+RpJnSVOI=;
        b=uPRFGDc8vHXxL/qusZWKmJQGBIWSnWFxcw2ywTjOuII1/FucLpgIdq40KInjYMJqwG
         bq+x+Qhi+EvupSqR6+64s/YrDQLp7FVFr57D+FHsjBIPRFWZFLG04l2j7VGmbSpd5IPt
         up0ryxA6EWBoku800736DQO+ZDUCK7/1F3GFvGEa/knmuncFGx87vYZzY4nPHN5vs97+
         O21ie6Fgr93O3EkPqONmBZja6BjmwE2dUpIZ3BMfzhJ2SepCMFavAH9Gbtx5ctCVjj48
         4AJ2UJk9YfhhFGTWJ+v0uJG8xloKd1yNazedih5qTwCnh5+F7klyjYIEMrfFbQJpLAoO
         4i6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0oMWpNnTxXu1CTx8IOkZ/8FlW+IWHoxo4W+RpJnSVOI=;
        b=RhlK3V70IkDxbzSF4i5IVhIBMZcQH9eeuVo4z5H8cnN64egg0X8Fony/IGtt3g0ZVu
         wnoseQze8owYAKjD9IasgCtah0u6QAS5EJy9gUTMlURBVmpHYGrMfQn8ZTqFDx6rPyJ0
         SLBe7xpXQLIPfnUWZcJpGTq66/7nInnSRz8rts5dmc+dnA5wrm0ktAqTrKmi2DygWQcW
         GXLVS5N8NgJEritR+pM9p354PEHtfs0g24YhAJVMS2PcmENTrZB27fsqz01leXsCGbTt
         HBcXQ7YzWALahcaamgQO68916zp2N/uNwpsNDNjWAIvs89pyc7QZZohX2BytSg4XtulD
         Jb8Q==
X-Gm-Message-State: AOAM531dUliSE3mbfsGRTJLl7844OpQWCj2F/p7OVpD8nguDX2jZVdU6
	kewyx6Kl3lx6nTHgi6GIBwhT4sIB78MhGA==
X-Google-Smtp-Source: ABdhPJwG2RoldbKSY+XBvBgHTn83B3nNTEUkmFpXDmxwDSgQXRtY0zqVWPIE9j/3EMkoSRRjfrO1EA==
X-Received: by 2002:adf:efc7:: with SMTP id i7mr29958542wrp.87.1628591748033;
        Tue, 10 Aug 2021 03:35:48 -0700 (PDT)
Return-Path: <rybczynska@gmail.com>
Received: from localhost.localdomain ([80.215.234.181])
        by smtp.gmail.com with ESMTPSA id d8sm23020518wrv.20.2021.08.10.03.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 03:35:47 -0700 (PDT)
From: rybczynska@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [meta-oe][PATCH] cve-check: add coverage statistics on recipes without CVEs
Date: Tue, 10 Aug 2021 12:35:40 +0200
Message-Id: <20210810103540.940851-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Until now the CVE checker was giving information about CVEs found for
a product (or more products) contained in a receipe. However, there was
no easy way to find out which products or receipes have no CVEs. Having
no reported CVEs might mean there are simply none, but can also mean
a product name (CPE) mismatch.

This patch adds CVE_CHECK_COVERAGE option enabling a new type of
statistics. A new file (*.cves_coverage) shows if a receipe has any
CVEs found in the NVD database, and if so, for which products.

This option is expected to help with an identification of receipes with
mismatched CPEs, issues in the database and more.

An example entry:
LAYER: meta
PACKAGE NAME: libsdl2-native
PACKAGE VERSION: 2.0.14
CVES FOUND IN RECIPE: Yes
    PRODUCT: simple_directmedia_layer (Yes)
    PRODUCT: sdl (No)

Signed-of-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/classes/cve-check.bbclass | 115 ++++++++++++++++++++++++++++-----
 1 file changed, 98 insertions(+), 17 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6582f97151..c483e2cefc 100644
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
+CVE_CHECK_COVERAGE_SUMMARY_FILE_NAME ?= "coverage-summary"
 CVE_CHECK_SUMMARY_FILE ?= "${CVE_CHECK_SUMMARY_DIR}/${CVE_CHECK_SUMMARY_FILE_NAME}"
 
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
 CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
+CVE_CHECK_COVERAGE_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cves_coverage"
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
 CVE_CHECK_REPORT_PATCHED ??= "1"
 
+# Do a check for packages without CVEs (no issues or wrong product name)
+CVE_CHECK_COVERAGE ??= "1"
+
 # Whitelist for packages (PN)
 CVE_CHECK_PN_WHITELIST ?= ""
 
@@ -59,7 +66,6 @@ CVE_CHECK_LAYER_EXCLUDELIST ??= ""
 # Layers to be included
 CVE_CHECK_LAYER_INCLUDELIST ??= ""
 
-
 # set to "alphabetical" for version using single alphabetical character as increment release
 CVE_VERSION_SUFFIX ??= ""
 
@@ -73,18 +79,13 @@ python cve_save_summary_handler () {
     cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
     bb.utils.mkdirhier(cvelogpath)
 
-    timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
-    cve_summary_file = os.path.join(cvelogpath, "%s-%s.txt" % (cve_summary_name, timestamp))
-
-    if os.path.exists(cve_tmp_file):
-        shutil.copyfile(cve_tmp_file, cve_summary_file)
+    save_status_file(d, cve_tmp_file, cvelogpath, cve_summary_name, timestamp)
 
-        if cve_summary_file and os.path.exists(cve_summary_file):
-            cvefile_link = os.path.join(cvelogpath, cve_summary_name)
+    if (d.getVar("CVE_CHECK_COVERAGE") == "1"):
+    cve_tmp_file = d.getVar("CVE_CHECK_COVERAGE_TMP_FILE")
+        cve_summary_name = d.getVar("CVE_CHECK_COVERAGE_SUMMARY_FILE_NAME")
 
-            if os.path.exists(os.path.realpath(cvefile_link)):
-                os.remove(cvefile_link)
-            os.symlink(os.path.basename(cve_summary_file), cvefile_link)
+        save_status_file(d, cve_tmp_file, cvelogpath, cve_summary_name, timestamp)
 }
 
 addhandler cve_save_summary_handler
@@ -100,10 +101,12 @@ python do_cve_check () {
             patched_cves = get_patches_cves(d)
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
 
@@ -118,6 +121,7 @@ python cve_check_cleanup () {
     Delete the file used to gather all the CVE information.
     """
     bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
+    bb.utils.remove(e.data.getVar("CVE_CHECK_COVERAGE_TMP_FILE"))
 }
 
 addhandler cve_check_cleanup
@@ -151,11 +155,43 @@ python cve_check_write_rootfs_manifest () {
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
 do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 
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
+
 def get_patches_cves(d):
     """
     Get patches that solve CVEs using the "CVE: " tag.
@@ -226,17 +262,20 @@ def check_cves(d, patched_cves):
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
 
     old_cve_whitelist =  d.getVar("CVE_CHECK_CVE_WHITELIST")
     if old_cve_whitelist:
@@ -249,6 +288,7 @@ def check_cves(d, patched_cves):
 
     # For each of the known product names (e.g. curl has CPEs using curl and libcurl)...
     for product in products:
+        cves_found_product = False
         if ":" in product:
             vendor, product = product.split(":", 1)
         else:
@@ -267,6 +307,13 @@ def check_cves(d, patched_cves):
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
@@ -312,9 +359,16 @@ def check_cves(d, patched_cves):
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
 
 def get_cve_info(d, cves):
     """
@@ -338,7 +392,7 @@ def get_cve_info(d, cves):
     conn.close()
     return cve_data
 
-def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
+def cve_write_data(d, patched, unpatched, whitelisted, cve_data, status):
     """
     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
     CVE manifest if enabled.
@@ -404,3 +458,30 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
 
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
+            write_string += "    PRODUCT: %s (%s) \n" % (st[0], "No" if st[1] == False else "Yes")
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
2.30.2

