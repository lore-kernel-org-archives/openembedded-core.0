Return-Path: <juan.m.cruz.alcaraz@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 837987835B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 01:36:17 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2017 18:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,385,1498546800"; d="scan'208";a="138498653"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by orsmga005.jf.intel.com with ESMTP; 16 Aug 2017 18:36:17 -0700
From: juan.m.cruz.alcaraz@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 18:36:15 -0700
Message-Id: <20170817013615.5900-1-juan.m.cruz.alcaraz@linux.intel.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH v2] devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation.
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
X-List-Received-Date: Thu, 17 Aug 2017 01:36:17 -0000

From: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>

The eSDK installation requires the meta-skeleton layer.
The build system might use the meta-skeleton recipes as layout
to create custom recipes. An example is the recipetool script
that uses the meta-skeleton kernel recipe when creating a custom
kernel recipe.

[YOCTO #11102]

Signed-off-by: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
---
 meta/lib/oe/copy_buildsystem.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index dd506a39e6..4cc8e3dd17 100644
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
@@ -123,6 +127,10 @@ class BuildSystem(object):
                         line = line.replace('workspacelayer', workspace_newname)
                         f.write(line)
 
+        # meta-skeleton layer is added as part of the build system
+        # but not as a layer included in the build, therefore it is
+        # not reported to the function caller.
+        layers_copied.remove('poky/meta-skeleton')
         return layers_copied
 
 def generate_locked_sigs(sigfile, d):
-- 
2.13.2


