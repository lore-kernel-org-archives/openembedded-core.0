Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29771C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 12:54:51 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.6208.1648558489558604874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 05:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jtB/gJei;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id n35so10226025wms.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 05:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PswbeqIo2HBgHkBsAUHZeX0pV2yCTuITd+BWZE++xMY=;
        b=jtB/gJeiJQqaYje577hssFvyDc4TEVPXeav3BquhmqvHJtZCnRyqnE2ESfAXXznltR
         I4hNd0KIpkD6m7WAQdfh70uFeizZrNdW6BIdH2iD/TmZgOiRJgYlWIS0LS9KXdVLdo8T
         YDJUurxliS0se0t6zzuRJ88ZWqLZI7WOq6st/Ko/pI933qfuWQQLlXKzMnNElQlfEacq
         F5EmjRf/DMBzHzyQgQGQfSmFJZpOHCFkTfeh2twuJ8jihsZkHux4MPHViGqnHIr5T4Pk
         Rfoyh/c/QenNAzidWQJe3Vl+1EEGRdBQPpE+Bg3ZYEBWlagSfnJO/+qlMuTvwfK8RNM7
         Os4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PswbeqIo2HBgHkBsAUHZeX0pV2yCTuITd+BWZE++xMY=;
        b=SNhEr19v5mnLeQL/jAaMM/pb54kuDQcw4T9OVHRCR0f99XU3c9OrqPwY8aTtDYWIui
         oxR6fIcr2x9ES6udp4O8ovr50A4nAIh3b2D6nb8DhAIUzUyBak258GmUam5PAXbSGnDh
         Vc1E9jrs397cvywbRA14Y+1HpzHvKHrJQDCsJ+k+cpyN8/9CHbNS8n1SwtEuDLPygPms
         y9pDm2t/hXFlTCqXYCeiRNoYJnjvRheVOHUItmJ65gnMSbgn303mqGfQPr4SNZPomdS1
         FumX9IMgZY6J+rPKObDm6E3LA8kQsT4kZOuIrSwYV8zZX6TyMkM3gj4V0B/y2wB/FmGw
         fT1Q==
X-Gm-Message-State: AOAM530/hCsQezgnOOwIxZ/oKpHM+LvWCaM8EcWyBvRZOGBfEzRNfphx
	T/OxZ3D2WtVERucS5KCVupmYHX4t4Cg=
X-Google-Smtp-Source: 
 ABdhPJy8pd/PUpSpiBoJfEshN8xZq3rMNE/PFr9lhLkGqvhKM0LghVqu01+JeuauK7uu395Tei54jw==
X-Received: by 2002:a05:600c:154d:b0:38c:e9b8:d13f with SMTP id
 f13-20020a05600c154d00b0038ce9b8d13fmr6726155wmg.183.1648558487258;
        Tue, 29 Mar 2022 05:54:47 -0700 (PDT)
Received: from localhost.localdomain ([80.215.138.119])
        by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b00380deeaae72sm2361165wmb.1.2022.03.29.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 05:54:46 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross@burtonini.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [OE-core][PATCH v3 1/2] cve-check: add json format
Date: Tue, 29 Mar 2022 14:54:31 +0200
Message-Id: <20220329125432.78608-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 12:54:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163745

Add an option to output the CVE check in a JSON-based format.
This format is easier to parse in software than the original
text-based one and allows post-processing by other tools.

Output formats are now handed by CVE_CHECK_FORMAT_TEXT and
CVE_CHECK_FORMAT_JSON. Both of them are enabled by default.

The JSON output format gets generated in a similar way to the
text format with the exception of the manifest: appending to
JSON arrays requires parsing the file. Because of that we
first write JSON fragments and then assemble them in one pass
at the end.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>

---
Changes in v3:
- fix CVE_CHECK_REPORT_PATCHED==0 with the YAML output

Changes in v2:
- hardcoded the dictionary merge (cve_check_merge_jsons)
---
 meta/classes/cve-check.bbclass | 144 ++++++++++++++++++++++++++++++++-
 meta/lib/oe/cve_check.py       |  16 ++++
 2 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index dfad10c22b..f574f5daa4 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -34,15 +34,27 @@ CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
 CVE_CHECK_SUMMARY_DIR ?= "${LOG_DIR}/cve"
 CVE_CHECK_SUMMARY_FILE_NAME ?= "cve-summary"
 CVE_CHECK_SUMMARY_FILE ?= "${CVE_CHECK_SUMMARY_DIR}/${CVE_CHECK_SUMMARY_FILE_NAME}"
+CVE_CHECK_SUMMARY_FILE_NAME_JSON = "cve-summary.json"
+CVE_CHECK_SUMMARY_INDEX_PATH = "${CVE_CHECK_SUMMARY_DIR}/cve-summary-index.txt"
+
+CVE_CHECK_LOG_JSON ?= "${T}/cve.json"
 
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
+CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
 CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
