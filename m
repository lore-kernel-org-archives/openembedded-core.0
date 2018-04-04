Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id A6B2F74848
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599850"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:17 +0300
Message-Id: <20180404111321.10824-18-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/22] btrfs-tools: update to 4.15.1
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:14 -0000

Drop upstreamed 0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch

Add ftw-subdir-walk.patch as it resolves the RECIPE_NO_UPDATE_REASON.

Add --disable-zstd as libzstd isn't provided in oe-core.

Fix wic testcase, as the minimal fs size is now bigger.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py                |  2 +-
 ...ith-musl-missing-header-include-for-dev_t.patch | 26 --------
 .../btrfs-tools/btrfs-tools/ftw-subdir-walk.patch  | 69 ++++++++++++++++++++++
 ...btrfs-tools_4.13.3.bb => btrfs-tools_4.15.1.bb} |  6 +-
 4 files changed, 73 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/ftw-subdir-walk.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.13.3.bb => btrfs-tools_4.15.1.bb} (84%)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b84466d9aef..055175212a6 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -765,7 +765,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                             'part emptyvfat   --fstype vfat   --size 1M\n',
                             'part emptymsdos  --fstype msdos  --size 1M\n',
                             'part emptyext2   --fstype ext2   --size 1M\n',
-                            'part emptybtrfs  --fstype btrfs  --size 100M\n'])
+                            'part emptybtrfs  --fstype btrfs  --size 150M\n'])
             wks.flush()
             cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
             self.assertEqual(0, runCmd(cmd).status)
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch
deleted file mode 100644
index 790676b9cbf..00000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From bc35c4caebb57cc8b96c30c25432b12ca8dc18d5 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 6 Oct 2017 15:03:49 +0300
-Subject: [PATCH] Fix build with musl (missing header include for dev_t).
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- convert/source-fs.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/convert/source-fs.h b/convert/source-fs.h
-index 23f3356..6fd770f 100644
---- a/convert/source-fs.h
-+++ b/convert/source-fs.h
-@@ -20,6 +20,7 @@
- #include "kerncompat.h"
- #include <linux/kdev_t.h>
- #include <pthread.h>
-+#include <sys/types.h>
- 
- #define CONV_IMAGE_SUBVOL_OBJECTID BTRFS_FIRST_FREE_OBJECTID
- 
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/ftw-subdir-walk.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/ftw-subdir-walk.patch
new file mode 100644
index 00000000000..fbe0c47849f
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/ftw-subdir-walk.patch
@@ -0,0 +1,69 @@
+From patchwork Wed Mar 28 06:39:09 2018
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: btrfs-progs: mkfs/rootdir: Don't follow symbolic link when calcuating
+ size
+From: Qu Wenruo <wqu@suse.com>
+X-Patchwork-Id: 10312225
+Message-Id: <20180328063909.937-1-wqu@suse.com>
+To: linux-btrfs@vger.kernel.org
+Date: Wed, 28 Mar 2018 14:39:09 +0800
+
+[BUG]
+If we have a symbolic link in rootdir pointing to non-existing location,
+mkfs.btrfs --rootdir will just fail:
+------
+$ mkfs.btrfs  -f --rootdir /tmp/rootdir/ /dev/data/btrfs
+btrfs-progs v4.15.1
+See http://btrfs.wiki.kernel.org for more information.
+
+ERROR: ftw subdir walk of /tmp/rootdir/ failed: No such file or directory
+------
+
+[CAUSE]
+Commit 599a0abed564 ("btrfs-progs: mkfs/rootdir: Use over-reserve method
+to make size estimate easier") add extra ftw walk to estimate the
+filesystem size.
+
+Such default ftw walk will follow symbolic link and gives ENOENT error.
+
+[FIX]
+Use nftw() to specify FTW_PHYS so we won't follow symbolic link for size
+calculation.
+
+Reported-by: Alexander Kanavin <alexander.kanavin@intel.com>
+Fixes: 599a0abed564 ("btrfs-progs: mkfs/rootdir: Use over-reserve method to make size estimate easier")
+Signed-off-by: Qu Wenruo <wqu@suse.com>
+Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10312225/]
+---
+ mkfs/rootdir.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/mkfs/rootdir.c b/mkfs/rootdir.c
+index a1d223a2408a..33c3ff1e18cf 100644
+--- a/mkfs/rootdir.c
++++ b/mkfs/rootdir.c
+@@ -696,7 +696,7 @@ out:
+ }
+ 
+ static int ftw_add_entry_size(const char *fpath, const struct stat *st,
+-			      int type)
++			      int type, struct FTW *ftwbuf)
+ {
+ 	/*
+ 	 * Failed to read the directory, mostly due to EPERM.  Abort ASAP, so
+@@ -731,7 +731,12 @@ u64 btrfs_mkfs_size_dir(const char *dir_name, u32 sectorsize, u64 min_dev_size,
+ 	fs_block_size = sectorsize;
+ 	ftw_data_size = 0;
+ 	ftw_meta_nr_inode = 0;
+-	ret = ftw(dir_name, ftw_add_entry_size, 10);
++
++	/*
++	 * Symbolic link is not followed when creating files, so no need to
++	 * follow them here.
++	 */
++	ret = nftw(dir_name, ftw_add_entry_size, 10, FTW_PHYS);
+ 	if (ret < 0) {
+ 		error("ftw subdir walk of %s failed: %s", dir_name,
+ 			strerror(errno));
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.15.1.bb
similarity index 84%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.15.1.bb
index bc157e26776..f7ea27321cf 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.15.1.bb
@@ -14,18 +14,18 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "a7a1ea0f4f2a1d6eeeb3d106e062c7f1034f16d4"
+SRCREV = "3097f02c948f69f520c565ff8f8ba476aa6edb88"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
-           file://0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch \
+           file://ftw-subdir-walk.patch \
            "
 
-RECIPE_NO_UPDATE_REASON = "Waiting for resolution of https://github.com/kdave/btrfs-progs/issues/109"
 inherit autotools-brokensep pkgconfig manpages
 
 CLEANBROKEN = "1"
 
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
+EXTRA_OECONF = " --disable-zstd"
 EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
 
 do_configure_prepend() {
-- 
2.16.1


