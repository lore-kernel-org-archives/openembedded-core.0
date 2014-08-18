Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8ACEB70C65
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 09:44:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Aug 2014 02:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,885,1400050800"; d="scan'208";a="578119221"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga001.fm.intel.com with ESMTP; 18 Aug 2014 02:44:04 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Aug 2014 12:44:00 +0300
Message-Id: <1408355040-22171-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] qemu: fix Darwin cross-compilation
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
X-List-Received-Date: Mon, 18 Aug 2014 09:44:30 -0000

Darwin target will not be detected correctly
if qemu is cross-compiled under a Linux host.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../configure-fix-Darwin-target-detection.patch    | 32 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  4 +--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/configure-fix-Darwin-target-detection.patch

diff --git a/meta/recipes-devtools/qemu/qemu/configure-fix-Darwin-target-detection.patch b/meta/recipes-devtools/qemu/qemu/configure-fix-Darwin-target-detection.patch
new file mode 100644
index 0000000..59cdc1c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/configure-fix-Darwin-target-detection.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending
+Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
+
+From 9ac096d8eccf2d56ece646320c282c8369f8337c Mon Sep 17 00:00:00 2001
+From: Cristian Iorga <cristian.iorga@intel.com>
+Date: Tue, 29 Jul 2014 18:35:59 +0300
+Subject: [PATCH] configure: fix Darwin target detection
+
+fix Darwin target detection for qemu
+cross-compilation.
+
+Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
+---
+ configure | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure b/configure
+index 283c71c..1c66a11 100755
+--- a/configure
++++ b/configure
+@@ -444,6 +444,8 @@ elif check_define __sun__ ; then
+   targetos='SunOS'
+ elif check_define __HAIKU__ ; then
+   targetos='Haiku'
++elif check_define __APPLE__ ; then
++  targetos='Darwin'
+ else
+   targetos=`uname -s`
+ fi
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.1.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
index abf8dfc..9b8337a 100644
--- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
@@ -3,10 +3,10 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI += "file://qemu-enlarge-env-entry-size.patch \
+SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
+            file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             "
-
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
 SRC_URI[sha256sum] = "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e97e6fd2f31e8f8802"
-- 
1.9.1


