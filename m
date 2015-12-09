Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E973A6FF7D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 18:07:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2015 10:07:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,404,1444719600"; d="scan'208";a="857461301"
Received: from humberto-desktop.zpn.intel.com ([10.219.5.56])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2015 10:07:15 -0800
From: humberto.ibarra.lopez@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 12:04:56 -0600
Message-Id: <1449684296-4117-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v3] scripts/yocto-layer: Avoids duplication of "meta-" prefix
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
X-List-Received-Date: Wed, 09 Dec 2015 18:07:15 -0000

From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

The yocto-layer script puts and extra "meta-" prefix on the given layer
name even when the prefix is already there. This fix avoids duplicating
the prefix in these situations.

The change was done inside the create subcommand since this is a parsing
specific to the layer creation. Parsing this in the main method of
yocto-layer was not the right way to go.

Before the change:

$ yocto-layer create meta-layer
[...]
New layer created in meta-meta-layer.

After the change:

$ yocto-layer create meta-layer
[...]
New layer created in meta-layer.

[YOCTO #8050]

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


