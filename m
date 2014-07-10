Return-Path: <roxana.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5002D703F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 13:12:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2014 06:12:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,637,1400050800"; d="scan'208";a="455396886"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.57])
	by azsmga001.ch.intel.com with ESMTP; 10 Jul 2014 06:12:52 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jul 2014 16:13:09 +0300
Message-Id: <56d5da369a640da16ac88ce325b12636d17e0400.1404997871.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1404997871.git.roxana.ciobanu@intel.com>
References: <cover.1404997871.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1404997871.git.roxana.ciobanu@intel.com>
References: <cover.1404997871.git.roxana.ciobanu@intel.com>
Subject: [PATCH v2 1/1] latencytop: fix mount error
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
X-List-Received-Date: Thu, 10 Jul 2014 13:13:01 -0000

Bug was fixed by redirecting stderr to /dev/null. The error was
caused because /sys/kernel/debug was already mounted by sysfs.sh.

[ YOCTO #6498 ]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 .../latencytop/latencytop-0.5/latencytop-fsync-mount.patch  | 13 +++++++++++++
 meta/recipes-kernel/latencytop/latencytop_0.5.bb            |  5 +++--
 2 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch

diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch
new file mode 100644
index 0000000..043be75
--- /dev/null
+++ b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch
@@ -0,0 +1,13 @@
+Index: latencytop-0.5/fsync.c
+===================================================================
+--- latencytop-0.5.orig/fsync.c
++++ latencytop-0.5/fsync.c
+@@ -151,7 +151,7 @@ int enable_fsync_tracer(void)
+  * echo ftrace_printk > iter_ctrl 
+  * echo 1 > tracing_on
+  */
+-	ret = system("/bin/mount -t debugfs none /sys/kernel/debug/");
++	ret = system("/bin/mount -t debugfs none /sys/kernel/debug/ 2>/dev/null");
+ 	if (!ret) 
+ 		return -1;
+ 	write_to_file("/sys/kernel/debug/tracing/current_tracer", "fsync");	
diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index 516e2c5..9a95b92 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -6,11 +6,12 @@ LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a
 
 DEPENDS = "virtual/libintl ncurses glib-2.0  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
             file://latencytop-makefile.patch \
-            file://latencytop-fsync.patch"
+            file://latencytop-fsync.patch \
+            file://latencytop-fsync-mount.patch"
 
 SRC_URI[md5sum] = "73bb3371c6ee0b0e68e25289027e865c"
 SRC_URI[sha256sum] = "9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef"
-- 
1.9.1


