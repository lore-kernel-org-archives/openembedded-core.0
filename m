Return-Path: <damien.riegel@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id C70E374C06
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 00:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E69459C1CCE;
	Fri, 15 Jun 2018 20:18:43 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id i_faaG4laENm; Fri, 15 Jun 2018 20:18:43 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6779D9C2648;
	Fri, 15 Jun 2018 20:18:43 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id Rogtf4U1ADUX; Fri, 15 Jun 2018 20:18:43 -0400 (EDT)
Received: from workotop.localdomain (modemcable073.90-22-96.mc.videotron.ca
	[96.22.90.73])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 37AE59C1CCE;
	Fri, 15 Jun 2018 20:18:43 -0400 (EDT)
From: Damien Riegel <damien.riegel@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 20:18:38 -0400
Message-Id: <20180616001838.23093-1-damien.riegel@savoirfairelinux.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v3] populate_sdk_ext.bbclass: fix corebase identification
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
X-List-Received-Date: Sat, 16 Jun 2018 00:18:44 -0000

When generating the extended SDK, there is a copy step where this class
goes through the layers and other stuff that have been copied to
generate the SDK. The corebase; ie. the folder that contains the core
layer 'meta' is treated in a special way. Unfortunately in our tree, we
have:

  sources/meta/meta
           |     `- core layer
           `------- corebase

In populate_sdk_ext's copy_buildsystem, the heuristic to determine which
element of the list returned by copy_bitbake_and_layers is corebase is
fooled by such layout.

In copy_bitbake_and_layers, corebase is already handled specifically and
reliably, so we should let that function tell us which folder is
corebase instead of trying to determine it.

To do so, change the return type of copy_bitbake_and_layers to a tuple
that contains (corebase, copied_layers). It also simplifies the code on
the caller side.

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
---
Changes in v3:
 - rebased on master to apply cleanly

Changes in v2:
 - move the logic in copy_bitbake_and_layers

 meta/classes/populate_sdk_ext.bbclass | 12 +++---------
 meta/lib/oe/copy_buildsystem.py       |  8 +++++---
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index e1bba49eaf..f0c8709c5b 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -200,15 +200,9 @@ python copy_buildsystem () {
         workspace_name = 'orig-workspace'
     else:
         workspace_name = None
-    layers_copied = buildsystem.copy_bitbake_and_layers(baseoutpath + '/layers', workspace_name)
-
-    sdkbblayers = []
-    corebase = os.path.basename(d.getVar('COREBASE'))
-    for layer in layers_copied:
-        if corebase == os.path.basename(layer):
-            conf_bbpath = os.path.join('layers', layer, 'bitbake')
-        else:
-            sdkbblayers.append(layer)
+
+    corebase, sdkbblayers = buildsystem.copy_bitbake_and_layers(baseoutpath + '/layers', workspace_name)
+    conf_bbpath = os.path.join('layers', corebase, 'bitbake')
 
     for path in os.listdir(baseoutpath + '/layers'):
         relpath = os.path.join('layers', path, oe_init_env_script)
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 4b94806c73..4abec4666f 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -26,6 +26,7 @@ class BuildSystem(object):
 
     def copy_bitbake_and_layers(self, destdir, workspace_name=None):
         # Copy in all metadata layers + bitbake (as repositories)
+        copied_corebase = None
         layers_copied = []
         bb.utils.mkdirhier(destdir)
         layers = list(self.layerdirs)
@@ -84,17 +85,18 @@ class BuildSystem(object):
 
             layer_relative = os.path.relpath(layerdestpath,
                                              destdir)
-            layers_copied.append(layer_relative)
-
             # Treat corebase as special since it typically will contain
             # build directories or other custom items.
             if corebase == layer:
+                copied_corebase = layer_relative
                 bb.utils.mkdirhier(layerdestpath)
                 for f in corebase_files:
                     f_basename = os.path.basename(f)
                     destname = os.path.join(layerdestpath, f_basename)
                     _smart_copy(f, destname)
             else:
+                layers_copied.append(layer_relative)
+
                 if os.path.exists(os.path.join(layerdestpath, 'conf/layer.conf')):
                     bb.note("Skipping layer %s, already handled" % layer)
                 else:
@@ -140,7 +142,7 @@ class BuildSystem(object):
                 layers_copied.remove(layer)
                 break
 
-        return layers_copied
+        return copied_corebase, layers_copied
 
 def generate_locked_sigs(sigfile, d):
     bb.utils.mkdirhier(os.path.dirname(sigfile))
-- 
2.17.1