+CVE_CHECK_MANIFEST_JSON ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.json"
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
 CVE_CHECK_REPORT_PATCHED ??= "1"
 
+# Provide text output
+CVE_CHECK_FORMAT_TEXT ??= "1"
+
+# Provide JSON output
+CVE_CHECK_FORMAT_JSON ??= "1"
+
 # Skip CVE Check for packages (PN)
 CVE_CHECK_SKIP_RECIPE ?= ""
 
@@ -120,6 +132,7 @@ python cve_check_cleanup () {
     Delete the file used to gather all the CVE information.
     """
     bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
+    bb.utils.remove(e.data.getVar("CVE_CHECK_SUMMARY_INDEX_PATH"))
 }
 
 addhandler cve_check_cleanup
@@ -131,11 +144,15 @@ python cve_check_write_rootfs_manifest () {
     """
 
     import shutil
+    from oe.cve_check import cve_check_merge_jsons
 
     if d.getVar("CVE_CHECK_COPY_FILES") == "1":
         deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
         if os.path.exists(deploy_file):
             bb.utils.remove(deploy_file)
+        deploy_file_json = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+        if os.path.exists(deploy_file_json):
+            bb.utils.remove(deploy_file_json)
 
     if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
         bb.note("Writing rootfs CVE manifest")
@@ -154,6 +171,26 @@ python cve_check_write_rootfs_manifest () {
                 os.remove(manifest_link)
             os.symlink(os.path.basename(manifest_name), manifest_link)
             bb.plain("Image CVE report stored in: %s" % manifest_name)
+
+    if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
+        import json
+        bb.note("Generating JSON CVE manifest")
+        deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
+        link_name = d.getVar("IMAGE_LINK_NAME")
+        manifest_name = d.getVar("CVE_CHECK_MANIFEST_JSON")
+        index_file = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
+        manifest = {"version":"1", "package": []}
+        with open(index_file) as f:
+            filename = f.readline()
+            while filename:
+                with open(filename.rstrip()) as j:
+                    data = json.load(j)
+                    cve_check_merge_jsons(manifest, data)
+                filename = f.readline()
+
+        with open(manifest_name, "w") as f:
+            json.dump(manifest, f, indent=2)
+        bb.plain("Image CVE report stored in: %s" % manifest_name)
 }
 
 ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
@@ -280,7 +317,7 @@ def get_cve_info(d, cves):
     conn.close()
     return cve_data
 
-def cve_write_data(d, patched, unpatched, ignored, cve_data):
+def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
     """
     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
     CVE manifest if enabled.
@@ -346,3 +383,108 @@ def cve_write_data(d, patched, unpatched, ignored, cve_data):
 
             with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
                 f.write("%s" % write_string)
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
+def cve_write_data_json(d, patched, unpatched, ignored, cve_data):
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
+    unpatched_cves = []
+
+    package_version = "%s%s" % (d.getVar("EXTENDPE"), d.getVar("PV"))
+    package_data = {
+        "name" : d.getVar("PN"),
+        "layer" : layer,
+        "version" : package_version
+    }
+    cve_list = []
+
+    for cve in sorted(cve_data):
+        is_patched = cve in patched
+        status = "Unpatched"
+        if is_patched and (d.getVar("CVE_CHECK_REPORT_PATCHED") != "1"):
+            continue
+        if cve in ignored:
+            status = "Ignored"
+        elif is_patched:
+            status = "Patched"
+        else:
+            # default value of status is Unpatched
+            unpatched_cves.append(cve)
+
+        issue_link = "%s%s" % (nvd_link, cve)
+
+        cve_item = {
+            "id" : cve,
+            "summary" : cve_data[cve]["summary"],
+            "scorev2" : cve_data[cve]["scorev2"],
+            "scorev3" : cve_data[cve]["scorev3"],
+            "vector" : cve_data[cve]["vector"],
+            "status" : status,
+            "link": issue_link
+        }
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
+
+def cve_write_data(d, patched, unpatched, ignored, cve_data):
+    """
+    Write CVE data in each enabled format.
+    """
+
+    if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
+        cve_write_data_text(d, patched, unpatched, ignored, cve_data)
+    if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
+        cve_write_data_json(d, patched, unpatched, ignored, cve_data)
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 0302beeb4a..e445b7a6ae 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -146,3 +146,19 @@ def get_cpe_ids(cve_product, version):
         cpe_ids.append(cpe_id)
 
     return cpe_ids
+
+def cve_check_merge_jsons(output, data):
+    """
+    Merge the data in the "package" property to the main data file
+    output
+    """
+    if output["version"] != data["version"]:
+        bb.error("Version mismatch when merging JSON outputs")
+        return
+
+    for product in output["package"]:
+        if product["name"] == data["package"][0]["name"]:
+            bb.error("Error adding the same package twice")
+            return
+
+    output["package"].append(data["package"][0])
-- 
2.33.0


