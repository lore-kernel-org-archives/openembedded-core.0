Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E4FF96FCEA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 17:10:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jun 2014 10:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,990,1392192000"; d="scan'208";a="551054969"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2014 10:10:38 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id C89DE6A4087;
	Fri,  6 Jun 2014 10:10:10 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jun 2014 22:14:37 +0300
Message-Id: <1402082078-10826-7-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1402082078-10826-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1402082078-10826-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH V2 6/7] controllers/masterimage.py: Make testimage kernel naming pattern universal
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
X-List-Received-Date: Fri, 06 Jun 2014 17:10:45 -0000

YB: #6254

The QemuTargetControl class does not specify any kernel naming but the runqemu script it uses uses the " KERNEL_IMAGETYPE + MACHINE + '.bin' " naming scheme.
Modifying the other major target controller class, MasterImageHardwareTarget, to use the same kernel naming scheme.

This is usefull also to outside scripts that want to anticipate the kernel file name for all target controllers.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index b03c5bf..311f0cf 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -52,7 +52,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
         # test rootfs + kernel
         self.image_fstype = self.get_image_fstype(d)
         self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
-        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE"))
+        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE") + '-' + d.getVar('MACHINE') + '.bin')
         if not os.path.isfile(self.rootfs):
             # we could've checked that IMAGE_FSTYPES contains tar.gz but the config for running testimage might not be
             # the same as the config with which the image was build, ie
-- 
1.8.3.2


