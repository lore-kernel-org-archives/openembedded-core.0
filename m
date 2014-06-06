Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 188C96FCE4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 16:02:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jun 2014 09:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,990,1392192000"; d="scan'208";a="551006674"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2014 09:02:09 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id B36C06A4087;
	Fri,  6 Jun 2014 09:01:41 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jun 2014 21:06:16 +0300
Message-Id: <1402077980-9548-3-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1402077980-9548-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1402077980-9548-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 2/6] masterimage.py: enable dynamical determination of rootfs type
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
X-List-Received-Date: Fri, 06 Jun 2014 16:02:32 -0000

YB: #6375

Adding support for get_image_fstype() in the MasterImageHardwareTarget and GummibootTarget classes.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index f2585d4..b03c5bf 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -28,6 +28,8 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
 
     __metaclass__ = ABCMeta
 
+    supported_image_fstypes = ['tar.gz', 'tar.bz2']
+
     def __init__(self, d):
         super(MasterImageHardwareTarget, self).__init__(d)
 
@@ -48,7 +50,8 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
         bb.note("Server IP: %s" % self.server_ip)
 
         # test rootfs + kernel
-        self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + '.tar.gz')
+        self.image_fstype = self.get_image_fstype(d)
+        self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
         self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE"))
         if not os.path.isfile(self.rootfs):
             # we could've checked that IMAGE_FSTYPES contains tar.gz but the config for running testimage might not be
@@ -177,7 +180,7 @@ class GummibootTarget(MasterImageHardwareTarget):
                 'mount -t efivarfs efivarfs /sys/firmware/efi/efivars',
                 'cp ~/test-kernel /boot',
                 'rm -rf /mnt/testrootfs/*',
-                'tar xzvf ~/test-rootfs.tar.gz -C /mnt/testrootfs',
+                'tar xvf ~/test-rootfs.%s -C /mnt/testrootfs' % self.image_fstype,
                 'printf "%s" > /sys/firmware/efi/efivars/LoaderEntryOneShot-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f' % self.efivarvalue
                 ]
 
@@ -187,7 +190,7 @@ class GummibootTarget(MasterImageHardwareTarget):
         # from now on, every deploy cmd should return 0
         # else an exception will be thrown by sshcontrol
         self.master.ignore_status = False
-        self.master.copy_to(self.rootfs, "~/test-rootfs.tar.gz")
+        self.master.copy_to(self.rootfs, "~/test-rootfs." + self.image_fstype)
         self.master.copy_to(self.kernel, "~/test-kernel")
         for cmd in self.deploy_cmds:
             self.master.run(cmd)
-- 
1.8.3.2


