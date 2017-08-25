Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4917B784A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 20:13:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Aug 2017 13:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,426,1498546800"; d="scan'208";a="304483359"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 25 Aug 2017 13:13:04 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 5C15D5808E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:13:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 23:12:26 +0300
Message-Id: <3c061a817266af2f26979da81a6d23aef3b9cb62.1503691753.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503691753.git.ed.bartosh@linux.intel.com>
References: <cover.1503691753.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 5/8] wic: extend list of used tools
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
X-List-Received-Date: Fri, 25 Aug 2017 20:13:04 -0000

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
index 9f2e87f..4ffb08d 100644
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


