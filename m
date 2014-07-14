Return-Path: <roxana.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AFE7865DAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 10:58:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jul 2014 03:52:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,657,1400050800"; d="scan'208";a="561450620"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.57])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2014 03:58:15 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jul 2014 13:58:34 +0300
Message-Id: <bdbcbfeed06623ac20632e04036ff5eb15e53258.1405335436.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1405335436.git.roxana.ciobanu@intel.com>
References: <cover.1405335436.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1405335436.git.roxana.ciobanu@intel.com>
References: <cover.1405335436.git.roxana.ciobanu@intel.com>
Subject: [PATCH v3 1/1] latencytop: fix mount error
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
X-List-Received-Date: Mon, 14 Jul 2014 10:58:16 -0000

Added a check to ensure debugfs is not mounted before trying
to mount it, because sysfs.sh already mounts it.

[ YOCTO #6498 ]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 .../latencytop-0.5/latencytop-fsync-mount.patch    | 37 ++++++++++++++++++++++
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch

diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch
new file mode 100644
index 0000000..9f2e120
--- /dev/null
+++ b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch
@@ -0,0 +1,37 @@
+Index: latencytop-0.5/fsync.c
+===================================================================
+--- latencytop-0.5.orig/fsync.c	2014-07-14 13:25:27.657187985 +0300
++++ latencytop-0.5/fsync.c	2014-07-14 13:26:12.033187979 +0300
+@@ -32,6 +32,7 @@
+ #include <time.h>
+ #include <wchar.h>
+ #include <ctype.h>
++#include <sys/stat.h>
+ 
+ #include <glib.h>
+ 
+@@ -142,16 +143,23 @@
+ int enable_fsync_tracer(void)
+ {
+ 	int ret;
++    struct stat s_debug, s_mount_point;
++
+ /*
+  * Steps to do:
+  *
++ * check if /sys/kernel/debug is mounted
+  * mount -t debugfs none /sys/kernel/debug/
+  * cd /sys/kernel/debug/tracing
+  * echo fsync > current_tracer
+  * echo ftrace_printk > iter_ctrl 
+  * echo 1 > tracing_on
+  */
+-	ret = system("/bin/mount -t debugfs none /sys/kernel/debug/");
++
++    stat("/sys/kernel/debug/..", &s_debug);
++    if (stat("/sys/kernel/debug", &s_mount_point) != 0 ||
++        (s_debug.st_dev == s_mount_point.st_dev))
++        ret = system("/bin/mount -t debugfs none /sys/kernel/debug/");
+ 	if (!ret) 
+ 		return -1;
+ 	write_to_file("/sys/kernel/debug/tracing/current_tracer", "fsync");	
diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index 516e2c5..243f3d9 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -10,7 +10,8 @@ PR = "r3"
 
 SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
             file://latencytop-makefile.patch \
-            file://latencytop-fsync.patch"
+            file://latencytop-fsync.patch \
+            file://latencytop-fsync-mount.patch"
 
 SRC_URI[md5sum] = "73bb3371c6ee0b0e68e25289027e865c"
 SRC_URI[sha256sum] = "9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef"
-- 
1.9.1


