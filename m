Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CDC676E681
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 13:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3MDpSmQ009244; Fri, 22 Apr 2016 14:51:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cLLbfPk_aSTs; Fri, 22 Apr 2016 14:51:28 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3MDpMLi009237
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 22 Apr 2016 14:51:23 +0100
Message-ID: <1461333082.31320.121.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Apr 2016 14:51:22 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] lib/oe/rootfs: Fix DEBUGFS generation when using opkg
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
X-List-Received-Date: Fri, 22 Apr 2016 13:51:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When enabling extra DEBUGFS image generation with opkg, errors are seen like:

ERROR: core-image-minimal-1.0-r0 do_rootfs: Cannot get the installed packages list. Command '/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg -f /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/opkg.conf -o /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs  --force_postinstall --prefer-arch-to-version   status' returned 0 and stderr:
Collected errors:
 * file_md5sum_alloc: Failed to open file /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/syslog-startup.conf.busybox: No such file or directory.
 * file_md5sum_alloc: Failed to open file /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/fstab: No such file or directory.

basically for all CONFFILES in the image. This is due to the file rearranging
the rootfs generation code does. If we preserve the /etc directory,
the avoids the problem.

We need to tell copyfile to preserve symlinks since some are present in /etc.

[YOCTO #9490]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a95e1b7..0546c1e 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -122,7 +122,7 @@ class Rootfs(object):
         bb.note("  Copying back package database...")
         for dir in dirs:
             bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
-            shutil.copytree(self.image_rootfs + '-orig' + dir, self.image_rootfs + dir)
+            shutil.copytree(self.image_rootfs + '-orig' + dir, self.image_rootfs + dir, symlinks=True)
 
         cpath = oe.cachedpath.CachedPath()
         # Copy files located in /usr/lib/debug or /usr/src/debug
@@ -907,7 +907,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
 
         self.pm.install_complementary()
 
-        self._setup_dbg_rootfs(['/var/lib/opkg'])
+        self._setup_dbg_rootfs(['/etc', '/var/lib/opkg'])
 
         execute_pre_post_process(self.d, opkg_post_process_cmds)
 



