Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 485F573D46
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 11:12:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Feb 2016 03:12:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,440,1449561600"; d="scan'208";a="911322666"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 13 Feb 2016 03:12:33 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 530E06A4004
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 04:00:24 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2016 11:02:11 +0200
Message-Id: <a2d4fad34230f0ed551bb293de06f4b5ad6b3a31.1455353103.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v3 04/14] oe-selftest: remove unused parameter
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
X-List-Received-Date: Sat, 13 Feb 2016 11:12:33 -0000

From: Ed Bartosh <bartosh@gmail.com>

Removed unused parameter 'test' from runqemu function.

(From OE-Core rev: c688b3bcbb57099fa72a9728bc708b109802f7fc)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/devtool.py       | 2 +-
 meta/lib/oeqa/selftest/imagefeatures.py | 6 +++---
 meta/lib/oeqa/utils/commands.py         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index e5a2134..0361464 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1025,7 +1025,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool deploy-target -n %s root@localhost' % testrecipe)
         self.assertIn('  %s' % testfile, result.output)
         # Boot the image
-        with runqemu(testimage, self) as qemu:
+        with runqemu(testimage) as qemu:
             # Now really test deploy-target
             result = runCmd('devtool deploy-target -c %s root@%s' % (testrecipe, qemu.ip))
             # Run a test command to see if it was installed properly
diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index 62ddc52..1c08ce2 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -31,7 +31,7 @@ class ImageFeatures(oeSelfTest):
         # Build a core-image-minimal
         bitbake('core-image-minimal')
 
-        with runqemu("core-image-minimal", self) as qemu:
+        with runqemu("core-image-minimal") as qemu:
             # Attempt to ssh with each user into qemu with empty password
             for user in [self.root_user, self.test_user]:
                 ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
@@ -58,7 +58,7 @@ class ImageFeatures(oeSelfTest):
         # Build a core-image-minimal
         bitbake('core-image-minimal')
 
-        with runqemu("core-image-minimal", self) as qemu:
+        with runqemu("core-image-minimal") as qemu:
             # Attempt to ssh with each user into qemu with empty password
             for user in [self.root_user, self.test_user]:
                 ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
@@ -112,7 +112,7 @@ class ImageFeatures(oeSelfTest):
                 self.fail('No rpm package found in image')
 
         # Now do a couple of runtime tests
-        with runqemu("core-image-minimal", self) as qemu:
+        with runqemu("core-image-minimal") as qemu:
             command = "rpm --version"
             status, output = qemu.run(command)
             self.assertEqual(0, status, 'Failed to run command "%s": %s' % (command, output))
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index dfb6c21..93a0e48 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -178,7 +178,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, test):
+def runqemu(pn):
 
     import bb.tinfoil
     import bb.build
-- 
2.1.4


