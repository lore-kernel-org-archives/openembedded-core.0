Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 970716E250
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 19:07:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2013 11:03:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,859,1378882800"; d="scan'208";a="421821789"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.25])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2013 11:07:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2013 19:06:54 +0000
Message-Id: <465a7718dede33f981e7df3a0a2bd9a9652cdbe0.1386615914.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386615914.git.paul.eggleton@linux.intel.com>
References: <cover.1386615914.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386615914.git.paul.eggleton@linux.intel.com>
References: <cover.1386615914.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] toaster.bbclass: read layer information
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
X-List-Received-Date: Mon, 09 Dec 2013 19:07:01 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

In the process of removing the local system
accesses from toaster UI (which must be able to
run remotely), the code to read layer information
is moved from Bitbake Toaster UI
to the server-side toaster.bbclass

    [YOCTO #5604]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/toaster.bbclass | 68 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 8dc1663..ec9b6c5 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -24,7 +24,73 @@
 #
 #
 
-# 1. Dump package file info data
+# Find and dump layer info when we got the layers parsed
+
+
+
+python toaster_layerinfo_dumpdata() {
+    import subprocess
+
+    def _get_git_branch(layer_path):
+        branch = subprocess.Popen("git symbolic-ref HEAD 2>/dev/null ", cwd=layer_path, shell=True, stdout=subprocess.PIPE).communicate()[0]
+        branch = branch.replace('refs/heads/', '').rstrip()
+        return branch
+
+    def _get_git_revision(layer_path):
+        revision = subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=layer_path, shell=True, stdout=subprocess.PIPE).communicate()[0].rstrip()
+        return revision
+
+    def _get_url_map_name(layer_name):
+        """ Some layers have a different name on openembedded.org site,
+            this method returns the correct name to use in the URL
+        """
+
+        url_name = layer_name
+        url_mapping = {'meta': 'openembedded-core'}
+
+        for key in url_mapping.keys():
+            if key == layer_name:
+                url_name = url_mapping[key]
+
+        return url_name
+
+    def _get_layer_version_information(layer_path):
+
+        layer_version_info = {}
+        layer_version_info['branch'] = _get_git_branch(layer_path)
+        layer_version_info['commit'] = _get_git_revision(layer_path)
+        layer_version_info['priority'] = 0
+
+        return layer_version_info
+
+
+    def _get_layer_dict(layer_path):
+
+        layer_info = {}
+        layer_name = layer_path.split('/')[-1]
+        layer_url = 'http://layers.openembedded.org/layerindex/layer/{layer}/'
+        layer_url_name = _get_url_map_name(layer_name)
+
+        layer_info['name'] = layer_name
+        layer_info['local_path'] = layer_path
+        layer_info['layer_index_url'] = layer_url.format(layer=layer_url_name)
+        layer_info['version'] = _get_layer_version_information(layer_path)
+
+        return layer_info
+
+
+    bblayers = e.data.getVar("BBLAYERS", True)
+
+    llayerinfo = {}
+
+    for layer in { l for l in bblayers.strip().split(" ") if len(l) }:
+        llayerinfo[layer] = _get_layer_dict(layer)
+
+
+    bb.event.fire(bb.event.MetadataEvent("LayerInfo", llayerinfo), e.data)
+}
+
+# Dump package file info data
 
 python toaster_package_dumpdata() {
     """
-- 
1.8.1.2


