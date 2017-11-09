Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DFAF8784FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:57:19 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:57:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401169"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:57:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:22 +1300
Message-Id: <5dfcdb113ef4e28216fd18fc380d35ea0d0c59cd.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 21/24] devtool: show a better error message if meta-files aren't found
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
X-List-Received-Date: Thu, 09 Nov 2017 01:57:20 -0000

If the files that the devtool-source class is supposed to create in the
source tree aren't found in the temporary directory then we know that
the class hasn't worked properly - say that explicitly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 5ac678b..1e7d707 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -544,11 +544,14 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         if not res:
             raise DevtoolError('Extracting source for %s failed' % pn)
 
-        with open(os.path.join(tempdir, 'initial_rev'), 'r') as f:
-            initial_rev = f.read()
+        try:
+            with open(os.path.join(tempdir, 'initial_rev'), 'r') as f:
+                initial_rev = f.read()
 
-        with open(os.path.join(tempdir, 'srcsubdir'), 'r') as f:
-            srcsubdir = f.read()
+            with open(os.path.join(tempdir, 'srcsubdir'), 'r') as f:
+                srcsubdir = f.read()
+        except FileNotFoundError as e:
+            raise DevtoolError('Something went wrong with source extraction - the devtool-source class was not active or did not function correctly:\n%s' % str(e))
         srcsubdir_rel = os.path.relpath(srcsubdir, os.path.join(tempdir, 'workdir'))
 
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
-- 
2.9.5


