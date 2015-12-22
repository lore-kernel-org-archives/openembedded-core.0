Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1E417731E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:05:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:05:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979310"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:05:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:14 +1300
Message-Id: <b99f4df5965d5f5b14f49a1c8a4495201769180e.1450756556.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 21/26] devtool: reset: print message about leaving source tree behind
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
X-List-Received-Date: Tue, 22 Dec 2015 04:05:10 -0000

We deliberately leave the source tree alone when resetting in case it
contains any work in progress belonging to the user; tell them that
we're doing this so they aren't surprised about it still existing later
on.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ed9e793..a9c4cf8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1229,6 +1229,17 @@ def reset(args, config, basepath, workspace):
         # We don't automatically create this dir next to appends, but the user can
         preservedir(os.path.join(config.workspace_path, 'appends', pn))
 
+        srctree = workspace[pn]['srctree']
+        if os.path.isdir(srctree):
+            if os.listdir(srctree):
+                # We don't want to risk wiping out any work in progress
+                logger.info('Leaving source tree %s as-is; if you no '
+                            'longer need it then please delete it manually'
+                            % srctree)
+            else:
+                # This is unlikely, but if it's empty we can just remove it
+                os.rmdir(srctree)
+
     return 0
 
 
-- 
2.5.0


