Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF887FDD1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:24 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id x17so4665931pln.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZFs0MnN/bBfSg/6D+ln1OmgzSOl42k/KJkc0HvAoc1g=;
	b=PJTuy58ow2S2FE7eIICG33DJUTi+Hsew0X8d2edtyyRGHus5x3+XGwcahXka4qX8RC
	mMuPp6I985ep267lRanC8YkOgRW0Q3TJXs3f0UWDhpiwI7jFhT/zaR68nZv8U4geWMqN
	Rlnc3H9OVcdAo9cRyzjgchGT/NHPtiXPuGdpqq06DXEaklcTDCUmNEr/pxkegfBJbo8e
	GkeeRhTTAAdbZwNcLKmxVert2ABb8oT0K+y9yckqae1SrpNg6a1Or+K8LMbwnR+LWa6r
	eaqKF2j3GGVSNobOnC3mUXGif3WTmx9oNpCz7G+ySW7DHhYLFjkLgZHt+6K9hMBW19HQ
	uGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZFs0MnN/bBfSg/6D+ln1OmgzSOl42k/KJkc0HvAoc1g=;
	b=qfEC2UAPPdNN0ebM45onWLKR0zIQAgNsGvXzknC9FXl1naSyxxfhKoqyRivN0H4lFp
	HnPzV2Y8Sx3A+ro0bsvVHN2zNaUy/HdqvsnsvdDBEfJbDOqIHcz0q8YmnfEhHCEXpbVW
	JcEoDUh5jLA+7AjQFIbOi3Eeu80aJICIPMBZxp2867fSg6Zw42IDPJfaS0yWGP9HiZXo
	jdqntJa6LP3bv1RO2AN3B97Rsd/03oAXoCHzGZymKpjIZJ1aJ+HaRpb7BaUaoAPJODEP
	nM+yGtEqBFz1PT3bhaitl+f9nHQwc0BO6TWp7byauo7P2OkIm2JdoKL/kFgVx4fiif3H
	rI3Q==
X-Gm-Message-State: APjAAAWimrhzC1Ir5susdfI5fE4u5ZHlGqTsG9qWl4vcvgA3MRQ/lZc9
	QSgQpDNUZmOMBbjJE+0gGiRphDZ8VeM=
X-Google-Smtp-Source: APXvYqzyTPVm60avtMx1b4ropSZYti0QqNnGE2BjARqNPxBKujKTDDmZIKf35mfIh21bVFZ4PqjNmA==
X-Received: by 2002:a17:902:9b84:: with SMTP id
	y4mr16175242plp.13.1576512025495; 
	Mon, 16 Dec 2019 08:00:25 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 08:00:04 -0800
Message-Id: <541dc24d974d3e22c45a650c34298eebc45121e8.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 14/18] cve-check: rewrite look to fix false negatives
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:24 -0000

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
 meta/classes/cve-check.bbclass | 63 +++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 3326944..c1cbdbd 100644
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
2.7.4


