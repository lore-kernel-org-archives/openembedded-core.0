Received: from smtp-out01.xworks.net (smtp-out01.xworks.net [31.25.48.216])
 by mx.groups.io with SMTP id smtpd.web12.1872.1589271439856082470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 01:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kabelmail.de header.s=mail header.b=IjJD8uOs;
 spf=pass (domain: kabelmail.de, ip: 31.25.48.216, mailfrom: timon.ulrich@kabelmail.de)
Received: from mailbackend2 (cluster06.xworks.net [10.100.1.80])
	by smtp-out01.xworks.net (Postfix) with ESMTP id 3CA84616E1;
	Tue, 12 May 2020 10:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kabelmail.de;
	s=mail; t=1589271437;
	bh=DjkvfEHb/So5ssJcyxQ1JoIHwQZS+9DPUIhKiu75AzM=;
	h=From:To:Subject:Date;
	b=IjJD8uOsck2LSQVWaEvzBhDkX2UgdLH2DwPo3ofzlMg43Ps2ermyfnsSD8wBwqz2O
	 Ov7mN3Ot3B6p8wCp9tNjNsWdq627TZYrzLyxq81PVld/dU6vJQLSMG1JOLm/dp3MHu
	 ROIpl/01NalSlnEeIH9FNfExlQkD8zZbr6wjRHko=
Received: from AN1049-Latitude-5590.anapur.local (pd95bd745.dip0.t-ipconnect.de [217.91.215.69])
	(authenticated bits=0)
	by smtp.kabelmail.de  with ESMTP id 04C8H94g002191
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 12 May 2020 10:17:15 +0200
X-mediaBEAM-Originating-IP: [217.91.215.69]
X-mediaBEAM-AUTHID: [timon.ulrich@kabelmail.de]
From: timon.ulrich@kabelmail.de
To: openembedded-core@lists.openembedded.org
Cc: Timon Ulrich <t.ulrich@anapur.de>
Subject: [PATCH v2] cve-check: add option to format reports as comma seperated values
Date: Tue, 12 May 2020 10:17:09 +0200
Message-Id: <20200512081709.3914-1-timon.ulrich@kabelmail.de>
X-Mailer: git-send-email 2.17.1
X-mediaBEAM-AuthCheck: route13
X-mediaBEAM-AuthScore: 0.0/5.0, scanned in 1.685sec

From: Timon Ulrich <t.ulrich@anapur.de>

cve-check will check if CVE_CHECK_FORMAT_CSV is set and format the outputs
(manifest etc.) as CSV for use in spreadsheets.

Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
---
 meta/classes/cve-check.bbclass | 52 ++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 2a530a0489..3933a78552 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -35,6 +35,7 @@ CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
+CVE_CHECK_FORMAT_CSV ??= "0"
 
 # Whitelist for packages (PN)
 CVE_CHECK_PN_WHITELIST ?= ""
