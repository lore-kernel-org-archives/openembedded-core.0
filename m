Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B6EB873C48
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 09:53:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2015 02:53:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,656,1422950400"; d="scan'208";a="562337906"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.219])
	by orsmga003.jf.intel.com with ESMTP; 27 Apr 2015 02:53:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2015 10:53:18 +0100
Message-Id: <4d068052803b085151d664d5dc0a8dc8fbdba3c8.1430128109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430128109.git.paul.eggleton@linux.intel.com>
References: <cover.1430128109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430128109.git.paul.eggleton@linux.intel.com>
References: <cover.1430128109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 6/9] devtool: add: use correct bbappend file name with -V option
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
X-List-Received-Date: Mon, 27 Apr 2015 09:53:36 -0000

We weren't adding the version into the bbappend file name when -V was
specified which meant that building or resetting failed.

Also adjust one of the tests so that we're testing devtool add both with
and without this option.

Fixes [YOCTO #7647].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 4 ++--
 scripts/lib/devtool/standard.py   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 1a5eecd..6881835 100644
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
index faf5c92..8932265 100644
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


