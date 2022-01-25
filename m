Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C63C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 09:59:29 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.5224.1643104767734406419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 01:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nXQzDrqF;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: rybczynska@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id u18so47381339edt.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 01:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Wf8yD2IPzwdr/ZA1/+NF/hnQ2Mso5znqOtn7j5nano=;
        b=nXQzDrqFlmAdyR1szlEY5RIY9MpdJ0dZwAftVQkMxxKbKcVRiyDxLl348sD0bIWgqp
         fme00QGskekEPd9lG0WP70xdgcynl8FFARU5aAym7aEwc2FfjQ3UAP70yCLM14n9Ujzo
         /PJD5X3u3P+DutZEC8SpkW85Ku7jPEhkKDLeMRQZoTZR6Wu7ZkClXsWz6OumztydiJT7
         wZD/r6uTQXcNNHnolZhCjcTPocuO4SnAIG0LdBwvQb6vw3HQENm5nvVaOi6FwymbMmsN
         kx6kbwDJ34NhRHYCllj9rOIdkK6/WQJn5rx4RBrJpf91QrFZBlwmut+LJ+PggveG14Oh
         37wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Wf8yD2IPzwdr/ZA1/+NF/hnQ2Mso5znqOtn7j5nano=;
        b=d6RYWRuuS7CYx9yLwecw3FZ7e8DrrS7LUmpy1b/p/Xerwrx/4AoXgipM7zLl2BRf8t
         oL0vzeH5exiERGJuscLhL/J/Ay+PoKHgPfbkPSsmXUvIUDWHGsXJ6DBfyby0WanasXtE
         jxwUkxvNuLaozJWGKuwMEVIyZ397kwuVJ0aWlxasl93Z+sb0gc1mGVln60eU6tYxsOaO
         iZf8WIKGK6bvv/gWdm/2HibuPVWGdyoh51/ZCpzskdfKOlnNhnFUj7Q71UlP0TJrXUkE
         GeO7TXMi7DU9FFJWtUVlgvTqTlxq/+2MlH0v4j4M9Bg47TeOZNV+v6vNj34BmKR6NEMD
         0y4w==
X-Gm-Message-State: AOAM533IkWjlLKHd2GOjn9ZQwIDzzqae256+LKJyqXcBKH7RzJL/TaJF
	jvGetfOL6jxB/PEsmbUzWseeEl3ufcI=
X-Google-Smtp-Source: 
 ABdhPJxprddbFN9uWIaTNO3/Q1PfPDEF/7EkjEnmcXFEOlIt4kZA8mKJ5KVSXHt1EuLHpJ3lAxF/wQ==
X-Received: by 2002:a05:6402:27ce:: with SMTP id
 c14mr1876446ede.415.1643104765967;
        Tue, 25 Jan 2022 01:59:25 -0800 (PST)
Received: from localhost.localdomain ([80.215.138.130])
        by smtp.gmail.com with ESMTPSA id
 zm17sm4400198ejb.213.2022.01.25.01.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 01:59:25 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH] cve-check: add json format
Date: Tue, 25 Jan 2022 10:59:22 +0100
Message-Id: <20220125095922.70163-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 09:59:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160914

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
 meta/classes/cve-check.bbclass | 155 ++++++++++++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6c04ff9f09..4900797fb9 100644
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
 # Whitelist for packages (PN)
 CVE_CHECK_PN_WHITELIST ?= ""
 
@@ -120,6 +132,7 @@ python cve_check_cleanup () {
     Delete the file used to gather all the CVE information.
     """
     bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
+    bb.utils.remove(e.data.getVar("CVE_CHECK_SUMMARY_INDEX_PATH"))
 }
 
 addhandler cve_check_cleanup
@@ -136,6 +149,9 @@ python cve_check_write_rootfs_manifest () {
         deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
         if os.path.exists(deploy_file):
             bb.utils.remove(deploy_file)
+        deploy_file_json = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+        if os.path.exists(deploy_file_json):
+            bb.utils.remove(deploy_file_json)
 
     if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
         bb.note("Writing rootfs CVE manifest")
@@ -153,6 +169,35 @@ python cve_check_write_rootfs_manifest () {
                 os.remove(manifest_link)
             os.symlink(os.path.basename(manifest_name), manifest_link)
             bb.plain("Image CVE report stored in: %s" % manifest_name)
+
+    if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
+        import json
+        from jsonmerge import Merger
+        schema = {
+            "properties": {
+                "package": {
+                     "mergeStrategy": "append"
+                 }
+             }
+        }
+        merger = Merger(schema)
+        bb.note("Generating JSON CVE manifest")
+        deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
+        link_name = d.getVar("IMAGE_LINK_NAME")
+        manifest_name = d.getVar("CVE_CHECK_MANIFEST_JSON")
+        index_file = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
+        manifest = {}
+        with open(index_file) as f:
+            filename = f.readline()
+            while filename:
+                with open(filename.rstrip()) as j:
+                    data = json.load(j)
+                    manifest = merger.merge(manifest, data)
+                filename = f.readline()
+
+        with open(manifest_name, "w") as f:
+            json.dump(manifest, f, indent=2)
+        bb.plain("Image CVE report stored in: %s" % manifest_name)
 }
 
 ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
@@ -278,10 +323,10 @@ def get_cve_info(d, cves):
     conn.close()
     return cve_data
 
-def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
+def cve_write_data_text(d, patched, unpatched, whitelisted, cve_data):
     """
-    Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
-    CVE manifest if enabled.
+    Write CVE information in the text format: to WORKDIR; and to
+    CVE_CHECK_DIR, and CVE manifest if enabled.
     """
 
 
@@ -344,3 +389,107 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
 
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
+def cve_write_data_json(d, patched, unpatched, whitelisted, cve_data):
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
+
+        if cve in whitelisted:
+            status = "Skipped"
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
+def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
+    """
+    Write CVE data in each enabled format.
+    """
+
+    if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
+        cve_write_data_text(d, patched, unpatched, whitelisted, cve_data)
+    if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
+        cve_write_data_json(d, patched, unpatched, whitelisted, cve_data)
-- 
2.33.0


