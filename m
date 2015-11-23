Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E544B62131
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:11:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:10:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213403"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:10:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:28 +1300
Message-Id: <7fe75c2836eb209f46ab0f0a19a4c4415f0c5ad0.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/18] devtool: drop unused plugin_init() functions
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
X-List-Received-Date: Mon, 23 Nov 2015 02:11:11 -0000

This function is no longer required to be defined for a plugin, so drop
it where it's a no-op.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/build.py        | 4 ----
 scripts/lib/devtool/package.py      | 4 ----
 scripts/lib/devtool/sdk.py          | 4 ----
 scripts/lib/devtool/upgrade.py      | 4 ----
 scripts/lib/recipetool/newappend.py | 5 -----
 5 files changed, 21 deletions(-)

diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index 9b58858..62d8599 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -25,10 +25,6 @@ from devtool import exec_build_env_command, check_workspace_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
-def plugin_init(pluginlist):
-    """Plugin initialization"""
-    pass
-
 def _create_conf_file(values, conf_file=None):
     if not conf_file:
         fd, conf_file = tempfile.mkstemp(suffix='.conf')
diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index 53d3dc7..a296fce 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -24,10 +24,6 @@ from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recip
 
 logger = logging.getLogger('devtool')
 
-def plugin_init(pluginlist):
-    """Plugin initialization"""
-    pass
-
 def package(args, config, basepath, workspace):
     """Entry point for the devtool 'package' subcommand"""
     check_workspace_recipe(workspace, args.recipename)
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 7a842af..85c0fb1 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -11,10 +11,6 @@ from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
 
 logger = logging.getLogger('devtool')
 
-def plugin_init(pluginlist):
-    """Plugin initialization"""
-    pass
-
 def parse_locked_sigs(sigfile_path):
     """Return <pn:task>:<hash> dictionary"""
     sig_dict = {}
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 9d9ab0f..761aa99 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -33,10 +33,6 @@ from devtool import exec_build_env_command, setup_tinfoil, DevtoolError, parse_r
 
 logger = logging.getLogger('devtool')
 
-def plugin_init(pluginlist):
-    """Plugin initialization"""
-    pass
-
 def _run(cmd, cwd=''):
     logger.debug("Running command %s> %s" % (cwd,cmd))
     return bb.process.run('%s' % cmd, cwd=cwd)
diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
index 77b74cb..4eeac0e 100644
--- a/scripts/lib/recipetool/newappend.py
+++ b/scripts/lib/recipetool/newappend.py
@@ -32,11 +32,6 @@ logger = logging.getLogger('recipetool')
 tinfoil = None
 
 
-def plugin_init(pluginlist):
-    # Don't need to do anything here right now, but plugins must have this function defined
-    pass
-
-
 def tinfoil_init(instance):
     global tinfoil
     tinfoil = instance
-- 
2.1.0


