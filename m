Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56ADECCA480
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 13:38:05 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.55463.1656423481683108988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 06:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N4EuDM/N;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id ge10so25830034ejb.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 06:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8N22cBO5s2jy59yARK3lM0W8X0KaMSHQI/zikTKQmNM=;
        b=N4EuDM/NjPtsKkaZDhaTqhAMltN54KQducXa5cUG0DMKLT9A43rVdyZbYsTsALbj4O
         YJMoIalM/ou9qna8XY52itQvbYxv/E981/lxNwSmM+hLEBWDdLPZKZ/i9d0o9LHH5Df2
         mIhrCSss9iwjyjcIHNE4/ZEifpWAIvkx7Aus18A6pc07ms4OEQ9GgYEMBZAD1RrSD1eY
         KsMwimDI74Yc1a5qzvQbKGexiEjekVARCylZB0QDzv4DuBBjKZaGBfHpGqg1tho2U879
         5bbmlwWBBYa4ZIu9oDN1dECjUKs/XDSm4PYxSJQt++lmU6QN9JEfXCEY/2aRmuE1rkuG
         lhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8N22cBO5s2jy59yARK3lM0W8X0KaMSHQI/zikTKQmNM=;
        b=y8j5RGrQRH/ikOQd6ZzCMkaEvXrL45Z6LsvsGrSXuHolspB6TraQeUpbO0PJfXI/fT
         w3o+D05EkEFT9ZMpFYmtA+ox6iT0Gbq9PK1OwvrWnlf/BQkiDVIgIbBuyUPOUj1SzDUg
         dr0DVBJzSw4We7ALmVDue3OGrZfH+ToHHxdos9ecukxuhDIg5w4DwpXb/P73f4Pb3Q/Y
         8899lcB8xf+Ey7R1DcDgp53snEm15foX4eIdhwx3zParIK2BLxkxlCFZgfhqXW2tz9mN
         GCfRhuWkUwEOCHwArOyQY1Li0r8i8oIOWtxU6AWx71v46my+4EFiOlXxc3O0jntOBVFP
         OeMQ==
X-Gm-Message-State: AJIora9rvU2yWywQV2Xk94LwGrqSRQ501Ud8M51UGCeeie7BV71JK40L
	lZP49r6l24X4rn40iR8Ke6PhPbuzKQU=
X-Google-Smtp-Source: 
 AGRyM1sP+/20zL5papEb71+g9KgXhyunRjcWjT+iIBW1QZ1ktIg0EovRfqXVFpx2jRe6oCGCHW+UKA==
X-Received: by 2002:a17:907:1c11:b0:726:851e:179e with SMTP id
 nc17-20020a1709071c1100b00726851e179emr15972848ejc.39.1656423479275;
        Tue, 28 Jun 2022 06:37:59 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a170906444d00b00722eeb368cesm6451853ejp.64.2022.06.28.06.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 06:37:58 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH 4/5] cve-check: major class refactor
Date: Tue, 28 Jun 2022 15:37:12 +0200
Message-Id: <20220628133713.3390786-4-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628133713.3390786-1-davide.gardenal@huawei.com>
References: <20220628133713.3390786-1-davide.gardenal@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 13:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167342

The rationale behind refactoring the class is to make testing 
and maintainability easier.

This commit includes:
    - bb var refactor for better readability
    - function and program flow refactor for better scalability
      and extensibility
    - better documentation for all the functions
    - minor bug fixes when using specific configurations

Deleted bb vars:
    - CVE_CHECK_LOG
    - CVE_CHECK_TMP_FILE
    - CVE_CHECK_SUMMARY_DIR
    - CVE_CHECK_SUMMARY_FILE_NAME
    - CVE_CHECK_SUMMARY_FILE
    - CVE_CHECK_SUMMARY_FILE_NAME_JSON
    - CVE_CHECK_SUMMARY_INDEX_PATH
    - CVE_CHECK_LOG_JSON
    - CVE_CHECK_RECIPE_FILE
    - CVE_CHECK_RECIPE_FILE_JSON
    - CVE_CHECK_MANIFEST
    - CVE_CHECK_MANIFEST_JSON
    - CVE_CHECK_CREATE_MANIFEST

Renamed bb vars:
    - CVE_CHECK_DIR -> CVE_CHECK_OUTPUT_DIR
    - CVE_CHECK_COPY_FILES -> CVE_CHECK_CREATE_RECIPE_REPORTS

