Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0B6C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 13:02:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.11234.1717160523580426050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 06:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DvrD9+BV;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-420180b5897so9798675e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717160521; x=1717765321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX88ZyUT0fuLVupYi3y2vuzPRb6O2rVnbY0hyr73huI=;
        b=DvrD9+BVIy7jxgFGgmiLTA2YdREkE/jU2fC5BOPe/k2oDLhLi4YnsssVAPVPnb6ZDU
         O/y0j9kZtO7m/ys9Tq7wVtZzzmxU+cCgRI0BXTNsofSi+1roDCjmTadD1qVtrF5t0PUy
         DGl5Xo0P2ZwKSHeBPnCPeeBx9AEv5RkSsjpv0OHWru3ww5e+BqGYZPfvtKhia0A9GDJH
         58j7n6w4nX37iJJmrs+GeV6gic5c8H9ikar83RGxR87sX+WUcbOify19NF0jdWmT/7wj
         p7o5O24Ome/+6TztZW/Jy5xMp2zikYLNsZK+RsxmEt3BskjR4jFRn0Do8hX8DecLXrQp
         Jd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717160521; x=1717765321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uX88ZyUT0fuLVupYi3y2vuzPRb6O2rVnbY0hyr73huI=;
        b=Ashl13j9ImfbUxochITrHyep1D+pPdqyvw2qxA1VW4tbBJfBwRjFZLjUBwOXbi6HIz
         TROq4AjfKJg4pxhLKIE1YU9SVQ3BHZW+XMH7WUEr67iBS3+MWbNs+MvlbvSd5UothQbx
         2+phqqi4IerLNCHyAQ1sigNQx8f3jnPMIaYgRFg1D87IQeIfOsF0TCJqMLpOnf8thXy/
         H8Vgb36p7S4JP9xSezYmC0LkV2Filsd6FdG2HfAZts5rgLzQukBwZo7tFHsR67dKqQU7
         y4IF/0YDSSqV2AEp9HZHtt912vt3nteDxRlYCzhb0oK9T6YUC9uwigG1ZlxUYvy6ESZ/
         F0Ew==
X-Gm-Message-State: AOJu0YxQHXcsDWmJUschzbVzf4YzZQfJrq1kkF5MHgKZxI9RNqnRDGFe
	uRIxbuaDOxB78xO83AECwUSnS5UP2y2pA0XmxW2HlGONZLogFVu2qPqljQ==
X-Google-Smtp-Source: AGHT+IGQxnCLe9RWO3uanmn/HBPIzglMgHvf9RZhZ4Y96Wv9kvMcQKl94GkUOWKdk1hmSVp6c9o/PA==
X-Received: by 2002:a05:600c:4753:b0:420:1551:96ab with SMTP id 5b1f17b1804b1-4212e05e7e8mr17749425e9.10.1717160521060;
        Fri, 31 May 2024 06:02:01 -0700 (PDT)
