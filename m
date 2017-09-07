Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CFE2577CF6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 20:44:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Sep 2017 13:44:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,360,1500966000"; d="scan'208";a="1170135609"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2017 13:44:06 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Sep 2017 15:52:54 -0500
Message-Id: <20170907205254.4593-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] selftest/cases/signing: ignore removal errors when cleaning temporary gpg directory
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
X-List-Received-Date: Thu, 07 Sep 2017 20:44:05 -0000

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
 meta/lib/oeqa/selftest/cases/signing.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index edb5f653f2..b3d1a8292e 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -22,14 +22,17 @@ class Signing(OESelftestTestCase):
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
     @OETestID(1362)
     def test_signing_packages(self):
         """
-- 
2.11.0