Added bb vars:
    - CVE_CHECK_CREATE_BUILD_REPORT: flag to control if cve-check
      creates a build report or not
    - CVE_CHECK_CREATE_IMAGE_REPORT: flag to control if cve-check
      creates an image report or not
    - CVE_CHECK_TXT_INDEX_FILE: path of the temporary index file
      for the txt output format. Deleted after the build is
      completed
    - CVE_CHECK_TXT_INDEX_DIR: folder path where all the temp
      recipes reports with txt format are store. Deleted after
      the build is completed
    - CVE_CHECK_JSON_INDEX_FILE: same as CVE_CHECK_TXT_INDEX_FILE
      but for the json format
    - CVE_CHECK_JSON_INDEX_DIR: same as CVE_CHECK_TXT_INDEX_DIR
      but for the json format
    - CVE_CHECK_IMAGE_REPORT_FILE_NAME_BASE: name without extension
      of the report for the image
    - CVE_CHECK_BUILD_REPORT_FILE_NAME_BASE: name without extension
      of the report for the entire build
    - CVE_CHECK_RECIPE_FILE_NAME_BASE: name without extension of
      the report for every recipe

Default output structure (with txt and json format enabled):
tmp
|-log
   |-cve
      |-build_reports
      |  |-txt
      |  |  |- build report files with txt format
      |  |-json
      |     |- build report files with json format
      |-image_reports
      |  |-txt
      |  |  |- image report files with txt format
      |  |-json
      |     |- image report file with json format
      |-recipe_reports
      |  |-txt
      |     |- recipe report files with txt format
      |  |-json
      |     |- recipe report files with json format
      |-cve-report.json -> link pointing to the latest json build report
      |-cve-report.txt  -> link pointing to the latest txt build report

Note that a link to the latest image report is present in the
image deploy folder.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/classes/cve-check.bbclass | 642 +++++++++++++++++++++++++----------------
 1 file changed, 390 insertions(+), 252 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 50b9247f46..5ee53d4c77 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -19,44 +19,26 @@
 # This class/tool is meant to be used as support and not
 # the only method to check against CVEs. Running this tool
 # doesn't guarantee your packages are free of CVEs.
-
+#
+# Variables below are named using the following convention:
+# CVE_CHECK_ -> class prefix (always to use)
+# _DIR -> complete directory path
+# _FILE -> complete file path (including extension)
+# _FILE_NAME -> file name with extension
+# _FILE_NAME_BASE -> file name without extension (used when multiple extensions could be used)
+# For example: CVE_CHECK_IMAGE_REPORT_FILE_NAME_BASE has "_FILE_NAME_BASE" so that's just the file name,
+# without the extension, of the report file. And has "CVE_CHECK_" to indicate that this variable is
+# from the cve-check class
+
+
+# CHECK OPTIONS
 # The product name that the CVE database uses defaults to BPN, but may need to
-# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
+# be overridden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
-CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
-
-CVE_CHECK_LOG ?= "${T}/cve.log"
-CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
-CVE_CHECK_SUMMARY_DIR ?= "${LOG_DIR}/cve"
-CVE_CHECK_SUMMARY_FILE_NAME ?= "cve-summary"
-CVE_CHECK_SUMMARY_FILE ?= "${CVE_CHECK_SUMMARY_DIR}/${CVE_CHECK_SUMMARY_FILE_NAME}"
-CVE_CHECK_SUMMARY_FILE_NAME_JSON = "cve-summary.json"
-CVE_CHECK_SUMMARY_INDEX_PATH = "${CVE_CHECK_SUMMARY_DIR}/cve-summary-index.txt"
-
-CVE_CHECK_LOG_JSON ?= "${T}/cve.json"
-
-CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
-CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
-CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
-CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
-CVE_CHECK_MANIFEST_JSON ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.json"
-CVE_CHECK_COPY_FILES ??= "1"
-CVE_CHECK_CREATE_MANIFEST ??= "1"
-
-# Report Patched or Ignored CVEs
-CVE_CHECK_REPORT_PATCHED ??= "1"
-
-CVE_CHECK_SHOW_WARNINGS ??= "1"
-
-# Provide text output
-CVE_CHECK_FORMAT_TEXT ??= "1"
-
-# Provide JSON output
-CVE_CHECK_FORMAT_JSON ??= "1"
+# set to "alphabetical" for version using single alphabetical character as increment release
+CVE_VERSION_SUFFIX ??= ""
 
 # Check for packages without CVEs (no issues or missing product name)
 CVE_CHECK_COVERAGE ??= "1"
