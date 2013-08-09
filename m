Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D08076B5DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 15:04:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Aug 2013 08:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,846,1367996400"; d="scan'208";a="378605666"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2013 08:04:39 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 4F98B2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:04:37 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 18:04:32 +0300
Message-Id: <ec7aac7ff30161a4900dbf98c0ba6fb4b7f00a35.1376060086.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1376060086.git.stefanx.stanacar@intel.com>
References: <cover.1376060086.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1376060086.git.stefanx.stanacar@intel.com>
References: <cover.1376060086.git.stefanx.stanacar@intel.com>
Subject: [PATCH 4/4] lib/oeqa/runtime: add new systemd tests
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
X-List-Received-Date: Fri, 09 Aug 2013 15:04:58 -0000

From: Alexandru Palalau <alexandrux.palalau@intel.com>

New systemd runtime tests for enable/disable service, start/stop service and list services.

Signed-off-by: Alexandru Palalau <alexandrux.palalau@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/systemd.py | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index edf4f39..e4f4336 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -22,3 +22,38 @@ class SystemdTests(oeRuntimeTest):
     def test_systemd_failed(self):
         (status, output) = self.target.run('systemctl --failed | grep "0 loaded units listed"')
         self.assertEqual(status, 0, msg="Failed systemd services: %s" % self.target.run('systemctl --failed')[1])
+
+    @skipUnlessPassed('test_systemd_version')
+    def test_systemd_service(self):
+        (status, output) = self.target.run('systemctl list-unit-files | grep "systemd-hostnamed.service"')
+        self.assertEqual(status, 0, msg="systemd-hostnamed.service service is not available.")
+
+    @skipUnlessPassed('test_systemd_service')
+    def test_systemd_stop(self):
+        self.target.run('systemctl stop systemd-hostnamed.service')
+        (status, output) = self.target.run('systemctl show systemd-hostnamed.service | grep "ActiveState" | grep "=inactive"')
+        self.assertEqual(status, 0, msg="systemd-hostnamed.service service could not be stopped.Status and output: %s and %s" % (status, output))
+
+    @skipUnlessPassed('test_systemd_stop')
+    @skipUnlessPassed('test_systemd_version')
+    def test_systemd_start(self):
+        self.target.run('systemctl start systemd-hostnamed.service')
+        (status, output) = self.target.run('systemctl show systemd-hostnamed.service | grep "ActiveState" | grep "=active"')
+        self.assertEqual(status, 0, msg="systemd-hostnamed.service service could not be started. Status and output: %s and %s" % (status, output))
+
+    @skipUnlessPassed('test_systemd_version')
+    def test_systemd_enable(self):
+        self.target.run('systemctl enable machineid.service')
+        (status, output) = self.target.run('systemctl is-enabled machineid.service')
+        self.assertEqual(output, 'enabled', msg="machineid.service service could not be enabled. Status and output: %s and %s" % (status, output))
+
+    @skipUnlessPassed('test_systemd_enable')
+    def test_systemd_disable(self):
+        self.target.run('systemctl disable machineid.service')
+        (status, output) = self.target.run('systemctl is-enabled machineid.service')
+        self.assertEqual(output, 'disabled', msg="machineid.service service could not be disabled. Status and output: %s and %s" % (status, output))
+
+    @skipUnlessPassed('test_systemd_version')
+    def test_systemd_list(self):
+        (status, output) = self.target.run('systemctl list-unit-files')
+        self.assertEqual(status, 0, msg="systemctl list-unit-files command failed. Status:  %s" % status)
-- 
1.8.3.1


