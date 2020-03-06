Return-Path: <chee.yang.lee@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1BB610EC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 02:27:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Mar 2020 18:27:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,520,1574150400"; d="scan'208";a="275368980"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga002.fm.intel.com with ESMTP; 05 Mar 2020 18:27:27 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Mar 2020 10:27:26 +0800
Message-Id: <1583461646-73057-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] cve-check: show whitelisted status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Mar 2020 02:27:27 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

change whitelisted CVE status from "Patched" to "Whitelisted".

[Yocto #13687]

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/classes/cve-check.bbclass | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 7412436..7f98da6 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -56,10 +56,10 @@ python do_cve_check () {
             patched_cves = get_patches_cves(d)
         except FileNotFoundError:
             bb.fatal("Failure in searching patches")
-        patched, unpatched = check_cves(d, patched_cves)
+        whitelisted, patched, unpatched = check_cves(d, patched_cves)
         if patched or unpatched:
             cve_data = get_cve_info(d, patched + unpatched)
-            cve_write_data(d, patched, unpatched, cve_data)
+            cve_write_data(d, patched, unpatched, whitelisted, cve_data)
     else:
         bb.note("No CVE database found, skipping CVE check")
 
@@ -263,7 +263,7 @@ def check_cves(d, patched_cves):
 
     conn.close()
 
-    return (list(patched_cves), cves_unpatched)
+    return (list(cve_whitelist), list(patched_cves), cves_unpatched)
 
 def get_cve_info(d, cves):
     """
@@ -287,7 +287,7 @@ def get_cve_info(d, cves):
     conn.close()
     return cve_data
 
-def cve_write_data(d, patched, unpatched, cve_data):
+def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     """
     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
     CVE manifest if enabled.
@@ -303,7 +303,9 @@ def cve_write_data(d, patched, unpatched, cve_data):
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s\n" % d.getVar("PV")
         write_string += "CVE: %s\n" % cve
-        if cve in patched:
+        if cve in whitelisted:
+            write_string += "CVE STATUS: Whitelisted\n"
+        elif cve in patched:
             write_string += "CVE STATUS: Patched\n"
         else:
             unpatched_cves.append(cve)
-- 
2.7.4