@@ -72,66 +54,63 @@ CVE_CHECK_SKIP_RECIPE ?= ""
 #
 CVE_CHECK_IGNORE ?= ""
 
-# Layers to be excluded
-CVE_CHECK_LAYER_EXCLUDELIST ??= ""
 
-# Layers to be included
-CVE_CHECK_LAYER_INCLUDELIST ??= ""
+# DATABASE OPTIONS
+CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
+CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
 
-# set to "alphabetical" for version using single alphabetical character as increment release
-CVE_VERSION_SUFFIX ??= ""
+# TEMPORARY FILES
+CVE_CHECK_TXT_INDEX_FILE ?= "${TMPDIR}/cve-report-index_txt.txt"
+CVE_CHECK_TXT_INDEX_DIR ?= "${TMPDIR}/cve-tmp-files_txt"
 
-def generate_json_report(d, out_path, link_path):
-    if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
-        import json
-        from oe.cve_check import cve_check_merge_jsons, update_symlinks
+CVE_CHECK_JSON_INDEX_FILE ?= "${TMPDIR}/cve-report-index_json.txt"
+CVE_CHECK_JSON_INDEX_DIR ?= "${TMPDIR}/cve-tmp-files_json"
 
-        bb.note("Generating JSON CVE summary")
-        index_file = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
-        summary = {"version":"1", "package": []}
-        with open(index_file) as f:
-            filename = f.readline()
-            while filename:
-                with open(filename.rstrip()) as j:
-                    data = json.load(j)
-                    cve_check_merge_jsons(summary, data)
-                filename = f.readline()
 
-        with open(out_path, "w") as f:
-            json.dump(summary, f, indent=2)
+# OUTPUT OPTIONS
+# Output directory
+CVE_CHECK_OUTPUT_DIR ?= "${LOG_DIR}/cve"
 
-        update_symlinks(out_path, link_path)
+# File names without extension of the image and build reports
+# Build reports should not contain image specific bb vars line IMAGE_NAME or IMAGE_LINK_NAME
+CVE_CHECK_IMAGE_REPORT_FILE_NAME_BASE ?= "cve-report_${IMAGE_LINK_NAME}"
+CVE_CHECK_BUILD_REPORT_FILE_NAME_BASE ?= "cve-report"
 
-python cve_save_summary_handler () {
-    import shutil
-    import datetime
-    from oe.cve_check import update_symlinks
+# Create a report for each recipe in the build
+CVE_CHECK_CREATE_RECIPE_REPORTS ??= "1"
 
-    cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
+# Name of the cve check per recipe file. If this is changed be sure that every recipe has a different
+# value otherwise they will override each other
+CVE_CHECK_RECIPE_FILE_NAME_BASE ?= "${PN}"
 
-    cve_summary_name = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
-    cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
-    bb.utils.mkdirhier(cvelogpath)
+# Create a report file for the whole build
+CVE_CHECK_CREATE_BUILD_REPORT ??= "1"
 
-    timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
-    cve_summary_file = os.path.join(cvelogpath, "%s-%s.txt" % (cve_summary_name, timestamp))
-
-    if os.path.exists(cve_tmp_file):
-        shutil.copyfile(cve_tmp_file, cve_summary_file)
-        cvefile_link = os.path.join(cvelogpath, cve_summary_name)
-        update_symlinks(cve_summary_file, cvefile_link)
-        bb.plain("Complete CVE report summary created at: %s" % cvefile_link)
-
-    if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
-        json_summary_link_name = os.path.join(cvelogpath, d.getVar("CVE_CHECK_SUMMARY_FILE_NAME_JSON"))
-        json_summary_name = os.path.join(cvelogpath, "%s-%s.json" % (cve_summary_name, timestamp))
-        generate_json_report(d, json_summary_name, json_summary_link_name)
-        bb.plain("Complete CVE JSON report summary created at: %s" % json_summary_link_name)
-}
+# Create a report file for each image
+CVE_CHECK_CREATE_IMAGE_REPORT ??= "1"
+
+# If set patched CVEs will show in the reports
+CVE_CHECK_REPORT_PATCHED ??= "1"
+
+# If set bitbake will show a warning if unpatched CVEs are found
+CVE_CHECK_SHOW_WARNINGS ??= "1"
+
+# Warning: Disabling one of these options doesn't clear their output folders, disabling both won't produce any files.
+# Provide text output
+CVE_CHECK_FORMAT_TEXT ??= "1"
+# Provide JSON output
+CVE_CHECK_FORMAT_JSON ??= "1"
+
+
+# LAYERS OPTIONS
+# Layers to be excluded
+CVE_CHECK_LAYER_EXCLUDELIST ??= ""
+
+# Layers to be included
+CVE_CHECK_LAYER_INCLUDELIST ??= ""
 
