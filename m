Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5C1966067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 19:11:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 15 Feb 2016 11:11:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,451,1449561600"; d="scan'208";a="915484695"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2016 11:11:01 -0800
Received: from fjpedraz.zpn.intel.com (fjpedraz.zpn.intel.com [10.219.24.19])
	by linux.intel.com (Postfix) with ESMTP id C559B6A4004;
	Mon, 15 Feb 2016 11:58:51 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 13:10:42 -0600
Message-Id: <1455563442-11586-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455563442-11586-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1455563442-11586-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCHv2 2/2] oeqa/selftest/prservice: Added new tc: check pr-server stop msg
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
X-List-Received-Date: Mon, 15 Feb 2016 19:11:01 -0000

When stopping the prserver using localhost as host, it tries to
find a file '/tmp/PRServer_127.0.0.1_8585.pid' which is not
present on the system.

fix for [YOCTO #8258]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/selftest/prservice.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/prservice.py
index f22288e..fbde5a6 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -9,9 +9,9 @@ import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils.decorators import testcase
+from oeqa.utils.network import get_free_port
 
 class BitbakePrTests(oeSelfTest):
-
     def get_pr_version(self, package_name):
         pkgdata_dir = get_bb_var('PKGDATA_DIR')
         package_data_file = os.path.join(pkgdata_dir, 'runtime', package_name)
@@ -119,3 +119,16 @@ class BitbakePrTests(oeSelfTest):
     @testcase(936)
     def test_pr_service_ipk_arch_indep(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'ipk', 'do_package')
+
+    @testcase(1419)
+    def test_stopping_prservice_message(self):
+        output_msg_passed = 'Waiting for pr-server to exit.'
+        err_msg = 'pidfile /tmp/PRServer_localhost_8585.pid does not exist. Daemon not running?'
+
+        port = get_free_port()
+        runCmd('bitbake-prserv --host localhost --port %s --loglevel=DEBUG --start' % port)
+        ret = runCmd('bitbake-prserv --host localhost --port %s --loglevel=DEBUG --stop' % port)
+
+        self.assertNotEqual(ret.output, err_msg)
+        self.assertEqual(ret.output, output_msg_passed)
+
-- 
2.5.0


