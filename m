Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C34778049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 07:40:22 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7N7eMUF032075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 23 Aug 2017 08:40:23 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dkQH0-0006x0-75; Wed, 23 Aug 2017 08:40:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 08:40:20 +0100
Message-Id: <1503474020-26672-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503474020-26672-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1503474020-26672-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 23 Aug 2017 08:40:23 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] runqemu: Use virtio to mount cdrom drives
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
X-List-Received-Date: Wed, 23 Aug 2017 07:40:23 -0000

The IDE driver in the kernel is fragile and in 4.12 is causing backtraces.
To unblock 4.12 kernel merging use the virtio CD driver instead to mount
iso images which should be faster and more stable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 2 +-
 scripts/runqemu                         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 8805a38..1991be7 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -62,7 +62,7 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s iso" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue(' -cdrom ' in f.read(), "Failed: %s" % cmd)
+                self.assertTrue('media=cdrom' in f.read(), "Failed: %s" % cmd)
 
     @OETestID(2004)
     def test_boot_recipe_image(self):
diff --git a/scripts/runqemu b/scripts/runqemu
index fd2717e..1131324 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1005,7 +1005,7 @@ class BaseConfig(object):
             vm_drive = ''
             if self.fstype in self.vmtypes:
                 if self.fstype == 'iso':
-                    vm_drive = '-cdrom %s' % self.rootfs
+                    vm_drive = '-drive file=%s,if=virtio,media=cdrom' % self.rootfs
                 elif self.get('QB_DRIVE_TYPE'):
                     drive_type = self.get('QB_DRIVE_TYPE')
                     if drive_type.startswith("/dev/sd"):
-- 
2.7.4


