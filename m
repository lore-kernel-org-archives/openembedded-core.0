Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8E47845C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:42:33 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 25 Aug 2017 06:42:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,425,1498546800"; d="scan'208";a="143871673"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2017 06:42:34 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0129E58059A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 06:42:33 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 16:41:42 +0300
Message-Id: <4b6755eb6189c5a1b8fac8905fb5485603d7eb10.1503667857.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503667857.git.ed.bartosh@linux.intel.com>
References: <cover.1503667857.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 07/10] wic: extend list of used tools
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
X-List-Received-Date: Fri, 25 Aug 2017 13:42:33 -0000

Added sfdisk, e2fsck, mkswap, resize2fs, mkdosfs to the
list of used tools in Disk class. They're going to be used
in 'wic write' implementation.

Added dependency to util-linux to wic-tools to ensure that
sfdisk and mkswap are available from wic-tools native sysroot.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-core/meta/wic-tools.bb | 3 ++-
 scripts/lib/wic/engine.py           | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 428befe..57dd37a 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -5,7 +5,8 @@ LICENSE = "MIT"
 DEPENDS = "\
            parted-native syslinux-native gptfdisk-native dosfstools-native \
            mtools-native bmap-tools-native grub-efi-native cdrtools-native \
-           btrfs-tools-native squashfs-tools-native pseudo-native e2fsprogs-native \
+           btrfs-tools-native squashfs-tools-native pseudo-native \
+           e2fsprogs-native util-linux-native \
            "
 DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
 DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index a6ea362..3c1f0d3 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -276,7 +276,8 @@ class Disk:
 
     def __getattr__(self, name):
         """Get path to the executable in a lazy way."""
-        if name in ("mdir", "mcopy", "mdel", "mdeltree"):
+        if name in ("mdir", "mcopy", "mdel", "mdeltree", "sfdisk", "e2fsck",
+                    "resize2fs", "mkswap", "mkdosfs"):
             aname = "_%s" % name
             if aname not in self.__dict__:
                 setattr(self, aname, find_executable(name, self.paths))
-- 
2.1.4


