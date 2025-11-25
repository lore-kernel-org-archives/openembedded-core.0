Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30962D0EE38
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:59:10 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4280.1764104342540326542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G4kPm4BM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so4040620b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104342; x=1764709142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+cxfcEUAmmSXU7NN+0j+xiQGEgoJY15kh7ZNLdhWkI=;
        b=G4kPm4BMJTiFFcuRpsTsS5a6DlYoKdUETbnLE7Iw2HlBiwpeVabOpCceF+TzblEtCb
         Qr5v2y4PvfkNEzuHV1WpvYF5LcbrzbHB2AWtL0NjzpKGS4o1uPNoEB7ByLfuW2vsLKIT
         pNCvrsYuboTYQ5iKL8vyUYqDRKKlpK2CIzrt80Zl0d6O5cjdUoqaB537Iv+Y8yXvzjO8
         cPxZgib8bui0fNCUc2g5HxwT6KuiACML22H+TIEDiII2MY7uCMn8IVu5NGaQzl6or+AU
         vkfhjX3h40JDdllSodSTuOlCSyZvpH4zM/2+sXi3dNRZ7/X77nyX+5ggNa6dxxkcvEkp
         pcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104342; x=1764709142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O+cxfcEUAmmSXU7NN+0j+xiQGEgoJY15kh7ZNLdhWkI=;
        b=V1ngR/A1nw80T1WmH1hLuLjr9zeN2KNqxbCC2szKAZjQIHzFYvpUlvfDz30i3srlED
         RfozY1ZU5OkZPlWa8W7NN1Ihvjm0+VgEq8dqSc51711BwBOaLUJRzQRhBgIBXqpuVmo4
         ZJ02yNaGn3AI540s8hQVhUOaCgEEz3JvbhpeFccFPNCvaMyTnzQjG0UA4Q7gx8qxFbLD
         EK2psboSn8ZHaWs/Nizt4MubJQSHYF5ewQ6J/LzJMGb0yDVp/eZYEaUT8NhNcLlFVpAq
         Tm8sDaZIt/7WKeDO/SrhOjn0asDX57xZrlrhh9CzRSqjqkljYOCmcp23t798WaJi2yeP
         QX7w==
X-Gm-Message-State: AOJu0YzbOfQIdY3E3RqjXhZ0VIdDhrnNCLXNWNr90CFbG/Uevypk4a3H
	7pEOmpWKMQtISx0v8/DEz25yj0L6epER5LzcZnGL5sSdoKH8AjwcXln7dXIaGDYrjVeV6bZumI3
	TWX4u
X-Gm-Gg: ASbGncugF4JNCBhMp5CZhL8f1j6UCQR28rIQL3DRpnw3TxbeVtACpy1jpI1cyB3WR8p
	j1rFg8JJRgtVuAJ9n5NHwsqTAevDv2Cb498pHOWgY43KM1f4bbS2ZdYpVqQiAAblk+/0eSNEQDI
	4CV9yWuHp+Dp+QwL0t3rreDfGk5gUGu9f/8h5eSajx8zaJRT/J85cqFBANZcp0KhWkUw2AVPtIv
	JiMok87DzKkgsy5sswFCc3VZ4kQmzSlie9dsA5FJy9fn3zOnuBtAHNsNbgr4bOqIPCSMnDUBRBH
	tqhd/72LCQJtjo66z1/SicfPGchrfyVBfM8o9xE39Ty0u1RTJE0luFgRGz+qRW2IXPWg1MDWWZp
	E65FkdZyzBqRvF7W4uu6ztGB6GucCNDagsxakUL16UrlKKsqplOGCxyj8BX+68F4sJj0Ej4pOMS
	pqKw==
X-Google-Smtp-Source: AGHT+IECRz1IS+vM1GZrvQ+UDmgbLoppq7w5bFyga7dC5RmM00APwfiJHQ6eG90pKYiPML3vklgIUg==
X-Received: by 2002:a05:6a21:32a5:b0:342:873d:7e62 with SMTP id adf61e73a8af0-3637dea5b4emr4580064637.29.1764104341489;
        Tue, 25 Nov 2025 12:59:01 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm17340755a12.4.2025.11.25.12.59.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:59:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/9] vex.bbclass: add a new class
Date: Tue, 25 Nov 2025 12:58:41 -0800
Message-ID: <123a60bc19987e99d511b1f515e118022949be7e.1764104199.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764104199.git.steve@sakoman.com>
References: <cover.1764104199.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226788

From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>

The "vex" class generates the minimum information that is necessary
for VEX generation by an external CVE checking tool. It is a drop-in
replacement of "cve-check". It uses the same variables from recipes
to make the migration and backporting easier.

The goal of this class is to allow generation of the CVE list of
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

When back-porting this feature, the do_generate_vex() had to be modified
to use the "old" get_patched_cves() API.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6352ad93a72e67d6dfa82e870222518a97c426fa)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/vex.bbclass | 327 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 327 insertions(+)
 create mode 100644 meta/classes/vex.bbclass

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
new file mode 100644
index 0000000000..73dd9338a1
--- /dev/null
+++ b/meta/classes/vex.bbclass
@@ -0,0 +1,327 @@
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
+    from oe.cve_check import get_patched_cves, decode_cve_status
+
+    cves_status = []
+    products = d.getVar("CVE_PRODUCT").split()
+    for product in products:
+        if ":" in product:
+            _, product = product.split(":", 1)
+        cves_status.append([product, False])
+
+    patched_cves = get_patched_cves(d)
+    cve_data = {}
+    for cve_id in (d.getVarFlags("CVE_STATUS") or {}):
+        mapping, detail, description = decode_cve_status(d, cve_id)
+        if not mapping or not detail:
+            bb.warn(f"Skipping {cve_id} — missing or unknown CVE status")
+            continue
+        cve_data[cve_id] = {
+            "abbrev-status": mapping,
+            "status": detail,
+            "justification": description
+        }
+        patched_cves.discard(cve_id)
+
+    # decode_cve_status is decoding CVE_STATUS, so patch files need to be hardcoded
+    for cve_id in patched_cves:
+        # fix-file-included is not available in scarthgap
+        cve_data[cve_id] = {
+            "abbrev-status": "Patched",
+            "status": "backported-patch",
+        }
+
+    cve_write_data_json(d, cve_data, cves_status)
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


