Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 45F027210C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 16:22:24 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so3166870pad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V4446VrTJXcwWp9eV3tB4Tayec06/8+8aXOi3z8vKM4=;
	b=kKX/8fkOjs2/vq/c6KtAmRwkrOzOo4Ltxw9UIqAd/4P74LjdOZftb+AzedoIbUyp14
	vLtqCz3syLgdPaydvZ+XWsYsYf+wcg5aHWHEUUSasG7r5mS/cCDZsrAQ5fpfbIePlFef
	MFTBpO8YrcTTlZ1DqI4yzNmh9+V0+NklvFuSaExz8RU4isPi5PyZL3YGEuYGgHh5MzNr
	kFmXwl1NMW5G4/8GjWeSvdFLJK0cDrErhuzPPP3gcndeuAgtdrc2//Q7rPAO7asdYMk9
	2DCnPs3N4UIcm2IljOl2doXF0lZn3/Ba+wv1EiVjA6IYOHDmfDH9cG77mOhiS48mxeHx
	PE6g==
X-Received: by 10.66.248.104 with SMTP id yl8mr15624051pac.2.1417018945192;
	Wed, 26 Nov 2014 08:22:25 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qn1sm4736673pdb.42.2014.11.26.08.22.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Nov 2014 08:22:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 08:22:05 -0800
Message-Id: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417018567.git.akuster808@gmail.com>
References: <cover.1417018567.git.akuster808@gmail.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 01/11] wic: Don't allow mkfs to fail silently in partition command
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
X-List-Received-Date: Wed, 26 Nov 2014 16:22:25 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

The return code from the mkfs command used by the partition creation
command was being ignored, allowing it to silently fail and leaving
users mystified as to why the resulting filesystem was corrupted.

This became obvious when failures occurred when creating large
e.g. sdk filesystems [YOCTO #6863].

(From OE-Core rev: 8cef3b06f7e9f9d922673f430ddb3170d2fac000)

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../lib/wic/kickstart/custom_commands/partition.py | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 8b0ace6..3950b43 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -241,8 +241,10 @@ class Wic_PartData(Mic_PartData):
 
         mkfs_cmd = "mkfs.%s -F %s %s -d %s" % \
             (self.fstype, extra_imagecmd, rootfs, image_rootfs)
-        exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
-
+        (rc, out) = exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
+        if rc:
+            print "rootfs_dir: %s" % rootfs_dir
+            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details) when creating filesystem from rootfs directory: %s" % (self.fstype, rc, rootfs_dir))
 
         # get the rootfs size in the right units for kickstart (Mb)
         du_cmd = "du -Lbms %s" % rootfs
@@ -284,7 +286,9 @@ class Wic_PartData(Mic_PartData):
 
         mkfs_cmd = "mkfs.%s -b %d -r %s %s" % \
             (self.fstype, rootfs_size * 1024, image_rootfs, rootfs)
-        exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
+        (rc, out) = exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
+        if rc:
+            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details) when creating filesystem from rootfs directory: %s" % (self.fstype, rc, rootfs_dir))
 
         # get the rootfs size in the right units for kickstart (Mb)
         du_cmd = "du -Lbms %s" % rootfs
@@ -396,7 +400,9 @@ class Wic_PartData(Mic_PartData):
         extra_imagecmd = "-i 8192"
 
         mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, fs)
-        exec_native_cmd(mkfs_cmd, native_sysroot)
+        (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
+        if rc:
+            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
 
         self.source_file = fs
 
@@ -414,10 +420,14 @@ class Wic_PartData(Mic_PartData):
         exec_cmd(dd_cmd)
 
         mkfs_cmd = "mkfs.%s -b %d %s" % (self.fstype, self.size * 1024, rootfs)
-        exec_native_cmd(mkfs_cmd, native_sysroot)
+        (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
+        if rc:
+            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
 
         mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, fs)
-        exec_native_cmd(mkfs_cmd, native_sysroot)
+        (rc, out) = exec_native_cmd(mkfs_cmd, native_sysroot)
+        if rc:
+            msger.error("ERROR: mkfs.%s returned '%s' instead of 0 (which you probably don't want to ignore, use --debug for details)" % (self.fstype, rc))
 
         self.source_file = fs
 
-- 
1.9.1


