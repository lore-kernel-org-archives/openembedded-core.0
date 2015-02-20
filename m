Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD9C5606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 20:14:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 20 Feb 2015 12:08:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,616,1418112000"; d="scan'208";a="688535893"
Received: from rhamler-mobl2.amr.corp.intel.com (HELO localhost)
	([10.254.47.47])
	by orsmga002.jf.intel.com with ESMTP; 20 Feb 2015 12:14:03 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 14:14:01 -0600
Message-Id: <25bc24271aeb562e276392372d4a99d8a6230426.1424462781.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424462781.git.tom.zanussi@linux.intel.com>
References: <cover.1424462781.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] wic: Fix kernel dir location
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
X-List-Received-Date: Fri, 20 Feb 2015 20:14:03 -0000

With the recent kernel staging changes, STAGING_KERNEL_DIR no longer
points to the kernel image, which can be found however in
DEPLOY_DIR_IMAGE.  This updates find_artifacts() to look there
instead.

Fixes [YOCTO #7307].

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/engine.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index e794545..68d1ce2 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -73,8 +73,8 @@ def find_artifacts(image_name):
         if (get_line_val(line, "IMAGE_ROOTFS")):
             rootfs_dir = get_line_val(line, "IMAGE_ROOTFS")
             continue
-        if (get_line_val(line, "STAGING_KERNEL_DIR")):
-            kernel_dir = get_line_val(line, "STAGING_KERNEL_DIR")
+        if (get_line_val(line, "DEPLOY_DIR_IMAGE")):
+            kernel_dir = get_line_val(line, "DEPLOY_DIR_IMAGE")
             continue
         if (get_line_val(line, "STAGING_DIR_NATIVE")):
             native_sysroot = get_line_val(line, "STAGING_DIR_NATIVE")
@@ -200,7 +200,7 @@ def wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     values from the output of 'bitbake -e':
 
     rootfs_dir:        IMAGE_ROOTFS
-    kernel_dir:        STAGING_KERNEL_DIR
+    kernel_dir:        DEPLOY_DIR_IMAGE
     native_sysroot:    STAGING_DIR_NATIVE
 
     In the above case, bootimg_dir remains unset and the
-- 
1.9.3


