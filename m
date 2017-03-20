Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.visioncatalog.com [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 899A7719B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 12:18:53 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 0F559A00368
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 13:19:25 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017032013185344-378732 ;
	Mon, 20 Mar 2017 13:18:53 +0100 
From: Daniel Schultz <d.schultz@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 13:18:52 +0100
Message-Id: <1490012333-43021-2-git-send-email-d.schultz@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1490012333-43021-1-git-send-email-d.schultz@phytec.de>
References: <1490012333-43021-1-git-send-email-d.schultz@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 20.03.2017 13:18:53,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 20.03.2017 13:18:53,
	Serialize complete at 20.03.2017 13:18:53
X-TNEFEvaluated: 1
Subject: [PATCH 2/3] wic: partition.py: Add fsck to avoid corrupt EXT file systems
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
X-List-Received-Date: Mon, 20 Mar 2017 12:18:53 -0000

This patch avoids the creation of a corrupt EXT file system.

Since there are no checks if a EXT file system was successfully created,
this should add to prevent possible system failures.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 scripts/lib/wic/partition.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 6ef8d7f..8e32afc 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -286,6 +286,9 @@ class Partition():
             (self.fstype, extra_imagecmd, rootfs, label_str, rootfs_dir)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
+        mkfs_cmd = "fsck.%s -fy %s" % (self.fstype, rootfs)
+        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
+
     def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
-- 
1.9.1


