Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A0DC43217
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:35:38 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.53185.1638804937073418541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230,
 mailfrom: foss+yocto@0leil.net)
Received: from localhost.localdomain (84-115-236-2.cable.dynamic.surfer.at
 [84.115.236.2])
	(Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id 53867240005;
	Mon,  6 Dec 2021 15:35:35 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 2/4] core: initrdscripts: init-install{-efi,}-testfs.sh:
 rename masterimage into goldenimage
Date: Mon,  6 Dec 2021 16:35:09 +0100
Message-Id: <20211206153511.34838-3-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206153511.34838-1-foss+yocto@0leil.net>
References: <20211206153511.34838-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:35:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159244

golden image has a more explicit meaning in addition of not being an
issue wrt inclusivity.

Signed-off-by: Quentin Schulz <foss+yocto@0leil.net>
---
 meta/lib/oeqa/controllers/masterimage.py               | 10 +++++-----
 meta/lib/oeqa/runtime/cases/ssh.py                     |  4 ++--
 .../initrdscripts/files/init-install-efi-testfs.sh     |  2 +-
 .../initrdscripts/files/init-install-testfs.sh         |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 2eff6d05ef9..feb30366323 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -121,17 +121,17 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
         # base class just sets the ssh log file for us
         super(MasterImageHardwareTarget, self).deploy()
         self.master = sshcontrol.SSHControl(ip=self.ip, logfile=self.sshlog, timeout=600, port=self.port)
-        status, output = self.master.run("cat /etc/masterimage")
+        status, output = self.master.run("cat /etc/goldenimage")
         if status != 0:
-            # We're not booted into the master image, so try rebooting
-            bb.plain("%s - booting into the master image" % self.pn)
+            # We're not booted into the golden image, so try rebooting
+            bb.plain("%s - booting into the golden image" % self.pn)
             self.power_ctl("cycle")
             self._wait_until_booted()
 
         bb.plain("%s - deploying image on target" % self.pn)
-        status, output = self.master.run("cat /etc/masterimage")
+        status, output = self.master.run("cat /etc/goldenimage")
         if status != 0:
-            bb.fatal("No ssh connectivity or target isn't running a master image.\n%s" % output)
+            bb.fatal("No ssh connectivity or target isn't running a golden image.\n%s" % output)
         if self.user_cmds:
             self.deploy_cmds = self.user_cmds.split("\n")
         try:
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index 60a5fbbfbfd..a0bbed0b581 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -13,7 +13,7 @@ class SSHTest(OERuntimeTestCase):
     def test_ssh(self):
         (status, output) = self.target.run('uname -a')
         self.assertEqual(status, 0, msg='SSH Test failed: %s' % output)
-        (status, output) = self.target.run('cat /etc/masterimage')
-        msg = "This isn't the right image  - /etc/masterimage " \
+        (status, output) = self.target.run('cat /etc/goldenimage')
+        msg = "This isn't the right image  - /etc/goldenimage " \
               "shouldn't be here %s" % output
         self.assertEqual(status, 1, msg=msg)
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
index b351985a61c..6f554f62967 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -133,7 +133,7 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /rootmnt
 echo "Copying rootfs files..."
 cp -a /rootmnt/* /ssd
 
-touch /ssd/etc/masterimage
+touch /ssd/etc/goldenimage
 
 if [ -d /ssd/etc/ ] ; then
     # We dont want udev to mount our root device while we're booting...
diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index ac621605287..df3a7767319 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -158,7 +158,7 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
 
-touch /tgt_root/etc/masterimage
+touch /tgt_root/etc/goldenimage
 
 if [ -d /tgt_root/etc/ ] ; then
     echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
-- 
2.33.1


