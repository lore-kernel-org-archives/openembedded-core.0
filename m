Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4FF6E5CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:10:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:10:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213332"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:10:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:23 +1300
Message-Id: <59b2e3ffd9b0f01fd59e5f61ef99919e9ef2a0f3.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/18] devtool: upgrade: fetch remote repository before checking out new revision
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
X-List-Received-Date: Mon, 23 Nov 2015 02:10:38 -0000

If we're upgrading a recipe that fetches from git, and we've simply
fetched a tarball of the repo instead of directly from the upstream repo
(this can happen if you have PREMIRRORS set up as in poky with a core recipe,
e.g. kernelshark) then we won't have any new revisions, and the checkout
will fail with "fatal: reference is not a tree: <hash>". To avoid this,
do a "git fetch" before checking out the new revision.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index f033fc8..6bac44b 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -199,6 +199,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
     if srcrev:
         rev = srcrev
     if uri.startswith('git://'):
+        __run('git fetch')
         __run('git checkout %s' % rev)
         __run('git tag -f devtool-base-new')
         md5 = None
-- 
2.1.0


