Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA13C3DA70
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 11:53:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.42242.1721735622158735974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 04:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BjYudiRw;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so27534525e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 04:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721735620; x=1722340420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0COb0ouQK2KcFBa+WKmnw5NbCHtzPTvRASNIILZhCFM=;
        b=BjYudiRwXEDndAfSzA0xWUc8xOtvY25qmWQuN7UYKimYbGz7KOxVM/DovFY2hYDDG0
         Rjkz2SMgDgLt/73ITwXVZHKFdg2hT9sHKZSimizAKfFs9OoUDJzTO9xLEisHFnPOCjIY
         Xwqe8+ce9bFlEeiw85hBOY0Dh9a4izpdAqYdTUkmd+635PdVv13+my2JtmtIRz0M2Ldy
         K4MT+j+Px/VVA4T7cjsjOQQkVS2njHwk/Sv/4qpbFmxgnk/35JSO9gTIgS4Eu/AuD+Ul
         +QBs34t0ZjepcRRmQnAczQTWZQjteZ2x2DxaP1jChj4LDzeQL5V4fafpmqkmZ3MWTLAa
         lWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721735620; x=1722340420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0COb0ouQK2KcFBa+WKmnw5NbCHtzPTvRASNIILZhCFM=;
        b=kBpxK9H3FgeZqMEmNb21EfXxGLF0eotMQIIpzqExTOD+cLSv9JpOR93KpxwpEuodEN
         Lo1zRpDSGEnusN8HNrsteQEuZLGyehrSbfWiLPp/ADqnaS02x1mf7QLLdC+kSbDQy9Hk
         MYnUlo9kdGr1fDxPaJ/wbR1VUsp72nrvxWENnZfa9PWsS/y2EkQK2S3fZCJyZbuFEh//
         aU9nPrk2bZ68qXbwyEaYFT2/2bE4LafF+0QQig0l/Tp9yWjXal8f+nnCg0nNg/zQhpln
         3p4OhxqxYuiIhc3RRH01gHrNO0HFQGck4ysXs+13cjy1wOpZ60PI49w0i8qY+IcGS8nv
         TwHQ==
X-Gm-Message-State: AOJu0YzK2+kCeSzRRIt3mz6vJLCYOcW2cWyNJCr7cbkFnMtVfPsXslNW
	wQwetDJn/R75YT+Cz3E1S41BvQ5SVvQJ1uMmz6sxBzGVOa6WmSpxLHLOkg==
X-Google-Smtp-Source: AGHT+IFwHi5vheLxebOPPnfQoVctoiQmAlz14QOBjylttE0+R46AOjYR8YyF2rJubLmEZUPeTIc/cA==
X-Received: by 2002:a05:600c:a46:b0:426:711c:6591 with SMTP id 5b1f17b1804b1-427ef2c4ad1mr14372375e9.4.1721735619655;
        Tue, 23 Jul 2024 04:53:39 -0700 (PDT)
