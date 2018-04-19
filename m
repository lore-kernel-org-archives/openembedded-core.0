Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF5A745EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 12:26:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3JCQ5NH009459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 19 Apr 2018 13:26:06 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1f98dZ-0003mB-H8; Thu, 19 Apr 2018 13:26:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Apr 2018 13:26:04 +0100
Message-Id: <1524140764-14477-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: [PATCH] wic/imager/direct: Ensure correct ROOTFS_DIR is shown
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
X-List-Received-Date: Thu, 19 Apr 2018 12:26:07 -0000

This changes the output of "wic create mkefidisk -e core-image-sato" from:

The following build artifacts were used to create the image(s):
  ROOTFS_DIR:                   /media/build1/poky/build/tmp.wic.ybraavmb/rootfs_copy

to:

The following build artifacts were used to create the image(s):
  ROOTFS_DIR:                   /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs

which s much less confusing for the user.

[YOCTO #12564]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/plugins/imager/direct.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 71c0b1c..1fa6b91 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -63,6 +63,7 @@ class DirectPlugin(ImagerPlugin):
 
         # parse possible 'rootfs=name' items
         self.rootfs_dir = dict(rdir.split('=') for rdir in rootfs_dir.split(' '))
+        self.replaced_rootfs_paths = {}
         self.bootimg_dir = bootimg_dir
         self.kernel_dir = kernel_dir
         self.native_sysroot = native_sysroot
@@ -183,6 +184,7 @@ class DirectPlugin(ImagerPlugin):
             new_rootfs = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
         if new_rootfs:
             # rootfs was copied to update fstab
+            self.replaced_rootfs_paths[new_rootfs] = self.rootfs_dir['ROOTFS_DIR']
             self.rootfs_dir['ROOTFS_DIR'] = new_rootfs
 
         for part in self.parts:
@@ -258,7 +260,10 @@ class DirectPlugin(ImagerPlugin):
                 suffix = ':'
             else:
                 suffix = '["%s"]:' % (part.mountpoint or part.label)
-            msg += '  ROOTFS_DIR%s%s\n' % (suffix.ljust(20), part.rootfs_dir)
+            rootdir = part.rootfs_dir
+            if rootdir in self.replaced_rootfs_paths:
+                rootdir = self.replaced_rootfs_paths[rootdir]
+            msg += '  ROOTFS_DIR%s%s\n' % (suffix.ljust(20), rootdir)
 
         msg += '  BOOTIMG_DIR:                  %s\n' % self.bootimg_dir
         msg += '  KERNEL_DIR:                   %s\n' % self.kernel_dir
-- 
2.7.4