-addhandler cve_save_summary_handler
-cve_save_summary_handler[eventmask] = "bb.event.BuildCompleted"
 
 python do_cve_check () {
     """
@@ -145,6 +124,10 @@ python do_cve_check () {
         except FileNotFoundError:
             bb.fatal("Failure in searching patches")
         ignored, patched, unpatched, status = check_cves(d, patched_cves)
+
+        if unpatched and d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
+            bb.warn("Found unpatched CVE (%s)" % (" ".join(unpatched)))
+
         if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
             cve_data = get_cve_info(d, patched + unpatched + ignored)
             cve_write_data(d, patched, unpatched, ignored, cve_data, status)
@@ -157,97 +140,62 @@ addtask cve_check before do_build
 do_cve_check[depends] = "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] = "1"
 
-python cve_check_cleanup () {
+python cve_check_write_image_report () {
     """
-    Delete the file used to gather all the CVE information.
+    After 'do_rootfs' task is executed, if CVE_CHECK_CREATE_IMAGE_REPORT is set
+    a complete image report is created.
+    This includes all the information contained in the recipe reports builded by the image.
     """
-    bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
-    bb.utils.remove(e.data.getVar("CVE_CHECK_SUMMARY_INDEX_PATH"))
+    if d.getVar('CVE_CHECK_CREATE_IMAGE_REPORT') == "1":
+        from oe.rootfs import image_list_installed_packages_pn
+        deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
+        report_name_base = d.getVar("CVE_CHECK_IMAGE_REPORT_FILE_NAME_BASE")
+        report_dir_name = "image_reports"
+        recipes_filter = list(image_list_installed_packages_pn(d))
+
+        if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
+            generate_report(d, report_dir_name, report_name_base, "txt", generate_text_report, link_override=deploy_dir, gen_filter=recipes_filter)
+
+        if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
+            generate_report(d, report_dir_name, report_name_base, "json",
+                            generate_json_report, link_override=deploy_dir,
+                            gen_filter=recipes_filter)
 }
 
-addhandler cve_check_cleanup
-cve_check_cleanup[eventmask] = "bb.cooker.CookerExit"
+ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_image_report; ' if d.getVar('CVE_CHECK_CREATE_IMAGE_REPORT') == '1' else ''}"
+do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_IMAGE_REPORT') == '1' else ''}"
 
-python cve_check_write_rootfs_manifest () {
+python cve_create_build_report_handler () {
     """
-    Create CVE manifest when building an image
+    After the build is completed, if "CVE_CHECK_CREATE_BUILD_REPORT" is set
+    a complete report is created including all CVEs recipe reports information in a single file.
     """
+    if d.getVar("CVE_CHECK_CREATE_BUILD_REPORT") == "1":
+        report_name_base = d.getVar("CVE_CHECK_BUILD_REPORT_FILE_NAME_BASE")
+        build_reports_dir = "build_reports"
 
-    import shutil
-    import json
-    from oe.rootfs import image_list_installed_packages
-    from oe.cve_check import cve_check_merge_jsons, update_symlinks
-
-    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
-        if os.path.exists(deploy_file):
-            bb.utils.remove(deploy_file)
-        deploy_file_json = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
-        if os.path.exists(deploy_file_json):
-            bb.utils.remove(deploy_file_json)
-
-    # Create a list of relevant recipies
-    recipies = set()
-    for pkg in list(image_list_installed_packages(d)):
-        pkg_info = os.path.join(d.getVar('PKGDATA_DIR'),
-                                'runtime-reverse', pkg)
-        pkg_data = oe.packagedata.read_pkgdatafile(pkg_info)
-        recipies.add(pkg_data["PN"])
-
-    bb.note("Writing rootfs CVE manifest")
-    deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
-    link_name = d.getVar("IMAGE_LINK_NAME")
-
-    json_data = {"version":"1", "package": []}
-    text_data = ""
-    enable_json = d.getVar("CVE_CHECK_FORMAT_JSON") == "1"
-    enable_text = d.getVar("CVE_CHECK_FORMAT_TEXT") == "1"
-
-    save_pn = d.getVar("PN")
-
-    for pkg in recipies:
-        # To be able to use the CVE_CHECK_RECIPE_FILE variable we have to evaluate
-        # it with the different PN names set each time.
-        d.setVar("PN", pkg)
-        if enable_text:
-            pkgfilepath = d.getVar("CVE_CHECK_RECIPE_FILE")
-            if os.path.exists(pkgfilepath):
-                with open(pkgfilepath) as pfile:
-                    text_data += pfile.read()
-
-        if enable_json:
-            pkgfilepath = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
-            if os.path.exists(pkgfilepath):
-                with open(pkgfilepath) as j:
-                    data = json.load(j)
-                    cve_check_merge_jsons(json_data, data)
-
-    d.setVar("PN", save_pn)
-
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
-    if enable_json:
-        link_path = os.path.join(deploy_dir, "%s.json" % link_name)
-        manifest_name = d.getVar("CVE_CHECK_MANIFEST_JSON")
-
-        with open(manifest_name, "w") as f:
-            json.dump(json_data, f, indent=2)
-
-        update_symlinks(manifest_name, link_path)
-        bb.plain("Image CVE JSON report stored in: %s" % manifest_name)
+        if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
+            generate_report(d, build_reports_dir, report_name_base, "txt", generate_text_report)
+
+        if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
+            generate_report(d, build_reports_dir, report_name_base, "json", generate_json_report)
 }
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
-do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
-do_populate_sdk[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
+addhandler cve_create_build_report_handler
+cve_create_build_report_handler[eventmask] = "bb.event.BuildCompleted"
+
+python cve_check_cleanup () {
+    """
+    Delete temporary files on bitbake exit
+    """
+    bb.utils.remove(e.data.getVar("CVE_CHECK_TXT_INDEX_FILE"))
+    bb.utils.remove(e.data.getVar("CVE_CHECK_TXT_INDEX_DIR"), recurse=True)
+    bb.utils.remove(e.data.getVar("CVE_CHECK_JSON_INDEX_FILE"))
+    bb.utils.remove(e.data.getVar("CVE_CHECK_JSON_INDEX_DIR"), recurse=True)
+}
+
+addhandler cve_check_cleanup
+cve_check_cleanup[eventmask] = "bb.cooker.CookerExit"
 
 def check_cves(d, patched_cves):
     """
@@ -392,35 +340,117 @@ def get_cve_info(d, cves):
     conn.close()
     return cve_data
 
-def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
+def create_file_and_update_index(d, content, recipes_tmp_dir, index_file, extension):
     """
-    Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
-    CVE manifest if enabled.
+    Helper function used to create a file inside recipes_tmp_dir with content in it.
+    Then update the index file with it's path.
+
+    Args:
+        d: Bitbake data store object.
+        content: String with the temporary recipe report.
+        recipes_tmp_dir: Path of the folder containing the temporary recipes reports.
+        index_file: Path of the index file. The index file is used to save all the temporary recipes reports paths.
+        extension: String of the file extension. (Like "txt" or "json")
+
+    Returns:
+        None. Side effects the temporary recipes report file creation and appends its path to the index.
     """
+    import bb
+    bb.utils.mkdirhier(recipes_tmp_dir)
+    fragment_file_name = "%s.%s" % (d.getVar("PN"), extension)
+    fragment_file = os.path.join(recipes_tmp_dir, fragment_file_name)
 
-    cve_file = d.getVar("CVE_CHECK_LOG")
-    fdir_name  = d.getVar("FILE_DIRNAME")
-    layer = fdir_name.split("/")[-3]
+    with open(fragment_file, "w") as f:
+        f.write(content)
+    with open(index_file, "a+") as f:
+        f.write("%s\n" % fragment_file)
 
-    include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
-    exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
+def tmp_report_saver_json(d, content):
+    """
+    Helper function used to save temporary information used when
+    assembling a complete image or build report.
+    For JSON reports only.
 
-    report_all = d.getVar("CVE_CHECK_REPORT_PATCHED") == "1"
+    Args:
+        d: Bitbake data store object.
+        content: String that will be wrote to the output file.
 
-    if exclude_layers and layer in exclude_layers:
-        return
+    Returns:
+        None. Side effect from create_file_and_update_index.
+    """
+    recipes_tmp_dir = d.getVar("CVE_CHECK_JSON_INDEX_DIR")
+    index_file = d.getVar("CVE_CHECK_JSON_INDEX_FILE")
+    create_file_and_update_index(d, content, recipes_tmp_dir, index_file, "json")
 
-    if include_layers and layer not in include_layers:
-        return
+def tmp_report_saver_txt(d, content):
+    """
+    Helper function used to save temporary information used when
+    assembling a complete image or build report.
+    For txt reports only.
 
-    # Early exit, the text format does not report packages without CVEs
-    if not patched+unpatched+ignored:
-        return
+    Args:
+        d: Bitbake data store object.
+        content: String that will be wrote to the output file.
 
+    Returns:
+        None. Side effect from create_file_and_update_index.
+    """
+    recipes_tmp_dir = d.getVar("CVE_CHECK_TXT_INDEX_DIR")
+    index_file = d.getVar("CVE_CHECK_TXT_INDEX_FILE")
+    create_file_and_update_index(d, content, recipes_tmp_dir, index_file, "txt")
+
+def save_cve_recipe_report(d, content, format, tmp_report_saver):
+    """
+    Save in a dedicated file the content if "CVE_CHECK_CREATE_RECIPE_REPORTS" is set.
+    If a report flag is set (image or build level) then "tmp_report_saver" is executed passing "content",
+    this should save all the information needed when composing the complete report later.
+
+    Args:
+        d: Bitbake data store object.
+        content: String that will be wrote to the output file.
+        format: String of the output format name. Used as file extension and as the name for the
+            format specific output folder.
+        tmp_report_saver: Function that takes (d, content) and saves `content` to a temporary file.
+            This is used in case of image or build reports are enabled.
+
+    Returns:
+        None. Side effects the recipe report file creation and tmp_report_saver side effect (only in case
+        CVE_CHECK_CREATE_IMAGE_REPORT or CVE_CHECK_CREATE_BUILD_REPORT is set).
+    """
+    if d.getVar("CVE_CHECK_CREATE_RECIPE_REPORTS") == "1":
+
+        recipe_file_name = "%s.%s" % (d.getVar("CVE_CHECK_RECIPE_FILE_NAME_BASE"), format)
+        out_dir = d.getVar("CVE_CHECK_OUTPUT_DIR")
+        recipe_reports_dir = os.path.join(out_dir, "recipes_reports/%s" % format)
+        recipe_file = os.path.join(recipe_reports_dir, recipe_file_name)
+        bb.utils.mkdirhier(os.path.dirname(recipe_file))
+        with open(recipe_file, "w") as f:
+            f.write(content)
+
+    if d.getVar("CVE_CHECK_CREATE_IMAGE_REPORT") == "1" or d.getVar("CVE_CHECK_CREATE_BUILD_REPORT") == 1:
+        tmp_report_saver(d, content)
+
+def generate_txt_cve_recipe_report_content(d, patched, unpatched, ignored, cve_data):
+    """
+    Construct the recipe report content string from the cve raw data.
+
+    Args:
+        d: Bitbake data store object.
+        patched: List of patched CVEs.
+        unpatched: List of unpatched CVEs.
+        ignored: List of ignored CVEs.
+        cve_data: Dictionary containing all the CVEs data.
+
+    Returns:
+        Recipe report content string in txt format.
+    """
+    from oe.utils import get_current_recipe_layer
+
+    layer = get_current_recipe_layer(d)
     nvd_link = "https://nvd.nist.gov/vuln/detail/"
     write_string = ""
     unpatched_cves = []
-    bb.utils.mkdirhier(os.path.dirname(cve_file))
+    report_all = d.getVar("CVE_CHECK_REPORT_PATCHED") == "1"
 
     for cve in sorted(cve_data):
         is_patched = cve in patched
@@ -428,7 +458,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
 
         if (is_patched or is_ignored) and not report_all:
             continue
-
+
         write_string += "LAYER: %s\n" % layer
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
@@ -446,78 +476,31 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
 
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
+    return write_string
 
-def cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file):
+def generate_json_cve_recipe_report_content(d, patched, unpatched, ignored, cve_data, cve_status):
     """
-    Write CVE information in the JSON format: to WORKDIR; and to
-    CVE_CHECK_DIR, if CVE manifest if enabled, write fragment
-    files that will be assembled at the end in cve_check_write_rootfs_manifest.
+    Construct the recipe report content string from the cve raw data.
+
+    Args:
+        d: Bitbake data store object.
+        patched: List of patched CVEs.
+        unpatched: List of unpatched CVEs.
+        ignored: List of ignored CVEs.
+        cve_data: Dictionary containing all the CVEs data.
+        cve_status: List of products with their CVE status.
+
+    Returns:
+        Recipe report content string in json format.
     """
