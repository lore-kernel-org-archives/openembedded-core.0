Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.1101.1593105463923509713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 10:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: jwessel@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05PHHNJF016997
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 10:17:33 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 25 Jun 2020
 10:17:12 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 5002)	id 98F8D900DBE;
 Thu, 25 Jun 2020 10:17:12 -0700 (PDT)
From: "Jason Wessel" <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] runqemu: If using a vmtype image do not add the -no-reboot flag
Date: Thu, 25 Jun 2020 10:17:10 -0700
Message-ID: <20200625171710.86653-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

There is no way to use runqemu and turn off the no-reboot flag with a
command line argument.  If someone really wants it back it can be
added with the qemuparams="" argument.

Also if you use the "halt -p" from user space, the qemu will exit when
it is complete.  It is impossible to test self deploying image with
runqemu if you cannot reboot the device.  One might argue that you can
run runqemu in a loop, but that defeats the purpose of having a
wrapper around a tool that already does what is needed in the first
place.

For the vmtype images, the -no-reboot flag should not be added.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 scripts/runqemu | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 21680b4..5ae3e5e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1241,7 +1241,9 @@ class BaseConfig(object):
                         vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
 
                 # All branches above set vm_drive.
-                self.rootfs_options = '%s -no-reboot' % vm_drive
+                self.rootfs_options = vm_drive
+                if not self.fstype in self.vmtypes:
+                    self.rootfs_options += ' -no-reboot'
             self.kernel_cmdline = 'root=%s rw' % (self.get('QB_KERNEL_ROOT'))
 
         if self.fstype == 'nfs':
-- 
2.17.1