Received: from localhost.localdomain ([80.215.234.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6900caasm168537075e9.11.2024.07.23.04.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:53:38 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [OE-core][PATCH v2 3/5] vex.bbclass: add a new class
Date: Tue, 23 Jul 2024 13:53:13 +0200
Message-ID: <20240723115315.207013-3-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723115315.207013-1-marta.rybczynska@syslinbit.com>
References: <20240723115315.207013-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 11:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202338

The "vex" class generates the minimum information that is necessary
for VEX generation by an external CVE checking tool. It is a drop-in
replacement of "cve-check". It uses the same variables from recipes
to make the migration and backporting easier.

The goal if this class is to allow generation of the CVE list of
an image or distribution on-demand, including the latest information
from vulnerability databases. Vulnerability data changes every day,
so a status generated at build becomes out-of-date very soon.

Research done for this work shows that the current VEX formats (CSAF
and OpenVEX) do not provide enough information to generate such
rolling information. Instead, we extract the needed data from recipe
annotations (package names, CPEs, versions, CVE patches applied...)
and store for later use in the format that is an extension of the
CVE-check JSON output format.

This output can be then used (separately or with SPDX of the same
build) by an external tool to generate the vulnerability annotation
and VEX statements in standard formats.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 meta/classes/vex.bbclass | 310 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 310 insertions(+)
 create mode 100644 meta/classes/vex.bbclass

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
new file mode 100644
index 0000000000..bb16e2a529
--- /dev/null
+++ b/meta/classes/vex.bbclass
@@ -0,0 +1,310 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# This class is used to generate metadata needed by external
+# tools to check for vulnerabilities, for example CVEs.
+#
+# In order to use this class just inherit the class in the
+# local.conf file and it will add the generate_vex task for
+# every recipe. If an image is build it will generate a report
+# in DEPLOY_DIR_IMAGE for all the packages used, it will also
+# generate a file for all recipes used in the build.
+#
+# Variables use CVE_CHECK prefix to keep compatibility with
+# the cve-check class
+#
+# Example:
+#   bitbake -c generate_vex openssl
+#   bitbake core-image-sato
+#   bitbake -k -c generate_vex universe
+#
+# The product name that the CVE database uses defaults to BPN, but may need to
+# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
+CVE_PRODUCT ??= "${BPN}"
+CVE_VERSION ??= "${PV}"
+
+CVE_CHECK_SUMMARY_DIR ?= "${LOG_DIR}/cve"
+
+CVE_CHECK_SUMMARY_FILE_NAME_JSON = "cve-summary.json"
+CVE_CHECK_SUMMARY_INDEX_PATH = "${CVE_CHECK_SUMMARY_DIR}/cve-summary-index.txt"
+
+CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
+CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
+CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.json"
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
+    if bb.data.inherits_class("cve-check", d):
+        raise bb.parse.SkipRecipe("Skipping recipe: found incompatible combination of cve-check and vex enabled at the same time.")
+
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
+    cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+
+    bb.utils.mkdirhier(cvelogpath)
+    timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
+
+    json_summary_link_name = os.path.join(cvelogpath, d.getVar("CVE_CHECK_SUMMARY_FILE_NAME_JSON"))
+    json_summary_name = os.path.join(cvelogpath, "cve-summary-%s.json" % (timestamp))
+    generate_json_report(d, json_summary_name, json_summary_link_name)
+    bb.plain("Complete CVE JSON report summary created at: %s" % json_summary_link_name)
+}
+
+addhandler vex_save_summary_handler
+vex_save_summary_handler[eventmask] = "bb.event.BuildCompleted"
+
+python do_generate_vex () {
+    """
+    Generate metadata needed for vulnerability checking for
+    the current recipe
+    """
+    from oe.cve_check import get_patched_cves
+
+    try:
+        patched_cves = get_patched_cves(d)
+        cves_status = []
+        products = d.getVar("CVE_PRODUCT").split()
+        for product in products:
+            if ":" in product:
+                _, product = product.split(":", 1)
+            cves_status.append([product, False])
+
+    except FileNotFoundError:
+        bb.fatal("Failure in searching patches")
+
+    cve_write_data_json(d, patched_cves, cves_status)
+}
+
+addtask generate_vex before do_build
+
+python vex_cleanup () {
+    """
+    Delete the file used to gather all the CVE information.
+    """
+    bb.utils.remove(e.data.getVar("CVE_CHECK_SUMMARY_INDEX_PATH"))
+}
+
+addhandler vex_cleanup
+vex_cleanup[eventmask] = "bb.event.BuildCompleted"
+
+python vex_write_rootfs_manifest () {
+    """
+    Create VEX/CVE manifest when building an image
+    """
+
+    import json
+    from oe.rootfs import image_list_installed_packages
+    from oe.cve_check import cve_check_merge_jsons, update_symlinks
+
+    deploy_file_json = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+    if os.path.exists(deploy_file_json):
+        bb.utils.remove(deploy_file_json)
+
+    # Create a list of relevant recipies
+    recipies = set()
+    for pkg in list(image_list_installed_packages(d)):
+        pkg_info = os.path.join(d.getVar('PKGDATA_DIR'),
+                                'runtime-reverse', pkg)
+        pkg_data = oe.packagedata.read_pkgdatafile(pkg_info)
+        recipies.add(pkg_data["PN"])
+
+    bb.note("Writing rootfs VEX manifest")
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
+    bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
+}
+
+ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest; "
+do_rootfs[recrdeptask] += "do_generate_vex "
+do_populate_sdk[recrdeptask] += "do_generate_vex "
+
+def cve_write_data_json(d, cve_data, cve_status):
+    """
+    Prepare CVE data for the JSON format, then write it.
+    Done for each recipe.
+    """
+
+    from oe.cve_check import get_cpe_ids
+    import json
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
+    product_data = list({p['product']:p for p in product_data}.values())
+
+    package_version = "%s%s" % (d.getVar("EXTENDPE"), d.getVar("PV"))
+    cpes = get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION"))
+    package_data = {
+        "name" : d.getVar("PN"),
+        "layer" : layer,
+        "version" : package_version,
+        "products": product_data,
+        "cpes": cpes
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
+    deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+
+    write_string = json.dumps(output, indent=2)
+
+    cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+    index_path = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
+    bb.utils.mkdirhier(cvelogpath)
+    fragment_file = os.path.basename(deploy_file)
+    fragment_path = os.path.join(cvelogpath, fragment_file)
+    with open(fragment_path, "w") as f:
+        f.write(write_string)
+    with open(index_path, "a+") as f:
+        f.write("%s\n" % fragment_path)
-- 
2.43.0


