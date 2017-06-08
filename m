Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2B36E7826A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 08 Jun 2017 09:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="1179988989"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2017 09:15:15 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id C7A3558029B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:14 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:12:45 +0300
Message-Id: <450de9ab74bbf2a08e160d1241259d6914b28b67.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 03/25] bootimg-pcbios: make boot image file unique
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:15 -0000

Plugin code uses boot.img file name for an image file. If there are
two partitions that use bootimg-pcbios wic breaks with an error
"file already exists: boot.img"

Made image file name unique by adding wks like number to it to fix
the issue.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 5890c12..98ad88b 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -186,7 +186,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
                      extra_blocks, part.mountpoint, blocks)
 
         # dosfs image, created by mkdosfs
-        bootimg = "%s/boot.img" % cr_workdir
+        bootimg = "%s/boot%s.img" % (cr_workdir, part.lineno)
 
         dosfs_cmd = "mkdosfs -n boot -S 512 -C %s %d" % (bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
-- 
2.1.4


