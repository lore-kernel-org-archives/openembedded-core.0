Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1F3278421
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 02:46:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w562kKUU013487
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2018 19:46:20 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Tue, 5 Jun 2018 19:46:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2018 10:54:40 +0800
Message-ID: <df139782d247130634f5a046c6dcfac199854877.1528252931.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528252931.git.liezhi.yang@windriver.com>
References: <cover.1528252931.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 05/11] oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN
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
X-List-Received-Date: Wed, 06 Jun 2018 02:46:18 -0000
Content-Type: text/plain

It is helpful when exclude a lot of layers. It uses python re, and
supports multiple patterns (separated by space).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/copy_buildsystem.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 4b94806..c43c2bd 100644
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
         self.layerdirs = [os.path.abspath(pth) for pth in d.getVar('BBLAYERS').split()]
         self.layers_exclude = (d.getVar('SDK_LAYERS_EXCLUDE') or "").split()
+        self.layers_exclude_pattern = d.getVar('SDK_LAYERS_EXCLUDE_PATTERN')
 
     def copy_bitbake_and_layers(self, destdir, workspace_name=None):
+        import re
         # Copy in all metadata layers + bitbake (as repositories)
         layers_copied = []
         bb.utils.mkdirhier(destdir)
@@ -40,8 +49,17 @@ class BuildSystem(object):
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
2.7.4


