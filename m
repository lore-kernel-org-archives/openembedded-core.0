Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E899B77E99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 14:32:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Aug 2017 07:32:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,409,1498546800"; d="scan'208";a="1208420809"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2017 07:32:58 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 07:32:55 -0700
Message-Id: <20170821143256.139578-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v2 1/2] devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation.
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
X-List-Received-Date: Mon, 21 Aug 2017 14:32:58 -0000

From: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>

The eSDK installation requires the meta-skeleton layer.
The build system might use the meta-skeleton recipes as layout
to create custom recipes. An example is the recipetool script
that uses the meta-skeleton kernel recipe when creating a custom
kernel recipe.

[YOCTO #11102]

(From OE-Core rev: 5c9ef0734d23909b5694ed43cdbb205c2ba9ca95)

Signed-off-by: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/copy_buildsystem.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index e24488db10..ac2fae1ed1 100644
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
@@ -128,6 +132,14 @@ class BuildSystem(object):
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


