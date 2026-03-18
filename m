Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409D4FCD0B5
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:39:17 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7581.1773812349558822087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XDFNHWL3;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=19067; q=dns/txt;
  s=iport01; t=1773812349; x=1775021949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+6a8f8QOZjHnH8QFA6HcYnWOct2WlK9bSmQOd7nhAZs=;
  b=XDFNHWL3TYLbTXhW8KxV1m39Dgb4NEYzM2UYpjVR3sZ1PFPRBNAkTsqN
   Iiz5OsCru6FmHzCO/Yo3nv5E2iRCL7DbE0R149hwdC/BpacQgjfsQ0Kae
   xOAsvFOWaY2W5iCZNu68PnLR2EaixoDGU6bYIG9j5CS+6oOV7Dokor72y
   4DQ9BxvwbKEKC6A6btoZ2XOrQoMxkMCGwp/KBMZm0hXz30/IsRqRi12OH
   LKkwkE5SrZLSbm6WnIISFWWWCIcm3aZtKnTpIHO2sqvB4Z67TG2p7ZA1H
   aQ8bwF/LqD0Tle+SMdXjp+9zw1DyDmjWL5p4H9osNiCz6Es2AyVUYPqQ+
   g==;
X-CSE-ConnectionGUID: 3Z3syOXpTeCLSbvDTyKwgA==
X-CSE-MsgGUID: jvgfFSsUTDagafskfeS5pA==
X-IPAS-Result: =?us-ascii?q?A0D5BQA1Obpp/5EQJK1aglmCGDAPcV9CSZZLA4tkkjaBf?=
 =?us-ascii?q?w8BAQEPNxoEAQGFBwKNIgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGFQEGMw2GWwIBAzIBRhAgMSALKxmDAgGCOgM2AgGzDoIsg?=
 =?us-ascii?q?QGCZoIW2EcNglIBBQYUAYE4hTyCeYUgWhqEeicbG4FyhH2CH0IBiCUEgiKBD?=
 =?us-ascii?q?oF/h0eCADuGe0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYQAD?=
 =?us-ascii?q?4htdG2BE4QMAwsYDUgRLDcUGwQ+bgeNTzuBQXIBASxFDQUKASsEARswKxYKB?=
 =?us-ascii?q?UwBGDo4A5JDLioTj1eCIZ9QTXEKKIN0jB6PPoV8GjOEBKZnmQaCWIsxhAmSR?=
 =?us-ascii?q?4RogWg8RoEBCwdwFTuCZ1IZD4d/AYdVAQeEQ8QCIzU9AQEHAgcNAwuBaJF9A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:slAe9q/f8j10iJhhK+mCDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2oeDGyAO/qJZWqjf913PIiw8kMGvsXTztcwGgZu+CBEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsaTtLs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2ltD9YD68FHGV1D3
 tgjIi4hUgGgmO2flefTpulE3qzPLeHiOIcZ/3UlxjbDALN+EdbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cPnWjOX9PYH46tOelmmH2bxVTqUmeouw85G27IAlZjOS9b4OLK4faLSlTtkSGq
 WzoxH/EPj0TO9WR0jmL/0nxnsaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1bfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:MO/6lK1owCf6IlDy4l6gYAqjBLUkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7N5ZwQt7eC3OF+eOxQpuW6zA==
X-Talos-CUID: 9a23:rBWlW28DCs2iFGyaQNyVvxUmQds0VU3F8Hr7B3SyF0pVWZ6KRnbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AOEwk8gxHFGqCd5oujd47okAcZEeaqKawB04jqo4?=
 =?us-ascii?q?7h+WNOiV+IDSTgQ/qWqZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,126,1770595200"; 
   d="scan'208";a="448716938"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Mar 2026 05:39:08 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 49B5E1800022B;
	Wed, 18 Mar 2026 05:39:08 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id E6231CE2A79; Tue, 17 Mar 2026 22:39:07 -0700 (PDT)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH v1 2/4] cve-check: annotate CVEs during analysis
Date: Tue, 17 Mar 2026 22:39:04 -0700
Message-Id: <20260318053906.26606-3-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260318053906.26606-1-hetpat@cisco.com>
References: <20260318053906.26606-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 05:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233361

From: Marta Rybczynska <rybczynska@gmail.com>

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

We also use the annotation in CVE_STATUS to filter out entries
that do not apply to the given recipe

