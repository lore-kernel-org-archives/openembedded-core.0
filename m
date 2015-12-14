Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0266FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064226"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:16 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:26 +0200
Message-Id: <233aa581fab8ee81b1832ec3db696ddebfa3d3a4.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/20] kbd: update to 2.0.3
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:15 -0000

0003-Only-inluclude-kernel-headers-with-glibc.patch is handling #include lines that
are no longer present in the upstream source so it was dropped.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-Only-inluclude-kernel-headers-with-glibc.patch | 29 ----------------------
 .../kbd/{kbd_2.0.2.bb => kbd_2.0.3.bb}             |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-core/kbd/kbd/0003-Only-inluclude-kernel-headers-with-glibc.patch
 rename meta/recipes-core/kbd/{kbd_2.0.2.bb => kbd_2.0.3.bb} (83%)

diff --git a/meta/recipes-core/kbd/kbd/0003-Only-inluclude-kernel-headers-with-glibc.patch b/meta/recipes-core/kbd/kbd/0003-Only-inluclude-kernel-headers-with-glibc.patch
deleted file mode 100644
index 8bfcb0c..0000000
--- a/meta/recipes-core/kbd/kbd/0003-Only-inluclude-kernel-headers-with-glibc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3c5c7acc7ef874b919b26583d3892e21b907833f Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Wed, 20 Aug 2014 09:00:03 +0200
-Subject: [PATCH 3/4] Only inluclude kernel headers with glibc
-
-This fixes compile errors with musl libc
-
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
-Upstream-Status: Pending
----
- src/resizecons.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/resizecons.c b/src/resizecons.c
-index 5f84845..691dfcc 100644
---- a/src/resizecons.c
-+++ b/src/resizecons.c
-@@ -80,7 +80,7 @@
- #include <sys/ioctl.h>
- #if (__GNU_LIBRARY__ >= 6)
- #include <sys/perm.h>
--#else
-+#elif defined(__GLIBC__)
- #include <linux/types.h>
- #include <linux/termios.h>
- #endif
--- 
-2.1.0
-
diff --git a/meta/recipes-core/kbd/kbd_2.0.2.bb b/meta/recipes-core/kbd/kbd_2.0.3.bb
similarity index 83%
rename from meta/recipes-core/kbd/kbd_2.0.2.bb
rename to meta/recipes-core/kbd/kbd_2.0.3.bb
index 49bb6c9..746b68a 100644
--- a/meta/recipes-core/kbd/kbd_2.0.2.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.3.bb
@@ -12,11 +12,10 @@ RCONFLICTS_${PN} = "console-tools"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            file://uclibc-stdarg.patch \
-	   file://0003-Only-inluclude-kernel-headers-with-glibc.patch \
           "
 
-SRC_URI[md5sum] = "87475eb78b1d6e6ab06686dd323ad4ba"
-SRC_URI[sha256sum] = "9dfddabf96012e329c4bebb96a21aeef7c3872f624e96e8156ba542b82aeb912"
+SRC_URI[md5sum] = "231b46e7142eb41ea3ae06d2ded3c208"
+SRC_URI[sha256sum] = "7a899de1c0eb75f3aea737095a736f2375e1cbfbe693fc14a3fe0bfb4649fb5e"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--enable-vlock, --disable-vlock, libpam,"
-- 
2.6.2


