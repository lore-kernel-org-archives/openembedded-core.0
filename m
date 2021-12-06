Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994AFC433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:35:39 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.53186.1638804937995942802
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230,
 mailfrom: foss+yocto@0leil.net)
Received: from localhost.localdomain (84-115-236-2.cable.dynamic.surfer.at
 [84.115.236.2])
	(Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id 23704240007;
	Mon,  6 Dec 2021 15:35:35 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 3/4] oeqa: rename masterimage into goldenimage
Date: Mon,  6 Dec 2021 16:35:10 +0100
Message-Id: <20211206153511.34838-4-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206153511.34838-1-foss+yocto@0leil.net>
References: <20211206153511.34838-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 150
X-GND-Status: SPAM
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:35:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159245

Golden image has a more explicit meaning than masterimage and is not an
issue wrt inclusivity.

Signed-off-by: Quentin Schulz <foss+yocto@0leil.net>
---
 .../{masterimage.py => goldenimage.py}        | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)
 rename meta/lib/oeqa/controllers/{masterimage.py => goldenimage.py} (91%)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/goldenimage.py
similarity index 91%
rename from meta/lib/oeqa/controllers/masterimage.py
rename to meta/lib/oeqa/controllers/goldenimage.py
index feb30366323..fb1ac7a53a0 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/goldenimage.py
@@ -24,12 +24,12 @@ from oeqa.utils import CommandError
 
 from abc import ABCMeta, abstractmethod
 
-class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta):
+class GoldenImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta):
 
     supported_image_fstypes = ['tar.gz', 'tar.bz2']
 
     def __init__(self, d):
-        super(MasterImageHardwareTarget, self).__init__(d)
+        super(GoldenImageHardwareTarget, self).__init__(d)
 
         # target ip
         addr = d.getVar("TEST_TARGET_IP") or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
@@ -61,8 +61,8 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
         if not os.path.isfile(self.kernel):
             bb.fatal("No kernel found. Expected path: %s" % self.kernel)
 
-        # master ssh connection
-        self.master = None
+        # golden ssh connection
+        self.golden = None
         # if the user knows what they are doing, then by all means...
         self.user_cmds = d.getVar("TEST_DEPLOY_CMDS")
         self.deploy_cmds = None
@@ -119,9 +119,9 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
 
     def deploy(self):
         # base class just sets the ssh log file for us
-        super(MasterImageHardwareTarget, self).deploy()
-        self.master = sshcontrol.SSHControl(ip=self.ip, logfile=self.sshlog, timeout=600, port=self.port)
-        status, output = self.master.run("cat /etc/goldenimage")
+        super(GoldenImageHardwareTarget, self).deploy()
+        self.golden = sshcontrol.SSHControl(ip=self.ip, logfile=self.sshlog, timeout=600, port=self.port)
+        status, output = self.golden.run("cat /etc/goldenimage")
         if status != 0:
             # We're not booted into the golden image, so try rebooting
             bb.plain("%s - booting into the golden image" % self.pn)
@@ -129,7 +129,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
             self._wait_until_booted()
 
         bb.plain("%s - deploying image on target" % self.pn)
-        status, output = self.master.run("cat /etc/goldenimage")
+        status, output = self.golden.run("cat /etc/goldenimage")
         if status != 0:
             bb.fatal("No ssh connectivity or target isn't running a golden image.\n%s" % output)
         if self.user_cmds:
@@ -156,10 +156,10 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
 
     def stop(self):
         bb.plain("%s - reboot/powercycle target" % self.pn)
-        self.power_cycle(self.master)
+        self.power_cycle(self.golden)
 
 
-class SystemdbootTarget(MasterImageHardwareTarget):
+class SystemdbootTarget(GoldenImageHardwareTarget):
 
     def __init__(self, d):
         super(SystemdbootTarget, self).__init__(d)
@@ -184,16 +184,16 @@ class SystemdbootTarget(MasterImageHardwareTarget):
 
     def _deploy(self):
         # make sure these aren't mounted
-        self.master.run("umount /boot; umount /mnt/testrootfs; umount /sys/firmware/efi/efivars;")
+        self.golden.run("umount /boot; umount /mnt/testrootfs; umount /sys/firmware/efi/efivars;")
         # from now on, every deploy cmd should return 0
         # else an exception will be thrown by sshcontrol
-        self.master.ignore_status = False
-        self.master.copy_to(self.rootfs, "~/test-rootfs." + self.image_fstype)
-        self.master.copy_to(self.kernel, "~/test-kernel")
+        self.golden.ignore_status = False
+        self.golden.copy_to(self.rootfs, "~/test-rootfs." + self.image_fstype)
+        self.golden.copy_to(self.kernel, "~/test-kernel")
         for cmd in self.deploy_cmds:
-            self.master.run(cmd)
+            self.golden.run(cmd)
 
     def _start(self, params=None):
-        self.power_cycle(self.master)
+        self.power_cycle(self.golden)
         # there are better ways than a timeout but this should work for now
         time.sleep(120)
-- 
2.33.1


