Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B5EBA7F8CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:46:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b17so19717993wmj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bXpTy66ZhmzjFqRhzkqbURNmX/UVYlGxO0A5tVJj/8M=;
	b=vlibkkv2d6MKO7QsI4chhZbn0VBvKUJSNvu/o7t+0xJPAEcwLAL2ApToFdl0zU63dL
	9o5i/SKw/abiFjhLQJ0JbCG8pShXAW/d9lQPdCoq9W4Bj5zLuUqXXjMmKM8DuLCMwRsJ
	72CMzPSy8X1NlmkE6abIQu/gajmuL17DoB9gbLykaNYpRE2YqApCGHyVOq8dgqQ77zDr
	RQ0m72cBe8KD50ntsaGq8B/7hicqEZcyx1H3CDLteUon2RsVHpxezBoURjdU0cZz/OBw
	p3L8tlXGMFqN5Kf2Pvs9cd7gHNkce+YjIIvedDBHBtbsA4MDqBBJBMYn/6+Cv+kSwoj/
	JSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bXpTy66ZhmzjFqRhzkqbURNmX/UVYlGxO0A5tVJj/8M=;
	b=fr+r01ihFLun3dVbUgrUSVtPJ6DZBSV0TbbmF+Bc/l2UXU2j9WkO4HgjDbpZjfUFX0
	fzbb9wfjxbuL8QicSdwEMmqc2dbd1NSKy/RfTDwqQF5TiibB93C6BQswCQutyVDIVDnD
	5vLFIzdUsxd3h4eAUGfXIlsdpkH/7S0u3t+JswXO4pU6BumtX9mwpC/3FD+5xAM6Cu7T
	SBXwzCHutGlS8uV9BYkcD9goJQnrL58z5bxWiUiwIoX9ajuY7Bsg5Dx1A49WUk3Xngvq
	RVqz1BLbzC0VsAe+pxZ7sTA0AQ+P9WuS+K+F2RNgqjYPE6z/yyS2GOuHnGeNfJV3ow1Y
	tbFg==
X-Gm-Message-State: APjAAAXmVtTzjbHPw2Dob25pCrWKI+B0GuJdxH6vAOuTZrQoAUut7v5D
	5WRSOY58NDgaQLnHFg+hi3roJDOZcXQ=
X-Google-Smtp-Source: APXvYqxQm9tPJ6PeKD4nJnzFCVi+2ek3OUqvCE/TbTaRxwpAcX1gd97J74rhc+p5fotwHLizhx2zXQ==
X-Received: by 2002:a7b:c776:: with SMTP id x22mr29090101wmk.144.1574095616145;
	Mon, 18 Nov 2019 08:46:56 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y189sm20936208wmb.13.2019.11.18.08.46.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 08:46:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:46:45 +0000
Message-Id: <20191118164647.29409-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191118164647.29409-1-ross.burton@intel.com>
References: <20191118164647.29409-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] cve-check: rewrite look to fix false negatives
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
X-List-Received-Date: Mon, 18 Nov 2019 16:46:56 -0000
Content-Transfer-Encoding: 8bit

A previous optimisation was premature and resulted in false-negatives in the report.

Rewrite the checking algorithm to first get the list of potential CVEs by
vendor:product, then iterate through every matching CPE for that CVE to
determine if the bounds match or not.  By doing this in two stages we can know
if we've checked every CPE, instead of accidentally breaking out of the scan too
early.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass | 63 ++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 3326944d791..c1cbdbde7b7 100644
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


