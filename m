Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 40A186B0AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 09:28:06 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2013 02:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,776,1367996400"; d="scan'208";a="275216600"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 02:28:06 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 0B71F6A4092
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 02:28:04 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 12:28:20 +0300
Message-Id: <42a3f746ec638bfb4802ccc4c10f0cbd09de958e.1375176217.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1375176217.git.stefanx.stanacar@intel.com>
References: <cover.1375176217.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1375176217.git.stefanx.stanacar@intel.com>
References: <cover.1375176217.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 4/4] oeqa/runtime/xorg: use the right ps command for xorg test
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
X-List-Received-Date: Tue, 30 Jul 2013 09:28:06 -0000

Use our determined ps command, otherwise test fails for images with procps.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/xorg.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/xorg.py b/meta/lib/oeqa/runtime/xorg.py
index 96cc20a..12dccd8 100644
--- a/meta/lib/oeqa/runtime/xorg.py
+++ b/meta/lib/oeqa/runtime/xorg.py
@@ -11,8 +11,8 @@ class XorgTest(oeRuntimeTest):
 
     @skipUnlessPassed('test_ssh')
     def test_xorg_running(self):
-        (status, output) = self.target.run('ps | grep -v xinit | grep [X]org')
-        self.assertEqual(status, 0, msg="Xorg does not appear to be running %s" % self.target.run('ps')[1])
+        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' |  grep -v xinit | grep [X]org')
+        self.assertEqual(status, 0, msg="Xorg does not appear to be running %s" % self.target.run(oeRuntimeTest.pscmd)[1])
 
     @skipUnlessPassed('test_ssh')
     def test_xorg_error(self):
-- 
1.8.3.1