Received: from localhost.localdomain ([80.215.210.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421270ad52dsm54599665e9.42.2024.05.31.06.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:02:00 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [RFC][OE-core 2/3] vex.bbclass: add a new class
Date: Fri, 31 May 2024 15:01:27 +0200
Message-ID: <20240531130128.1258909-2-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240531130128.1258909-1-marta.rybczynska@syslinbit.com>
References: <20240531130128.1258909-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 13:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200075

The "vex" class generates the minimum information that is necessary
by an external CVE checking tool. It is a drop-in replacement of "cve-check".
It uses the same variables from recipes.

It generates the JSON output format only.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 meta/classes/vex.bbclass | 332 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 332 insertions(+)
 create mode 100644 meta/classes/vex.bbclass

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
new file mode 100644
index 0000000000..e196f73169
--- /dev/null
+++ b/meta/classes/vex.bbclass
@@ -0,0 +1,332 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# This class is used to check recipes against public CVEs.
+#
+# In order to use this class just inherit the class in the
+# local.conf file and it will add the cve_check task for
+# every recipe. The task can be used per recipe, per image,
+# or using the special cases "world" and "universe". The
+# cve_check task will print a warning for every unpatched
+# CVE found and generate a file in the recipe WORKDIR/cve
+# directory. If an image is build it will generate a report
+# in DEPLOY_DIR_IMAGE for all the packages used.
+#
+# Example:
+#   bitbake -c cve_check openssl
+#   bitbake core-image-sato
+#   bitbake -k -c cve_check universe
+#
+# DISCLAIMER
+#
+# This class/tool is meant to be used as support and not
+# the only method to check against CVEs. Running this tool
+# doesn't guarantee your packages are free of CVEs.
+
+# The product name that the CVE database uses defaults to BPN, but may need to
+# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
+CVE_PRODUCT ??= "${BPN}"
+CVE_VERSION ??= "${PV}"
+
+CVE_CHECK_SUMMARY_DIR ?= "${LOG_DIR}/cve"
+CVE_CHECK_SUMMARY_FILE_NAME ?= "cve-summary"
+CVE_CHECK_SUMMARY_FILE_NAME_JSON = "cve-summary.json"
+CVE_CHECK_SUMMARY_INDEX_PATH = "${CVE_CHECK_SUMMARY_DIR}/cve-summary-index.txt"
+
+CVE_CHECK_LOG_JSON ?= "${T}/cve.json"
+
+CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
+CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
+CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.json"
+CVE_CHECK_COPY_FILES ??= "1"
+CVE_CHECK_CREATE_MANIFEST ??= "1"
+
+# Report Patched or Ignored CVEs
+CVE_CHECK_REPORT_PATCHED ??= "1"
+
+CVE_CHECK_SHOW_WARNINGS ??= "1"
+
+# Skip CVE Check for packages (PN)
+CVE_CHECK_SKIP_RECIPE ?= ""
+
+# Replace NVD DB check status for a given CVE. Each of CVE has to be mentioned
+# separately with optional detail and description for this status.
+#
+# CVE_STATUS[CVE-1234-0001] = "not-applicable-platform: Issue only applies on Windows"
+# CVE_STATUS[CVE-1234-0002] = "fixed-version: Fixed externally"
+#
+# Settings the same status and reason for multiple CVEs is possible
+# via CVE_STATUS_GROUPS variable.
+#
+# CVE_STATUS_GROUPS = "CVE_STATUS_WIN CVE_STATUS_PATCHED"
+#
+# CVE_STATUS_WIN = "CVE-1234-0001 CVE-1234-0003"
+# CVE_STATUS_WIN[status] = "not-applicable-platform: Issue only applies on Windows"
+# CVE_STATUS_PATCHED = "CVE-1234-0002 CVE-1234-0004"
+# CVE_STATUS_PATCHED[status] = "fixed-version: Fixed externally"
+#
+# All possible CVE statuses could be found in cve-check-map.conf
+# CVE_CHECK_STATUSMAP[not-applicable-platform] = "Ignored"
+# CVE_CHECK_STATUSMAP[fixed-version] = "Patched"
+#
+# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
+# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
+CVE_CHECK_IGNORE ?= ""
+
+# Layers to be excluded
+CVE_CHECK_LAYER_EXCLUDELIST ??= ""
+
+# Layers to be included
+CVE_CHECK_LAYER_INCLUDELIST ??= ""
+
+
+# set to "alphabetical" for version using single alphabetical character as increment release
+CVE_VERSION_SUFFIX ??= ""
+
+python () {
+    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
+    cve_check_ignore = d.getVar("CVE_CHECK_IGNORE")
+    if cve_check_ignore:
+        bb.warn("CVE_CHECK_IGNORE is deprecated in favor of CVE_STATUS")
+        for cve in (d.getVar("CVE_CHECK_IGNORE") or "").split():
+            d.setVarFlag("CVE_STATUS", cve, "ignored")
+
+    # Process CVE_STATUS_GROUPS to set multiple statuses and optional detail or description at once
+    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split():
+        cve_group = d.getVar(cve_status_group)
+        if cve_group is not None:
+            for cve in cve_group.split():
+                d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_group, "status"))
+        else:
+            bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" % cve_status_group)
+}
+
+def generate_json_report(d, out_path, link_path):
+    if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
+        import json
+        from oe.cve_check import cve_check_merge_jsons, update_symlinks
+
+        bb.note("Generating JSON CVE summary")
+        index_file = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
+        summary = {"version":"1", "package": []}
+        with open(index_file) as f:
+            filename = f.readline()
+            while filename:
+                with open(filename.rstrip()) as j:
+                    data = json.load(j)
+                    cve_check_merge_jsons(summary, data)
+                filename = f.readline()
+
+        summary["package"].sort(key=lambda d: d['name'])
+
+        with open(out_path, "w") as f:
+            json.dump(summary, f, indent=2)
+
+        update_symlinks(out_path, link_path)
+
+python vex_save_summary_handler () {
+    import shutil
+    import datetime
+    from oe.cve_check import update_symlinks
+
+    cve_summary_name = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
+    cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+
+    bb.utils.mkdirhier(cvelogpath)
+    timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
+
+    json_summary_link_name = os.path.join(cvelogpath, d.getVar("CVE_CHECK_SUMMARY_FILE_NAME_JSON"))
+    json_summary_name = os.path.join(cvelogpath, "%s-%s.json" % (cve_summary_name, timestamp))
+    generate_json_report(d, json_summary_name, json_summary_link_name)
+    bb.plain("Complete CVE JSON report summary created at: %s" % json_summary_link_name)
+}
+
+addhandler vex_save_summary_handler
+vex_save_summary_handler[eventmask] = "bb.event.BuildCompleted"
+
+python do_generate_vex () {
+    """
+    Check recipe for patched and unpatched CVEs
+    """
+    from oe.cve_check import get_patched_cves
+
+    try:
+        patched_cves = get_patched_cves(d)
+    except FileNotFoundError:
+        bb.fatal("Failure in searching patches")
+
+    cve_write_data_json(d, patched_cves, [])
+}
+
+addtask generate_vex before do_build
+
+python vex_cleanup () {
+    """
+    Delete the file used to gather all the CVE information.
+    """
+    bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
+    bb.utils.remove(e.data.getVar("CVE_CHECK_SUMMARY_INDEX_PATH"))
+}
+
+addhandler vex_cleanup
+vex_cleanup[eventmask] = "bb.event.BuildCompleted"
+
+python vex_write_rootfs_manifest () {
+    """
+    Create CVE manifest when building an image
+    """
+
+    import shutil
+    import json
+    from oe.rootfs import image_list_installed_packages
+    from oe.cve_check import cve_check_merge_jsons, update_symlinks
+
+    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
+        deploy_file_json = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+        if os.path.exists(deploy_file_json):
+            bb.utils.remove(deploy_file_json)
+
+    # Create a list of relevant recipies
+    recipies = set()
+    for pkg in list(image_list_installed_packages(d)):
+        pkg_info = os.path.join(d.getVar('PKGDATA_DIR'),
+                                'runtime-reverse', pkg)
+        pkg_data = oe.packagedata.read_pkgdatafile(pkg_info)
+        recipies.add(pkg_data["PN"])
+
+    bb.note("Writing rootfs CVE manifest")
+    deploy_dir = d.getVar("IMGDEPLOYDIR")
+    link_name = d.getVar("IMAGE_LINK_NAME")
+
+    json_data = {"version":"1", "package": []}
+    text_data = ""
+
+    save_pn = d.getVar("PN")
+
+    for pkg in recipies:
+        # To be able to use the CVE_CHECK_RECIPE_FILE_JSON variable we have to evaluate
+        # it with the different PN names set each time.
+        d.setVar("PN", pkg)
+
+        pkgfilepath = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+        if os.path.exists(pkgfilepath):
+            with open(pkgfilepath) as j:
+                data = json.load(j)
+                cve_check_merge_jsons(json_data, data)
+
+    d.setVar("PN", save_pn)
+
+    link_path = os.path.join(deploy_dir, "%s.json" % link_name)
+    manifest_name = d.getVar("CVE_CHECK_MANIFEST_JSON")
+
+    with open(manifest_name, "w") as f:
+        json.dump(json_data, f, indent=2)
+
+    update_symlinks(manifest_name, link_path)
+    bb.plain("Image CVE JSON report stored in: %s" % manifest_name)
+}
+
+ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest; "
+do_rootfs[recrdeptask] += "do_generate_vex "
+do_populate_sdk[recrdeptask] += "do_generate_vex "
+
+def cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file):
+    """
+    Write CVE information in the JSON format: to WORKDIR; and to
+    CVE_CHECK_DIR, if CVE manifest if enabled, write fragment
+    files that will be assembled at the end in cve_check_write_rootfs_manifest.
+    """
+
+    import json
+
+    write_string = json.dumps(output, indent=2)
+    with open(direct_file, "w") as f:
+        bb.note("Writing file %s with CVE information" % direct_file)
+        f.write(write_string)
+
+    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
+        bb.utils.mkdirhier(os.path.dirname(deploy_file))
+        with open(deploy_file, "w") as f:
+            f.write(write_string)
+
+    if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
+        cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+        index_path = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
+        bb.utils.mkdirhier(cvelogpath)
+        fragment_file = os.path.basename(deploy_file)
+        fragment_path = os.path.join(cvelogpath, fragment_file)
+        with open(fragment_path, "w") as f:
+            f.write(write_string)
+        with open(index_path, "a+") as f:
+            f.write("%s\n" % fragment_path)
+
+def cve_write_data_json(d, cve_data, cve_status):
+    """
+    Prepare CVE data for the JSON format, then write it.
+    """
+
+    output = {"version":"1", "package": []}
+    nvd_link = "https://nvd.nist.gov/vuln/detail/"
+
+    fdir_name  = d.getVar("FILE_DIRNAME")
+    layer = fdir_name.split("/")[-3]
+
+    include_layers = d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
+    exclude_layers = d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
+
+    if exclude_layers and layer in exclude_layers:
+        return
+
+    if include_layers and layer not in include_layers:
+        return
+
+    product_data = []
+    for s in cve_status:
+        p = {"product": s[0], "cvesInRecord": "Yes"}
+        if s[1] == False:
+            p["cvesInRecord"] = "No"
+        product_data.append(p)
+
+    package_version = "%s%s" % (d.getVar("EXTENDPE"), d.getVar("PV"))
+    package_data = {
+        "name" : d.getVar("PN"),
+        "layer" : layer,
+        "version" : package_version,
+        "products": product_data
+    }
+
+    cve_list = []
+
+    for cve in sorted(cve_data):
+        issue_link = "%s%s" % (nvd_link, cve)
+
+        cve_item = {
+            "id" : cve,
+            "status" : cve_data[cve]["abbrev-status"],
+            "link": issue_link,
+        }
+        if 'NVD-summary' in cve_data[cve]:
+            cve_item["summary"] = cve_data[cve]["NVD-summary"]
+            cve_item["scorev2"] = cve_data[cve]["NVD-scorev2"]
+            cve_item["scorev3"] = cve_data[cve]["NVD-scorev3"]
+            cve_item["vector"] = cve_data[cve]["NVD-vector"]
+            cve_item["vectorString"] = cve_data[cve]["NVD-vectorString"]
+        if 'status' in cve_data[cve]:
+            cve_item["detail"] = cve_data[cve]["status"]
+        if 'justification' in cve_data[cve]:
+            cve_item["description"] = cve_data[cve]["justification"]
+        if 'resource' in cve_data[cve]:
+            cve_item["patch-file"] = cve_data[cve]["resource"]
+        cve_list.append(cve_item)
+
+    package_data["issue"] = cve_list
+    output["package"].append(package_data)
+
+    direct_file = d.getVar("CVE_CHECK_LOG_JSON")
+    deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+    manifest_file = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME_JSON")
+
+    cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file)
-- 
2.42.0


