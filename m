Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D037D784E8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:56:50 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:56:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401069"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:56:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:14 +1300
Message-Id: <b5c5c1c3bc7aac3c537b721abdf9dd443fd2ad49.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/24] devtool: finish: fix "layer not in bblayers.conf" warning when path specified
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
X-List-Received-Date: Thu, 09 Nov 2017 01:56:50 -0000

devtool finish will check if the destination layer is part of
bblayers.conf so that we avoid the user getting confused about the
recipe vanishing from their configuration if it isn't. devtool finish
also accepts a path underneath a layer so that you have a bit
more control over where it ends up. However if you used a path
underneath a layer then it wasn't converting this to the base of the
layer before checking it against BBLAYERS, thus the warning was being
shown erroneously in that case.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7fee304..166862f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1714,6 +1714,8 @@ def finish(args, config, basepath, workspace):
                 elif line.startswith('# original_files:'):
                     origfilelist = line.split(':')[1].split()
 
+        destlayerbasedir = oe.recipeutils.find_layerdir(destlayerdir)
+
         if origlayerdir == config.workspace_path:
             # Recipe file itself is in workspace, update it there first
             appendlayerdir = None
@@ -1727,7 +1729,7 @@ def finish(args, config, basepath, workspace):
                 raise DevtoolError("Unable to determine destination layer path - check that %s specifies an actual layer and %s/conf/layer.conf specifies BBFILES. You may also need to specify a more complete path." % (args.destination, destlayerdir))
             # Warn if the layer isn't in bblayers.conf (the code to create a bbappend will do this in other cases)
             layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS').split()]
-            if not os.path.abspath(destlayerdir) in layerdirs:
+            if not os.path.abspath(destlayerbasedir) in layerdirs:
                 bb.warn('Specified destination layer is not currently enabled in bblayers.conf, so the %s recipe will now be unavailable in your current configuration until you add the layer there' % args.recipename)
 
         elif destlayerdir == origlayerdir:
@@ -1740,7 +1742,7 @@ def finish(args, config, basepath, workspace):
             destpath = None
 
         # Remove any old files in the case of an upgrade
-        if origpath and origfilelist and oe.recipeutils.find_layerdir(origpath) == oe.recipeutils.find_layerdir(destlayerdir):
+        if origpath and origfilelist and oe.recipeutils.find_layerdir(origpath) == destlayerbasedir:
             for fn in origfilelist:
                 fnp = os.path.join(origpath, fn)
                 try:
-- 
2.9.5


