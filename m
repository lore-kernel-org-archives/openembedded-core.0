Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8EC6FF97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:14:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 20 Mar 2016 22:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="938122186"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2016 22:14:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:14:05 +1300
Message-Id: <d52615af439cb62736ca45b5b170ae95fecb3999.1458537176.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/9] devtool: add: create git repository if URL specified as positional argument
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
X-List-Received-Date: Mon, 21 Mar 2016 05:14:35 -0000

When we add from a fetched URL we are supposed to turn the resulting
source tree into a git repository (if it isn't already one). However, we
were using the older deprecated option name here instead of the
positional argument, so "devtool add -f <url>" resulted in the repo
being created but "devtool add <url>" didn't, which was wrong.

Also update the oe-selftest tests to check that this worked.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 2 ++
 scripts/lib/devtool/standard.py   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 2e4b6da..fe9f7f7 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -301,6 +301,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
         self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created. %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'setup.py')), 'Unable to find setup.py in source directory')
+        self.assertTrue(os.path.isdir(os.path.join(srcdir, '.git')), 'git repository for external source tree was not created')
         # Test devtool status
         result = runCmd('devtool status')
         self.assertIn(testrecipe, result.output)
@@ -394,6 +395,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool add %s' % url)
         self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created. %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure')), 'Unable to find configure script in source directory')
+        self.assertTrue(os.path.isdir(os.path.join(srcdir, '.git')), 'git repository for external source tree was not created')
         # Test devtool status
         result = runCmd('devtool status')
         self.assertIn(testrecipe, result.output)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 9ac2ad5..f3f3e98 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -205,7 +205,7 @@ def add(args, config, basepath, workspace):
     for fn in os.listdir(recipedir):
         _add_md5(config, recipename, os.path.join(recipedir, fn))
 
-    if args.fetch and not args.no_git:
+    if args.fetchuri and not args.no_git:
         setup_git_repo(srctree, args.version, 'devtool')
 
     initial_rev = None
-- 
2.5.5


