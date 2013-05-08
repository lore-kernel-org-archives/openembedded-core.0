Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Ua4is-0003Ur-2B
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 15:47:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 May 2013 06:29:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="238522421"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by AZSMGA002.ch.intel.com with ESMTP; 08 May 2013 06:29:40 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 16:33:17 +0300
Message-Id: <1368019997-2015-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] btrfs-tools: upgraded to 0.20-rc1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 13:47:59 -0000

'fix_use_of_gcc.patch' was integrated in the main repository.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../btrfs-tools/btrfs-tools/fix_use_of_gcc.patch   |   31 --------------------
 .../btrfs-tools/btrfs-tools_git.bb                 |    9 ++----
 2 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
deleted file mode 100644
index 7f6594a..0000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Nitin A Kamble <nitin.a.kamble@intel.com> 2011/06/09
-Upstream-Status: Pending
-
-Avoid these kinds of errors while doing cross build:
-
-| ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build0/tmp/sysroots/qemux86 -Wp,-MMD,./.btrfsctl.o.d,-MT,btrfsctl.o -Wall -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types -c btrfsctl.c
-| gcc -O2 -pipe -g -feliminate-unused-debug-types -o btrfsctl btrfsctl.o ctree.o disk-io.o radix-tree.o extent-tree.o print-tree.o root-tree.o dir-item.o file-item.o inode-item.o inode-map.o crc32c.o rbtree.o extent-cache.o extent_io.o volumes.o utils.o btrfs-list.o -Wl,-O1  -Wl,--as-needed -luuid
-| /usr/bin/ld: i386 architecture of input file `btrfsctl.o' is incompatible with i386:x86-64 output
-| /usr/bin/ld: i386 architecture of input file `ctree.o' is incompatible with i386:x86-64 output
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -41,13 +41,13 @@ btrfs: $(objects) btrfs.o btrfs_cmds.o s
- 		$(objects) $(LDFLAGS) $(LIBS)
- 
- calc-size: $(objects) calc-size.o
--	gcc $(CFLAGS) -o calc-size calc-size.o $(objects) $(LDFLAGS) $(LIBS)
-+	$(CC) $(CFLAGS) -o calc-size calc-size.o $(objects) $(LDFLAGS) $(LIBS)
- 
- find-root: $(objects) find-root.o
--	gcc $(CFLAGS) -o find-root find-root.o $(objects) $(LDFLAGS) $(LIBS)
-+	$(CC) $(CFLAGS) -o find-root find-root.o $(objects) $(LDFLAGS) $(LIBS)
- 
- restore: $(objects) restore.o
--	gcc $(CFLAGS) -o restore restore.o $(objects) $(LDFLAGS) $(LIBS) $(RESTORE_LIBS)
-+	$(CC) $(CFLAGS) -o restore restore.o $(objects) $(LDFLAGS) $(LIBS) $(RESTORE_LIBS)
- 
- btrfsctl: $(objects) btrfsctl.o
- 	$(CC) $(CFLAGS) -o btrfsctl btrfsctl.o $(objects) $(LDFLAGS) $(LIBS)
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index ef575ae..51c1b08 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -12,17 +12,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
 DEPENDS = "util-linux attr"
 
-SRCREV = "fdb6c0402337d9607c7a39155088eaf033742752"
+SRCREV = "89fe5b5f666c247aa3173745fb87c710f3a71a4a"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
-PV = "0.19+git${SRCPV}"
+PV = "0.20-rc1+git${SRCPV}"
 
-PR = "r6"
-
-SRC_URI += " file://fix_use_of_gcc.patch \
-	 file://weak-defaults.patch \
+SRC_URI += " file://weak-defaults.patch \
 	 file://fix_race_condition_with_multithreaded_make.patch "
 
 SRC_URI[md5sum] = "78b1700d318de8518abfaab71f99a885"
-- 
1.7.10.4