@@ -98,10 +99,24 @@ python cve_check_write_rootfs_manifest () {
         manifest_name = d.getVar("CVE_CHECK_MANIFEST")
         cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
 
+        if d.getVar("CVE_CHECK_FORMAT_CSV") == "1":
+            manifest_name += ".csv"
+            
+            with open(cve_tmp_file, "r") as f:
+                db_update_timestamp = f.readline()
+                orig_tmp_file = f.readlines()[1:]
+            with open(cve_tmp_file, "w") as f:
+                f.write(db_update_timestamp+'\n')
+                f.write("PACKAGE NAME;PACKAGE VERSION;CVE;CVE STATUS;"
+                       "CVE SUMMARY;CVSS v2 BASE SCORE;CVSS v3 BASE SCORE;"
+                       "VECTOR;MORE INFORMATION\n")
+            with open(cve_tmp_file, "a") as f:
+                f.writelines(orig_tmp_file)
+
         shutil.copyfile(cve_tmp_file, manifest_name)
 
         if manifest_name and os.path.exists(manifest_name):
-            manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
+            manifest_link = os.path.join(deploy_dir, "%s.cve%s" % (link_name, ".csv" if d.getVar("CVE_CHECK_FORMAT_CSV") == "1" else ""))
             # If we already have another manifest, update symlinks
             if os.path.exists(os.path.realpath(manifest_link)):
                 os.remove(manifest_link)
@@ -295,26 +310,35 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
 
     cve_file = d.getVar("CVE_CHECK_LOG")
     nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
+    eol_char = '\n' if d.getVar("CVE_CHECK_FORMAT_CSV") != "1" else ';'
     write_string = ""
     unpatched_cves = []
     bb.utils.mkdirhier(os.path.dirname(cve_file))
 
     for cve in sorted(cve_data):
-        write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
-        write_string += "PACKAGE VERSION: %s\n" % d.getVar("PV")
-        write_string += "CVE: %s\n" % cve
+        write_string += "%s%s%c" % ("PACKAGE NAME: " if d.getVar("CVE_CHECK_FORMAT_CSV") != "1" else "", d.getVar("PN"), eol_char)
+        write_string += "%s%s%c" % ("PACKAGE VERSION: " if d.getVar("CVE_CHECK_FORMAT_CSV") != "1" else "", d.getVar("PV"), eol_char)
+        write_string += "%s%s%c" % ("CVE: " if d.getVar("CVE_CHECK_FORMAT_CSV") != "1" else "", cve, eol_char)
+        if d.getVar("CVE_CHECK_FORMAT_CSV") != "1":
+            write_string += "CVE STATUS: "
         if cve in whitelisted:
-            write_string += "CVE STATUS: Whitelisted\n"
+            write_string += "Whitelisted"
         elif cve in patched:
-            write_string += "CVE STATUS: Patched\n"
+            write_string += "Patched"
         else:
             unpatched_cves.append(cve)
-            write_string += "CVE STATUS: Unpatched\n"
-        write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
-        write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
-        write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
-        write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
-        write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
+            write_string += "Unpatched"
+        write_string += eol_char
+        if d.getVar("CVE_CHECK_FORMAT_CSV") == "1":
+            write_string += "\"%s\"%c" % (cve_data[cve]["summary"].replace("\"","\'"), eol_char)
+        else:
+            write_string += "CVE SUMMARY: %s%c" % (cve_data[cve]["summary"], eol_char)
+        write_string += "%s%s%c" % ("CVSS v2 BASE SCORE: " if d.getVar("CVE_CHECK_FORMAT_CSV") != "1" else "", cve_data[cve]["scorev2"], eol_char)
+        write_string += "%s%s%c" % ("CVSS v3 BASE SCORE: " if d.getVar("CVE_CHECK_FORMAT_CSV") != "1" else "", cve_data[cve]["scorev3"], eol_char)
+        write_string += "%s%s%c" % ("VECTOR: " if d.getVar("CVE_CHECK_FORMAT_CSV") != "1" else "", cve_data[cve]["vector"], eol_char)
+        write_string += "%s%s%s\n" % ("MORE INFORMATION: " if d.getVar("CVE_CHECK_FORMAT_CSV") != "1" else "", nvd_link, cve)
+        if d.getVar("CVE_CHECK_FORMAT_CSV") != "1":
+            write_string += '\n'
 
     if unpatched_cves:
         bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
@@ -328,6 +352,10 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
         bb.utils.mkdirhier(cve_dir)
         deploy_file = os.path.join(cve_dir, d.getVar("PN"))
         with open(deploy_file, "w") as f:
+            if d.getVar("CVE_CHECK_FORMAT_CSV") == "1":
+                f.write("PACKAGE NAME;PACKAGE VERSION;CVE;CVE STATUS;"
+                       "CVE SUMMARY;CVSS v2 BASE SCORE;CVSS v3 BASE SCORE;"
+                       "VECTOR;MORE INFORMATION\n")
             f.write(write_string)
 
     if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
-- 
2.17.1


