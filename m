Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A18C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 04:09:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.38907.1723435777356984314
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 21:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dyOFlfn1;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-429cfd469cbso7049045e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 21:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723435775; x=1724040575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8RtOd/pWAwkB86w1uPA3cSfshp4MJ5pl5hWlknMepc=;
        b=dyOFlfn1DW3VIAmi8H8XDeHj59uzA0QU9FdYX4ANlRTvstYQ9YUi356FgliDWJ+CuR
         vFFVs57eANyIM6qFXo41UVpOL3AE2qQiaw6FQJgu3YNcIOTjGV2xQ5jwPNUE0As+ylRx
         7jQViRYG4Hw9LHdurlHSyIR6BYJik7fDFmQVHtiCEFXrhVy02k/ixoE/8yq9ZCYWEPaC
         42f4wltpy0i13L5x1FwMGf3QEzL1plt9Ip+Lz1NlkU8XiJggzkJvcaihnwRuec2qGJiI
         WfgI2gerxJcmWuJlCTGzn7tzQ+xRqM6j+VSQdC7aquGCSGHhQNEgO99bZTMQ9NK8sKGr
         md1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723435775; x=1724040575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8RtOd/pWAwkB86w1uPA3cSfshp4MJ5pl5hWlknMepc=;
        b=TY6VwvAdW2IL3dKnBZQj1D82rN2v3ZRv+4DTOuMqSJecnPK2U4Kyx06rLVyaUJs1M9
         SFOn3WaW/jFj7cycqI7qeZN4nNvVG0YMpNyBcNOzZR3G0ciExpwqsHihEAnMSe7cSgGP
         3hwzILBEGHBJYboIDApamydEkbVYfwjqBRCfKTmDrqfd0rXC9/fG7rtnf4nWgRngjVS+
         c8c2JrsAwHMdn0HbwAmBb6bkD7uTED8EJtd7mo2X5mppjf2EXaZKXGnnkIqY7n7ioTi1
         rscm7vwldWcObh8EkI6PzVIX6xxmaPy/FwEHzlnnV8rMUUJqedEL0CCtkzIVY+acqdxU
         DHHg==
X-Gm-Message-State: AOJu0YzuDz4sb31NrDE7ZrdgDOTvpLwOWEiNsRP6YpIy+6AE+QMqHPGt
	fJPS0xeOgbke2i4unpDMNF1UdDDczC7dnHUpv5K1ahm9BkHEy6SrfmQVZA==
X-Google-Smtp-Source: AGHT+IEIhid3s22zmGxH+BpWszDxepTwYy+UYiXXQyVsLAca3Rw95eKxKROT3ROdW1J/MRj2qVyfvA==
X-Received: by 2002:a05:600c:3799:b0:426:59d3:8cae with SMTP id 5b1f17b1804b1-429ccacdf39mr33455745e9.13.1723435774740;
        Sun, 11 Aug 2024 21:09:34 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:76:4400:56c3:4c21:1a48:89b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c7bc8c3sm174144655e9.47.2024.08.11.21.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 21:09:34 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH v4][OE-core 3/6] cve-check: annotate CVEs during analysis
Date: Mon, 12 Aug 2024 06:09:08 +0200
Message-ID: <20240812040911.13096-3-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812040911.13096-1-marta.rybczynska@syslinbit.com>
References: <20240812040911.13096-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 04:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203196

Add status information for each CVE under analysis.

Previously the information passed between different function of the
cve-check class included only tables of patched, unpatched, ignored
vulnerabilities and the general status of the recipe.

The VEX work requires more information, and we need to pass them
between different functions, so that it can be enriched as the
analysis progresses. Instead of multiple tables, use a single one
with annotations for each CVE encountered. For example, a patched
CVE will have:

{"abbrev-status": "Patched", "status": "version-not-in-range"}

abbrev-status contains the general status (Patched, Unpatched,
Ignored and Unknown that will be added in the VEX code)
status contains more detailed information that can come from
CVE_STATUS and the analysis.