-
     import json
+    from oe.utils import get_current_recipe_layer
 
-    write_string = json.dumps(output, indent=2)
-    with open(direct_file, "w") as f:
-        bb.note("Writing file %s with CVE information" % direct_file)
-        f.write(write_string)
-
-    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-        bb.utils.mkdirhier(os.path.dirname(deploy_file))
-        with open(deploy_file, "w") as f:
-            f.write(write_string)
-
-    if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
-        cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
-        index_path = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
-        bb.utils.mkdirhier(cvelogpath)
-        fragment_file = os.path.basename(deploy_file)
-        fragment_path = os.path.join(cvelogpath, fragment_file)
-        with open(fragment_path, "w") as f:
-            f.write(write_string)
-        with open(index_path, "a+") as f:
-            f.write("%s\n" % fragment_path)
-
-def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
-    """
-    Prepare CVE data for the JSON format, then write it.
-    """
-
+    layer = get_current_recipe_layer(d)
     output = {"version":"1", "package": []}
     nvd_link = "https://nvd.nist.gov/vuln/detail/"
-
-    fdir_name  = d.getVar("FILE_DIRNAME")
-    layer = fdir_name.split("/")[-3]
-
-    include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
-    exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
-
     report_all = d.getVar("CVE_CHECK_REPORT_PATCHED") == "1"
 
