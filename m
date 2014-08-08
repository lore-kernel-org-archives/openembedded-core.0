Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9F770A89
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:07:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2014 15:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="555928462"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2014 15:07:12 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:55 -0500
Message-Id: <b7057e08020420a34dce5bcfeb3a760a118dc514.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 30/35] wic: Update/rename configure-related code
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
X-List-Received-Date: Fri, 08 Aug 2014 22:07:16 -0000

The wic code inherited a basic image-creation flow based on
image-configuration, but wic doesn't actually configure anything, so
rename parts of the code dealing with configuration to something more
appropriate.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/imager/direct.py                | 7 ++++---
 scripts/lib/mic/plugins/imager/direct_plugin.py | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index 8d7b6ee..17bfd01 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -284,12 +284,13 @@ class DirectImageCreator(BaseImageCreator):
                         % (disk_name, full_path, disk['min_size']))
             self.__image.assemble(full_path)
 
-    def configure(self):
+    def finalize(self):
         """
-        Configure the system image according to kickstart.
+        Finalize the disk image.
 
-        For now, it just prepares the image to be bootable by e.g.
+        For example, prepare the image to be bootable by e.g.
         creating and installing a bootloader configuration.
+
         """
         source_plugin = self.get_default_source_plugin()
         if source_plugin:
diff --git a/scripts/lib/mic/plugins/imager/direct_plugin.py b/scripts/lib/mic/plugins/imager/direct_plugin.py
index 2cbd5d1..ff30f09 100644
--- a/scripts/lib/mic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/mic/plugins/imager/direct_plugin.py
@@ -93,7 +93,7 @@ class DirectPlugin(ImagerPlugin):
         try:
             creator.create()
             creator.assemble()
-            creator.configure()
+            creator.finalize()
             creator.print_outimage_info()
 
         except errors.CreatorError:
-- 
1.8.3.1


