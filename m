Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EF97B77D62
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:28:34 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 07:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,384,1488873600"; d="scan'208";a="94884629"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2017 07:28:35 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 17:28:11 +0300
Message-Id: <7c37b80082b49e30a8088e3ee1a4c1a3cf0ea54b.1493302527.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
References: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/13] parted: move test helper scripts to Python 3
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
X-List-Received-Date: Thu, 27 Apr 2017 14:28:35 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-helper-scripts-used-only-in-tests-to-Pyt.patch | 44 ++++++++++++++++++++++
 meta/recipes-extended/parted/parted_3.2.bb         |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch

diff --git a/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch b/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
new file mode 100644
index 00000000000..428b14ed5e0
--- /dev/null
+++ b/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
@@ -0,0 +1,44 @@
+From 6e82af54714392dcdf74a8aedaae7de7d0af1080 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 27 Apr 2017 16:37:24 +0300
+Subject: [PATCH] Move python helper scripts (used only in tests) to Python 3
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/gpt-header-move | 2 +-
+ tests/msdos-overlap   | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tests/gpt-header-move b/tests/gpt-header-move
+index 05cdc65..3cbcb7e 100755
+--- a/tests/gpt-header-move
++++ b/tests/gpt-header-move
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python3
+ 
+ # open img file, subtract 33 from altlba address, and move the last 33 sectors
+ # back by 33 sectors
+diff --git a/tests/msdos-overlap b/tests/msdos-overlap
+index 5bddfb0..3de7d2e 100755
+--- a/tests/msdos-overlap
++++ b/tests/msdos-overlap
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python3
+ """
+     Write an overlapping partition to a msdos disk
+ 
+@@ -14,7 +14,7 @@ BAD_ENTRY = (0x72, 0xf5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+ OFFSET = 0x1b8
+ 
+ if len(sys.argv) < 2:
+-    print "%s: <image or device>"
++    print("%s: <image or device>")
+     sys.exit(1)
+ 
+ data = "".join(chr(c) for c in BAD_ENTRY)
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index 9ce2dfecd33..73548b77925 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://0001-Include-fcntl.h-in-platform_defs.h.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch \
+           file://0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch \
 	   file://parted-3.2-sysmacros.patch \
            file://run-ptest \
            file://Makefile \
@@ -46,4 +47,4 @@ do_install_ptest() {
 	sed -e 's| ../parted||' -i $t/tests/*.sh
 }
 
-RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python"
+RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python3"
-- 
2.11.0


