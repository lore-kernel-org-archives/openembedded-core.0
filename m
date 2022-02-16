Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2524FC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 17:46:27 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.2362.1645033586246296650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 09:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aXasp4A4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id v12so4772672wrv.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 09:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wEf6Pnvp1gbsRvXTpd0nXJfLSBtInqwGTxTS/MLqcUY=;
        b=aXasp4A4sh5toYZyMY2iAX0eCADyo0TkjP1nB/5OQxytB8pSNhDdo1znqt2xtdqePX
         6Z3sHfKYj2WIHxaVNfqMsmyZ0dDNBeliKSJbKW950y2br10DGuBZD5eRCZk5drekybKV
         QtIHb2iVLfEDNkCwd3qfRxaZv0G7xPtZjVS3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wEf6Pnvp1gbsRvXTpd0nXJfLSBtInqwGTxTS/MLqcUY=;
        b=dF3TuWqA0V0Whrv7l6tx/XjdREmF6cEUQh3DzqGm5kIml9O1CQR9thSSA9ltJlDnfh
         evlVqlO+iEqrBqUlcvwSZi3TMOm2do7oY0tEoRlCrErkRcMMTKPfAG7f/+3bqlyIFHK8
         /DjuP8OU4FkJ5kLVFq6bCsPqdteWsRvzBl+AISC/GUT/edOCBS5F6ZlKsXXXGkjG4Yy/
         9TP+fC4xaRieuoa6joHVoOOJmsPR/z/2Mc+vqVcDMYWyRNF8Qxh8w8Cfk8GdnCua5nHt
         1/HMr6zyvjTbnfThJrIw2np3LloSBG4askHmZrTUPVZurENA9BkKutjZ4ojeCsNz92Nh
         BZSg==
X-Gm-Message-State: AOAM533J5qzAG06EXAe48FoAlRGQ4EWz0K1Cbh771agawq6Ja++c8lKn
	TiAA9qZuaWKUrXNhcPryGZDkwNswxOyLwky/
X-Google-Smtp-Source: 
 ABdhPJwV6jXLZbWMvani0NT0w9QposwBnsYCkPI9o0Kc/iWBNL8VtYb3XbCgMcoR0I0h81/3lYmvGA==
X-Received: by 2002:a5d:5344:0:b0:1e6:34cf:f74 with SMTP id
 t4-20020a5d5344000000b001e634cf0f74mr3123534wrv.683.1645033584236;
        Wed, 16 Feb 2022 09:46:24 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a680:61af:4a53:1ad3])
        by smtp.gmail.com with ESMTPSA id
 x11sm18259297wmi.37.2022.02.16.09.46.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 09:46:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] core-image-testmaster: Rename to core-image-testcontroller
Date: Wed, 16 Feb 2022 17:46:23 +0000
Message-Id: <20220216174623.2917230-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 17:46:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161781

Rename the image, the test controller class/code/module and the underlying
image sentinel file to all match the controller terminology.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/distro_alias.inc     |  4 +-
 meta/conf/distro/include/maintainers.inc      |  4 +-
 .../{masterimage.py => controllerimage.py}    | 44 +++++++++----------
 meta/lib/oeqa/runtime/cases/ssh.py            |  4 +-
 .../files/init-install-efi-testfs.sh          |  2 +-
 .../files/init-install-testfs.sh              |  2 +-
 ...=> core-image-testcontroller-initramfs.bb} |  2 +-
 ...master.bb => core-image-testcontroller.bb} |  4 +-
 8 files changed, 33 insertions(+), 33 deletions(-)
 rename meta/lib/oeqa/controllers/{masterimage.py => controllerimage.py} (84%)
 rename meta/recipes-extended/images/{core-image-testmaster-initramfs.bb => core-image-testcontroller-initramfs.bb} (92%)
 rename meta/recipes-extended/images/{core-image-testmaster.bb => core-image-testcontroller.bb} (70%)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 44bc3bf1315..e43c0acd80c 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -42,8 +42,8 @@ DISTRO_PN_ALIAS:pn-core-image-rt-sdk = "OE-Core"
 DISTRO_PN_ALIAS:pn-core-image-sato = "OE-Core"
 DISTRO_PN_ALIAS:pn-core-image-sato-dev = "OE-Core"
 DISTRO_PN_ALIAS:pn-core-image-sato-sdk = "OE-Core"