Additional fields of the annotation include for example the name
of the patch file fixing a given CVE.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 meta/classes/cve-check.bbclass | 208 +++++++++++++++++----------------
 meta/lib/oe/cve_check.py       |  31 ++++-
 2 files changed, 135 insertions(+), 104 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index bc35a1c53c..0d7c8a5835 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -189,10 +189,10 @@ python do_cve_check () {
                 patched_cves = get_patched_cves(d)
             except FileNotFoundError:
                 bb.fatal("Failure in searching patches")
-            ignored, patched, unpatched, status = check_cves(d, patched_cves)
-            if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
-                cve_data = get_cve_info(d, patched + unpatched + ignored)
-                cve_write_data(d, patched, unpatched, ignored, cve_data, status)
+            cve_data, status = check_cves(d, patched_cves)
+            if len(cve_data) or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
+                get_cve_info(d, cve_data)
+                cve_write_data(d, cve_data, status)
         else:
             bb.note("No CVE database found, skipping CVE check")
 
@@ -295,7 +295,51 @@ ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest ' if d
 do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 do_populate_sdk[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
 
-def check_cves(d, patched_cves):
+def cve_is_ignored(d, cve_data, cve):
+    if cve not in cve_data:
+        return False
+    if cve_data[cve]['abbrev-status'] == "Ignored":
+        return True
+    return False
+
+def cve_is_patched(d, cve_data, cve):
+    if cve not in cve_data:
+        return False
+    if cve_data[cve]['abbrev-status'] == "Patched":
+        return True
+    return False
+
+def cve_update(d, cve_data, cve, entry):
+    # If no entry, just add it
+    if cve not in cve_data:
+        cve_data[cve] = entry
+        return
+    # If we are updating, there might be change in the status
+    bb.debug("Trying CVE entry update for %s from %s to %s" % (cve, cve_data[cve]['abbrev-status'], entry['abbrev-status']))
+    if cve_data[cve]['abbrev-status'] == "Unknown":
+        cve_data[cve] = entry
+        return
+    if cve_data[cve]['abbrev-status'] == entry['abbrev-status']:
+        return
+    # Update like in {'abbrev-status': 'Patched', 'status': 'version-not-in-range'} to {'abbrev-status': 'Unpatched', 'status': 'version-in-range'}
+    if entry['abbrev-status'] == "Unpatched" and cve_data[cve]['abbrev-status'] == "Patched":
+        if entry['status'] == "version-in-range" and cve_data[cve]['status'] == "version-not-in-range":
+            # New result from the scan, vulnerable
+            cve_data[cve] = entry
+            bb.debug("CVE entry %s update from Patched to Unpatched from the scan result" % cve)
+            return
+    if entry['abbrev-status'] == "Patched" and cve_data[cve]['abbrev-status'] == "Unpatched":
+        if entry['status'] == "version-not-in-range" and cve_data[cve]['status'] == "version-in-range":
+            # Range does not match the scan, but we already have a vulnerable match, ignore
+            bb.debug("CVE entry %s update from Patched to Unpatched from the scan result - not applying" % cve)
+            return
+    # If we have an "Ignored", it has a priority
+    if cve_data[cve]['abbrev-status'] == "Ignored":
+        bb.debug("CVE %s not updating because Ignored" % cve)
+        return
+    bb.warn("Unhandled CVE entry update for %s from %s to %s" % (cve, cve_data[cve], entry))
+
+def check_cves(d, cve_data):
     """
     Connect to the NVD database and find unpatched cves.
     """
@@ -305,28 +349,19 @@ def check_cves(d, patched_cves):
     real_pv = d.getVar("PV")
     suffix = d.getVar("CVE_VERSION_SUFFIX")
 
-    cves_unpatched = []
-    cves_ignored = []
     cves_status = []
     cves_in_recipe = False
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
     products = d.getVar("CVE_PRODUCT").split()
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
     if not products:
-        return ([], [], [], [])
+        return ([], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
     # If the recipe has been skipped/ignored we return empty lists
     if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
         bb.note("Recipe has been skipped by cve-check")
-        return ([], [], [], [])
-
-    # Convert CVE_STATUS into ignored CVEs and check validity
-    cve_ignore = []
-    for cve in (d.getVarFlags("CVE_STATUS") or {}):
-        decoded_status = decode_cve_status(d, cve)
-        if 'mapping' in decoded_status and decoded_status['mapping'] == "Ignored":
-            cve_ignore.append(cve)
+        return ([], [])
 
     import sqlite3
     db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
@@ -345,11 +380,10 @@ def check_cves(d, patched_cves):
         for cverow in cve_cursor:
             cve = cverow[0]
 
-            if cve in cve_ignore:
+            if cve_is_ignored(d, cve_data, cve):
                 bb.note("%s-%s ignores %s" % (product, pv, cve))
-                cves_ignored.append(cve)
                 continue
-            elif cve in patched_cves:
+            elif cve_is_patched(d, cve_data, cve):
                 bb.note("%s has been patched" % (cve))
                 continue
             # Write status once only for each product
@@ -365,7 +399,7 @@ def check_cves(d, patched_cves):
             for row in product_cursor:
                 (_, _, _, version_start, operator_start, version_end, operator_end) = row
                 #bb.debug(2, "Evaluating row " + str(row))
-                if cve in cve_ignore:
+                if cve_is_ignored(d, cve_data, cve):
                     ignored = True
 
                 version_start = convert_cve_version(version_start)
@@ -404,16 +438,16 @@ def check_cves(d, patched_cves):
                 if vulnerable:
                     if ignored:
                         bb.note("%s is ignored in %s-%s" % (cve, pn, real_pv))
-                        cves_ignored.append(cve)
+                        cve_update(d, cve_data, cve, {"abbrev-status": "Ignored"})
                     else:
                         bb.note("%s-%s is vulnerable to %s" % (pn, real_pv, cve))
-                        cves_unpatched.append(cve)
+                        cve_update(d, cve_data, cve, {"abbrev-status": "Unpatched", "status": "version-in-range"})
                     break
             product_cursor.close()
 
             if not vulnerable:
                 bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, cve))
-                patched_cves.add(cve)
+                cve_update(d, cve_data, cve, {"abbrev-status": "Patched", "status": "version-not-in-range"})
         cve_cursor.close()
 
         if not cves_in_product:
@@ -421,48 +455,45 @@ def check_cves(d, patched_cves):
             cves_status.append([product, False])
 
     conn.close()
-    diff_ignore = list(set(cve_ignore) - set(cves_ignored))
-    if diff_ignore:
-        oe.qa.handle_error("cve_status_not_in_db", "Found CVE (%s) with CVE_STATUS set that are not found in database for this component" % " ".join(diff_ignore), d)
 
     if not cves_in_recipe:
         bb.note("No CVE records for products in recipe %s" % (pn))
 
-    return (list(cves_ignored), list(patched_cves), cves_unpatched, cves_status)
+    return (cve_data, cves_status)
 
-def get_cve_info(d, cves):
+def get_cve_info(d, cve_data):
     """
     Get CVE information from the database.
     """
 
     import sqlite3
 
-    cve_data = {}
     db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
     conn = sqlite3.connect(db_file, uri=True)
 
-    for cve in cves:
+    for cve in cve_data:
         cursor = conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,))
         for row in cursor:
-            cve_data[row[0]] = {}
-            cve_data[row[0]]["summary"] = row[1]
-            cve_data[row[0]]["scorev2"] = row[2]
-            cve_data[row[0]]["scorev3"] = row[3]
-            cve_data[row[0]]["modified"] = row[4]
-            cve_data[row[0]]["vector"] = row[5]
-            cve_data[row[0]]["vectorString"] = row[6]
+            # The CVE itdelf has been added already
+            if row[0] not in cve_data:
+                bb.note("CVE record %s not present" % row[0])
+                continue
+            #cve_data[row[0]] = {}
+            cve_data[row[0]]["NVD-summary"] = row[1]
+            cve_data[row[0]]["NVD-scorev2"] = row[2]
+            cve_data[row[0]]["NVD-scorev3"] = row[3]
+            cve_data[row[0]]["NVD-modified"] = row[4]
+            cve_data[row[0]]["NVD-vector"] = row[5]
+            cve_data[row[0]]["NVD-vectorString"] = row[6]
         cursor.close()
     conn.close()
-    return cve_data
 
-def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
+def cve_write_data_text(d, cve_data):
     """
     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
     CVE manifest if enabled.
     """
 
-    from oe.cve_check import decode_cve_status
-
     cve_file = d.getVar("CVE_CHECK_LOG")
     fdir_name  = d.getVar("FILE_DIRNAME")
     layer = fdir_name.split("/")[-3]
