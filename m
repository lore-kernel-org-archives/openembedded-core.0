Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD02673D85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 16:19:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Apr 2015 09:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,632,1422950400"; d="scan'208";a="484753714"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 09:18:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 17:18:30 +0100
Message-Id: <8ad323c0dcfe7b2096d1642417a511cbccc36bc8.1429805738.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/8] devtool: add: use correct bbappend file name with -V option
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
X-List-Received-Date: Thu, 23 Apr 2015 16:19:13 -0000

We weren't adding the version into the bbappend file name which meant
that building or resetting failed.

Also adjust one of the tests so that we're testing devtool add both with
and without this option.

Fixes [YOCTO #7647].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 4 ++--
 scripts/lib/devtool/standard.py   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index aa5bd76..91d4c39 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -150,10 +150,10 @@ class DevtoolTests(oeSelfTest):
         result = runCmd('tar xfv libftdi1-1.1.tar.bz2', cwd=tempdir)
         srcdir = os.path.join(tempdir, 'libftdi1-1.1')
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'CMakeLists.txt')), 'Unable to find CMakeLists.txt in source directory')
-        # Test devtool add
+        # Test devtool add (and use -V so we test that too)
         self.track_for_cleanup(workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add libftdi %s' % srcdir)
+        result = runCmd('devtool add libftdi %s -V 1.1' % srcdir)
         self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
         # Test devtool status
         result = runCmd('devtool status')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 9abdbd4..8fa9e6f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -73,7 +73,7 @@ def add(args, config, basepath, workspace):
         (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
         initial_rev = stdout.rstrip()
 
-    appendfile = os.path.join(appendpath, '%s.bbappend' % args.recipename)
+    appendfile = os.path.join(appendpath, '%s.bbappend' % bp)
     with open(appendfile, 'w') as f:
         f.write('inherit externalsrc\n')
         f.write('EXTERNALSRC = "%s"\n' % srctree)
-- 
2.1.0