-    if exclude_layers and layer in exclude_layers:
-        return
-
-    if include_layers and layer not in include_layers:
-        return
-
     unpatched_cves = []
 
     product_data = []
@@ -566,18 +549,173 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
     package_data["issue"] = cve_list
     output["package"].append(package_data)
 
-    direct_file = d.getVar("CVE_CHECK_LOG_JSON")
-    deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
-    manifest_file = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME_JSON")
+    return json.dumps(output, indent=2)
 
-    cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file)
+def is_layer_checked(d):
+    """
+        Helper function used to check if the layer of the current recipe
+        is expected to be checked for CVEs. A layer isn't checked if:
+        CVE_CHECK_LAYER_INCLUDELIST exists and the layer is not on the list,
+        or CVE_CHECK_LAYER_EXCLUDELIST exists and the layer is on the list.
+
+        Args:
+            d: Bitbake data store object.
+
+        Returns:
+            True if the layer is ok, otherwise False.
+    """
+    from oe.utils import get_current_recipe_layer
+
+    layer = get_current_recipe_layer(d)
+    include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
+    exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
+
+    if (include_layers and layer not in include_layers) or \
+       (exclude_layers and layer in exclude_layers):
+        return False
+    else:
+        return True
 
 def cve_write_data(d, patched, unpatched, ignored, cve_data, status):
     """
-    Write CVE data in each enabled format.
+    Checks if the layer of the current recipe is ok then calls the functions to generate and save
+    the recipe reports in txt and JSON formats only if the relative flags are set.
+
+    Args:
+        d: Bitbake data store object.
+        patched: List of patched CVEs.
+        unpatched: List of unpatched CVEs.
+        ignored: List of ignored CVEs.
+        cve_data: Dictionary containing all the CVEs data.
+        cve_status: List of products with their CVE status.
+
+    Returns:
+        None. Same side effect of save_cve_recipe_report.
+
+    """
+    if is_layer_checked(d):
+        if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
+            txt_content = generate_txt_cve_recipe_report_content(d, patched, unpatched, ignored, cve_data)
+            save_cve_recipe_report(d, txt_content, "txt", tmp_report_saver_txt)
+        if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
+            json_content = generate_json_cve_recipe_report_content(d, patched, unpatched, ignored, cve_data, status)
+            save_cve_recipe_report(d, json_content, "json", tmp_report_saver_json)
+
+def get_content_list(d, index_file, filter=None):
+    """
+    Given the index file path and a filter read all the files listed in the index.
+    If filter is not None use it on the file name (without extension).
+
+    Args:
+        d: Bitbake data store object.
+        index_file: Path of the index file.
+        filter: List of product name, used to filter out the reports to include in the output list.
+
+    Returns:
+        List of strings representing the content of the files read.
+    """
+    output_list = []
+    with open(index_file) as f:
+        file_path = f.readline()
+        while file_path:
+            file_path = file_path.rstrip()
+            # Get the file name without extension
+            file_name = file_path.split("/")[-1].split(".")[0]
+            if filter is None or (filter and file_name in filter):
+                with open(file_path, "r") as j:
+                    output_list.append(j.read())
+            file_path = f.readline()
+
+    return output_list
+
+def generate_json_report(d, report_file, report_link, filter=None):
+    """
+    Generate the JSON reports (image or build level).
+    Store the results in report_file and creates the link from report_link to that.
+    The report can be filtered using a list of file names.
+
+    Args:
+        d: Bitbake data store object.
+        report_file: Path of the report file to create.
+        report_link: Path where to create the link to report_file.
+        filter: List of product name, used to filter out the products to include in report.
+
+    Returns:
+        None. Side effects the report and link creation in json format.
+    """
+    if os.path.exists(d.getVar("CVE_CHECK_JSON_INDEX_FILE")):
+        import json
+        from oe.cve_check import cve_check_merge_jsons, update_symlinks
+
+        index_file = d.getVar("CVE_CHECK_JSON_INDEX_FILE")
+        report_dict = {"version":"1", "package": []}
+        temp_content_list = get_content_list(d, index_file, filter)
+        [cve_check_merge_jsons(report_dict, json.loads(s)) for s in temp_content_list]
+
+        with open(report_file, "w") as f:
+            json.dump(report_dict, f, indent=2)
+
+        update_symlinks(report_file, report_link)
+
+def generate_text_report(d, report_file, report_link, filter=None):
+    """
+    Generate the txt reports (image or build level).
+    Store the results in report_file and creates the link from report_link to that.
+
+    Args:
+        d: Bitbake data store object.
+        report_file: Path of the report file to create.
+        report_link: Path where to create the link to report_file.
+        filter: List of product name, used to filter out the products to include in report.
+
+    Returns:
+        None. Side effects the report and link creation in txt format.
     """
 
