Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1StJHL-0000uT-BC
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 16:06:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Jul 2012 06:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="196747038"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2012 06:55:02 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2012 17:02:42 +0300
Message-Id: <1343052163-4060-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] kmod: Handle undefined O_CLOEXEC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 14:06:31 -0000

Close-on-exec seems to be unsuported on some architectures like CentOS 5.8
and thus causing some packages to fail to build successfully. Future kernel
version will probably fix this, but for now this patch works around this
problem.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-kernel/kmod/kmod.inc                  |    3 +-
 .../Handle-unsupported-close-on-exec-flag.patch    |   60 ++++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/kmod/kmod/Handle-unsupported-close-on-exec-flag.patch

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index adba4d4..c992ad8 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0+ & LGPL-2.1+"
 LICENSE_libkmod = "LGPL-2.1+"
 SECTION = "base"
 PV = "8"
-INC_PR = "r1"
+INC_PR = "r2"
 
 DEPENDS += "pkgconfig-native"
 
@@ -20,6 +20,7 @@ inherit autotools gtk-doc
 SRC_URI = "git://git.profusion.mobi/kmod.git;protocol=git;branch=master \
            file://depmod-search.conf \
            file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
+           file://Handle-unsupported-close-on-exec-flag.patch \
           "
 
 SRCREV = "819f79a24d58e3c8429f1631df2f8f85a2f95d4a"
diff --git a/meta/recipes-kernel/kmod/kmod/Handle-unsupported-close-on-exec-flag.patch b/meta/recipes-kernel/kmod/kmod/Handle-unsupported-close-on-exec-flag.patch
new file mode 100644
index 0000000..f0820d9
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/Handle-unsupported-close-on-exec-flag.patch
@@ -0,0 +1,60 @@
+Index: git/libkmod/libkmod-config.c
+===================================================================
+--- git.orig/libkmod/libkmod-config.c	2012-07-23 16:13:44.000000000 +0300
++++ git/libkmod/libkmod-config.c	2012-07-23 16:15:53.000000000 +0300
+@@ -33,6 +33,10 @@
+ #include "libkmod.h"
+ #include "libkmod-private.h"
+ 
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#endif
++
+ struct kmod_alias {
+ 	char *name;
+ 	char modname[];
+Index: git/libkmod/libkmod-file.c
+===================================================================
+--- git.orig/libkmod/libkmod-file.c	2012-07-23 16:13:44.000000000 +0300
++++ git/libkmod/libkmod-file.c	2012-07-23 16:15:57.000000000 +0300
+@@ -31,6 +31,10 @@
+ #include "libkmod.h"
+ #include "libkmod-private.h"
+ 
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#endif
++
+ #ifdef ENABLE_XZ
+ #include <lzma.h>
+ #endif
+Index: git/libkmod/libkmod-index.c
+===================================================================
+--- git.orig/libkmod/libkmod-index.c	2012-07-23 16:13:44.000000000 +0300
++++ git/libkmod/libkmod-index.c	2012-07-23 16:16:00.000000000 +0300
+@@ -31,6 +31,10 @@
+ #include "libkmod-index.h"
+ #include "macro.h"
+ 
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#endif
++
+ /* index.c: module index file shared functions for modprobe and depmod */
+ 
+ #define INDEX_CHILDMAX 128
+Index: git/libkmod/libkmod-module.c
+===================================================================
+--- git.orig/libkmod/libkmod-module.c	2012-07-23 16:13:44.000000000 +0300
++++ git/libkmod/libkmod-module.c	2012-07-23 16:16:04.000000000 +0300
+@@ -40,6 +40,10 @@
+ #include "libkmod.h"
+ #include "libkmod-private.h"
+ 
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#endif
++
+ /**
+  * SECTION:libkmod-module
+  * @short_description: operate on kernel modules
-- 
1.7.9.5