@@ -479,7 +510,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         return
 
     # Early exit, the text format does not report packages without CVEs
-    if not patched+unpatched+ignored:
+    if not len(cve_data):
         return
 
     nvd_link = "https://nvd.nist.gov/vuln/detail/"
@@ -488,36 +519,29 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
     bb.utils.mkdirhier(os.path.dirname(cve_file))
 
     for cve in sorted(cve_data):
-        is_patched = cve in patched
-        is_ignored = cve in ignored
-
-        status = "Unpatched"
-        if (is_patched or is_ignored) and not report_all:
+        if not report_all and (cve_data[cve]["abbrev-status"] == "Patched" or cve_data[cve]["abbrev-status"] == "Ignored"):
             continue
-        if is_ignored:
-            status = "Ignored"
-        elif is_patched:
-            status = "Patched"
-        else:
-            # default value of status is Unpatched
-            unpatched_cves.append(cve)
-
         write_string += "LAYER: %s\n" % layer
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
-        write_string += "CVE STATUS: %s\n" % status
-        status_details = decode_cve_status(d, cve)
-        if 'detail' in status_details:
-            write_string += "CVE DETAIL: %s\n" % status_details['detail']
-        if 'description' in status_details:
-            write_string += "CVE DESCRIPTION: %s\n" % status_details['description']
-        write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
-        write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
-        write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
-        write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
-        write_string += "VECTORSTRING: %s\n" % cve_data[cve]["vectorString"]
+        write_string += "CVE STATUS: %s\n" % cve_data[cve]["abbrev-status"]
+
+        if 'status' in cve_data[cve]:
+            write_string += "CVE DETAIL: %s\n" % cve_data[cve]["status"]
+        if 'justification' in cve_data[cve]:
+            write_string += "CVE DESCRIPTION: %s\n" % cve_data[cve]["justification"]
+
+        if "NVD-summary" in cve_data[cve]:
+            write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["NVD-summary"]
+            write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["NVD-scorev2"]
+            write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["NVD-scorev3"]
+            write_string += "VECTOR: %s\n" % cve_data[cve]["NVD-vector"]
+            write_string += "VECTORSTRING: %s\n" % cve_data[cve]["NVD-vectorString"]
+
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
+        if cve_data[cve]["abbrev-status"] == "Unpatched":
+            unpatched_cves.append(cve)
 
     if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
         bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
@@ -569,13 +593,11 @@ def cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_fi
         with open(index_path, "a+") as f:
             f.write("%s\n" % fragment_path)
 
-def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
+def cve_write_data_json(d, cve_data, cve_status):
     """
     Prepare CVE data for the JSON format, then write it.
     """
 
-    from oe.cve_check import decode_cve_status
-
     output = {"version":"1", "package": []}
     nvd_link = "https://nvd.nist.gov/vuln/detail/"
 
@@ -593,8 +615,6 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
     if include_layers and layer not in include_layers:
         return
 
-    unpatched_cves = []
-
     product_data = []
     for s in cve_status:
         p = {"product": s[0], "cvesInRecord": "Yes"}
@@ -609,39 +629,31 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
         "version" : package_version,
         "products": product_data
     }
+
     cve_list = []
 
     for cve in sorted(cve_data):
-        is_patched = cve in patched
-        is_ignored = cve in ignored
-        status = "Unpatched"
-        if (is_patched or is_ignored) and not report_all:
+        if not report_all and (cve_data[cve]["abbrev-status"] == "Patched" or cve_data[cve]["abbrev-status"] == "Ignored"):
             continue
