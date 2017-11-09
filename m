Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id ABA8978533
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:57:01 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:57:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401098"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:57:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:17 +1300
Message-Id: <6ee2341dd2d80a35f15478104e792fe5165bd1fb.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 16/24] devtool: stop always moving workspace to end of BBLAYERS
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
X-List-Received-Date: Thu, 09 Nov 2017 01:57:01 -0000

I noticed that using bitbake-layers add-layer followed by a devtool
command resulted in bitbake re-parsing all of the recipes, which is
annoying. Upon closer inspection I could see that devtool was moving the
workspace layer path to the end of BBLAYERS if it happened to be
somewhere in the middle - there's no need for it to be doing this. This
occurred because we were passing the current workspace path to remove
and the "new" path to add even if the path is not being changed, and I
think earlier versions of bb.utils.edit_bblayers_conf() didn't move the
existing entry under these circumstances as it clearly does now. Fix it
so we only pass the path to be removed if we're actually changing the
path.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/devtool b/scripts/devtool
index 87bb5c8..a651d8f 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -189,7 +189,11 @@ def _enable_workspace_layer(workspacedir, config, basepath):
     if not os.path.exists(bblayers_conf):
         logger.error('Unable to find bblayers.conf')
         return
-    _, added = bb.utils.edit_bblayers_conf(bblayers_conf, workspacedir, config.workspace_path)
+    if os.path.abspath(workspacedir) != os.path.abspath(config.workspace_path):
+        removedir = config.workspace_path
+    else:
+        removedir = None
+    _, added = bb.utils.edit_bblayers_conf(bblayers_conf, workspacedir, removedir)
     if added:
         logger.info('Enabling workspace layer in bblayers.conf')
     if config.workspace_path != workspacedir:
-- 
2.9.5


