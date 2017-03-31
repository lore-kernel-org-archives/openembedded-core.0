Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.phycard.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 21D5277D91
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 12:51:47 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 05AB9A00368
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 14:52:23 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017033114514715-433758 ;
	Fri, 31 Mar 2017 14:51:47 +0200 
From: Daniel Schultz <d.schultz@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2017 14:51:47 +0200
Message-Id: <1490964707-38823-1-git-send-email-d.schultz@phytec.de>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 31.03.2017 14:51:47,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 31.03.2017 14:51:47,
	Serialize complete at 31.03.2017 14:51:47
X-TNEFEvaluated: 1
Subject: [PATCH morty v2] wic: partition: Run fsck on EXT file systems
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
X-List-Received-Date: Fri, 31 Mar 2017 12:51:49 -0000

Mkfs may create EXT file systems which can only be optimized by fsck
and not by itself, e.g. directory optimization (in Pass 3A).

To prevent those optimizations during runtime, it will be performed after
the creation of an EXT file system.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 scripts/lib/wic/partition.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 3b3bd2d..152eb7b 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -239,6 +239,9 @@ class Partition():
             (self.fstype, extra_imagecmd, rootfs, label_str, rootfs_dir)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
+        mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
+        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
+
     def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
-- 
1.9.1


