Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 382FE771B9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316025"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:22:58 -0700
Message-Id: <26522368766ff1c565a2bc4f0bd97a3e9f4b7a21.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 10/20] oeqa.selftest.lic-checksum: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:21 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/conf/lic-checksum.conf |  4 ++++
 meta/lib/oeqa/selftest/lic-checksum.py        | 22 ++++++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/lic-checksum.conf

diff --git a/meta/lib/oeqa/selftest/conf/lic-checksum.conf b/meta/lib/oeqa/selftest/conf/lic-checksum.conf
new file mode 100644
index 0000000..262b8b1
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/lic-checksum.conf
@@ -0,0 +1,4 @@
+[LicenseTests]
+nonmatching_checksum_bitbake_cmd = -c populate_lic emptytest
+nonmatching_checksum_error_msg = emptytest: The new md5 checksum is 8d777f385d3dfec8815d20f7496026dc
+nonmatching_checksum_lic_path_md5 = d41d8cd98f00b204e9800998ecf8427e
diff --git a/meta/lib/oeqa/selftest/lic-checksum.py b/meta/lib/oeqa/selftest/lic-checksum.py
index df44c97..78590fc 100644
--- a/meta/lib/oeqa/selftest/lic-checksum.py
+++ b/meta/lib/oeqa/selftest/lic-checksum.py
@@ -5,25 +5,35 @@ from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import bitbake
 from oeqa.utils import CommandError
 from oeqa.utils.decorators import testcase
+from oeqa.utils.readconfig import conffile
+
 
 class LicenseTests(oeSelfTest):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+
     # Verify that changing a license file that has an absolute path causes
     # the license qa to fail due to a mismatched md5sum.
     @testcase(1197)
     def test_nonmatching_checksum(self):
-        bitbake_cmd = '-c populate_lic emptytest'
-        error_msg = 'emptytest: The new md5 checksum is 8d777f385d3dfec8815d20f7496026dc'
-
+        bitbake_cmd = self.config.get(
+                    'LicenseTests', 'nonmatching_checksum_bitbake_cmd')
+        error_msg = self.config.get(
+                  'LicenseTests', 'nonmatching_checksum_error_msg')
+        lic_path_md5 = self.config.get(
+                     'LicenseTests', 'nonmatching_checksum_lic_path_md5')
         lic_file, lic_path = tempfile.mkstemp()
         os.close(lic_file)
         self.track_for_cleanup(lic_path)
 
         self.write_recipeinc('emptytest', """
 INHIBIT_DEFAULT_DEPS = "1"
-LIC_FILES_CHKSUM = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
-SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
-""" % (lic_path, lic_path))
+LIC_FILES_CHKSUM = "file://%s;md5=%s"
+SRC_URI = "file://%s;md5=%s"
+""" % (lic_path, lic_path_md5, lic_path, lic_path_md5))
         result = bitbake(bitbake_cmd)
 
         with open(lic_path, "w") as f:
-- 
1.8.3.1


