Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 079E271AB3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 06:19:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAH6JiYc021962
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 22:19:44 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 16 Nov 2016 22:19:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2016 22:19:37 -0800
Message-ID: <9003b14f4bb043c0eee17488ce40e4a72fbbcd56.1479363545.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1479363545.git.liezhi.yang@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN
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
X-List-Received-Date: Thu, 17 Nov 2016 06:19:43 -0000
Content-Type: text/plain

It is helpful we want to exclude a lot of layers.
It uses python re, and supports multiple patterns (separated by space).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/copy_buildsystem.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 29ac6d4..e5d00c7 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -1,5 +1,12 @@
 # This class should provide easy access to the different aspects of the
 # buildsystem such as layers, bitbake location, etc.
+#
+# SDK_LAYERS_EXCLUDE: Layers which will be excluded from SDK layers.
+# SDK_LAYERS_EXCLUDE_PATTERN: The simiar to SDK_LAYERS_EXCLUDE, this supports
+#                             python regular expression, use space as separator,
+#                              e.g.: ".*-downloads closed-.*"
+#
+
 import stat
 import shutil
 
@@ -23,8 +30,10 @@ class BuildSystem(object):
         self.context = context
         self.layerdirs = [os.path.abspath(pth) for pth in d.getVar('BBLAYERS', True).split()]
         self.layers_exclude = (d.getVar('SDK_LAYERS_EXCLUDE', True) or "").split()
+        self.layers_exclude_pattern = d.getVar('SDK_LAYERS_EXCLUDE_PATTERN', True)
 
     def copy_bitbake_and_layers(self, destdir, workspace_name=None):
+        import re
         # Copy in all metadata layers + bitbake (as repositories)
         layers_copied = []
         bb.utils.mkdirhier(destdir)
@@ -36,8 +45,17 @@ class BuildSystem(object):
         # Exclude layers
         for layer_exclude in self.layers_exclude:
             if layer_exclude in layers:
+                bb.note('Excluded %s from sdk layers since it is in SDK_LAYERS_EXCLUDE' % layer_exclude)
                 layers.remove(layer_exclude)
 
+        if self.layers_exclude_pattern:
+            layers_cp = layers[:]
+            for pattern in self.layers_exclude_pattern.split():
+                for layer in layers_cp:
+                    if re.match(pattern, layer):
+                        bb.note('Excluded %s from sdk layers since matched SDK_LAYERS_EXCLUDE_PATTERN' % layer)
+                        layers.remove(layer)
+
         workspace_newname = workspace_name
         if workspace_newname:
             layernames = [os.path.basename(layer) for layer in layers]
-- 
2.10.2


