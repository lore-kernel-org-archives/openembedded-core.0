Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id BC5997FA23
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:07 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id bg7so1728843pjb.5
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NHBnYyxJdUgrd8Xs5MZzpBc8XHWfaayO3iLg3SThnLA=;
	b=brhruidOFBh3WWcjb8s8FYASw+MjRhASuUTkImc3s4PZP+dC7fx120WwVZOd6OL3K1
	wu247S4MZYMExxrBXeDn9mel5Fa+l/6MVLR0RfRJWgv2EAu9J//LLsGZDK3/OsAaPjW1
	yEWFIcOs2Soh2PBCnpWdz7iB62IZeasmlJqyuJnLI9xiqJDPmDo2oWwFIqaUtIKm6zto
	Im7j9uPWhNnDcbYaWrjQ6isujOsv9HyHK7DXdEzW+fm3EpJ3arVQ9PjR+BcFwTqBlL+2
	g8R6GnUgetway0RSCzSxRXsBlEMzpXtf6n4bksVkEnqHM3crnrusjXbdaE39ODzrQqIF
	5J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NHBnYyxJdUgrd8Xs5MZzpBc8XHWfaayO3iLg3SThnLA=;
	b=PNyXZQHdUYWjLmtmwHfdSqlNgzTRrrruaVxZtA9RgBxJXGCspHSzPWMhiEBYV7F7hu
	aEtp1CPYYbpPGmFg6QSgrhTR8o+cHPYRhnMCs7yL1/BgIJfkdHBRpnLkhTzhGzRs1mTi
	Cu3azRysOtQENRDfgGTh5pV9vaLCcrDpVS85mOTnbzHeg9TO7l3SqHq7k2KuhCFIbLNU
	enEGtn+iJ0Y/1JUvoEl7c/3AMhsRBpthSi6dy4xKOUPMitxh61UtE3N/ybhm8sSg7cL8
	6b6wue7UdtHr/tJ9YZJrZhGiYx1KRDqMwgOwcTtJVLx6A9RFtvZC30ejVA+H3sK2OxD0
	Py7g==
X-Gm-Message-State: APjAAAWaGWnBfuOGb0eEQd04CJQD9ncNsjI+DooxP/hutHn6xtGlIYvL
	sVTxTAPQOgs6sy4lTyRxuYKEB+BY
X-Google-Smtp-Source: APXvYqyQcpSnTrBZmoY/nEc3xyBuUP0X3vKuHmE1yGA7Fbm5jmJEhDZ83YcPXKa1plNs68LpbFPFmg==
X-Received: by 2002:a17:902:b102:: with SMTP id
	q2mr24062598plr.247.1579188068626; 
	Thu, 16 Jan 2020 07:21:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.07
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:34 -0800
Message-Id: <9948dd86d100bec56e22e6c0bbf4759925a4b306.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 25/32] cve-check: rewrite look to fix false negatives
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:08 -0000

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1


