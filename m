Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrW-00050A-VZ
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:21:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752333"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:36 -0800
Message-Id: <51d3652f48fffdc2ee45015f31ab22f9953cf31d.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 110/113] btrfs-tools:Fix multithreaded building
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:47 -0000

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



