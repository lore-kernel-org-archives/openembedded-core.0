Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A632D60069
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:11:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v499B7OV025802
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 May 2017 02:11:08 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 9 May 2017 02:11:07 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 May 2017 17:13:23 +0800
Message-ID: <ecb02fcc0cbe4c1ea8967c80b9d1e6d14586ed2e.1494321164.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1494321164.git.Qi.Chen@windriver.com>
References: <cover.1494321164.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cve-check.bbclass: make warning contain CVE IDs
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
X-List-Received-Date: Tue, 09 May 2017 09:11:07 -0000
Content-Type: text/plain

When warning users about unpatched CVE, we'd better put CVE IDs into
the warning message, so that it would be more straight forward for the
user to know which CVEs are not patched.

So instead of:
  WARNING: gnutls-3.5.9-r0 do_cve_check: Found unpatched CVE, for more information check /path/to/workdir/cve/cve.log.
We should have:
  WARNING: gnutls-3.5.9-r0 do_cve_check: Found unpatched CVE (CVE-2017-7869), for more information check /path/to/workdir/cve/cve.log.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/cve-check.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0e4294f..496d744 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -234,7 +234,8 @@ def cve_write_data(d, patched, unpatched, cve_data):
     cve_file = d.getVar("CVE_CHECK_LOCAL_FILE")
     nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
     write_string = ""
-    first_alert = True
+    has_unpatched_cve = False
+    unpatched_cves = []
     bb.utils.mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR"))
 
     for cve in sorted(cve_data):
@@ -244,15 +245,17 @@ def cve_write_data(d, patched, unpatched, cve_data):
         if cve in patched:
             write_string += "CVE STATUS: Patched\n"
         else:
+            unpatched_cves.append(cve)
             write_string += "CVE STATUS: Unpatched\n"
-            if first_alert:
-                bb.warn("Found unpatched CVE, for more information check %s" % cve_file)
-                first_alert = False
+            has_unpatched_cve = True
         write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["score"]
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
 
+    if has_unpatched_cve:
+        bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
+
     with open(cve_file, "w") as f:
         bb.note("Writing file %s with CVE information" % cve_file)
         f.write(write_string)
-- 
1.9.1


