Return-Path: <niko.mauno@iki.fi>
Received: from tulikuusama2.dnainternet.net (tulikuusama3.dnainternet.net
	[83.102.40.155])
	by mail.openembedded.org (Postfix) with ESMTP id E095A7F33D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 18:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id B579F293A2;
	Sun,  8 Dec 2019 20:41:10 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.653
X-Spam-Level: 
X-Spam-Status: No, score=0.653 tagged_above=-9999 required=6
	tests=[SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.652] autolearn=disabled
Received: from tulikuusama2.dnainternet.net ([83.102.40.155])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id Mkzu2FuY0r5G; Sun,  8 Dec 2019 20:41:10 +0200 (EET)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net
	[83.102.40.55])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 2778829349;
	Sun,  8 Dec 2019 20:41:10 +0200 (EET)
Received: from localhost.localdomain (62-78-161-185.bb.dnainternet.fi
	[62.78.161.185])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id 4878F89;
	Sun,  8 Dec 2019 20:41:04 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 20:35:55 +0200
Message-Id: <20191208183557.32589-9-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191208183557.32589-1-niko.mauno@iki.fi>
References: <20191208183557.32589-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Subject: [thud-next][PATCH 09/11] cve-check: rewrite look to fix false negatives
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
X-List-Received-Date: Sun, 08 Dec 2019 18:41:11 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

A previous optimisation was premature and resulted in false-negatives in the report.

Rewrite the checking algorithm to first get the list of potential CVEs by
vendor:product, then iterate through every matching CPE for that CVE to
determine if the bounds match or not.  By doing this in two stages we can know
if we've checked every CPE, instead of accidentally breaking out of the scan too
early.

(From OE-Core rev: d61aff9e22704ad69df1f7ab0f8784f4e7cc0c69)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 63 ++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 3326944d79..c1cbdbde7b 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -165,7 +165,6 @@ def check_cves(d, patched_cves):
     """
     Connect to the NVD database and find unpatched cves.
     """
-    import ast, csv, tempfile, subprocess, io
     from distutils.version import LooseVersion
 
     cves_unpatched = []
@@ -187,68 +186,74 @@ def check_cves(d, patched_cves):
     cve_whitelist = d.getVar("CVE_CHECK_WHITELIST").split()
 
     import sqlite3
-    db_file = d.getVar("CVE_CHECK_DB_FILE")
-    conn = sqlite3.connect(db_file)
+    db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
+    conn = sqlite3.connect(db_file, uri=True)
 
+    # For each of the known product names (e.g. curl has CPEs using curl and libcurl)...
     for product in products:
-        c = conn.cursor()
         if ":" in product:
             vendor, product = product.split(":", 1)
-            c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ? AND VENDOR IS ?", (product, vendor))
         else:
-            c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ?", (product,))
+            vendor = "%"
 
-        for row in c:
-            cve = row[0]
-            version_start = row[3]
-            operator_start = row[4]
-            version_end = row[5]
-            operator_end = row[6]
+        # Find all relevant CVE IDs.
+        for cverow in conn.execute("SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor)):
+            cve = cverow[0]
 
             if cve in cve_whitelist:
                 bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
                 # TODO: this should be in the report as 'whitelisted'
                 patched_cves.add(cve)
+                continue
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
-            else:
-                to_append = False
+                continue
+
+            vulnerable = False
+            for row in conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor)):
+                (_, _, _, version_start, operator_start, version_end, operator_end) = row
+                #bb.debug(2, "Evaluating row " + str(row))
+
                 if (operator_start == '=' and pv == version_start):
-                    to_append = True
+                    vulnerable = True
                 else:
                     if operator_start:
                         try:
-                            to_append_start =  (operator_start == '>=' and LooseVersion(pv) >= LooseVersion(version_start))
-                            to_append_start |= (operator_start == '>' and LooseVersion(pv) > LooseVersion(version_start))
+                            vulnerable_start =  (operator_start == '>=' and LooseVersion(pv) >= LooseVersion(version_start))
+                            vulnerable_start |= (operator_start == '>' and LooseVersion(pv) > LooseVersion(version_start))
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_start, version_start, cve))
-                            to_append_start = False
+                            vulnerable_start = False
                     else:
-                        to_append_start = False
+                        vulnerable_start = False
 
                     if operator_end:
                         try:
-                            to_append_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
-                            to_append_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
+                            vulnerable_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
+                            vulnerable_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_end, version_end, cve))
-                            to_append_end = False
+                            vulnerable_end = False
                     else:
-                        to_append_end = False
+                        vulnerable_end = False
 
                     if operator_start and operator_end:
-                        to_append = to_append_start and to_append_end
+                        vulnerable = vulnerable_start and vulnerable_end
                     else:
-                        to_append = to_append_start or to_append_end
+                        vulnerable = vulnerable_start or vulnerable_end
 
-                if to_append:
+                if vulnerable:
                     bb.note("%s-%s is vulnerable to %s" % (product, pv, cve))
                     cves_unpatched.append(cve)
-                else:
-                    bb.note("%s-%s is not vulnerable to %s" % (product, pv, cve))
-                    patched_cves.add(cve)
+                    break
+
+            if not vulnerable:
+                bb.note("%s-%s is not vulnerable to %s" % (product, pv, cve))
+                # TODO: not patched but not vulnerable
+                patched_cves.add(cve)
+
     conn.close()
 
     return (list(patched_cves), cves_unpatched)
-- 
2.20.1


