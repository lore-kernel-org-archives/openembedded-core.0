Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F0DDB60721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 15:38:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Mar 2016 08:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,382,1455004800"; d="scan'208";a="917276764"
Received: from jlock-mobl1.gar.corp.intel.com (HELO
	jlock-mobl.gar.corp.intel.com) ([10.252.25.208])
	by orsmga001.jf.intel.com with ESMTP; 23 Mar 2016 08:38:04 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 15:37:59 +0000
Message-Id: <1458747479-17230-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] rootfs-postcommands: don't write manifest when IMAGE_MANIFEST empty
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
X-List-Received-Date: Wed, 23 Mar 2016 15:38:38 -0000

Return early in write_image_manifest () if the IMAGE_MANIFEST
variable is unset. This allows us to prevent writing of the
manifest where we prevent images being created for a recipe by
unsetting IMAGE_FSTYPES.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/rootfs-postcommands.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index e184667..56e810f 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -215,12 +215,15 @@ python write_image_manifest () {
     link_name = d.getVar('IMAGE_LINK_NAME', True)
     manifest_name = d.getVar('IMAGE_MANIFEST', True)
 
+    if not manifest_name:
+        return
+
     pkgs = image_list_installed_packages(d)
     with open(manifest_name, 'w+') as image_manifest:
         image_manifest.write(format_pkg_list(pkgs, "ver"))
         image_manifest.write("\n")
 
-    if manifest_name is not None and os.path.exists(manifest_name):
+    if os.path.exists(manifest_name):
         manifest_link = deploy_dir + "/" + link_name + ".manifest"
         if os.path.exists(manifest_link):
             if d.getVar('RM_OLD_IMAGE', True) == "1" and \
-- 
2.5.5


