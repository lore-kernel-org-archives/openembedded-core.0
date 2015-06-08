Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3AFAD73BB7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 12:13:44 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so82900242wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jun 2015 05:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ejB81HozVDJ17rNMj4a+RjhlDahY/6myNH9vVx1I/5E=;
	b=lFNzzB5rQu1yajL9aepBWXJBfaKHFFYiZM8Kefy/P6cOZDuQds8vRe6r6LSdeqqgH+
	x9oylyMgyR7Lrbn2tBlJcL7h/1IZ3SLnE89IVfTI2r7aKd078cpHgWeq/fXmbhgjGp2z
	EbDD4zqabjmXxV30IPuwRJ0jHSrJ5dbERk+Odjq2V1vMawxZjddJbwczj3s4ThfrhJAe
	ooGCIqquRmkFdquIDGxkLMpIYW0t5QxCvczovrUa4DbRC7A5pVWLXZdUUAeJbwIGARc9
	3l+Eie0XpPDDVCMJ7KA52DfD5OWZsPTsl+mxOd/9IAKteBru3FOV8ZFLjG6o8v1kMIPJ
	M2rA==
X-Received: by 10.180.73.10 with SMTP id h10mr21980826wiv.3.1433765625733;
	Mon, 08 Jun 2015 05:13:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id hn7sm3991405wjc.16.2015.06.08.05.13.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jun 2015 05:13:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jun 2015 14:13:48 +0200
Message-Id: <1433765628-15931-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.2
Subject: [PATCH] squashfs-tools: upgrade to newer revision from git
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
X-List-Received-Date: Mon, 08 Jun 2015 12:13:48 -0000

* 4.3 release has nasty hard to reproduce bug in LZO compression
  which in few cases results in one of these 2 errors:
  1) Lseek failure when creating the FS:
    | writer: Lseek on destination failed because Bad file descriptor, offset=0x1f72306
    | FATAL ERROR:Probably out of space on output filesystem
    | Parallel mksquashfs: Using 32 processors
    | Creating 4.0 filesystem on rootfs.squashfs, block size 262144.
    ..
  2) failing to read the filesystem in runtime, kernel 3.16.0 showing
    errors like this:
    [   46.720568] SQUASHFS error: lzo decompression failed, data probably corrupt
    [   46.730003] SQUASHFS error: squashfs_read_data failed to read block 0x1f72305
    [   46.740076] SQUASHFS error: Unable to read fragment cache entry [1f72305]
  it's fixed in upstream git repo:
  https://github.com/plougher/squashfs-tools/commit/de03266983ceb62e5365aac84fcd3b2fd4d16e6f
  https://github.com/plougher/squashfs-tools/commit/9c1db6d13a51a2e009f0027ef336ce03624eac0d
  the official repo is:
  https://git.kernel.org/cgit/fs/squashfs/squashfs-tools.git
  but author's github is kept in sync so we can use just that

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../squashfs-tools/squashfs-tools_4.3.bb           | 40 ----------------------
 .../squashfs-tools/squashfs-tools_git.bb           | 37 ++++++++++++++++++++
 2 files changed, 37 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
deleted file mode 100644
index 19d555e1..0000000
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-# Note, we can probably remove the lzma option as it has be replaced with xz,
-# and I don't think the kernel supports it any more.
-SUMMARY = "Tools for manipulating SquashFS filesystems"
-SECTION = "base"
-LICENSE = "GPL-2 & PD"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
-                   "
-DEPENDS = "attr zlib xz lzo lz4"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=squashfs \
-           http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
-          "
-
-SRC_URI[squashfs.md5sum] = "d92ab59aabf5173f2a59089531e30dbf"
-SRC_URI[squashfs.sha256sum] = "0d605512437b1eb800b4736791559295ee5f60177e102e4d4ccd0ee241a5f3f6"
-
-SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
-SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
-
-S = "${WORKDIR}/squashfs${PV}/squashfs-tools"
-SPDX_S = "${WORKDIR}/squashfs${PV}"
-
-# EXTRA_OEMAKE is typically: -e MAKEFLAGS=
-# the -e causes problems as CFLAGS is modified in the Makefile, so
-# we redefine EXTRA_OEMAKE here
-EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1 LZO_SUPPORT=1 LZ4_SUPPORT=1"
-
-do_compile() {
-	oe_runmake mksquashfs unsquashfs
-}
-do_install () {
-        install -d ${D}${sbindir}
-        install -m 0755 mksquashfs ${D}${sbindir}/
-	install -m 0755 unsquashfs ${D}${sbindir}/
-}
-
-ARM_INSTRUCTION_SET = "arm"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
new file mode 100644
index 0000000..95042dd
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -0,0 +1,37 @@
+# Note, we can probably remove the lzma option as it has be replaced with xz,
+# and I don't think the kernel supports it any more.
+SUMMARY = "Tools for manipulating SquashFS filesystems"
+SECTION = "base"
+LICENSE = "GPL-2 & PD"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
+"
+DEPENDS = "attr zlib xz lzo lz4"
+
+PV = "4.3+gitr${SRCPV}"
+SRCREV = "9c1db6d13a51a2e009f0027ef336ce03624eac0d"
+SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
+           http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
+"
+SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
+SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
+
+S = "${WORKDIR}/git/squashfs-tools"
+
+# EXTRA_OEMAKE is typically: -e MAKEFLAGS=
+# the -e causes problems as CFLAGS is modified in the Makefile, so
+# we redefine EXTRA_OEMAKE here
+EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1 LZO_SUPPORT=1 LZ4_SUPPORT=1"
+
+do_compile() {
+    oe_runmake mksquashfs unsquashfs
+}
+do_install () {
+    install -d ${D}${sbindir}
+    install -m 0755 mksquashfs ${D}${sbindir}/
+    install -m 0755 unsquashfs ${D}${sbindir}/
+}
+
+ARM_INSTRUCTION_SET = "arm"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.4.2