Backport Changes:
- Cherry-picking this patch, which precedes commit [358dbfcd80ae] in
master. Since commit [358dbfcd80ae] was already cherry-picked earlier
in scarthgap, adjusted the changes accordingly to avoid conflicts.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 452e605b55ad61c08f4af7089a5a9c576ca28f7d)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/classes/cve-check.bbclass | 214 +++++++++++++++++----------------
 meta/lib/oe/cve_check.py       |  35 +++++-
 2 files changed, 142 insertions(+), 107 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index de5ddf6f04..32fb9e8a5c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -176,10 +176,10 @@ python do_cve_check () {
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
 
@@ -287,7 +287,51 @@ ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest ' if d
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
@@ -297,28 +341,19 @@ def check_cves(d, patched_cves):
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
@@ -337,11 +372,10 @@ def check_cves(d, patched_cves):
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
@@ -357,7 +391,7 @@ def check_cves(d, patched_cves):
             for row in product_cursor:
                 (_, _, _, version_start, operator_start, version_end, operator_end) = row
                 #bb.debug(2, "Evaluating row " + str(row))
-                if cve in cve_ignore:
+                if cve_is_ignored(d, cve_data, cve):
                     ignored = True
 
                 version_start = convert_cve_version(version_start)
@@ -396,16 +430,16 @@ def check_cves(d, patched_cves):
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
@@ -413,49 +447,46 @@ def check_cves(d, patched_cves):
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
-            cve_data[row[0]]["scorev4"] = row[4]
-            cve_data[row[0]]["modified"] = row[5]
-            cve_data[row[0]]["vector"] = row[6]
-            cve_data[row[0]]["vectorString"] = row[7]
+            # The CVE itdelf has been added already
+            if row[0] not in cve_data:
+                bb.note("CVE record %s not present" % row[0])
+                continue
+            #cve_data[row[0]] = {}
+            cve_data[row[0]]["NVD-summary"] = row[1]
+            cve_data[row[0]]["NVD-scorev2"] = row[2]
+            cve_data[row[0]]["NVD-scorev3"] = row[3]
+            cve_data[row[0]]["NVD-scorev4"] = row[4]
+            cve_data[row[0]]["NVD-modified"] = row[5]
+            cve_data[row[0]]["NVD-vector"] = row[6]
+            cve_data[row[0]]["NVD-vectorString"] = row[7]
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
@@ -472,7 +503,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         return
 
     # Early exit, the text format does not report packages without CVEs
-    if not patched+unpatched+ignored:
+    if not len(cve_data):
         return
 
     nvd_link = "https://nvd.nist.gov/vuln/detail/"
@@ -481,37 +512,30 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
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
-        write_string += "CVSS v4 BASE SCORE: %s\n" % cve_data[cve]["scorev4"]
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
+            write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["NVD-scorev4"]
+            write_string += "VECTOR: %s\n" % cve_data[cve]["NVD-vector"]
+            write_string += "VECTORSTRING: %s\n" % cve_data[cve]["NVD-vectorString"]
+
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
+        if cve_data[cve]["abbrev-status"] == "Unpatched":
+            unpatched_cves.append(cve)
 
     if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
         bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
@@ -563,13 +587,11 @@ def cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_fi
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
 
@@ -587,8 +609,6 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
     if include_layers and layer not in include_layers:
         return
 
-    unpatched_cves = []
-
     product_data = []
     for s in cve_status:
         p = {"product": s[0], "cvesInRecord": "Yes"}
@@ -603,40 +623,32 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
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
-            "scorev4" : cve_data[cve]["scorev4"],
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
+            cve_item["scorev4"] = cve_data[cve]["NVD-scorev4"]
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
@@ -648,12 +660,12 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
 
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
index 767d1a6750..37230b7957 100644
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
+        products = d.getVar("CVE_PRODUCT")
+        if has_cve_product_match(decoded_status, products) == True:
+            patched_cves[cve] = {
+                "abbrev-status": decoded_status["mapping"],
+                "status": decoded_status["detail"],
+                "justification": decoded_status["description"],
+                "affected-vendor": decoded_status["vendor"],
+                "affected-product": decoded_status["product"]
+            }
 
     return patched_cves
 
@@ -286,3 +292,20 @@ def extend_cve_status(d):
                 d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_group, "status"))
         else:
             bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" % cve_status_group)
+
+def has_cve_product_match(detailed_status, products):
+    """
+    Check product/vendor match between detailed_status from decode_cve_status and a string of
+    products (like from CVE_PRODUCT)
+    """
+    for product in products.split():
+        vendor = "*"
+        if ":" in product:
+            vendor, product = product.split(":", 1)
+
+        if (vendor == detailed_status["vendor"] or detailed_status["vendor"] == "*") and \
+            (product == detailed_status["product"] or detailed_status["product"] == "*"):
+            return True
+
+    #if no match, return False
+    return False

