Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5347A7898A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 08:49:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Mar 2018 00:49:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,411,1515484800"; d="scan'208";a="208269202"
Received: from echidna.jf.intel.com ([10.54.77.42])
	by fmsmga005.fm.intel.com with ESMTP; 02 Mar 2018 00:49:19 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 17:35:36 -0800
Message-Id: <1519954537-109282-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oeqa/runtime/apt.py: add runtime test for apt
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
X-List-Received-Date: Fri, 02 Mar 2018 08:49:20 -0000

Add runtime test for apt to test that it can install deb
package from remote source.

[YOCTO# 11488]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/apt.py | 47 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/apt.py

diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
new file mode 100644
index 0000000..8d4dd35
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -0,0 +1,47 @@
+import os
+from oeqa.utils.httpserver import HTTPService
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class AptTest(OERuntimeTestCase):
+
+    def pkg(self, command, expected = 0):
+        command = 'apt-get %s' % command
+        status, output = self.target.run(command, 1500)
+        message = os.linesep.join([command, output])
+        self.assertEqual(status, expected, message)
+        return output
+
+class AptRepoTest(AptTest):
+
+    @classmethod
+    def setUpClass(cls):
+        service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], 'all')
+        cls.repo_server = HTTPService(service_repo, cls.tc.target.server_ip)
+        cls.repo_server.start()
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.repo_server.stop()
+
+    def setup_source_config_for_package_install(self):
+        apt_get_source_server = 'http://%s:%s/' % (self.tc.target.server_ip, self.repo_server.port)
+        apt_get_sourceslist_dir = '/etc/apt/'
+        self.target.run('cd %s; echo deb %s ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
+
+    def cleanup_source_config_for_package_install(self):
+        apt_get_sourceslist_dir = '/etc/apt/'
+        self.target.run('cd %s; rm sources.list' % (apt_get_sourceslist_dir))
+
+    @skipIfNotFeature('package-management',
+                      'Test requires package-management to be in IMAGE_FEATURES')
+    @skipIfNotDataVar('IMAGE_PKGTYPE', 'deb',
+                      'DEB is not the primary package manager')
+    @OEHasPackage(['apt'])
+    def test_apt_install_from_repo(self):
+        self.setup_source_config_for_package_install()
+        self.pkg('update')
+        self.pkg('remove --yes run-postinsts-dev')
+        self.pkg('install --yes --allow-unauthenticated run-postinsts-dev')
+        self.cleanup_source_config_for_package_install()
-- 
2.7.4


