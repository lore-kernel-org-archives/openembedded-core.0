Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63B7E706F7
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 09:03:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.11714.1695287005314799706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 02:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: shin.matsunaga@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="133003681"
X-IronPort-AV: E=Sophos;i="6.03,165,1694703600"; 
   d="scan'208";a="133003681"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 18:03:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 67061CA1E9
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 18:03:20 +0900 (JST)
Received: from storage.utsfd.cs.fujitsu.co.jp (storage.utsfd.cs.fujitsu.co.jp [10.118.252.123])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E0BCBF4A0
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 18:03:19 +0900 (JST)
Received: by storage.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1068)
	id 8474C1A49A; Thu, 21 Sep 2023 18:03:19 +0900 (JST)
From: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	shin.matsunaga@fujitsu.com
Subject: [PATCH] cve-check: Classify patched CVEs into 3 statuses
Date: Thu, 21 Sep 2023 18:03:16 +0900
Message-Id: <20230921090316.10932-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 09:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187983

CVEs that are currently considered "Patched" are classified into the following 3 statuses:
1. "Patched"      - means that a patch file that fixed the vulnerability has been applied
2. "Out of range" - means that the package version (PV) is not subject to the vulnerability
3. "Undecidable"  - means that versions cannot be compared to determine if they are affected by the vulnerability

Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
---
 meta/classes/cve-check.bbclass | 55 +++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 55ae298024..a2456902ce 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -185,10 +185,10 @@ python do_cve_check () {
                 patched_cves = get_patched_cves(d)
             except FileNotFoundError:
                 bb.fatal("Failure in searching patches")
-            ignored, patched, unpatched, status = check_cves(d, patched_cves)
-            if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
-                cve_data = get_cve_info(d, patched + unpatched + ignored)
-                cve_write_data(d, patched, unpatched, ignored, cve_data, status)
+            ignored, patched, unpatched, out_of_range, undecidable, status = check_cves(d, patched_cves)
+            if patched or unpatched or out_of_range or undecidable or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
+                cve_data = get_cve_info(d, patched + unpatched + ignored + out_of_range + undecidable)
+                cve_write_data(d, patched, unpatched, ignored, out_of_range, undecidable, cve_data, status)
         else:
             bb.note("No CVE database found, skipping CVE check")
 
@@ -308,13 +308,13 @@ def check_cves(d, patched_cves):
     products = d.getVar("CVE_PRODUCT").split()
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
     if not products:
-        return ([], [], [], [])
+        return ([], [], [], [], [], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
     # If the recipe has been skipped/ignored we return empty lists
     if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
         bb.note("Recipe has been skipped by cve-check")
-        return ([], [], [], [])
+        return ([], [], [], [], [], [])
 
     # Convert CVE_STATUS into ignored CVEs and check validity
     cve_ignore = []
@@ -328,6 +328,8 @@ def check_cves(d, patched_cves):
     conn = sqlite3.connect(db_file, uri=True)
 
     # For each of the known product names (e.g. curl has CPEs using curl and libcurl)...
+    cves_out_of_range = []
+    cves_undecidable = []
     for product in products:
         cves_in_product = False
         if ":" in product:
@@ -355,6 +357,7 @@ def check_cves(d, patched_cves):
 
             vulnerable = False
             ignored = False
+            undecidable = False
 
             product_cursor = conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor))
             for row in product_cursor:
@@ -376,7 +379,7 @@ def check_cves(d, patched_cves):
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_start, version_start, cve))
-                            vulnerable_start = False
+                            undecidable = True
                     else:
                         vulnerable_start = False
 
@@ -387,10 +390,15 @@ def check_cves(d, patched_cves):
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_end, version_end, cve))
-                            vulnerable_end = False
+                            undecidable = True
                     else:
                         vulnerable_end = False
 
