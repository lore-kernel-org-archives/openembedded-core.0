Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 529DF71B40
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:29:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v499TLLa013169
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 May 2017 02:29:21 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 9 May 2017 02:29:20 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 May 2017 17:31:36 +0800
Message-ID: <364cb4905d949355da99a54b7cb6cd8788bbb9a2.1494322236.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1494322236.git.Qi.Chen@windriver.com>
References: <cover.1494322236.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] cve-check.bbclass: make warning contain CVE IDs
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
X-List-Received-Date: Tue, 09 May 2017 09:29:20 -0000
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
 meta/classes/cve-check.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0e4294f..3a9e227 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -234,7 +234,7 @@ def cve_write_data(d, patched, unpatched, cve_data):
     cve_file = d.getVar("CVE_CHECK_LOCAL_FILE")
     nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
     write_string = ""
-    first_alert = True
+    unpatched_cves = []
     bb.utils.mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR"))
 
     for cve in sorted(cve_data):
@@ -244,15 +244,16 @@ def cve_write_data(d, patched, unpatched, cve_data):
         if cve in patched:
             write_string += "CVE STATUS: Patched\n"
         else:
+            unpatched_cves.append(cve)
             write_string += "CVE STATUS: Unpatched\n"
-            if first_alert:
-                bb.warn("Found unpatched CVE, for more information check %s" % cve_file)
-                first_alert = False
         write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["score"]
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
 
+    if unpatched_cves:
+        bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
+
     with open(cve_file, "w") as f:
         bb.note("Writing file %s with CVE information" % cve_file)
         f.write(write_string)
-- 
1.9.1


