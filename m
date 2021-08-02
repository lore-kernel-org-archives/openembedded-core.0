Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002083"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002083"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:15 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478652775"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:14 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 19/37] parted: skip tests that need vfat support
Date: Mon,  2 Aug 2021 15:52:06 +0800
Message-Id: <414288ee0c96253b0714e10cd3be6c1366f4b10a.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

At the time of writing the qemu kernels don't support vfat filesystems.
There are patches on the list to add that, but as two tests fail without
vfat support, make them skip if vfat isn't available.

[ YOCTO #14470 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 17ecb3552cb7d7e7f82cc8b2e1b83f276525cbda)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../parted/files/check-vfat.patch             | 51 +++++++++++++++++++
 meta/recipes-extended/parted/parted_3.4.bb    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-extended/parted/files/check-vfat.patch

diff --git a/meta/recipes-extended/parted/files/check-vfat.patch b/meta/recipes-extended/parted/files/check-vfat.patch
new file mode 100644
index 0000000000..c64130a4e2
--- /dev/null
+++ b/meta/recipes-extended/parted/files/check-vfat.patch
@@ -0,0 +1,51 @@
+Add checks for both mkfs.vfat and the vfat file system in the kernel before
+running tests.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/tests/t-lib-helpers.sh b/tests/t-lib-helpers.sh
+index 4c6c75f..2cc7577 100644
+--- a/tests/t-lib-helpers.sh
++++ b/tests/t-lib-helpers.sh
+@@ -418,3 +418,13 @@ require_64bit_()
+           ;;
+   esac
+ }
++
++# Check if the specified filesystem is either built into the kernel, or can be loaded
++# as a module
++# Usage: has_filesystem vfat
++# Ruturns 0 if the filesystem is available, otherwise skips the test
++require_filesystem_()
++{
++  grep -q $1 /proc/filesystems && return 0
++  modprobe --quiet --dry-run $1 || skip_ "this test requires kernel support for $1"
++}
+diff --git a/tests/t1100-busy-label.sh b/tests/t1100-busy-label.sh
+index f1a13df..0f47b08 100755
+--- a/tests/t1100-busy-label.sh
++++ b/tests/t1100-busy-label.sh
+@@ -19,6 +19,9 @@
+ . "${srcdir=.}/init.sh"; path_prepend_ ../parted
+ require_root_
+ require_scsi_debug_module_
++require_fat_
++require_filesystem_ vfat
++
+ ss=$sector_size_
+ 
+ scsi_debug_setup_ sector_size=$ss dev_size_mb=90 > dev-name ||
+diff --git a/tests/t1101-busy-partition.sh b/tests/t1101-busy-partition.sh
+index e35e6f0..c813848 100755
+--- a/tests/t1101-busy-partition.sh
++++ b/tests/t1101-busy-partition.sh
+@@ -22,6 +22,8 @@ test "$VERBOSE" = yes && parted --version
+ 
+ require_root_
+ require_scsi_debug_module_
++require_fat_
++require_filesystem_ vfat
+ 
+ # create memory-backed device
+ scsi_debug_setup_ dev_size_mb=80 > dev-name ||
diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-extended/parted/parted_3.4.bb
index 6f9f0a3106..4260f3a0d4 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
            file://0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch \
            file://run-ptest \
+           file://check-vfat.patch \
            "
 
 SRC_URI[md5sum] = "357d19387c6e7bc4a8a90fe2d015fe80"
-- 
2.31.1