-DISTRO_PN_ALIAS:pn-core-image-testmaster = "OE-Core"
-DISTRO_PN_ALIAS:pn-core-image-testmaster-initramfs = "OE-Core"
+DISTRO_PN_ALIAS:pn-core-image-testcontroller = "OE-Core"
+DISTRO_PN_ALIAS:pn-core-image-testcontroller-initramfs = "OE-Core"
 DISTRO_PN_ALIAS:pn-core-image-weston = "OE-Core"
 DISTRO_PN_ALIAS:pn-core-image-x11 = "OE-Core"
 DISTRO_PN_ALIAS:pn-createrepo-c = "Fedora=createrepo_c Clear=createrepo_c"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 32ec391eb9e..740e5fe55c4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -112,8 +112,8 @@ RECIPE_MAINTAINER:pn-core-image-ptest-all = "Richard Purdie <richard.purdie@linu
 RECIPE_MAINTAINER:pn-core-image-ptest-fast = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-sato = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-sato-sdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-core-image-testmaster-initramfs = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-core-image-testmaster = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-core-image-testcontroller-initramfs = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-core-image-testcontroller = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-weston = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-weston-sdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-x11 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/controllerimage.py
similarity index 84%
rename from meta/lib/oeqa/controllers/masterimage.py
rename to meta/lib/oeqa/controllers/controllerimage.py
index 0bf5917e481..78a4aaff873 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/controllerimage.py
@@ -3,13 +3,13 @@
 # SPDX-License-Identifier: MIT
 #
 # This module adds support to testimage.bbclass to deploy images and run
-# tests using a "master image" - this is a "known good" image that is
+# tests using a "controller image" - this is a "known good" image that is
 # installed onto the device as part of initial setup and will be booted into
 # with no interaction; we can then use it to deploy the image to be tested
 # to a second partition before running the tests.
 #
-# For an example master image, see core-image-testmaster
-# (meta/recipes-extended/images/core-image-testmaster.bb)
+# For an example controller image, see core-image-testcontroller
+# (meta/recipes-extended/images/core-image-testcontroller.bb)
 
 import os
 import bb
@@ -24,12 +24,12 @@ from oeqa.utils import CommandError
 
 from abc import ABCMeta, abstractmethod
 
-class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta):
+class ControllerImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta):
 
     supported_image_fstypes = ['tar.gz', 'tar.bz2']
 
     def __init__(self, d):
-        super(MasterImageHardwareTarget, self).__init__(d)
+        super(ControllerImageHardwareTarget, self).__init__(d)
 
         # target ip
         addr = d.getVar("TEST_TARGET_IP") or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
@@ -61,8 +61,8 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
         if not os.path.isfile(self.kernel):
             bb.fatal("No kernel found. Expected path: %s" % self.kernel)
 
-        # master ssh connection
-        self.master = None
+        # controller ssh connection
+        self.controller = None
         # if the user knows what they are doing, then by all means...
         self.user_cmds = d.getVar("TEST_DEPLOY_CMDS")
         self.deploy_cmds = None
@@ -119,19 +119,19 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
 
     def deploy(self):
         # base class just sets the ssh log file for us
-        super(MasterImageHardwareTarget, self).deploy()
-        self.master = sshcontrol.SSHControl(ip=self.ip, logfile=self.sshlog, timeout=600, port=self.port)
-        status, output = self.master.run("cat /etc/masterimage")
+        super(ControllerImageHardwareTarget, self).deploy()
+        self.controller = sshcontrol.SSHControl(ip=self.ip, logfile=self.sshlog, timeout=600, port=self.port)
+        status, output = self.controller.run("cat /etc/controllerimage")
         if status != 0:
-            # We're not booted into the master image, so try rebooting
-            bb.plain("%s - booting into the master image" % self.pn)
+            # We're not booted into the controller image, so try rebooting
+            bb.plain("%s - booting into the controller image" % self.pn)
             self.power_ctl("cycle")
             self._wait_until_booted()
 
         bb.plain("%s - deploying image on target" % self.pn)
-        status, output = self.master.run("cat /etc/masterimage")
+        status, output = self.controller.run("cat /etc/controllerimage")
         if status != 0:
-            bb.fatal("No ssh connectivity or target isn't running a master image.\n%s" % output)
+            bb.fatal("No ssh connectivity or target isn't running a controller image.\n%s" % output)
         if self.user_cmds:
             self.deploy_cmds = self.user_cmds.split("\n")
         try:
@@ -156,10 +156,10 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
 
     def stop(self):
         bb.plain("%s - reboot/powercycle target" % self.pn)
