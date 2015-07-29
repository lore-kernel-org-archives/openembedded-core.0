Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE217641E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 19:51:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jul 2015 12:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,572,1432623600"; d="scan'208";a="772491328"
Received: from humberto-desktop.zpn.intel.com ([10.219.5.34])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2015 12:51:17 -0700
From: humberto.ibarra.lopez@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jul 2015 14:50:07 -0500
Message-Id: <1438199407-19848-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [scripts][PATCH] yocto-layer: Stops duplication of "meta-" prefix
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
X-List-Received-Date: Wed, 29 Jul 2015 19:51:17 -0000

From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

The yocto-layer script puts an extra "meta-" prefix to the given layer
name even when the prefix is already there. This fix avoids
duplicating the prefix in these situations.

[YOCTO #8050]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/yocto-layer | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/yocto-layer b/scripts/yocto-layer
index 53d2aab..0dbbf3b 100755
--- a/scripts/yocto-layer
+++ b/scripts/yocto-layer
@@ -74,6 +74,8 @@ def yocto_layer_create_subcommand(args, usage_str):
 
     if options.outdir:
         layer_output_dir = options.outdir
+    elif layer_name.startswith("meta-"):
+        layer_output_dir = layer_name
     else:
         layer_output_dir = "meta-" + layer_name
 
-- 
1.9.1