-    if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
-        cve_write_data_text(d, patched, unpatched, ignored, cve_data)
-    if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
-        cve_write_data_json(d, patched, unpatched, ignored, cve_data, status)
+    if os.path.exists(d.getVar("CVE_CHECK_TXT_INDEX_FILE")):
+        from oe.cve_check import update_symlinks
+        index_file = d.getVar("CVE_CHECK_TXT_INDEX_FILE")
+        report_out = "".join(get_content_list(d, index_file, filter))
+
+        with open(report_file, "w") as f:
+            f.write(report_out)
+
+        update_symlinks(report_file, report_link)
+
+def generate_report(d, report_dir, report_name_base, extension, generator_func, link_override=None, gen_filter=None):
+    """
+    Form the necessary paths and directory structures to call the generator_func, that generates and saves the report.
+    Args:
+        report_dir: Path of the subfolder that is created inside the out_dir. This will store all format folders (txt and json folders).
+        report_name_base: Name of the report without the extension
+        extension: String of the extension (txt or json are currently used)
+        generator_func: Function used to generate the report. It takes the report output path, a link path to save the output and a list to use as a filter.
+        link_override: Optional argument used to override the standard path of the link (inside CVE_CHECK_OUTPUT_DIR), this will be used
+            instead of out_dir when forming the link path.
+        gen_filter: Optional argument to pass as "filter" to generator_func. List of file names used by generator functions to filter
+            the recipe included in the report
+
+    Return:
+        None. Same side effect as generator_func. Prints where the report link is located.
+    """
+    import bb
+    import shutil
+    import datetime
+
+    out_dir = d.getVar("CVE_CHECK_OUTPUT_DIR")
+    timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
+    build_reports_dir = os.path.join(out_dir, report_dir)
+
+    report_file_name = "%s-%s.%s" % (report_name_base, timestamp, extension)
+    report_folder_dir = os.path.join(build_reports_dir, extension)
+    bb.utils.mkdirhier(report_folder_dir)
+    report_file = os.path.join(report_folder_dir, report_file_name)
+
+    if link_override is None:
+        report_link = os.path.join(out_dir, "%s.%s" % (report_name_base, extension))
+    else:
+        report_link = os.path.join(link_override, "%s.%s" % (report_name_base, extension))
+
+    generator_func(d, report_file, report_link, filter=gen_filter)
+
+    bb.plain("Report created at: %s" % report_link)
-- 
2.34.1

