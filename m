Return-Path: <jose.perez.carranza@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 44C1A6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 18:55:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jul 2016 11:55:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,358,1464678000"; d="scan'208";a="1016269239"
Received: from jgperezc-mobl1.zpn.intel.com ([10.219.5.37])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2016 11:55:25 -0700
From: Jose Perez Carranza <jose.perez.carranza@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 14:01:57 -0500
Message-Id: <1468436517-31379-1-git-send-email-jose.perez.carranza@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] oeqa/controllers: Add test target for Systemd-boot
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
X-List-Received-Date: Wed, 13 Jul 2016 18:55:28 -0000

A new test target is neede to test Systemd-boot similar
to gummiboot. Created a copy of GummibootTarget class
and named as SystemdbootTarget, at this point the
gummibootTarget will remain until documentation is
updated with new systed information.

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@intel.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 4cb7553..9ce3bf8 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -197,3 +197,43 @@ class GummibootTarget(MasterImageHardwareTarget):
         self.power_cycle(self.master)
         # there are better ways than a timeout but this should work for now
         time.sleep(120)
+
+
+class SystemdbootTarget(MasterImageHardwareTarget):
+
+    def __init__(self, d):
+        super(SystemdbootTarget, self).__init__(d)
+        # this the value we need to set in the LoaderEntryOneShot EFI variable
+        # so the system boots the 'test' bootloader label and not the default
+        # The first four bytes are EFI bits, and the rest is an utf-16le string
+        # (EFI vars values need to be utf-16)
+        # $ echo -en "test\0" | iconv -f ascii -t utf-16le | hexdump -C
+        # 00000000  74 00 65 00 73 00 74 00  00 00                    |t.e.s.t...|
+        self.efivarvalue = r'\x07\x00\x00\x00\x74\x00\x65\x00\x73\x00\x74\x00\x00\x00'
+        self.deploy_cmds = [
+                'mount -L boot /boot',
+                'mkdir -p /mnt/testrootfs',
+                'mount -L testrootfs /mnt/testrootfs',
+                'modprobe efivarfs',
+                'mount -t efivarfs efivarfs /sys/firmware/efi/efivars',
+                'cp ~/test-kernel /boot',
+                'rm -rf /mnt/testrootfs/*',
+                'tar xvf ~/test-rootfs.%s -C /mnt/testrootfs' % self.image_fstype,
+                'printf "%s" > /sys/firmware/efi/efivars/LoaderEntryOneShot-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f' % self.efivarvalue
+                ]
+
+    def _deploy(self):
+        # make sure these aren't mounted
+        self.master.run("umount /boot; umount /mnt/testrootfs; umount /sys/firmware/efi/efivars;")
+        # from now on, every deploy cmd should return 0
+        # else an exception will be thrown by sshcontrol
+        self.master.ignore_status = False
+        self.master.copy_to(self.rootfs, "~/test-rootfs." + self.image_fstype)
+        self.master.copy_to(self.kernel, "~/test-kernel")
+        for cmd in self.deploy_cmds:
+            self.master.run(cmd)
+
+    def _start(self, params=None):
+        self.power_cycle(self.master)
+        # there are better ways than a timeout but this should work for now
+        time.sleep(120)
-- 
1.9.1


