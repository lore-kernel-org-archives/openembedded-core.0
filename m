Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 900517852B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 09:50:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6V9oJHT020353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 02:50:19 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 31 Jul 2017 02:50:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Jul 2017 02:50:09 -0700
Message-ID: <81100738981ef9b5640b16f804f5f89a76ec2a0c.1501494496.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501494496.git.liezhi.yang@windriver.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] buildhistory.bbclass: add ptest_log
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
X-List-Received-Date: Mon, 31 Jul 2017 09:50:18 -0000
Content-Type: text/plain

The ptest log will be saved to buildhistory/ptest_log, we can easily get
the regression result between builds by:
$ git show HEAD ptest_log/pass.fail.skip.*

[YOCTO #11547]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/buildhistory.bbclass | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index a3e4c7a734a..26430a63d31 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -912,3 +912,31 @@ def write_latest_srcrev(d, pkghistdir):
     else:
         if os.path.exists(srcrevfile):
             os.remove(srcrevfile)
+
+do_testimage[postfuncs] += "write_ptest_result"
+do_testimage[vardepsexclude] += "write_ptest_result"
+
+python write_ptest_result() {
+    write_latest_ptest_result(d, d.getVar('BUILDHISTORY_DIR'))
+}
+
+def write_latest_ptest_result(d, histdir):
+    import glob
+    import subprocess
+    test_log_dir = d.getVar('TEST_LOG_DIR')
+    input_ptest_log = os.path.join(test_log_dir, 'ptest_log')
+    output_ptest_log = os.path.join(histdir, 'ptest_log')
+    if os.path.exists(input_ptest_log):
+        # Lock it avoid race issue
+        lock = bb.utils.lockfile(output_ptest_log + "/ptest_log.lock")
+        bb.utils.mkdirhier(output_ptest_log)
+        oe.path.copytree(input_ptest_log, output_ptest_log)
+        # Sort test result
+        for result in glob.glob('%s/pass.fail.*' % output_ptest_log):
+            bb.debug(1, 'Processing %s' % result)
+            cmd = "sort %s -o %s" % (result, result)
+            bb.debug(1, 'Running %s' % cmd)
+            ret = subprocess.call(cmd, shell=True)
+            if ret != 0:
+                bb.error('Failed to run %s!' % cmd)
+        bb.utils.unlockfile(lock)
-- 
2.11.0