-        if is_ignored:
-            status = "Ignored"
-        elif is_patched:
-            status = "Patched"
-        else:
-            # default value of status is Unpatched
-            unpatched_cves.append(cve)
-
         issue_link = "%s%s" % (nvd_link, cve)
 
         cve_item = {
             "id" : cve,
-            "summary" : cve_data[cve]["summary"],
-            "scorev2" : cve_data[cve]["scorev2"],
-            "scorev3" : cve_data[cve]["scorev3"],
-            "vector" : cve_data[cve]["vector"],
-            "vectorString" : cve_data[cve]["vectorString"],
-            "status" : status,
-            "link": issue_link
+            "status" : cve_data[cve]["abbrev-status"],
+            "link": issue_link,
         }
-        status_details = decode_cve_status(d, cve)
-        if 'detail' in status_details:
-            cve_item["detail"] = status_details['detail']
-        if 'description' in status_details:
-            cve_item["description"] = status_details['description']
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
         cve_list.append(cve_item)
 
     package_data["issue"] = cve_list
@@ -653,12 +665,12 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
 
     cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file)
 
-def cve_write_data(d, patched, unpatched, ignored, cve_data, status):
+def cve_write_data(d, cve_data, status):
     """
     Write CVE data in each enabled format.
     """
 
     if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
-        cve_write_data_text(d, patched, unpatched, ignored, cve_data)
+        cve_write_data_text(d, cve_data)
     if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
-        cve_write_data_json(d, patched, unpatched, ignored, cve_data, status)
+        cve_write_data_json(d, cve_data, status)
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 26dfdc1a54..a05bd29b1f 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -88,7 +88,7 @@ def get_patched_cves(d):
     # (cve_match regular expression)
     cve_file_name_match = re.compile(r".*(CVE-\d{4}-\d+)", re.IGNORECASE)
 
-    patched_cves = set()
+    patched_cves = {}
     patches = oe.patch.src_patches(d)
     bb.debug(2, "Scanning %d patches for CVEs" % len(patches))
     for url in patches:
@@ -98,7 +98,7 @@ def get_patched_cves(d):
         fname_match = cve_file_name_match.search(patch_file)
         if fname_match:
             cve = fname_match.group(1).upper()
-            patched_cves.add(cve)
+            patched_cves[cve] = {"abbrev-status": "Patched", "status": "fix-file-included", "resource": patch_file}
             bb.debug(2, "Found %s from patch file name %s" % (cve, patch_file))
 
         # Remote patches won't be present and compressed patches won't be
@@ -124,7 +124,7 @@ def get_patched_cves(d):
             cves = patch_text[match.start()+5:match.end()]
             for cve in cves.split():
                 bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
-                patched_cves.add(cve)
+                patched_cves[cve] = {"abbrev-status": "Patched", "status": "fix-file-included", "resource": patch_file}
                 text_match = True
 
         if not fname_match and not text_match:
@@ -133,9 +133,15 @@ def get_patched_cves(d):
     # Search for additional patched CVEs
     for cve in (d.getVarFlags("CVE_STATUS") or {}):
         decoded_status = decode_cve_status(d, cve)
-        if 'mapping' in decoded_status and decoded_status['mapping'] == "Patched":
-            bb.debug(2, "CVE %s is additionally patched" % cve)
-            patched_cves.add(cve)
+        products = d.getVar("CVE_PRODUCT").split()
+        if has_cve_product_match(decoded_status, products) == True:
+            patched_cves[cve] = {
+                "abbrev-status": decoded_status['mapping'],
+                "status": decoded_status['detail'],
+                "justification": decoded_status['description'],
+                "affected-vendor": decoded_status['vendor'],
+                "affected-product": decoded_status["product"]
+            }
 
     return patched_cves
 
@@ -257,3 +263,16 @@ def decode_cve_status(d, cve):
     status_out['mapping'] = status_mapping
 
     return status_out
+
+def has_cve_product_match(detailed_status, products):
+    for product in products:
+        if ":" in product:
+            vendor, product = product.split(":", 1)
+        else:
+            vendor = "*"
+        if (vendor == detailed_status['vendor'] or detailed_status['vendor'] == '*') and \
+            (product == detailed_status['product'] or detailed_status['product'] == '*'):
+            return True
+
+    #if no match, return False
+    return False
-- 
2.43.0


