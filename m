Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9D75172F96
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 16:02:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 09:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,312,1496127600"; d="scan'208";a="875039522"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Jul 2017 09:02:14 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 09:02:11 -0700
Message-Id: <20170705160211.14865-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] base.bbclass: use d instead on e.data
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
X-List-Received-Date: Wed, 05 Jul 2017 16:02:35 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

According to the bitbake documentation, the "d" global datastore should be
used instead of "e.data" because the latter is deprecated.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/base.bbclass | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3762c8addc..b76be06f60 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -225,18 +225,18 @@ python base_eventhandler() {
     import bb.runqueue
 
     if isinstance(e, bb.event.ConfigParsed):
-        if not e.data.getVar("NATIVELSBSTRING", False):
-            e.data.setVar("NATIVELSBSTRING", lsb_distro_identifier(e.data))
-        e.data.setVar('BB_VERSION', bb.__version__)
-        pkgarch_mapping(e.data)
-        oe.utils.features_backfill("DISTRO_FEATURES", e.data)
-        oe.utils.features_backfill("MACHINE_FEATURES", e.data)
+        if not d.getVar("NATIVELSBSTRING", False):
+            d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
+        d.setVar('BB_VERSION', bb.__version__)
+        pkgarch_mapping(d)
+        oe.utils.features_backfill("DISTRO_FEATURES", d)
+        oe.utils.features_backfill("MACHINE_FEATURES", d)
         # Works with the line in layer.conf which changes PATH to point here
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS', d)
         setup_hosttools_dir(d.getVar('HOSTTOOLS_DIR'), 'HOSTTOOLS_NONFATAL', d, fatal=False)
 
     if isinstance(e, bb.event.BuildStarted):
-        localdata = bb.data.createCopy(e.data)
+        localdata = bb.data.createCopy(d)
         statuslines = []
         for func in oe.data.typed_value('BUILDCFG_FUNCS', localdata):
             g = globals()
@@ -247,7 +247,7 @@ python base_eventhandler() {
                 if flines:
                     statuslines.extend(flines)
 
-        statusheader = e.data.getVar('BUILDCFG_HEADER')
+        statusheader = d.getVar('BUILDCFG_HEADER')
         if statusheader:
             bb.plain('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
 
@@ -255,23 +255,23 @@ python base_eventhandler() {
     # target ones and we'd see dulpicate key names overwriting each other
     # for various PREFERRED_PROVIDERS
     if isinstance(e, bb.event.RecipePreFinalise):
-        if e.data.getVar("TARGET_PREFIX") == e.data.getVar("SDK_PREFIX"):
-            e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils")
-            e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial")
-            e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc")
-            e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++")
-            e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs")
+        if d.getVar("TARGET_PREFIX") == d.getVar("SDK_PREFIX"):
+            d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils")
+            d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial")
+            d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc")
+            d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++")
+            d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs")
 
     if isinstance(e, bb.runqueue.sceneQueueComplete):
-        completions = e.data.expand("${STAGING_DIR}/sstatecompletions")
+        completions = d.expand("${STAGING_DIR}/sstatecompletions")
         if os.path.exists(completions):
             cmds = set()
             with open(completions, "r") as f:
                 cmds = set(f)
-            e.data.setVar("completion_function", "\n".join(cmds))
-            e.data.setVarFlag("completion_function", "func", "1")
+            d.setVar("completion_function", "\n".join(cmds))
+            d.setVarFlag("completion_function", "func", "1")
             bb.debug(1, "Executing SceneQueue Completion commands: %s" % "\n".join(cmds))
-            bb.build.exec_func("completion_function", e.data)
+            bb.build.exec_func("completion_function", d)
             os.remove(completions)
 
     if isinstance(e, bb.event.RecipeParsed):
-- 
2.12.0


