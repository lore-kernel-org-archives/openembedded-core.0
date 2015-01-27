Return-Path: <george.l.musat@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 82B0F72CE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 16:10:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Jan 2015 08:05:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,475,1418112000"; d="scan'208";a="643324727"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 27 Jan 2015 08:09:02 -0800
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 46B762C8002;
	Tue, 27 Jan 2015 08:08:54 -0800 (PST)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jan 2015 18:08:09 +0200
Message-Id: <1422374889-6141-2-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1422374889-6141-1-git-send-email-george.l.musat@intel.com>
References: <1422374889-6141-1-git-send-email-george.l.musat@intel.com>
Subject: [PATCH 2/2] oeqa/rpm: Added some new test cases
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
X-List-Received-Date: Tue, 27 Jan 2015 16:10:09 -0000

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 .../packagegroups/packagegroup-core-boot.bbappend  |  1 +
 .../qa-recipes/qa-dependency-test/COPYRIGHT        | 15 ++++++++++++++
 .../qa-dependency-test/qa-dependency-test.sh       |  6 ++++++
 .../qa-recipes/qa-dependency-test_0.1.bb           | 20 +++++++++++++++++++
 meta/lib/oeqa/runtime/rpm.py                       | 23 +++++++++++++++++++++-
 5 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/recipes-test/packagegroups/packagegroup-core-boot.bbappend
 create mode 100644 meta-selftest/recipes-test/qa-recipes/qa-dependency-test/COPYRIGHT
 create mode 100644 meta-selftest/recipes-test/qa-recipes/qa-dependency-test/qa-dependency-test.sh
 create mode 100644 meta-selftest/recipes-test/qa-recipes/qa-dependency-test_0.1.bb

diff --git a/meta-selftest/recipes-test/packagegroups/packagegroup-core-boot.bbappend b/meta-selftest/recipes-test/packagegroups/packagegroup-core-boot.bbappend
new file mode 100644
index 0000000..cf454f2
--- /dev/null
+++ b/meta-selftest/recipes-test/packagegroups/packagegroup-core-boot.bbappend
@@ -0,0 +1 @@
+DEPENDS="qa-dependency-test"
diff --git a/meta-selftest/recipes-test/qa-recipes/qa-dependency-test/COPYRIGHT b/meta-selftest/recipes-test/qa-recipes/qa-dependency-test/COPYRIGHT
new file mode 100644
index 0000000..e462360
--- /dev/null
+++ b/meta-selftest/recipes-test/qa-recipes/qa-dependency-test/COPYRIGHT
@@ -0,0 +1,15 @@
+    This is just an empty recipe for testing purposes.
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License
+    along with this program; if not, write to the Free Software
+    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
diff --git a/meta-selftest/recipes-test/qa-recipes/qa-dependency-test/qa-dependency-test.sh b/meta-selftest/recipes-test/qa-recipes/qa-dependency-test/qa-dependency-test.sh
new file mode 100644
index 0000000..35aedcb
--- /dev/null
+++ b/meta-selftest/recipes-test/qa-recipes/qa-dependency-test/qa-dependency-test.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+while true; do
+    sleep 1
+    false
+done
diff --git a/meta-selftest/recipes-test/qa-recipes/qa-dependency-test_0.1.bb b/meta-selftest/recipes-test/qa-recipes/qa-dependency-test_0.1.bb
new file mode 100644
index 0000000..5982a17
--- /dev/null
+++ b/meta-selftest/recipes-test/qa-recipes/qa-dependency-test_0.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Very basic recipe for testing purposes"
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYRIGHT;md5=dacc408549efc9b488408417196b0724"
+
+PACKAGES += "${PN}-never-installed"
+
+RDEPENDS_${PN} += "${PN}-never-installed"
+
+SRC_URI = "file://qa-dependency-test.sh \
+       file://COPYRIGHT \
+      "
+
+do_install () {
+    install -d ${D}${base_bindir}
+        cp ${WORKDIR}/qa-dependency-test.sh ${D}${base_bindir}/qa-dependency-test.sh
+    chmod +x ${D}${base_bindir}/qa-dependency-test.sh
+}
+
+FILES_${PN} += "$D{base_bindir}/qa-dependency-test.sh"
diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index b17e8b4..ad1435c 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -34,6 +34,9 @@ class RpmInstallRemoveTest(oeRuntimeTest):
         for f in fnmatch.filter(os.listdir(rpmdir), "rpm-doc-*.%s.rpm" % pkgarch):
             testrpmfile = f
         oeRuntimeTest.tc.target.copy_to(os.path.join(rpmdir,testrpmfile), "/tmp/rpm-doc.rpm")
+        for x in fnmatch.filter(os.listdir(rpmdir), "qa-dependency-test-0*.%s.rpm" % pkgarch):
+            testrpmfile = x
+        oeRuntimeTest.tc.target.copy_to(os.path.join(rpmdir,testrpmfile), "/tmp/qa-dependency-test.rpm")
 
     @testcase(192)
     @skipUnlessPassed('test_rpm_help')
@@ -47,7 +50,25 @@ class RpmInstallRemoveTest(oeRuntimeTest):
         (status,output) = self.target.run('rpm -e rpm-doc')
         self.assertEqual(status, 0, msg="Failed to remove rpm-doc package: %s" % output)
 
+    @testcase(1096)
+    @skipUnlessPassed('test_ssh')
+    def test_rpm_query_nonroot(self):
+        (status, output) = self.target.run('useradd test1')
+        self.assertTrue(status == 0, msg="Failed to create new user")
+        (status, output) = self.target.run('sudo -u test1 id')
+        self.assertTrue('(test1)' in output, msg="Failed to execute as new user")
+        (status, output) = self.target.run('sudo -u test1 rpm -qa')
+        self.assertEqual(status, 0, msg="status: %s. Cannot run rpm -qa" % status)
+
+    @testcase(193)
+    @skipUnlessPassed('test_rpm_install')
+    def test_rpm_dependency(self):
+        (status,output) = self.target.run('rpm -ivh /tmp/qa-dependency-test.rpm')
+        self.assertEqual(status, 1, msg="Package should fail to install: %s" % output)
+        self.assertTrue('Failed dependencies' in output, msg="Package should not work because of failed dependencies: %s" % output)
+
     @classmethod
     def tearDownClass(self):
         oeRuntimeTest.tc.target.run('rm -f /tmp/rpm-doc.rpm')
-
+        oeRuntimeTest.tc.target.run('rm -f /tmp/qa-dependency-test.rpm')
+        oeRuntimeTest.tc.target.run('userdel -r test1')
\ No newline at end of file
-- 
2.1.0


