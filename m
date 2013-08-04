Return-Path: <kirgene@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 70C44605A0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2013 16:00:30 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so1191962eek.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Aug 2013 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gKiv7EfPlcPfbLcLVKWqeEEZkkltArQoQR08TCzPaxU=;
	b=BFkM/ym30TsvlAJT8XwhSMGYdQm8dS7OF2R/74VFY4punDsAF43yGwcNidi1iMtT1n
	9A2uYg1IFbq6MKINt1vLpSfEIiQOhdP8IVPMgtbKDQQzG1dCkCztWwIPOS0oshLIdk9N
	h8MVJjrj1ZppLakZRi0HlTrQAC0uDK7UremcihKAgB5LgJTp3QbAkdG3g2nRr8xX8xqV
	4cAM7t71jvcY07C6G80Q6zSQvyqfM51qvfO2u9tboJlAn3i+QI2scRgLxLtBcMpkBhO5
	f7sxILdXWBbFqYmfBCvlsqp16L2PilLr0m5LEZeakWluOG0hrNAV74RS7YQQadl0508J
	CDBw==
X-Received: by 10.14.194.133 with SMTP id m5mr13470393een.109.1375632030285;
	Sun, 04 Aug 2013 09:00:30 -0700 (PDT)
Received: from ubuntu.datv.net ([213.174.0.226])
	by mx.google.com with ESMTPSA id a1sm749925eem.1.2013.08.04.09.00.28
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 09:00:29 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Aug 2013 19:00:11 +0300
Message-Id: <1375632011-55447-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH v3] btrfs-tools: upgrade to upstream revision.
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
X-List-Received-Date: Sun, 04 Aug 2013 16:00:31 -0000

Two patches were removed because changes that they provide are already exist.

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 ...ix_race_condition_with_multithreaded_make.patch | 36 ----------------------
 .../btrfs-tools/btrfs-tools/fix_use_of_gcc.patch   | 31 -------------------
 .../btrfs-tools/btrfs-tools_git.bb                 | 13 ++------
 3 files changed, 3 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
deleted file mode 100644
index 40175b8..0000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Pending
-
-Fix makefile for multithreaded (make -j ) building.
-
-btrfsctl.c
-| i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/intel/poky/builds/world/tmp/sysroots/qemux86 -Wp,-MMD,./.btrfsctl.o.d,-MT,btrfsctl.o -Wall -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types -c btrfsctl.c
-| btrfsctl.c:37:21: fatal error: version.h: No such file or directory
-| compilation terminated.
-| btrfslabel.c:40:21: fatal error: version.h: No such file or directory
-| compilation terminated.
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/01/02
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -26,14 +26,13 @@ else
- 	check = ls
- endif
- 
--.c.o:
-+%.o: %.c version.h
- 	$(check) $<
- 	$(CC) $(DEPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c $<
- 
-+all: $(progs) manpages
- 
--all: version $(progs) manpages
--
--version:
-+version.h: version.sh
- 	bash version.sh
- 
- btrfs: $(objects) btrfs.o btrfs_cmds.o scrub.o
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
index ef575ae..07e8529 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -12,21 +12,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
 DEPENDS = "util-linux attr"
 
-SRCREV = "fdb6c0402337d9607c7a39155088eaf033742752"
+SRCREV = "194aa4a1bd6447bb545286d0bcb0b0be8204d79f"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
-PV = "0.19+git${SRCPV}"
+PV = "0.20+git${SRCPV}"
 
-PR = "r6"
-
-SRC_URI += " file://fix_use_of_gcc.patch \
-	 file://weak-defaults.patch \
-	 file://fix_race_condition_with_multithreaded_make.patch "
-
-SRC_URI[md5sum] = "78b1700d318de8518abfaab71f99a885"
-SRC_URI[sha256sum] = "1285774e0cb72984fac158dd046c8d405324754febd30320cd31e459253e4b65"
+SRC_URI += "file://weak-defaults.patch"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
-- 
1.8.1.2


