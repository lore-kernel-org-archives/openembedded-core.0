Return-Path: <ashcharles@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 17F38761C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 21:44:18 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so2411745pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 14:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4X66WCTgtk7RAts3JvpSqSmgNUSLqHurIFyr4OO0SpU=;
	b=cqvCp9qwcYgQHNLJ1JL/rOE/NCEJNVuuZGgdNXKPmxDZlJCuqlgJQboEcWD1gmQYzH
	10RTlmKy3R3j3oG3QsYlMj2Kh166G7zexMgG+7MMGNMj1DnEyX76TMI4rlT6Rv0CfYDe
	9vyo5O6VbyaBL9nvxQkmj5CNKE0fUmf/jL6fE2SetLfAq00NsxcpB9QSSJNx+k+5uBnZ
	oeUyE7nmrUjoho5PaGx3irQUCyMpeE5E8d1KKwmzFDneC3QMIbR+CreD8uRjMb0bclB9
	QZelHmZ/5fchZfGhc7W5zm1ePcdFIXBHGdXl5rYUC96fhG9LcnBdP60DWi7tlgbK1Fzi
	PnGg==
X-Received: by 10.70.38.10 with SMTP id c10mr22986791pdk.72.1437687859075;
	Thu, 23 Jul 2015 14:44:19 -0700 (PDT)
Received: from gumstux.mystix.com (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180]) by smtp.gmail.com with ESMTPSA id
	g10sm10760875pat.35.2015.07.23.14.44.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jul 2015 14:44:18 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 14:44:15 -0700
Message-Id: <1437687855-6499-3-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437687855-6499-1-git-send-email-ashcharles@gmail.com>
References: <1437687855-6499-1-git-send-email-ashcharles@gmail.com>
Subject: [fido][PATCH 2/2] wic: Make sure file exists before removing it
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
X-List-Received-Date: Thu, 23 Jul 2015 21:44:19 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

Bunch of os.remove calls were added to the partition.py lately.
They're causing wic to fail with OSError: [Errno 2] No such file or directory
if file doesn't exist.

Added check for file existence to all recently added calls of
os.remove. That should fix this regression.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 654c380..7cfeec4 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -231,7 +231,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
 
-        os.remove(rootfs)
+        os.path.isfile(rootfs) and os.remove(rootfs)
         du_cmd = "du -ks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
@@ -283,7 +283,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        os.remove(rootfs)
+        os.path.isfile(rootfs) and os.remove(rootfs)
         du_cmd = "du -ks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
@@ -328,7 +328,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        os.remove(rootfs)
+        os.path.isfile(rootfs) and os.remove(rootfs)
         du_cmd = "du -bks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
@@ -381,7 +381,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
 
-        os.remove(rootfs)
+        os.path.isfile(rootfs) and os.remove(rootfs)
         squashfs_cmd = "mksquashfs %s %s -noappend" % \
                        (image_rootfs, rootfs)
         exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
@@ -420,7 +420,7 @@ class Wic_PartData(Mic_PartData):
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        os.remove(fs)
+        os.path.isfile(fs) and os.remove(fs)
         dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
             (fs, self.size)
         exec_cmd(dd_cmd)
@@ -448,7 +448,7 @@ class Wic_PartData(Mic_PartData):
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
-        os.remove(fs)
+        os.path.isfile(fs) and os.remove(fs)
         dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
             (fs, self.size)
         exec_cmd(dd_cmd)
@@ -473,7 +473,7 @@ class Wic_PartData(Mic_PartData):
         Prepare an empty vfat partition.
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
-        os.remove(fs)
+        os.path.isfile(fs) and os.remove(fs)
 
         blocks = self.size
 
@@ -500,7 +500,7 @@ class Wic_PartData(Mic_PartData):
                       "Proceeding as requested." % self.mountpoint)
 
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
-        os.remove(fs)
+        os.path.isfile(fs) and os.remove(fs)
 
         # it is not possible to create a squashfs without source data,
         # thus prepare an empty temp dir that is used as source
-- 
2.1.4