+                    if undecidable:
+                        bb.note("%s-%s is undecidable to %s" % (pn, real_pv, cve))
+                        cves_undecidable.append(cve)
+                        break
+
                     if operator_start and operator_end:
                         vulnerable = vulnerable_start and vulnerable_end
                     else:
@@ -406,9 +414,9 @@ def check_cves(d, patched_cves):
                     break
             product_cursor.close()
 
-            if not vulnerable:
+            if not undecidable and not vulnerable:
                 bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, cve))
-                patched_cves.add(cve)
+                cves_out_of_range.append(cve)
         cve_cursor.close()
 
         if not cves_in_product:
@@ -420,7 +428,7 @@ def check_cves(d, patched_cves):
     if not cves_in_recipe:
         bb.note("No CVE records for products in recipe %s" % (pn))
 
-    return (list(cves_ignored), list(patched_cves), cves_unpatched, cves_status)
+    return (list(cves_ignored), list(patched_cves), cves_unpatched, cves_out_of_range, cves_undecidable, cves_status)
 
 def get_cve_info(d, cves):
     """
@@ -446,7 +454,7 @@ def get_cve_info(d, cves):
     conn.close()
     return cve_data
 
-def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
+def cve_write_data_text(d, patched, unpatched, ignored, out_of_range, undecidable, cve_data):
     """
     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
     CVE manifest if enabled.
@@ -470,7 +478,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         return
 
     # Early exit, the text format does not report packages without CVEs
-    if not patched+unpatched+ignored:
+    if not patched+unpatched+ignored+out_of_range+undecidable:
         return
 
     nvd_link = "https://nvd.nist.gov/vuln/detail/"
@@ -481,6 +489,8 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
     for cve in sorted(cve_data):
         is_patched = cve in patched
         is_ignored = cve in ignored
+        is_out_of_range = cve in out_of_range
+        is_undecidable = cve in undecidable
 
         status = "Unpatched"
         if (is_patched or is_ignored) and not report_all:
@@ -489,6 +499,10 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
             status = "Ignored"
         elif is_patched:
             status = "Patched"
+        elif is_out_of_range:
+            status = "Out of range"
+        elif is_undecidable:
+            status = "Undecidable"
         else:
             # default value of status is Unpatched
             unpatched_cves.append(cve)
@@ -559,7 +573,7 @@ def cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_fi
         with open(index_path, "a+") as f:
             f.write("%s\n" % fragment_path)
 
-def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
+def cve_write_data_json(d, patched, unpatched, ignored, out_of_range, undecidable, cve_data, cve_status):
     """
     Prepare CVE data for the JSON format, then write it.
     """
@@ -604,6 +618,9 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
     for cve in sorted(cve_data):
         is_patched = cve in patched
         is_ignored = cve in ignored
+        is_out_of_range = cve in out_of_range
+        is_undecidable = cve in undecidable
+
         status = "Unpatched"
         if (is_patched or is_ignored) and not report_all:
             continue
@@ -611,6 +628,10 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
             status = "Ignored"
         elif is_patched:
             status = "Patched"
+        elif is_out_of_range:
+            status = "Out of range"
+        elif is_undecidable:
+            status = "Undecidable"
         else:
             # default value of status is Unpatched
             unpatched_cves.append(cve)
@@ -642,12 +663,12 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
 
     cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file)
 
-def cve_write_data(d, patched, unpatched, ignored, cve_data, status):
+def cve_write_data(d, patched, unpatched, ignored, out_of_range, undecidable, cve_data, status):
     """
     Write CVE data in each enabled format.
     """
 
     if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
-        cve_write_data_text(d, patched, unpatched, ignored, cve_data)
+        cve_write_data_text(d, patched, unpatched, ignored, out_of_range, undecidable, cve_data)
     if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
-        cve_write_data_json(d, patched, unpatched, ignored, cve_data, status)
+        cve_write_data_json(d, patched, unpatched, ignored, out_of_range, undecidable, cve_data, status)
-- 
2.41.0


