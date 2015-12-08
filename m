Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 06700601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 17:24:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Dec 2015 09:23:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,400,1444719600"; d="scan'208";a="867309067"
Received: from humberto-desktop.zpn.intel.com ([10.219.5.56])
	by orsmga002.jf.intel.com with ESMTP; 08 Dec 2015 09:23:57 -0800
From: humberto.ibarra.lopez@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 11:22:01 -0600
Message-Id: <1449595321-4397-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] scripts/yocto-layer Change to the yocto-layer script. The fix avoids the duplication of the "meta-" prefix on the layer directory when creating a new layer with the prefix already there. Made the script inside the create subcommand method since it's a change specific to the creation of layers and parsing it in the main method was not the way to go.
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
X-List-Received-Date: Tue, 08 Dec 2015 17:24:03 -0000

From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

Before the change:

$ yocto-layer create meta-layer2
...
New layer created in meta-meta-layer2.

---------

After the change:

$ yocto-layer create meta-layer2
...
New layer created in meta-layer2.

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/yocto-layer | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-layer b/scripts/yocto-layer
index 53d2aab..313d464 100755
--- a/scripts/yocto-layer
+++ b/scripts/yocto-layer
@@ -75,7 +75,11 @@ def yocto_layer_create_subcommand(args, usage_str):
     if options.outdir:
         layer_output_dir = options.outdir
     else:
-        layer_output_dir = "meta-" + layer_name
+        prefix="meta-"
+        if not layer_name.startswith(prefix):
+            layer_output_dir="%s%s"%(prefix,layer_name)
+        else:
+            layer_output_dir=layer_name
 
     yocto_layer_create(layer_name, scripts_path, layer_output_dir, options.codedump, options.properties_file, properties)
 
-- 
1.9.1


