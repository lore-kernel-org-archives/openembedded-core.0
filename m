Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8A56B4CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 08:35:42 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Jul 2013 01:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,776,1367996400"; d="scan'208";a="338899930"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2013 01:35:42 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 898C62C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 01:35:37 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 11:35:54 +0300
Message-Id: <edec10deb2863c79750af25b31d39f7d0904c8a8.1375171561.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1375171561.git.stefanx.stanacar@intel.com>
References: <cover.1375171561.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1375171561.git.stefanx.stanacar@intel.com>
References: <cover.1375171561.git.stefanx.stanacar@intel.com>
Subject: [PATCH 4/4] oeqa/runtime/xorg: use the right ps command for xorg test
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
X-List-Received-Date: Tue, 30 Jul 2013 08:35:42 -0000

Use our determined ps command, otherwise test fails for images with procps.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/xorg.py     | 4 ++--
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

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
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 45b3ccb..426af01 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -25,7 +25,7 @@ class QemuRunner:
         self.rootfs = rootfs
 
         self.streampath = '/tmp/qemuconnection.%s' % os.getpid()
-        self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8" qemuparams="-serial unix:%s,server,nowait"' % self.streampath
+        self.qemuparams = 'nographic bootparams="console=tty1 console=ttyS0,115200n8" qemuparams="-serial unix:%s,server,nowait"' % self.streampath
         self.qemupid = None
         self.ip = None
 
-- 
1.8.3.1


