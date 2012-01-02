Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RholK-0008Hb-EW
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 21:45:42 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jan 2012 12:38:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108039322"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2012 12:38:16 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 12:38:11 -0800
Message-Id: <e34303681f226a63703619353b0e035a7ad812bb.1325536389.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
References: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325536389.git.nitin.a.kamble@intel.com>
References: <cover.1325536389.git.nitin.a.kamble@intel.com>
Subject: [PATCH v2 15/15] btrfs-tools:Fix multithreaded building
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
X-List-Received-Date: Mon, 02 Jan 2012 20:45:42 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Fixes bug: [YOCTO #1524]

Fixes this error with make -j:
btrfsctl.c
| i586-poky-linux-gcc  -m32   -march=i586
--sysroot=/intel/poky/builds/world/tmp/sysroots/qemux86
-Wp,-MMD,./.btrfsctl.o.d,-MT,btrfsctl.o -Wall -D_FILE_OFFSET_BITS=64
-D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types -c
btrfsctl.c
| btrfsctl.c:37:21: fatal error: version.h: No such file or directory
| compilation terminated.
| btrfslabel.c:40:21: fatal error: version.h: No such file or directory
| compilation terminated.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...ix_race_condition_with_multithreaded_make.patch |   36 ++++++++++++++++++++
 .../btrfs-tools/btrfs-tools_git.bb                 |    6 ++-
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
new file mode 100644
index 0000000..40175b8
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Pending
+
+Fix makefile for multithreaded (make -j ) building.
+
+btrfsctl.c
+| i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/intel/poky/builds/world/tmp/sysroots/qemux86 -Wp,-MMD,./.btrfsctl.o.d,-MT,btrfsctl.o -Wall -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types -c btrfsctl.c
+| btrfsctl.c:37:21: fatal error: version.h: No such file or directory
+| compilation terminated.
+| btrfslabel.c:40:21: fatal error: version.h: No such file or directory
+| compilation terminated.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/01/02
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -26,14 +26,13 @@ else
+ 	check = ls
+ endif
+ 
+-.c.o:
++%.o: %.c version.h
+ 	$(check) $<
+ 	$(CC) $(DEPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c $<
+ 
++all: $(progs) manpages
+ 
+-all: version $(progs) manpages
+-
+-version:
++version.h: version.sh
+ 	bash version.sh
+ 
+ btrfs: $(objects) btrfs.o btrfs_cmds.o scrub.o
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index b2e503b..58049e5 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -16,10 +16,12 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;p
 
 S = "${WORKDIR}/git"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI += " file://fix_use_of_gcc.patch \
-	 file://weak-defaults.patch "
+	 file://weak-defaults.patch \
+	 file://fix_race_condition_with_multithreaded_make.patch "
+
 SRC_URI[md5sum] = "78b1700d318de8518abfaab71f99a885"
 SRC_URI[sha256sum] = "1285774e0cb72984fac158dd046c8d405324754febd30320cd31e459253e4b65"
 
-- 
1.7.6.4



