Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C89C971A49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 04:00:24 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 30 Oct 2016 21:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,573,1473145200"; d="scan'208";a="25576835"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2016 21:00:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 16:59:46 +1300
Message-Id: <299bdc10f6f62885565d15669097dae33cc60081.1477886344.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] devtool: finish: warn if moving recipe to unconfigured destination layer
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
X-List-Received-Date: Mon, 31 Oct 2016 04:00:24 -0000

If you run devtool finish to move a recipe created in the workspace by
devtool add or devtool upgrade to a layer, and that layer is not
currently included in bblayers.conf (perhaps unintentionally), then the
recipe will no longer be visible to bitbake. In this scenario, show a
warning so that the user isn't surprised by the recipe "going missing".

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 9511d56..c15bfef 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1517,6 +1517,11 @@ def finish(args, config, basepath, workspace):
             destpath = oe.recipeutils.get_bbfile_path(rd, destlayerdir, origrelpath)
             if not destpath:
                 raise DevtoolError("Unable to determine destination layer path - check that %s specifies an actual layer and %s/conf/layer.conf specifies BBFILES. You may also need to specify a more complete path." % (args.destination, destlayerdir))
+            # Warn if the layer isn't in bblayers.conf (the code to create a bbappend will do this in other cases)
+            layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS', True).split()]
+            if not os.path.abspath(destlayerdir) in layerdirs:
+                bb.warn('Specified destination layer is not currently enabled in bblayers.conf, so the %s recipe will now be unavailable in your current configuration until you add the layer there' % args.recipename)
+
         elif destlayerdir == origlayerdir:
             # Same layer, update the original recipe
             appendlayerdir = None
-- 
2.5.5


