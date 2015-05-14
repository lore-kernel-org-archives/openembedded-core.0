Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 90B5473D7E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 17:45:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2015 10:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="694963969"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2015 10:46:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 18:45:12 +0100
Message-Id: <48b8ce05a943c820f9b50dfe02888b6797ca0522.1431625238.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 9/9] devtool: if workspace layer exists, still ensure it's in bblayers.conf
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
X-List-Received-Date: Thu, 14 May 2015 17:45:58 -0000

When we run devtool, if the workspace layer already exists but isn't in
bblayers.conf (perhaps because it was previously created but
subsequently removed from bblayers.conf by the user) then we should add
it and notify the user, otherwise devtool operations won't work.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 841831c..0100eb8 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -2,7 +2,7 @@
 
 # OpenEmbedded Development tool
 #
-# Copyright (C) 2014 Intel Corporation
+# Copyright (C) 2014-2015 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -99,6 +99,8 @@ def read_workspace():
         else:
             logger.info('Creating workspace layer in %s' % config.workspace_path)
             _create_workspace(config.workspace_path, config, basepath)
+    if not context.fixed_setup:
+        _enable_workspace_layer(config.workspace_path, config, basepath)
 
     logger.debug('Reading workspace in %s' % config.workspace_path)
     externalsrc_re = re.compile(r'^EXTERNALSRC(_pn-[^ =]+)? =.*$')
@@ -116,9 +118,11 @@ def create_workspace(args, config, basepath, workspace):
         workspacedir = os.path.abspath(args.layerpath)
     else:
         workspacedir = os.path.abspath(os.path.join(basepath, 'workspace'))
-    _create_workspace(workspacedir, config, basepath, args.create_only)
+    _create_workspace(workspacedir, config, basepath)
+    if not args.create_only:
+        _enable_workspace_layer(workspacedir, config, basepath)
 
-def _create_workspace(workspacedir, config, basepath, create_only=False):
+def _create_workspace(workspacedir, config, basepath):
     import bb
 
     confdir = os.path.join(workspacedir, 'conf')
@@ -146,17 +150,21 @@ def _create_workspace(workspacedir, config, basepath, create_only=False):
             f.write('\nIf you no longer need to use devtool you can remove the path to this\n')
             f.write('workspace layer from your conf/bblayers.conf file (and then delete the\n')
             f.write('layer, if you wish).\n')
-    if not create_only:
-        # Add the workspace layer to bblayers.conf
-        bblayers_conf = os.path.join(basepath, 'conf', 'bblayers.conf')
-        if not os.path.exists(bblayers_conf):
-            logger.error('Unable to find bblayers.conf')
-            return -1
-        bb.utils.edit_bblayers_conf(bblayers_conf, workspacedir, config.workspace_path)
-        if config.workspace_path != workspacedir:
-            # Update our config to point to the new location
-            config.workspace_path = workspacedir
-            config.write()
+
+def _enable_workspace_layer(workspacedir, config, basepath):
+    """Ensure the workspace layer is in bblayers.conf"""
+    import bb
+    bblayers_conf = os.path.join(basepath, 'conf', 'bblayers.conf')
+    if not os.path.exists(bblayers_conf):
+        logger.error('Unable to find bblayers.conf')
+        return -1
+    _, added = bb.utils.edit_bblayers_conf(bblayers_conf, workspacedir, config.workspace_path)
+    if added:
+        logger.info('Enabling workspace layer in bblayers.conf')
+    if config.workspace_path != workspacedir:
+        # Update our config to point to the new location
+        config.workspace_path = workspacedir
+        config.write()
 
 
 def main():
-- 
2.1.0


