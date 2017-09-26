Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 505E17806E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 20:04:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2017 13:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,441,1500966000"; d="scan'208";a="316505760"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2017 13:04:31 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 13:04:28 -0700
Message-Id: <20170926200429.6248-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [pyro][PATCH 1/2] selftest/cases/signing: ignore removal errors when cleaning temporary gpg directory
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
X-List-Received-Date: Tue, 26 Sep 2017 20:04:30 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The high-level method tempfile.TemporaryDirectory give us no way to
ignore erros on removal thus use tempfile.mkdtemp instead. Ignoring possible issues
on removal is neccesary because it contains gpg sockets that are automatically removed
by the system once the process terminates, otherwise the following log is observed:

  ..
  ..
  File "/usr/lib/python3.5/shutil.py", line 436, in _rmtree_safe_fd
    os.unlink(name, dir_fd=topfd)
  FileNotFoundError: [Errno 2] No such file or directory: 'S.gpg-agent.browser'

[YOCTO #11821]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/signing.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 0ac3d1fac9..38e29305d5 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -21,14 +21,17 @@ class Signing(oeSelfTest):
         if not shutil.which("gpg"):
             raise AssertionError("This test needs GnuPG")
 
-        cls.gpg_home_dir = tempfile.TemporaryDirectory(prefix="oeqa-signing-")
-        cls.gpg_dir = cls.gpg_home_dir.name
+        cls.gpg_dir = tempfile.mkdtemp(prefix="oeqa-signing-")
 
         cls.pub_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.pub")
         cls.secret_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.secret")
 
         runCmd('gpg --batch --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
 
+    @classmethod
+    def tearDownClass(cls):
+        shutil.rmtree(cls.gpg_dir, ignore_errors=True)
+
     @testcase(1362)
     def test_signing_packages(self):
         """
-- 
2.12.3


