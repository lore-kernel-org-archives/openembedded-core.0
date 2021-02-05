Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2811.1612492102935951856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 18:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222071"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:28:22 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 93A504CE6D74
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Feb 2021 10:28:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:28:18 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] parted: upgrade 3.3 -> 3.4
Date: Fri, 5 Feb 2021 10:28:11 +0800
Message-ID: <1612492091-33259-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 93A504CE6D74.A3D0A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch
0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch
removed since they are included in 3.4

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...er-scripts-used-only-in-tests-to-Pyt.patch | 33 ----------
 ...s-add-sourcedir-lib-to-include-paths.patch | 26 --------
 ...rather-than-skip_test_-which-is-unde.patch | 66 -------------------
 .../parted/{parted_3.3.bb => parted_3.4.bb}   |  7 +-
 4 files changed, 2 insertions(+), 130 deletions(-)
 delete mode 100644 meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
 delete mode 100644 meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch
 delete mode 100644 meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch
 rename meta/recipes-extended/parted/{parted_3.3.bb => parted_3.4.bb} (83%)

diff --git a/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch b/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
deleted file mode 100644
index 829c0c8b78..0000000000
--- a/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ddbefd80d74c3baaae328332458db447e1666240 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 27 Apr 2017 16:37:24 +0300
-Subject: [PATCH] Move python helper scripts (used only in tests) to Python 3
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- tests/gpt-header-move | 2 +-
- tests/msdos-overlap   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/gpt-header-move b/tests/gpt-header-move
-index 3dda5cb..a2b9508 100755
---- a/tests/gpt-header-move
-+++ b/tests/gpt-header-move
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python3
- 
- # open img file, subtract 33 from altlba address, and move the last 33 sectors
- # back by 33 sectors
-diff --git a/tests/msdos-overlap b/tests/msdos-overlap
-index d6ae8d6..2c6747b 100755
---- a/tests/msdos-overlap
-+++ b/tests/msdos-overlap
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/env python3
- """
-     Write an overlapping partition to a msdos disk
- 
diff --git a/meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch b/meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch
deleted file mode 100644
index 4dc2ab259d..0000000000
--- a/meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d60a8a86f6593738b5324ccd8fe3e6d84a1fe7bc Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 11 Dec 2019 14:18:36 +0100
-Subject: [PATCH] libparted/fs: add $sourcedir/lib to include paths
-
-Otherwise, getopt-pfx-core.h won't be found.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- libparted/fs/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libparted/fs/Makefile.am b/libparted/fs/Makefile.am
-index 286bff6..65f45d3 100644
---- a/libparted/fs/Makefile.am
-+++ b/libparted/fs/Makefile.am
-@@ -3,7 +3,7 @@
- #
- # This file may be modified and/or distributed without restriction.
- 
--partedincludedir = -I$(top_builddir)/include -I$(top_srcdir)/include
-+partedincludedir = -I$(top_builddir)/include -I$(top_srcdir)/include -I$(top_srcdir)/lib
- 
- AM_CFLAGS = $(WARN_CFLAGS)
- 
diff --git a/meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch b/meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch
deleted file mode 100644
index 9524adf7b8..0000000000
--- a/meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 9f844484cedb39e301b016e9da7852c1a0fb6eea Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 11 Dec 2019 16:27:48 +0100
-Subject: [PATCH] tests: use skip_ rather than skip_test_ (which is undefined)
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/t6001-psep.sh               | 2 +-
- tests/t6004-dm-many-partitions.sh | 2 +-
- tests/t6005-dm-uuid.sh            | 2 +-
- tests/t6006-dm-512b-sectors.sh    | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tests/t6001-psep.sh b/tests/t6001-psep.sh
-index e350bd2..67014a0 100644
---- a/tests/t6001-psep.sh
-+++ b/tests/t6001-psep.sh
-@@ -21,7 +21,7 @@
- require_root_
- require_udevadm_settle_
- 
--(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
-+(dmsetup --help) > /dev/null 2>&1 || skip_ "No dmsetup installed"
- 
- # Device maps names - should be random to not conflict with existing ones on
- # the system
-diff --git a/tests/t6004-dm-many-partitions.sh b/tests/t6004-dm-many-partitions.sh
-index b4be975..7214f60 100755
---- a/tests/t6004-dm-many-partitions.sh
-+++ b/tests/t6004-dm-many-partitions.sh
-@@ -21,7 +21,7 @@
- 
- require_root_
- require_udevadm_settle_
--(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
-+(dmsetup --help) > /dev/null 2>&1 || skip_ "No dmsetup installed"
- 
- ss=$sector_size_
- ns=300
-diff --git a/tests/t6005-dm-uuid.sh b/tests/t6005-dm-uuid.sh
-index 4266747..4790a8b 100755
---- a/tests/t6005-dm-uuid.sh
-+++ b/tests/t6005-dm-uuid.sh
-@@ -21,7 +21,7 @@
- 
- require_root_
- require_udevadm_settle_
--(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
-+(dmsetup --help) > /dev/null 2>&1 || skip_ "No dmsetup installed"
- 
- ss=$sector_size_
- ns=300
-diff --git a/tests/t6006-dm-512b-sectors.sh b/tests/t6006-dm-512b-sectors.sh
-index bf32135..b679adb 100644
---- a/tests/t6006-dm-512b-sectors.sh
-+++ b/tests/t6006-dm-512b-sectors.sh
-@@ -25,7 +25,7 @@ require_scsi_debug_module_
- grep '^#define USE_BLKID 1' "$CONFIG_HEADER" > /dev/null ||
-   skip_ 'this system lacks a new-enough libblkid'
- 
--(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
-+(dmsetup --help) > /dev/null 2>&1 || skip_ "No dmsetup installed"
- 
- # Device maps names - should be random to not conflict with existing ones on
- # the system
diff --git a/meta/recipes-extended/parted/parted_3.3.bb b/meta/recipes-extended/parted/parted_3.4.bb
similarity index 83%
rename from meta/recipes-extended/parted/parted_3.3.bb
rename to meta/recipes-extended/parted/parted_3.4.bb
index ce40c04ad4..8b42a6d35d 100644
--- a/meta/recipes-extended/parted/parted_3.3.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -9,14 +9,11 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://no_check.patch \
            file://fix-doc-mandir.patch \
            file://0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch \
-           file://0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch \
            file://run-ptest \
-           file://0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch \
-           file://0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch \
            "
 
-SRC_URI[md5sum] = "090655d05f3c471aa8e15a27536889ec"
-SRC_URI[sha256sum] = "57e2b4bd87018625c515421d4524f6e3b55175b472302056391c5f7eccb83d44"
+SRC_URI[md5sum] = "357d19387c6e7bc4a8a90fe2d015fe80"
+SRC_URI[sha256sum] = "e1298022472da5589b7f2be1d5ee3c1b66ec3d96dfbad03dc642afd009da5342"
 
 EXTRA_OECONF = "--disable-device-mapper"
 
-- 
2.25.1



