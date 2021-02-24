Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.5559.1614165073506918530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 03:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: rELMbJ5+76x91nrlAcWOY95SLOZt6YMGMjxxJipvET8rsP6wt2XMgYj65jeYfllB+oxgGZv3hS
 qBNLCaTQlQpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="172787929"
X-IronPort-AV: E=Sophos;i="5.81,202,1610438400"; 
   d="scan'208";a="172787929"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2021 03:11:11 -0800
IronPort-SDR: rgvjROXwwWY5D3YGyaHDr/GZERG5Fs2g4Q891wFU7OLpKIxNoqyHYeUD1gwInopuilDUmNymIG
 JEUP/ikBDGUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,202,1610438400"; 
   d="scan'208";a="364887926"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga003.jf.intel.com with ESMTP; 24 Feb 2021 03:11:09 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-check: produce cve-summary in JSON format
Date: Wed, 24 Feb 2021 19:11:08 +0800
Message-Id: <20210224111108.41864-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <Chee.Yang.Lee@intel.com>

produce cve-summary in JSON format so it can be translate and consume
by other tools.

output json summary file use similar name as CVE_CHECK_SUMMARY_FILE_NAME
but with .json extension.

[yocto#13975]

Signed-off-by: Lee Chee Yang <Chee.Yang.Lee@intel.com>
---
 meta/classes/cve-check.bbclass | 43 +++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 112ee3379d..09bd1f6597 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -66,8 +66,10 @@ CVE_VERSION_SUFFIX ??= ""
 python cve_save_summary_handler () {
     import shutil
     import datetime
+    import json
 
     cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
+    cve_tmp_file_json = "%s-json" % cve_tmp_file
 
     cve_summary_name = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
     cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
@@ -85,6 +87,26 @@ python cve_save_summary_handler () {
             if os.path.exists(os.path.realpath(cvefile_link)):
                 os.remove(cvefile_link)
             os.symlink(os.path.basename(cve_summary_file), cvefile_link)
+
+    cve_summary_file_json = os.path.join(cvelogpath, "%s-%s.json" % (cve_summary_name, timestamp))
+    # cve_tmp_file_json record each CVE in single line, consolidate them into single json file
+    if os.path.exists(cve_tmp_file_json):
+        cve_json = {}
+        cve_json['CVEs'] = []
+        f_json = open(cve_tmp_file_json,"r")
+        for line in f_json:
+            cve_json['CVEs'].append(json.loads(line))
+        f_json.close()
+
+        with open(cve_summary_file_json,"w") as f:
+            json.dump(cve_json, f, indent=4)
+
+        if cve_summary_file_json and os.path.exists(cve_summary_file_json):
+            cvefile_link = os.path.join(cvelogpath, "%s.json" % cve_summary_name)
+
+            if os.path.exists(os.path.realpath(cvefile_link)):
+                os.remove(cvefile_link)
+            os.symlink(os.path.basename(cve_summary_file_json), cvefile_link)
 }
 
 addhandler cve_save_summary_handler
@@ -118,6 +140,7 @@ python cve_check_cleanup () {
     Delete the file used to gather all the CVE information.
     """
     bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
+    bb.utils.remove("%s-json" % e.data.getVar("CVE_CHECK_TMP_FILE"))
 }
 
 addhandler cve_check_cleanup
@@ -340,7 +363,7 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
     CVE manifest if enabled.
     """
-
+    import json
 
     cve_file = d.getVar("CVE_CHECK_LOG")
     fdir_name  = d.getVar("FILE_DIRNAME")
@@ -356,6 +379,7 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
         return
 
     nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
+    json_string = ""
     write_string = ""
     unpatched_cves = []
     bb.utils.mkdirhier(os.path.dirname(cve_file))
@@ -370,17 +394,30 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
         write_string += "CVE: %s\n" % cve
         if cve in whitelisted:
             write_string += "CVE STATUS: Whitelisted\n"
+            json_string += '{"CVE STATUS": "Whitelisted"'
         elif is_patched:
             write_string += "CVE STATUS: Patched\n"
+            json_string += '{"CVE STATUS": "Patched"'
         else:
             unpatched_cves.append(cve)
             write_string += "CVE STATUS: Unpatched\n"
+            json_string += '{"CVE STATUS": "Unpatched"'
         write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
         write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
 
+        json_string += ',"LAYER": "%s"' % layer
+        json_string += ',"PACKAGE NAME": "%s"' % d.getVar("PN")
+        json_string += ',"PACKAGE VERSION": "%s%s"' % (d.getVar("EXTENDPE"), d.getVar("PV"))
+        json_string += ',"CVE": "%s"' % cve
+        json_string += ',"CVE SUMMARY": %s' % json.dumps(cve_data[cve]["summary"])
+        json_string += ',"CVSS v2 BASE SCORE": "%s"' % cve_data[cve]["scorev2"]
+        json_string += ',"CVSS v3 BASE SCORE": "%s"' % cve_data[cve]["scorev3"]
+        json_string += ',"VECTOR": "%s"' % cve_data[cve]["vector"]
+        json_string += ',"MORE INFORMATION": "%s%s"}\n' % (nvd_link, cve)
+
     if unpatched_cves:
         bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
 
@@ -401,3 +438,7 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
 
             with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
                 f.write("%s" % write_string)
+
+            with open("%s-json" % d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
+                f.write("%s" % json_string)
+
-- 
2.17.1

