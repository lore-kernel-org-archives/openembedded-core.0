Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B005782A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 01:23:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7M1NMTl032737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 18:23:22 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 18:23:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 18:23:13 -0700
Message-ID: <883015e9381f66d88a32ff5fe0f81a24e9aa86a0.1503364879.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1503364879.git.liezhi.yang@windriver.com>
References: <cover.1503364879.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 9/9] buildhistory.bbclass: add ptest
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
X-List-Received-Date: Tue, 22 Aug 2017 01:23:21 -0000
Content-Type: text/plain

The ptest log will be saved to buildhistory/ptest, we can easily get
the regression result between builds by:

$ git show HEAD ptest/pass.fail.skip.*

[YOCTO #11547]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/buildhistory.bbclass | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index a3e4c7a..dbfcc05 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -912,3 +912,33 @@ def write_latest_srcrev(d, pkghistdir):
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
+    input_ptest = os.path.join(test_log_dir, 'ptest_log')
+    output_ptest = os.path.join(histdir, 'ptest')
+    if os.path.exists(input_ptest):
+        try:
+            # Lock it avoid race issue
+            lock = bb.utils.lockfile(output_ptest + "/ptest.lock")
+            bb.utils.mkdirhier(output_ptest)
+            oe.path.copytree(input_ptest, output_ptest)
+            # Sort test result
+            for result in glob.glob('%s/pass.fail.*' % output_ptest):
+                bb.debug(1, 'Processing %s' % result)
+                cmd = ['sort', result, '-o', result]
+                bb.debug(1, 'Running %s' % cmd)
+                ret = subprocess.call(cmd)
+                if ret != 0:
+                    bb.error('Failed to run %s!' % cmd)
+        finally:
+            bb.utils.unlockfile(lock)
-- 
2.10.2


