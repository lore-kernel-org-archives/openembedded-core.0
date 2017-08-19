Return-Path: <juan.m.cruz.alcaraz@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0D75E78469
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 00:29:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 18 Aug 2017 17:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,394,1498546800"; d="scan'208";a="1184448664"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga001.fm.intel.com with ESMTP; 18 Aug 2017 17:29:56 -0700
From: juan.m.cruz.alcaraz@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Aug 2017 17:29:55 -0700
Message-Id: <20170819002955.42328-1-juan.m.cruz.alcaraz@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v3] devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation.
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
X-List-Received-Date: Sat, 19 Aug 2017 00:29:56 -0000

From: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>

The eSDK installation requires the meta-skeleton layer.
The build system might use the meta-skeleton recipes as layout
to create custom recipes. An example is the recipetool script
that uses the meta-skeleton kernel recipe when creating a custom
kernel recipe.

[YOCTO #11102]

Signed-off-by: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
---
 meta/lib/oe/copy_buildsystem.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index dd506a39e6..a37072a02c 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -32,6 +32,10 @@ class BuildSystem(object):
 
         corebase = os.path.abspath(self.d.getVar('COREBASE'))
         layers.append(corebase)
+        # The bitbake build system uses the meta-skeleton layer as a layout
+        # for common recipies, e.g: the recipetool script to create kernel recipies
+        # Add the meta-skeleton layer to be included as part of the eSDK installation
+        layers.append(os.path.join(corebase, 'meta-skeleton'))
 
         # Exclude layers
         for layer_exclude in self.layers_exclude:
@@ -123,6 +127,14 @@ class BuildSystem(object):
                         line = line.replace('workspacelayer', workspace_newname)
                         f.write(line)
 
+        # meta-skeleton layer is added as part of the build system
+        # but not as a layer included in the build, therefore it is
+        # not reported to the function caller.
+        for layer in layers_copied:
+            if layer.endswith('/meta-skeleton'):
+                layers_copied.remove(layer)
+                break
+
         return layers_copied
 
 def generate_locked_sigs(sigfile, d):
-- 
2.12.3


