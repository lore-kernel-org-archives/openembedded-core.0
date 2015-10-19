Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9787877046
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 13:31:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 19 Oct 2015 06:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,702,1437462000"; d="scan'208";a="796925603"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga001.jf.intel.com with ESMTP; 19 Oct 2015 06:31:11 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 05:22:57 +0000
Message-Id: <29ba7e8deffc6b3380998a72bc528f518fac3335.1445231631.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1445231631.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1445231631.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 1/3] oeqa/selftest: clean up selftest.inc in teardown
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
X-List-Received-Date: Mon, 19 Oct 2015 13:31:17 -0000

From: Ross Burton <ross.burton@intel.com>

Test cases may want to do call bitbake in setUpClass() but at that point the
previous selftest.inc is still present which could change the build
configuration and result in any built artifacts being removed in the next
bitbake invocation as part of the sysroot clean up.

Resolve this by cleaning selftest.inc in the tearDown, the clean in setUp should
be considered a safety net.

[YOCTO #8466]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/base.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index b2faa66..9bddc23 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -31,7 +31,7 @@ class oeSelfTest(unittest.TestCase):
         self.testinc_bblayers_path = os.path.join(self.builddir, "conf/bblayers.inc")
         self.testlayer_path = oeSelfTest.testlayer_path
         self._extra_tear_down_commands = []
-        self._track_for_cleanup = []
+        self._track_for_cleanup = [self.testinc_path]
         super(oeSelfTest, self).__init__(methodName)
 
     def setUp(self):
-- 
1.8.4.5


