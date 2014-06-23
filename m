Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 450C46B255
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 10:55:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Jun 2014 03:55:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,529,1400050800"; d="scan'208";a="532624608"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 23 Jun 2014 03:55:11 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id F3BBE6A4087;
	Mon, 23 Jun 2014 03:54:40 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jun 2014 15:59:45 +0300
Message-Id: <1403528385-4446-2-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1403528385-4446-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1403528385-4446-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 2/2] scripts/test-remote-image: add value check for rootfs fstype, change method name used.
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
X-List-Received-Date: Mon, 23 Jun 2014 10:55:16 -0000

As per change in the oeqa/targetcontrol.py's BaseTarget class, changing the use of get_image_fstype() to match_image_fstype().

Also because there is no longer a value check done by the target controller's match_image_fstype() method, we have to do one here.

+ one helper comment for the get_controller() method.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 scripts/test-remote-image | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/test-remote-image b/scripts/test-remote-image
index 6da6672..7d02a84 100755
--- a/scripts/test-remote-image
+++ b/scripts/test-remote-image
@@ -136,7 +136,7 @@ class AutoTargetProfile(BaseTargetProfile):
         self.set_manifest_file()
         self.set_extra_download_files()
 
-
+    # Get the controller object that will be used by bitbake.
     def get_controller(self):
         from oeqa.controllers.testtargetloader import TestTargetLoader
 
@@ -158,8 +158,13 @@ class AutoTargetProfile(BaseTargetProfile):
 
     def set_rootfs_file(self):
         image_fstypes = get_bb_var('IMAGE_FSTYPES').split(' ')
-        fstype = self.controller.get_image_fstype(d=None, image_fstypes=image_fstypes)
-        self.rootfs_file = self.image_name + '.' + fstype
+        # Get a matching value between target's IMAGE_FSTYPES and the image fstypes suppoerted by the target controller.
+        fstype = self.controller.match_image_fstype(d=None, image_fstypes=image_fstypes)
+        if fstype:
+            self.rootfs_file = self.image_name + '.' + fstype
+        else:
+            log.error("Could not get a compatible image fstype. Check that IMAGE_FSTYPES and the target controller's supported_image_fstypes fileds have common values.")
+            sys.exit(1)
 
     def set_manifest_file(self):
         self.manifest_file = self.image_name + ".manifest"
-- 
1.8.3.2


