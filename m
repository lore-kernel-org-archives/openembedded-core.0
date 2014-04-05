Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id D621F6B6BA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Apr 2014 02:14:29 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id a41so3915581yho.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 19:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=34gIH3BUG+HsqTYPoe/MyDV9DnXF0mOVtxLAv68/Mmw=;
	b=HrBV2gVrMLj1HzHPO53Fn26rdNOfy/XIfKe6jicAnLg58zrf39EmIhU9Cd8ZC2XtVh
	qc2CaDBXJsa8ryIkeOROhjcrzIFpiFOCYfuriQoStGS93N6gOynuMFzwetThGrZP0ASj
	wmmi47A1DBUyUk+eAQ5y4wI1pGZC36Zqaf3N6r4GFf4acwdog2+3ZxRgG8oMxmIm5nfG
	WioWXkf1Tdjum6MsxBgmv5OiFcqrG+CDHYD+eMSt7VPNh5gTVcudf147SXKgEym019Xu
	+9jw5mfvyrmS8MQGv2rUw5MkotslSIKGF82qqzv1bapdeS2sXJCTqhE/nVwcd1HwQYP0
	SQuQ==
X-Received: by 10.236.86.226 with SMTP id w62mr903594yhe.94.1396664070443;
	Fri, 04 Apr 2014 19:14:30 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id n5sm18173596yhn.43.2014.04.04.19.14.28
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Apr 2014 19:14:30 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 23:14:11 -0300
Message-Id: <1396664051-11430-4-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1396664051-11430-1-git-send-email-joaohf@gmail.com>
References: <1396664051-11430-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 3/3] wic: Extend indirect string connection to support image names and rootfs
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
X-List-Received-Date: Sat, 05 Apr 2014 02:14:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The wic command-line param --rootfs-dir gets extended to support
multiple directories and image names. Each '--rootfs-dir' could be
connected using a special string. This special string is a image
name which gets expanded by bitbake to get 'IMAGE_ROOTFS' or
a rootfs-dir path pointing to rootfs directory. Like this:

  wic create ... --rootfs-dir rootfs1=core-image-minimal \
    --rootfs-dir rootfs2=core-image-minimal-dev

.wks:

  part / --source rootfs --rootfs-dir="rootfs1" --ondisk sda --fstype=ext3 \
    --label primary --align 1024

  part /standby --source rootfs --rootfs-dir="rootfs2" \
    --ondisk sda --fstype=ext3 --label secondary --align 1024

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/mic/plugins/source/rootfs.py | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/mic/plugins/source/rootfs.py b/scripts/lib/mic/plugins/source/rootfs.py
index 75999e0..a4d4547 100644
--- a/scripts/lib/mic/plugins/source/rootfs.py
+++ b/scripts/lib/mic/plugins/source/rootfs.py
@@ -43,6 +43,25 @@ from mic.imager.direct import DirectImageCreator
 class RootfsPlugin(SourcePlugin):
     name = 'rootfs'
 
+    @staticmethod
+    def __get_rootfs_dir(rootfs_dir):
+        if os.path.isdir(rootfs_dir):
+            return rootfs_dir
+
+        bitbake_env_lines = find_bitbake_env_lines(rootfs_dir)
+        if not bitbake_env_lines:
+            msg = "Couldn't get bitbake environment, exiting."
+            msger.error(msg)
+
+        image_rootfs_dir = find_artifact(bitbake_env_lines, "IMAGE_ROOTFS")
+        if not os.path.isdir(image_rootfs_dir):
+            msg = "No valid artifact IMAGE_ROOTFS from image named"
+            msg += " %s has been found at %s, exiting.\n" % \
+                (rootfs_dir, image_rootfs_dir)
+            msger.error(msg)
+
+        return image_rootfs_dir
+
     @classmethod
     def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
                              kernel_dir, krootfs_dir, native_sysroot):
@@ -59,13 +78,15 @@ class RootfsPlugin(SourcePlugin):
         else:
             if part.rootfs in krootfs_dir:
                 rootfs_dir = krootfs_dir[part.rootfs]
-            elif os.path.isdir(part.rootfs):
+            elif part.rootfs:
                 rootfs_dir = part.rootfs
             else:
                 msg = "Couldn't find --rootfs-dir=%s connection"
                 msg += " or it is not a valid path, exiting"
                 msger.error(msg % part.rootfs)
 
-        part.set_rootfs(rootfs_dir)
-        part.prepare_rootfs(cr_workdir, oe_builddir, rootfs_dir, native_sysroot)
+        real_rootfs_dir = self.__get_rootfs_dir(rootfs_dir)
+
+        part.set_rootfs(real_rootfs_dir)
+        part.prepare_rootfs(cr_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
 
-- 
1.8.3.2


