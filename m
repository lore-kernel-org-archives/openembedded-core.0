Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0F63875894
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 09:35:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 12 Feb 2016 01:36:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,435,1449561600"; d="scan'208";a="46732189"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 12 Feb 2016 01:36:00 -0800
Received: from fjpedraz.zpn.intel.com (fjpedraz.zpn.intel.com [10.219.18.69])
	by linux.intel.com (Postfix) with ESMTP id 0B71B6A4004;
	Fri, 12 Feb 2016 02:23:51 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 03:35:58 -0600
Message-Id: <1455269758-21882-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 2.5.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH] oeqa/selftest/prservice: Added new tc: check pr-server stop msg
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
X-List-Received-Date: Fri, 12 Feb 2016 09:36:01 -0000

When stopping the prserver using localhost as host, it tries to
find a file '/tmp/PRServer_127.0.0.1_8585.pid' which is not
present on the system.

fix for [YOCTO #8258]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/selftest/prservice.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/prservice.py
index f22288e..53e2388 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -119,3 +119,15 @@ class BitbakePrTests(oeSelfTest):
     @testcase(936)
     def test_pr_service_ipk_arch_indep(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'ipk', 'do_package')
+
+    @testcase(1419)
+    def test_stopping_prservice_message(self):
+        output_msg_passed = 'Waiting for pr-server to exit.'
+        err_msg = 'pidfile /tmp/PRServer_localhost_8585.pid does not exist. Daemon not running?'
+
+        runCmd('bitbake-prserv --host localhost --port 8585 --loglevel=DEBUG --start')
+        ret = runCmd('bitbake-prserv --host localhost --port 8585 --loglevel=DEBUG --stop')
+
+        self.assertNotEqual(ret.output, err_msg)
+        self.assertEqual(ret.output, output_msg_passed)
+
-- 
2.5.0


