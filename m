Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 29B9F6E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 10:53:40 +0000 (UTC)
Received: by wizk4 with SMTP id k4so134276955wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 03:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N4llDa2YXEXoet+Wm+PpShI2QrPrau1OQL+S81ZhG+4=;
	b=nLzdwBdCko6tw9lBM3oObzhD7I4u1Ljrlod2VXXbvo7vocZhjmOUEDM42P6csSs0Al
	NLbdkUQVTXsKKUQDJUseTLnkrCU4YPGdwtmibxxrZMYQ/RKao4zMWyR9wI2LSZGi1mCn
	69uFBH9N++/9MeKrWO/0lP+HfrsJYdGWmqejO0ayNifvUuh4cb+mQ0Tip7oKVg2RHB23
	BP1w67NTL70D4VLwPwTf/9OMR+3JH8+HbBM04tL2vnfudTWdX99GACl7rGbTRXFX7Kdb
	IwNmeIw4IUNM52CgAJRLpY+tZxGXEHAfAjt+YOK3rrag+xn7iGpdCp84yQLU6x8iZkzK
	04eA==
X-Received: by 10.180.92.228 with SMTP id cp4mr33380733wib.62.1429613621430;
	Tue, 21 Apr 2015 03:53:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id hy7sm2096160wjb.1.2015.04.21.03.53.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Apr 2015 03:53:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 12:53:38 +0200
Message-Id: <1429613620-2989-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1429613620-2989-1-git-send-email-Martin.Jansa@gmail.com>
References: <1429613620-2989-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [fido][PATCH 2/4] e2fsprogs: Package populate-extfs.sh and enable symlink install
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
X-List-Received-Date: Tue, 21 Apr 2015 10:53:42 -0000

* install populate-extfs.sh from contrib, be aware that in order
  to use it you need to set DEBUGFS shell variable, otherwise it will
  try to use debugfs from relative path which is almost always
  incorrect:
    CONTRIB_DIR=$(dirname $(readlink -f $0))
    DEBUGFS="$CONTRIB_DIR/../debugfs/debugfs"

* use symlinks to install e2fsck, mke2fs, without this option we have:
  $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/image/sbin/
  ...
  101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 e2fsck
  101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext2
  101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext3
  101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext4
  101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext4dev
  ...
  101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mke2fs
  101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext2
  101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext3
  101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4
  101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4dev
  ...

  which would be OK, because they are hadlinks, but after runstrip in
  do_package we get one stripped binary and 4 hardlinks to the original
  one:

  $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-e2fsck/sbin
  101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 e2fsck
  101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext2
  101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext3
  101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext4
  101983136 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15:43 fsck.ext4dev
  $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-mke2fs/sbin/
  101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mke2fs
  101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext2
  101988266 -rwxr-xr-x 2 bitbake bitbake  72K Apr 10 15:43 mkfs.ext3
  101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4
  101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4dev

  That's super annoying for big files like this which are often include
  in small recovery images. Using --enable-symlink-install option results
  in one stripped binary and 4 symlinks:

  $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-e2fsck/sbin/
  102113806 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15:50 e2fsck
  102113813 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext2 -> e2fsck
  102113814 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext3 -> e2fsck
  102113812 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext4 -> e2fsck
  102113815 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext4dev -> e2fsck
  $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-mke2fs/sbin/
  102113804 -rwxr-xr-x 2 bitbake bitbake  72K Apr 10 15:50 mke2fs
  102113825 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext2 -> mke2fs
  102113826 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext3 -> mke2fs
  102113823 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext4 -> mke2fs
  102113824 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext4dev -> mke2fs

  Saving cca 1,5MB.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 66065bc..95b4550 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -26,7 +26,7 @@ SRC_URI += "file://acinclude.m4 \
 SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
 SRC_URI[sha256sum] = "2f92ac06e92fa00f2ada3ee67dad012d74d685537527ad1241d82f2d041f2802"
 
-EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd --enable-verbose-makecmds"
+EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-elf-shlibs --disable-libuuid --disable-uuidd --enable-verbose-makecmds --enable-symlink-install"
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
 do_configure_prepend () {
@@ -54,6 +54,8 @@ do_install () {
 	oe_multilib_header ext2fs/ext2_types.h
 	install -d ${D}${base_bindir}
 	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
+
+	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
 }
 
 do_install_append_class-target() {
-- 
2.3.5


