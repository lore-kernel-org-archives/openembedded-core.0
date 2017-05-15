Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7095772F28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 14:20:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 07:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,345,1491289200"; d="scan'208";a="1147964269"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 15 May 2017 07:20:28 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id C78FA6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 07:20:12 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 16:57:34 +0300
Message-Id: <a5d1fee7f7cdf7fbb3ee8e7f4b30191377c84574.1494856157.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494856157.git.ed.bartosh@linux.intel.com>
References: <cover.1494856157.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/8] bootimg-pcbios: make boot image file unique
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
X-List-Received-Date: Mon, 15 May 2017 14:20:27 -0000

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


