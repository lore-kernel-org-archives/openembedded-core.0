Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4343C7751D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 10:04:08 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 06 Sep 2016 03:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,291,1470726000"; 
   d="scan'208";a="5042769"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2016 03:04:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 22:03:26 +1200
Message-Id: <2374b44b9289aea7fc23c47a71af0526416ec3a8.1473155977.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/9] recipetool: create: support git submodules
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
X-List-Received-Date: Tue, 06 Sep 2016 10:04:08 -0000

Ensure we fetch submodules and set SRC_URI correctly when pointing to a
git repository that contains submodules.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index a08352e..7cbd614 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -399,6 +399,11 @@ def create_recipe(args):
                     if '<html' in f.read(100).lower():
                         logger.error('Fetching "%s" returned a single HTML page - check the URL is correct and functional' % fetchuri)
                         sys.exit(1)
+        if os.path.exists(os.path.join(srctree, '.gitmodules')) and srcuri.startswith('git://'):
+            srcuri = 'gitsm://' + srcuri[6:]
+            logger.info('Fetching submodules...')
+            bb.process.run('git submodule init', cwd=srctree)
+            bb.process.run('git submodule update', cwd=srctree)
 
         if is_package(fetchuri):
             tmpfdir = tempfile.mkdtemp(prefix='recipetool-')
@@ -658,8 +663,11 @@ def create_recipe(args):
             # devtool looks for this specific exit code, so don't change it
             sys.exit(15)
         else:
-            if srcuri and srcuri.startswith(('git://', 'hg://', 'svn://')):
-                outfile = '%s_%s.bb' % (pn, srcuri.split(':', 1)[0])
+            if srcuri and srcuri.startswith(('gitsm://', 'git://', 'hg://', 'svn://')):
+                suffix = srcuri.split(':', 1)[0]
+                if suffix == 'gitsm':
+                    suffix = 'git'
+                outfile = '%s_%s.bb' % (pn, suffix)
             elif realpv:
                 outfile = '%s_%s.bb' % (pn, realpv)
             else:
-- 
2.5.5


