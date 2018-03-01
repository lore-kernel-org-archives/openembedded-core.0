Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 2942078882
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:06:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 06:06:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="35134118"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2018 06:06:51 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 16:00:43 +0200
Message-Id: <20180301140052.1388-6-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/15] btrfs-tools: update to 4.15.1
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
X-List-Received-Date: Thu, 01 Mar 2018 14:06:51 -0000

Drop upstreamed 0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch

Add --disable-zstd as libzstd isn't provided in oe-core.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ith-musl-missing-header-include-for-dev_t.patch | 26 ----------------------
 ...btrfs-tools_4.13.3.bb => btrfs-tools_4.15.1.bb} |  4 ++--
 2 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.13.3.bb => btrfs-tools_4.15.1.bb} (90%)

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
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.15.1.bb
similarity index 90%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.15.1.bb
index 263fc657550..4490b82d91d 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.15.1.bb
@@ -14,15 +14,15 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "a7a1ea0f4f2a1d6eeeb3d106e062c7f1034f16d4"
+SRCREV = "3097f02c948f69f520c565ff8f8ba476aa6edb88"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
-           file://0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch \
            "
 
 inherit autotools-brokensep pkgconfig manpages
 
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
+EXTRA_OECONF = " --disable-zstd"
 EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
 
 do_configure_prepend() {
-- 
2.15.1


