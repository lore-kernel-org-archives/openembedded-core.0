Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E022C4332F
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 21:47:21 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.2946.1651182441011175862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=E2ISupu1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso5608038pjj.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bkMeNNHEJRCOix41sp3liAyAArRWXnPUDUE/v+1u8gw=;
        b=E2ISupu1ZddNUO8b3QbWo7IiSBDBpfuuruKlN78Q8NiMcbapLFLlGXSCoU82sDBxoQ
         bawEvniXOhrPtw80s6fqJzzXaNa+3jCG1buMyC1zXPn/InLfreiudhMbKHUF9lEMXnbe
         iWpvf3xowNc9whcqM0VFPdL6v7Oe2qIhjZQSBDg4BrOnvPwoq2TixZ8fxNPQPH8eQjc0
         wO9l7K/NJpVE1IvSSdrzA88mwz4J9gX+mtsm5DwdUstqU0ZTC7UrJTmENcVqTcmjFUaT
         EVqSqNlmKFmFMBP3db3nPnYep6X/JWYElZk5lNUNJ9dz+607Kmf68IFNnzjXfz257LXa
         NHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bkMeNNHEJRCOix41sp3liAyAArRWXnPUDUE/v+1u8gw=;
        b=3DMdgOnrXrz/0vjf6O3QyACcs43947SJ3yvNx2q+F8zCZL1MRnFc2GmpD5XjilDxqp
         LCPdp/0zswscuoWLzeTwYORcC5568gqErN7qHeFz+JyaxC7K7wWEToHqdvIsEmnpC2jy
         oh9sTdk3TyC7r3ZJmsoI1Ec4boBF5Xxdy/MpfY4lhXiDQyGgtXKTEvBKREHOk7mLUPP4
         pqksXE8xe8TWB0rcwHciySM+6o/NDG8kyMsxE8nzNIHpP/QvTtBOO00d1DMF3ivfXGde
         pHKzHLuFixvwPLhnIaUOWLnFlRz7rbqpHigMrwUKA4n0YRRJw/YTCWokGxfa8ElP8b6B
         26kA==
X-Gm-Message-State: AOAM533yxiHwilXze/36OfT0JGOD3hMiYR69URVX37eEIDgLq8keqpXg
	RjM7XR/Fh5q9nsCUI4fGiYZZR4jXCyAF2B4tyqI=
X-Google-Smtp-Source: 
 ABdhPJwu1UEfZmBdvvcnckUqM0jkIpozAW9mJ+8dkEe3D5zuZvKT+m2XBDxcYCkqhdPQX+5EiG/QUQ==
X-Received: by 2002:a17:90b:3805:b0:1db:c60d:59ed with SMTP id
 mq5-20020a17090b380500b001dbc60d59edmr324362pjb.97.1651182439929;
        Thu, 28 Apr 2022 14:47:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 c138-20020a624e90000000b005081f92826dsm749742pfb.99.2022.04.28.14.47.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:47:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/6] cve-check: add json format
Date: Thu, 28 Apr 2022 11:46:34 -1000
Message-Id: 
 <92b6011ab25fd36e2f8900a4db6883cdebc3cd3d.1651182153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651182153.git.steve@sakoman.com>
References: <cover.1651182153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 21:47:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164982

From: Marta Rybczynska <rybczynska@gmail.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


