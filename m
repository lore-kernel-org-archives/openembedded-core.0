Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7B31474C4D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 10:03:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Aug 2018 03:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,301,1531810800"; d="scan'208";a="252829020"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 29 Aug 2018 03:03:44 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 17:48:21 +0800
Message-Id: <1535536101-89233-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oeqa/runtime/dnf: Make sure test_dnf_install does not skipped
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
X-List-Received-Date: Wed, 29 Aug 2018 10:03:44 -0000

During debugging dnf issue, we found that the test_dnf_install
PASSED the testing even though the environment does not allow
dnf install to run successfully. Further debugging had identified
that current test_dnf_install will execute dnf install even when
the package to be installed already exist, thus dnf install
will just skipped and this test will PASSED even though it was
not.

To solve this, added additional logic to check if the package
to be installed already exist, if yes then remove the package
before actually run dnf install. This will make sure dnf install
was tested as expected.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/dnf.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 67484bc..e93a1ce 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -67,7 +67,8 @@ class DnfRepoTest(DnfTest):
         deploy_url = 'http://%s:%s/' %(self.target.server_ip, self.repo_server.port)
         cmdlinerepoopts = ["--repofrompath=oe-testimage-repo-%s,%s%s" %(arch, deploy_url, arch) for arch in pkgarchs]
 
-        self.dnf(" ".join(cmdlinerepoopts) + " --nogpgcheck " + command)
+        output = self.dnf(" ".join(cmdlinerepoopts) + " --nogpgcheck " + command)
+        return output
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
     @OETestID(1744)
@@ -88,6 +89,9 @@ class DnfRepoTest(DnfTest):
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
     @OETestID(1740)
     def test_dnf_install(self):
+        output = self.dnf_with_repo('list run-postinsts-dev')
+        if 'Installed Packages' in output:
+            self.dnf_with_repo('remove -y run-postinsts-dev')
         self.dnf_with_repo('install -y run-postinsts-dev')
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
-- 
2.7.4


