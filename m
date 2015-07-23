Return-Path: <ashcharles@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 02BCF761C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 21:44:17 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so2401851pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 14:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ea+o17pehVZje7C7evqyQe6o6/IEE/0rAPyTubBpKac=;
	b=CNIGgyYadOejKkgD++5pRfvlZhMBwSh8EVHoNpaAjprxig8KSBkF2VJswSIp2K5JbO
	VuNc1aqitdpC5n8tph/JvlW5SiQ8091+FOCmjsOLQbisERZqgo8uMFHEF9+gXRKiufR1
	aanMbrw7CQG7hW1udmzyh6XYOLTPXGjADAIud/MItwNyvSHZnYLav6Vwc3ySGLrE5C6g
	wTmHSPSLoU+PA+Qy0hsN47T2rMC0jfZkeInAFadtMjcRmpy6yapO+KNQx/yGRnQao39B
	I3Kyev0hBefKBc6Fg+TdtK64Fgup8dj+cZPgF9gOD9hifKg03TU6HBaag4Yuiw5csday
	ay1Q==
X-Received: by 10.70.134.198 with SMTP id pm6mr23190820pdb.17.1437687858213;
	Thu, 23 Jul 2015 14:44:18 -0700 (PDT)
Received: from gumstux.mystix.com (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180]) by smtp.gmail.com with ESMTPSA id
	g10sm10760875pat.35.2015.07.23.14.44.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jul 2015 14:44:17 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 14:44:14 -0700
Message-Id: <1437687855-6499-2-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437687855-6499-1-git-send-email-ashcharles@gmail.com>
References: <1437687855-6499-1-git-send-email-ashcharles@gmail.com>
Subject: [fido][PATCH 1/2] wic: remove intermediate partitions
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
X-List-Received-Date: Thu, 23 Jul 2015 21:44:20 -0000

From: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Remove intermediate partitions that may have been created by a previous
wic invocation. Those partitions are causing issues on some systems. In
particular vfat partition creation is hanging on mcopy execution on
Fedora.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index f3d553b..654c380 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -231,6 +231,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
 
+        os.remove(rootfs)
         du_cmd = "du -ks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
@@ -282,6 +283,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
+        os.remove(rootfs)
         du_cmd = "du -ks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
@@ -326,6 +328,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
+        os.remove(rootfs)
         du_cmd = "du -bks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
@@ -378,6 +381,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
 
+        os.remove(rootfs)
         squashfs_cmd = "mksquashfs %s %s -noappend" % \
                        (image_rootfs, rootfs)
         exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
@@ -416,6 +420,7 @@ class Wic_PartData(Mic_PartData):
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
+        os.remove(fs)
         dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
             (fs, self.size)
         exec_cmd(dd_cmd)
@@ -443,6 +448,7 @@ class Wic_PartData(Mic_PartData):
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
+        os.remove(fs)
         dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
             (fs, self.size)
         exec_cmd(dd_cmd)
@@ -467,6 +473,7 @@ class Wic_PartData(Mic_PartData):
         Prepare an empty vfat partition.
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
+        os.remove(fs)
 
         blocks = self.size
 
@@ -493,6 +500,7 @@ class Wic_PartData(Mic_PartData):
                       "Proceeding as requested." % self.mountpoint)
 
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
+        os.remove(fs)
 
         # it is not possible to create a squashfs without source data,
         # thus prepare an empty temp dir that is used as source
-- 
2.1.4


