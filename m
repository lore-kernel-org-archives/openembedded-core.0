Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.3859.1618473665538788695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 01:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13F814k3029219
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 01:01:04 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 15 Apr 2021 01:01:03 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 15 Apr 2021 01:01:03 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] base.bbclass: remove obsolete hosttools
Date: Thu, 15 Apr 2021 01:01:03 -0700
Message-ID: <20210415080103.109691-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

If some tool is removed from HOSTTOOLS or HOSTTOOLS_NONFATAL, it
will not be removed from TMPDIR/hosttools in an existing build
directory. This is unexpected. Any tool that is not specified in
HOSTTOOLS and HOSTTOOLS_NONFATAL should be filtered out.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/base.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4dd01ade33..eef573d1ce 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -145,6 +145,13 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
     if notfound and fatal:
         bb.fatal("The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % " ".join(notfound))
 
+def clean_hosttools_dir(dest, tools):
+    import glob
+    desttools = glob.glob('%s/*' % dest)
+    for dt in desttools:
+        if os.path.basename(dt) not in tools:
+            os.unlink(dt)
+
 addtask fetch
 do_fetch[dirs] = "${DL_DIR}"
 do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
@@ -257,6 +264,7 @@ python base_eventhandler() {
         # Works with the line in layer.conf which changes PATH to point here
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONFATAL', d, fatal=False)
+        clean_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), d.getVar('HOSTTOOLS').split() + d.getVar('HOSTTOOLS_NONFATAL').split())
 
     if isinstance(e, bb.event.MultiConfigParsed):
         # We need to expand SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in each of the multiconfig data stores
-- 
2.30.2

