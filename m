Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B1B66784F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 11:35:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 04:35:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1205843509"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2017 04:35:06 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 14:34:56 +0300
Message-Id: <50ae05ce598f1a8890edecbfe2121ab6819b3747.1502795847.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
References: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v4 7/8] oeqa: fix temp file handling in dnf package feed test
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
X-List-Received-Date: Tue, 15 Aug 2017 11:35:05 -0000

Prevent stale temp files and a possible (if unlikely) race in tempfile
usage.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index 123e7259f1..68e56f2c5e 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -6,6 +6,8 @@ class DnfSelftest(DnfTest):
 
     @classmethod
     def setUpClass(cls):
+        import tempfile
+        cls.temp_dir = tempfile.TemporaryDirectory(prefix="oeqa-remotefeeds-")
         cls.repo_server = HTTPService(os.path.join(cls.tc.td['WORKDIR'], 'oe-rootfs-repo'),
                                       cls.tc.target.server_ip)
         cls.repo_server.start()
@@ -13,6 +15,7 @@ class DnfSelftest(DnfTest):
     @classmethod
     def tearDownClass(cls):
         cls.repo_server.stop()
+        cls.temp_dir.cleanup()
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
     def test_verify_package_feeds(self):
@@ -25,11 +28,11 @@ class DnfSelftest(DnfTest):
         """
         # When we created an image, we had to supply fake ip and port
         # for the feeds. Now we can patch the real ones into the config file.
-        import tempfile
-        temp_file = tempfile.TemporaryDirectory(prefix="oeqa-remotefeeds-").name
+        temp_file = os.path.join(self.temp_dir.name, 'tmp.repo')
         self.tc.target.copyFrom("/etc/yum.repos.d/oe-remote-repo.repo", temp_file)
         fixed_config = open(temp_file, "r").read().replace("bogus_ip", self.tc.target.server_ip).replace("bogus_port", str(self.repo_server.port))
-        open(temp_file, "w").write(fixed_config)
+        with open(temp_file, "w") as f:
+            f.write(fixed_config)
         self.tc.target.copyTo(temp_file, "/etc/yum.repos.d/oe-remote-repo.repo")
 
         import re
-- 
2.12.3


