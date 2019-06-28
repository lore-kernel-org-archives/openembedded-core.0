Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 803147E996
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 06:13:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5S6DT9x016266
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 23:13:29 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 23:13:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2019 14:25:35 +0800
Message-ID: <5ead749ee0cc6dc3f78dd7ca3b77c83bf88bfa51.1561702962.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1561702962.git.Qi.Chen@windriver.com>
References: <cover.1561702962.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] devtool: error out when using base name provided by multiple layers
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
X-List-Received-Date: Fri, 28 Jun 2019 06:13:28 -0000
Content-Type: text/plain

Currently `devtool finish RECIPE meta' will silently succeed even
if there are multiple layers having the same base name of 'meta'.
e.g. meta layer from oe-core and meta layer from meta-secure-core.

We should error out and give users useful information in such case.
With the patch, we will get error like below.

ERROR: Multiple layers have the same base name 'meta'. Consider using path instead of base name to specify layer:
        PROJ_DIR/oe-core/meta
        PROJ_DIR/meta-secure-core/meta

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/lib/devtool/standard.py | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index aca74b1..1841791 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1866,13 +1866,27 @@ def reset(args, config, basepath, workspace):
 def _get_layer(layername, d):
     """Determine the base layer path for the specified layer name/path"""
     layerdirs = d.getVar('BBLAYERS').split()
-    layers = {os.path.basename(p): p for p in layerdirs}
+    layers = {}    # {basename: layer_paths}
+    for p in layerdirs:
+        bn = os.path.basename(p)
+        if bn not in layers:
+            layers[bn] = [p]
+        else:
+            layers[bn].append(p)
     # Provide some shortcuts
     if layername.lower() in ['oe-core', 'openembedded-core']:
-        layerdir = layers.get('meta', None)
+        layername = 'meta'
+    layer_paths = layers.get(layername, None)
+    if not layer_paths:
+        return os.path.abspath(layername)
+    elif len(layer_paths) == 1:
+        return os.path.abspath(layer_paths[0])
     else:
-        layerdir = layers.get(layername, None)
-    return os.path.abspath(layerdir or layername)
+        # multiple layers having the same base name
+        msg = "Multiple layers have the same base name '%s'. " % layername
+        msg += "Consider using path instead of base name to specify layer:\n\t%s" % '\n\t'.join(layer_paths)
+        raise DevtoolError(msg)
+
 
 def finish(args, config, basepath, workspace):
     """Entry point for the devtool 'finish' subcommand"""
-- 
1.9.1


