Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3126FA85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 07:46:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2014 00:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,917,1392192000"; d="scan'208";a="546978890"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2014 00:46:19 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 3053B6A4087;
	Tue, 27 May 2014 00:45:54 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 May 2014 12:50:27 +0300
Message-Id: <1401184227-1138-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] oeqa/controllers/beaglebonetarget.py: fix conditions for files copied to /boot
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
X-List-Received-Date: Tue, 27 May 2014 07:46:22 -0000

Using '&&' as condition operator in '[ ! -e /mnt/testrootfs/boot/uImage ] && cp ~/test-kernel /mnt/testrootfs/boot/uImage' would result in exit code 1 if the first condition is not met.
Changing the code to handle the conditioning more cleanly and correctly return exit status 0 if [ ! -e /mnt/testrootfs/boot/uImage ] returns exit code 1.

Without this if the file existance check would fail then the image deploy task would stop.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py b/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
index 53f454b..af56bda 100644
--- a/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
+++ b/meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py
@@ -41,12 +41,12 @@ class BeagleBoneTarget(MasterImageHardwareTarget):
                 'mount -L testrootfs /mnt/testrootfs',
                 'rm -rf /mnt/testrootfs/*',
                 'tar xzvf ~/test-rootfs.tar.gz -C /mnt/testrootfs',
-                '[ ! -e /mnt/testrootfs/boot/uImage ] && cp ~/test-kernel /mnt/testrootfs/boot/uImage',
+                'if [ ! -e /mnt/testrootfs/boot/uImage ]; then cp ~/test-kernel /mnt/testrootfs/boot/uImage; fi',
                 ]
 
         for _, dtbfn in self.dtbs:
             # Kernel and dtb files may not be in the image, so copy them if not
-            self.deploy_cmds.append('[ ! -e /mnt/testrootfs/boot/{0} ] && cp ~/{0} /mnt/testrootfs/boot/'.format(dtbfn))
+            self.deploy_cmds.append('if [ ! -e /mnt/testrootfs/boot/{0} ]; then cp ~/{0} /mnt/testrootfs/boot/'.format(dtbfn) + '; fi')
 
         if not self.serialcontrol_cmd:
             bb.fatal("This TEST_TARGET needs a TEST_SERIALCONTROL_CMD defined in local.conf.")
-- 
1.8.3.2


