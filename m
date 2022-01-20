Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE17C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 15:21:52 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.13117.1642692111026511420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 69FEBE0010;
	Thu, 20 Jan 2022 15:21:48 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] runqemu: automatically turn on "kvm" on x86 CPUs with VT
Date: Thu, 20 Jan 2022 16:21:46 +0100
Message-Id: <20220120152146.1912559-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 15:21:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160769

This automatically turns on the "kvm" option when emulating
an x86 system on x86 CPUs with VT capability.

On an Intel i7-5600U CPU at 2.60GHz, using the "kvm"
option is at least 4x faster, booting "core-image-minimal" for qemux86-64.
The performance difference can even be bigger for larger systems.

Rather than changing the documentation to remind users
to use this option, that's easier to enable this option by
default on suitable systems.

A "noautokvm" option is added to disable this default,
and keep the previous behavior.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 scripts/runqemu | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 4e05c1bb15..b500ba2afa 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -78,8 +78,9 @@ of the following environment variables (in any order):
     serialstdio - enable a serial console on the console (regardless of graphics mode)
     slirp - enable user networking, no root privileges is required
     snapshot - don't write changes to back to images
-    kvm - enable KVM when running x86/x86_64 (VT-capable CPU required)
+    kvm - enable KVM. Enabled by default when running x86/x86_64 with a VT-capable CPU
     kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capable CPU required)
+    noautokvm - don't enable KVM automatically on x86/x86_64 with a VT-capable CPU
     publicvnc - enable a VNC server open to all hosts
     audio - enable audio
     [*/]ovmf* - OVMF firmware file or base name for booting with UEFI
@@ -170,6 +171,7 @@ class BaseConfig(object):
         self.fstype = ''
         self.kvm_enabled = False
         self.vhost_enabled = False
+        self.noautokvm = False
         self.slirp_enabled = False
         self.net_bridge = None
         self.nfs_instance = 0
@@ -506,6 +508,8 @@ class BaseConfig(object):
                 self.kvm_enabled = True
             elif arg == 'kvm-vhost':
                 self.vhost_enabled = True
+            elif arg == 'noautokvm':
+                self.noautokvm = True
             elif arg == 'slirp':
                 self.slirp_enabled = True
             elif arg.startswith('bridge='):
@@ -550,8 +554,18 @@ class BaseConfig(object):
             if s:
                 self.set("DEPLOY_DIR_IMAGE", s.group(1))
 
+    def kvm_cap_x86(self):
+        with open('/proc/cpuinfo', 'r') as f:
+            return re.search('vmx|svm', "".join(f.readlines()))
+
     def check_kvm(self):
-        """Check kvm and kvm-host"""
+        """Check kvm and kvm-vhost"""
+	# Turn on KVM by default emulating x86 on x86 CPUs with VT
+	# Can be disabled with the "noautokvm" option
+        if self.qemu_system.endswith(('i386', 'x86_64')) and not self.noautokvm:
+            if self.kvm_cap_x86():
+                self.kvm_enabled = True
+
         if not (self.kvm_enabled or self.vhost_enabled):
             self.qemu_opt_script += ' %s %s %s' % (self.get('QB_MACHINE'), self.get('QB_CPU'), self.get('QB_SMP'))
             return
@@ -565,9 +579,7 @@ class BaseConfig(object):
         dev_kvm = '/dev/kvm'
         dev_vhost = '/dev/vhost-net'
         if self.qemu_system.endswith(('i386', 'x86_64')):
-            with open('/proc/cpuinfo', 'r') as f:
-                kvm_cap = re.search('vmx|svm', "".join(f.readlines()))
-            if not kvm_cap:
+            if not self.kvm_cap_x86():
                 logger.error("You are trying to enable KVM on a cpu without VT support.")
                 logger.error("Remove kvm from the command-line, or refer:")
                 raise RunQemuError(yocto_kvm_wiki)
-- 
2.25.1


