Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3013A755F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 10:08:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 11 Sep 2015 03:08:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,511,1437462000"; d="scan'208";a="559698883"
Received: from unknown (HELO marquiz.fi.intel.com) ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Sep 2015 03:08:09 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Sep 2015 13:08:08 +0300
Message-Id: <1441966088-2657-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] devtool: update-recipe: get srcuri parameters with decodeurl()
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
X-List-Received-Date: Fri, 11 Sep 2015 10:08:11 -0000

Use already existing bb.fetch.decodeurl() for getting the parameters for
a URI. This is more fault tolerant and maintainable.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4702491..20a7fe2 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -766,11 +766,8 @@ def _guess_recipe_update_mode(srctree, rdata):
     # Just use the first URI for now
     uri = git_uris[0]
     # Check remote branch
-    upstr_branch = 'master'
-    for paramdef in uri.split(';')[1:]:
-        name, value = paramdef.split('=', 1)
-        if name == 'branch':
-            upstr_branch = value
+    params = bb.fetch.decodeurl(uri)[5]
+    upstr_branch = params['branch'] if 'branch' in params else 'master'
     # Check if current branch HEAD is found in upstream branch
     stdout, _ = bb.process.run('git rev-parse HEAD', cwd=srctree)
     head_rev = stdout.rstrip()
-- 
2.1.4


