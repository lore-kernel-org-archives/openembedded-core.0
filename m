Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB5776F9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:51:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2015 06:51:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,612,1437462000"; d="scan'208";a="816336294"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 30 Sep 2015 06:51:54 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2015 16:51:53 +0300
Message-Id: <1443621113-4568-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH] devtool: update-recipe: enable var history tracking
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
X-List-Received-Date: Wed, 30 Sep 2015 13:51:56 -0000

Enable variable history tracking so that the variables are updated in
the correct file - i.e. in the file they are already defined.

[YOCTO #7715]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 4 ++--
 scripts/lib/devtool/standard.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 7b1ab11..844aa12 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -96,7 +96,7 @@ def exec_fakeroot(d, cmd, **kwargs):
             newenv[splitval[0]] = splitval[1]
     return subprocess.call("%s %s" % (fakerootcmd, cmd), env=newenv, **kwargs)
 
-def setup_tinfoil(config_only=False, basepath=None):
+def setup_tinfoil(config_only=False, basepath=None, tracking=False):
     """Initialize tinfoil api from bitbake"""
     import scriptpath
     orig_cwd = os.path.abspath(os.curdir)
@@ -108,7 +108,7 @@ def setup_tinfoil(config_only=False, basepath=None):
         sys.exit(1)
 
     import bb.tinfoil
-    tinfoil = bb.tinfoil.Tinfoil()
+    tinfoil = bb.tinfoil.Tinfoil(tracking=tracking)
     tinfoil.prepare(config_only)
     tinfoil.logger.setLevel(logger.getEffectiveLevel())
     os.chdir(orig_cwd)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1dcf7cd..686c9d9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -797,7 +797,7 @@ def update_recipe(args, config, basepath, workspace):
             raise DevtoolError('conf/layer.conf not found in bbappend '
                                'destination layer "%s"' % args.append)
 
-    tinfoil = setup_tinfoil(basepath=basepath)
+    tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
 
     rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
-- 
2.1.4


