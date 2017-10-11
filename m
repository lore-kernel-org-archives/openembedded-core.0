Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 27A9E71A0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945756"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:33 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:05 +0300
Message-Id: <24998cd986f3d6fc28d9e940d786fe6b14affdb2.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/50] btrfs-tools: update to 4.13.2
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:33 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ith-musl-missing-header-include-for-dev_t.patch | 26 ++++++++++++++++++++++
 .../{btrfs-tools_4.12.bb => btrfs-tools_4.13.2.bb} |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.12.bb => btrfs-tools_4.13.2.bb} (90%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch
new file mode 100644
index 00000000000..790676b9cbf
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch
@@ -0,0 +1,26 @@
+From bc35c4caebb57cc8b96c30c25432b12ca8dc18d5 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 6 Oct 2017 15:03:49 +0300
+Subject: [PATCH] Fix build with musl (missing header include for dev_t).
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ convert/source-fs.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/convert/source-fs.h b/convert/source-fs.h
+index 23f3356..6fd770f 100644
+--- a/convert/source-fs.h
++++ b/convert/source-fs.h
+@@ -20,6 +20,7 @@
+ #include "kerncompat.h"
+ #include <linux/kdev_t.h>
+ #include <pthread.h>
++#include <sys/types.h>
+ 
+ #define CONV_IMAGE_SUBVOL_OBJECTID BTRFS_FIRST_FREE_OBJECTID
+ 
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.12.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.2.bb
similarity index 90%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.12.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.2.bb
index c3cc89c2b0f..43924d874d1 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.12.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.13.2.bb
@@ -14,9 +14,10 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "0607132c3200bcead1426e6dc685432008de95de"
+SRCREV = "37f1faef159ebcf91846e7126879b1a413cb29a5"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
+           file://0001-Fix-build-with-musl-missing-header-include-for-dev_t.patch \
            "
 
 inherit autotools-brokensep pkgconfig manpages
-- 
2.14.1


