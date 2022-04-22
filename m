Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F186C54F65
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.9257.1650637076501667191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 07:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=krT94bxN;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id bg25so4478359wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 07:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wDq6EpmXNJPeHA/qCi3yjA3s8VUtK50DDGxjXzv4YGo=;
        b=krT94bxNGV7ap2YeIaHYZqfbKckpbikjRNr1ulqlIRwrxgdAgK4aTGzC/2VaoaX/9p
         tdfzjTvVV8EzmnF4sor3qemJQByW69iiqFG0S/UaNu8BAustpLGS3XQAqFIksS9l7dQK
         YbgJSNNG+JwdoJuKaCAnu3ktBlCHJ4dmDv0V1KLWnUHB6vP4UWQhBH4o+Cq3qne8I+8I
         4oQQkkC/81ivq2pbQs5EJkvEIur4qbUUTU8iLM4mL/TX6I0TOiKvSnnGpLiF7sTF3fNI
         19Y955Yr9z9pMWw4TwHlpt6cKt2H/3D7bg1S80vg73F8e0AhGYyd3ox0slLNIZLkutxS
         /IQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wDq6EpmXNJPeHA/qCi3yjA3s8VUtK50DDGxjXzv4YGo=;
        b=GkASjnnjrQxPfV9IjwM1A4oLYXiBlhQBJCvFkWzr5+tJ/u3t5LZMJshwWxyXunaE6f
         5Q3ksfs3+5f23lxhAA/Cmx3VeA8vJoGN7PKDcE2WjemqOVtv0J3fWwbT65tVKScPIp15
         26a5q8pOGIz/Wl6PiOOQ4u0rhSiJ1aTV5NrKPA24Jej1bUs2S+DtYiHexCjZNgiZDNbo
         rUyc8OJhzhrQghYpjJabSN6NjzrWhClhlhH4h7MyZAlnYKMd3FlS3/eynlLUh5ZVwp/7
         uewra5DZ0Yl8F2knElaHi+8X5OVASzjNgRvMy7TXpNkPhN9/ERJAyhC4MN+snVIPwOJh
         HFwQ==
X-Gm-Message-State: AOAM530sWciWbRC0GG/0pkSrwbfAu/vglmKf7Lnz8JOZOZLUzurSAw66
	/g1cUYbKu11ug51NAe4m8EcDRa3iF1M=
X-Google-Smtp-Source: 
 ABdhPJzU1XDodehCxCNlze5RfTqSGrllaPQ+m4FEiYbzvoRB2EqD/gxHaFqJE6XK8XW7OBIULH4JHg==
X-Received: by 2002:a7b:ce99:0:b0:38e:b72a:382c with SMTP id
 q25-20020a7bce99000000b0038eb72a382cmr13745224wmj.128.1650637074520;
        Fri, 22 Apr 2022 07:17:54 -0700 (PDT)
Received: from localhost.localdomain ([80.215.234.219])
        by smtp.gmail.com with ESMTPSA id
 p26-20020adf959a000000b0020aca418f14sm1798317wrp.54.2022.04.22.07.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 07:17:53 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [OE-core][dunfell][RFC PATCH v2] cve-check: add json format
Date: Fri, 22 Apr 2022 16:17:50 +0200
Message-Id: <20220422141750.1428019-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164793

Backport to dunfell from master df567de36ae5964bee433ebb97e8bf702034994a

Add an option to output the CVE check in a JSON-based format.
This format is easier to parse in software than the original
text-based one and allows post-processing by other tools.

Output formats are now handed by CVE_CHECK_FORMAT_TEXT and
CVE_CHECK_FORMAT_JSON. The text format is enabled by default
to maintain compatibility, while the JSON format is disabled
by default.

The JSON output format gets generated in a similar way to the
text format with the exception of the manifest: appending to
JSON arrays requires parsing the file. Because of that we
first write JSON fragments and then assemble them in one pass
at the end.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/classes/cve-check.bbclass | 144 ++++++++++++++++++++++++++++++++-
 meta/lib/oe/cve_check.py       |  16 ++++
 2 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 75c5b92b96..a7156cbdfb 100644
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
+# Provide JSON output - disabled by default for backward compatibility
+CVE_CHECK_FORMAT_JSON ??= "0"
+
 # Whitelist for packages (PN)
 CVE_CHECK_PN_WHITELIST ?= ""
 
@@ -118,6 +130,7 @@ python cve_check_cleanup () {
     Delete the file used to gather all the CVE information.
     """
     bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
+    bb.utils.remove(e.data.getVar("CVE_CHECK_SUMMARY_INDEX_PATH"))
 }
 
 addhandler cve_check_cleanup
@@ -129,11 +142,15 @@ python cve_check_write_rootfs_manifest () {
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
@@ -152,6 +169,26 @@ python cve_check_write_rootfs_manifest () {
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
 
 ROOTFS_POSTPROCESS_COMMAND_prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
@@ -337,7 +374,7 @@ def get_cve_info(d, cves):
     conn.close()
     return cve_data
 
-def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
+def cve_write_data_text(d, patched, unpatched, whitelisted, cve_data):
     """
     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
     CVE manifest if enabled.
@@ -403,3 +440,108 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
 
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
index a1d7c292af..1d3c775bbe 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -63,3 +63,19 @@ def _cmpkey(release, patch_l, pre_l, pre_v):
     else:
         _pre = float(pre_v) if pre_v else float('-inf')
     return _release, _patch, _pre
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