-        self.power_cycle(self.master)
+        self.power_cycle(self.controller)
 
 
-class SystemdbootTarget(MasterImageHardwareTarget):
+class SystemdbootTarget(ControllerImageHardwareTarget):
 
     def __init__(self, d):
         super(SystemdbootTarget, self).__init__(d)
@@ -184,16 +184,16 @@ class SystemdbootTarget(MasterImageHardwareTarget):
 
     def _deploy(self):
         # make sure these aren't mounted
-        self.master.run("umount /boot; umount /mnt/testrootfs; umount /sys/firmware/efi/efivars;")
+        self.controller.run("umount /boot; umount /mnt/testrootfs; umount /sys/firmware/efi/efivars;")
         # from now on, every deploy cmd should return 0
         # else an exception will be thrown by sshcontrol
-        self.master.ignore_status = False
-        self.master.copy_to(self.rootfs, "~/test-rootfs." + self.image_fstype)
-        self.master.copy_to(self.kernel, "~/test-kernel")
+        self.controller.ignore_status = False
+        self.controller.copy_to(self.rootfs, "~/test-rootfs." + self.image_fstype)
+        self.controller.copy_to(self.kernel, "~/test-kernel")
         for cmd in self.deploy_cmds:
-            self.master.run(cmd)
+            self.controller.run(cmd)
 
     def _start(self, params=None):
-        self.power_cycle(self.master)
+        self.power_cycle(self.controller)
         # there are better ways than a timeout but this should work for now
         time.sleep(120)
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index 60a5fbbfbfd..e31224b3afd 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -13,7 +13,7 @@ class SSHTest(OERuntimeTestCase):
     def test_ssh(self):
         (status, output) = self.target.run('uname -a')
         self.assertEqual(status, 0, msg='SSH Test failed: %s' % output)
-        (status, output) = self.target.run('cat /etc/masterimage')
-        msg = "This isn't the right image  - /etc/masterimage " \
+        (status, output) = self.target.run('cat /etc/controllerimage')
+        msg = "This isn't the right image  - /etc/controllerimage " \
               "shouldn't be here %s" % output
         self.assertEqual(status, 1, msg=msg)
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
index b351985a61c..1fcd29e54ce 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -133,7 +133,7 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /rootmnt
 echo "Copying rootfs files..."
 cp -a /rootmnt/* /ssd
 
-touch /ssd/etc/masterimage
+touch /ssd/etc/controllerimage
 
 if [ -d /ssd/etc/ ] ; then
     # We dont want udev to mount our root device while we're booting...
diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index ac621605287..7b49001659d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -158,7 +158,7 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
 
-touch /tgt_root/etc/masterimage
+touch /tgt_root/etc/controllerimage
 
 if [ -d /tgt_root/etc/ ] ; then
     echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
diff --git a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb b/meta/recipes-extended/images/core-image-testcontroller-initramfs.bb
similarity index 92%
rename from meta/recipes-extended/images/core-image-testmaster-initramfs.bb
rename to meta/recipes-extended/images/core-image-testcontroller-initramfs.bb
index 1a2e0af27ba..2bc035a538d 100644
--- a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
+++ b/meta/recipes-extended/images/core-image-testcontroller-initramfs.bb
@@ -7,7 +7,7 @@ PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install-testfs initramfs-l
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
 
-export IMAGE_BASENAME = "core-image-testmaster-initramfs"
+export IMAGE_BASENAME = "core-image-testcontroller-initramfs"
 IMAGE_NAME_SUFFIX ?= ""
 IMAGE_LINGUAS = ""
 
diff --git a/meta/recipes-extended/images/core-image-testmaster.bb b/meta/recipes-extended/images/core-image-testcontroller.bb
similarity index 70%
rename from meta/recipes-extended/images/core-image-testmaster.bb
rename to meta/recipes-extended/images/core-image-testcontroller.bb
index 0faf18f5a4e..20edbd5630c 100644
--- a/meta/recipes-extended/images/core-image-testmaster.bb
+++ b/meta/recipes-extended/images/core-image-testcontroller.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A master image to be deployed on a target useful for testing other images"
+DESCRIPTION = "A test controller image to be deployed on a target useful for testing other images using the OEQA runtime tests"
 
 IMAGE_FEATURES += "ssh-server-openssh package-management"
 
@@ -14,5 +14,5 @@ IMAGE_INSTALL += "\
 # we need a particular initramfs for live images
 # that pulls custom install scripts which take
 # care of partitioning for us
-INITRD_IMAGE = "core-image-testmaster-initramfs"
+INITRD_IMAGE = "core-image-testcontroller-initramfs"
 
-- 
2.32.0


