Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9D251745D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 13:22:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2019 05:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,415,1544515200"; d="scan'208";a="323500641"
Received: from yaotangc-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.249.69.27])
	by fmsmga005.fm.intel.com with ESMTP; 26 Feb 2019 05:22:55 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2019 21:22:53 +0800
Message-Id: <20190226132253.26040-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] syslinux: upgrade to 6.04-pre2
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
X-List-Received-Date: Tue, 26 Feb 2019 13:22:56 -0000

For changes in this release, see:

http://www.syslinux.org/wiki/index.php?title=Syslinux_6_Changelog

Backport a patch to fix compilation failures and remove the patches that
are not needed anymore.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...don-t-install-obsolete-file-com32.ld.patch | 32 +++++++++++++
 ...linuxext-implement-syslinux_patch_bo.patch | 44 +++++++++---------
 .../syslinux/0010-gcc46-compatibility.patch   | 37 ---------------
 ...1-mk-MMD-does-not-take-any-arguments.patch | 33 --------------
 .../syslinux/syslinux-6.03-sysmacros.patch    | 45 -------------------
 ...syslinux-fix-parallel-building-issue.patch | 35 ---------------
 .../syslinux-libupload-depend-lib.patch       | 31 -------------
 ...syslinux_6.03.bb => syslinux_6.04-pre2.bb} | 15 +++----
 8 files changed, 62 insertions(+), 210 deletions(-)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0001-install-don-t-install-obsolete-file-com32.ld.patch
 delete mode 100644 meta/recipes-devtools/syslinux/syslinux/0010-gcc46-compatibility.patch
 delete mode 100644 meta/recipes-devtools/syslinux/syslinux/0011-mk-MMD-does-not-take-any-arguments.patch
 delete mode 100644 meta/recipes-devtools/syslinux/syslinux/syslinux-6.03-sysmacros.patch
 delete mode 100644 meta/recipes-devtools/syslinux/syslinux/syslinux-fix-parallel-building-issue.patch
 delete mode 100644 meta/recipes-devtools/syslinux/syslinux/syslinux-libupload-depend-lib.patch
 rename meta/recipes-devtools/syslinux/{syslinux_6.03.bb => syslinux_6.04-pre2.bb} (85%)

diff --git a/meta/recipes-devtools/syslinux/syslinux/0001-install-don-t-install-obsolete-file-com32.ld.patch b/meta/recipes-devtools/syslinux/syslinux/0001-install-don-t-install-obsolete-file-com32.ld.patch
new file mode 100644
index 0000000000..bfd7f41b13
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0001-install-don-t-install-obsolete-file-com32.ld.patch
@@ -0,0 +1,32 @@
+From bf6db5b48ec25f83939f1fdebb59028bc3c40b00 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
+Date: Wed, 6 Feb 2019 11:30:51 -0800
+Subject: [PATCH] install: don't install obsolete file com32.ld
+
+com32.ld has been obsolete for a long time, and has been removed now;
+don't install it either.
+
+Reported-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ com32/lib/Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/com32/lib/Makefile b/com32/lib/Makefile
+index 74fff149..6a931492 100644
+--- a/com32/lib/Makefile
++++ b/com32/lib/Makefile
+@@ -113,7 +113,6 @@ spotless: clean
+ 
+ install: all
+ 	mkdir -m 755 -p $(INSTALLROOT)$(COM32DIR)
+-	install -m 644 $(SRC)/com32.ld $(INSTALLROOT)$(COM32DIR)
+ 	-rm -rf $(INSTALLROOT)$(COM32DIR)/include
+ 	cp -r $(SRC)/../include $(INSTALLROOT)$(COM32DIR)
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch b/meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch
index 2400c98d6a..f1d01fa43c 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch
@@ -1,8 +1,7 @@
-From 78d76b87a4b855e6b661ae457283a63f385c04c9 Mon Sep 17 00:00:00 2001
+From efce87e5ab98664c57e5f4e3955a2f3747df5737 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 2 Jan 2015 12:26:46 +0800
-Subject: [PATCH 8/9] libinstaller/syslinuxext: implement
- syslinux_patch_bootsect()
+Subject: [PATCH] libinstaller/syslinuxext: implement syslinux_patch_bootsect()
 
 Move the related from extlinux/main.c to libinstaller/syslinuxext.c, the
 syslinux_patch_bootsect() are used by both extlinux/main.c and
@@ -12,17 +11,21 @@ Upstream-Status: Submitted
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Tested-by: Du Dolpher <dolpher.du@intel.com>
+
+Edited to include sysmacros.h
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 ---
  extlinux/Makefile          |   3 +-
- extlinux/main.c            | 167 +-------------------------------------------
- libinstaller/syslinuxext.c | 170 +++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 175 insertions(+), 165 deletions(-)
+ extlinux/main.c            | 167 +-----------------------------------
+ libinstaller/syslinuxext.c | 171 +++++++++++++++++++++++++++++++++++++
+ 3 files changed, 176 insertions(+), 165 deletions(-)
 
 diff --git a/extlinux/Makefile b/extlinux/Makefile
-index 02d1db5..90dd92f 100644
+index 1721ee54..62a49728 100644
 --- a/extlinux/Makefile
 +++ b/extlinux/Makefile
-@@ -31,7 +31,8 @@ SRCS     = main.c \
+@@ -32,7 +32,8 @@ SRCS     = main.c \
  	   ../libinstaller/advio.c \
  	   ../libinstaller/bootsect_bin.c \
  	   ../libinstaller/ldlinuxc32_bin.c \
@@ -33,10 +36,10 @@ index 02d1db5..90dd92f 100644
  
  .SUFFIXES: .c .o .i .s .S
 diff --git a/extlinux/main.c b/extlinux/main.c
-index 09740bd..6fe026e 100644
+index ebff7eae..9add50fb 100644
 --- a/extlinux/main.c
 +++ b/extlinux/main.c
-@@ -60,6 +60,7 @@
+@@ -62,6 +62,7 @@
  #include "setadv.h"
  #include "syslxopt.h" /* unified options */
  #include "mountinfo.h"
@@ -44,7 +47,7 @@ index 09740bd..6fe026e 100644
  
  #ifdef DEBUG
  # define dprintf printf
-@@ -67,10 +68,6 @@
+@@ -69,10 +70,6 @@
  # define dprintf(...) ((void)0)
  #endif
  
@@ -55,10 +58,11 @@ index 09740bd..6fe026e 100644
  /* Since we have unused 2048 bytes in the primary AG of an XFS partition,
   * we will use the first 0~512 bytes starting from 2048 for the Syslinux
   * boot sector.
-@@ -92,136 +89,6 @@ static char subvol[BTRFS_SUBVOL_MAX];
+@@ -93,136 +90,6 @@ static char subvol[BTRFS_SUBVOL_MAX];
+ #define BTRFS_ADV_OFFSET (BTRFS_BOOT_AREA_A_OFFSET + BTRFS_BOOT_AREA_A_SIZE \
  			  - 2*ADV_SIZE)
  
- /*
+-/*
 - * Get the size of a block device
 - */
 -static uint64_t get_size(int devfd)
@@ -188,11 +192,10 @@ index 09740bd..6fe026e 100644
 -    return rv;
 -}
 -
--/*
+ /*
   * Query the device geometry and put it into the boot sector.
   * Map the file and put the map in the boot sector and file.
-  * Stick the "current directory" inode number into the file.
-@@ -231,11 +98,8 @@ ok:
+@@ -233,11 +100,8 @@ ok:
  static int patch_file_and_bootblock(int fd, const char *dir, int devfd)
  {
      struct stat dirst, xdst;
@@ -204,7 +207,7 @@ index 09740bd..6fe026e 100644
      char *dirpath, *subpath, *xdirpath;
      int rv;
  
-@@ -279,33 +143,8 @@ static int patch_file_and_bootblock(int fd, const char *dir, int devfd)
+@@ -281,33 +145,8 @@ static int patch_file_and_bootblock(int fd, const char *dir, int devfd)
      /* Now subpath should contain the path relative to the fs base */
      dprintf("subpath = %s\n", subpath);
  
@@ -241,14 +244,15 @@ index 09740bd..6fe026e 100644
      /* Construct the boot file map */
  
 diff --git a/libinstaller/syslinuxext.c b/libinstaller/syslinuxext.c
-index bb54cef..5a4423b 100644
+index bb54cefc..9ae82884 100644
 --- a/libinstaller/syslinuxext.c
 +++ b/libinstaller/syslinuxext.c
-@@ -1,7 +1,177 @@
+@@ -1,7 +1,178 @@
  #define _GNU_SOURCE
  
 +#include <sys/stat.h>
 +#include <sys/types.h>
++#include <sys/sysmacros.h>
 +#include <getopt.h>
 +#include <ext2fs/ext2fs.h>
 +
@@ -423,5 +427,5 @@ index bb54cef..5a4423b 100644
  }
  
 -- 
-1.9.1
+2.17.1
 
diff --git a/meta/recipes-devtools/syslinux/syslinux/0010-gcc46-compatibility.patch b/meta/recipes-devtools/syslinux/syslinux/0010-gcc46-compatibility.patch
deleted file mode 100644
index 6279258c2e..0000000000
--- a/meta/recipes-devtools/syslinux/syslinux/0010-gcc46-compatibility.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-don't break with old compilers and -DGNU_EFI_USE_MS_ABI
-It's entirely legitimate to request GNU_EFI_USE_MS_ABI even if the current
-compiler doesn't support it, and gnu-efi should transparently fall back to
-using legacy techniques to set the calling convention.  We don't get type
-checking, but at least it will still compile.
-
-Adapted from gnu-efi
-
-Author: Steve Langasek <steve.langasek@ubuntu.com>
-Upstream-Status: Pending
-
-Index: syslinux-6.03/efi64/include/efi/x86_64/efibind.h
-===================================================================
---- syslinux-6.03.orig/efi64/include/efi/x86_64/efibind.h
-+++ syslinux-6.03/efi64/include/efi/x86_64/efibind.h
-@@ -25,8 +25,6 @@ Revision History
- #if defined(GNU_EFI_USE_MS_ABI)
-     #if defined(__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 7))
-         #define HAVE_USE_MS_ABI 1
--    #else
--        #error Compiler is too old for GNU_EFI_USE_MS_ABI
-     #endif
- #endif
- 
-Index: syslinux-6.03/gnu-efi/gnu-efi-3.0/inc/x86_64/efibind.h
-===================================================================
---- syslinux-6.03.orig/gnu-efi/gnu-efi-3.0/inc/x86_64/efibind.h
-+++ syslinux-6.03/gnu-efi/gnu-efi-3.0/inc/x86_64/efibind.h
-@@ -25,8 +25,6 @@ Revision History
- #if defined(GNU_EFI_USE_MS_ABI)
-     #if defined(__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 7))
-         #define HAVE_USE_MS_ABI 1
--    #else
--        #error Compiler is too old for GNU_EFI_USE_MS_ABI
-     #endif
- #endif
- 
diff --git a/meta/recipes-devtools/syslinux/syslinux/0011-mk-MMD-does-not-take-any-arguments.patch b/meta/recipes-devtools/syslinux/syslinux/0011-mk-MMD-does-not-take-any-arguments.patch
deleted file mode 100644
index 443c1ccc58..0000000000
--- a/meta/recipes-devtools/syslinux/syslinux/0011-mk-MMD-does-not-take-any-arguments.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0f3d83c25491951f1fa84c7957358ef3d1bcd8a9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Sep 2015 17:39:22 +0000
-Subject: [PATCH] mk: -MMD does not take any arguments
-
-Specify -Wp for each option, clang seems to not accept
--Wp,-x,y,-a,b
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- mk/syslinux.mk | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: syslinux-6.03/mk/syslinux.mk
-===================================================================
---- syslinux-6.03.orig/mk/syslinux.mk
-+++ syslinux-6.03/mk/syslinux.mk
-@@ -82,11 +82,11 @@ ARCH ?= $(strip $(SUBARCH))
- GCCWARN  = -W -Wall -Wstrict-prototypes $(DEBUGOPT)
- 
- # Common stanza to make gcc generate .*.d dependency files
--MAKEDEPS = -Wp,-MT,$@,-MD,$(dir $@).$(notdir $@).d
-+MAKEDEPS = -MT $@ -MD
- 
- # Dependencies that exclude system headers; use whenever we use
- # header files from the platform.
--UMAKEDEPS = -Wp,-MT,$@,-MMD,$(dir $@).$(notdir $@).d
-+UMAKEDEPS = -MT $@ -MMD
- 
- # Items that are only appropriate during development; this file is
- # removed when tarballs are generated.
diff --git a/meta/recipes-devtools/syslinux/syslinux/syslinux-6.03-sysmacros.patch b/meta/recipes-devtools/syslinux/syslinux/syslinux-6.03-sysmacros.patch
deleted file mode 100644
index 3ce46da103..0000000000
--- a/meta/recipes-devtools/syslinux/syslinux/syslinux-6.03-sysmacros.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-https://bugs.gentoo.org/579928
-
-From d84db34dbe39d55b4d7e868764c056689aa0793b Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Tue, 19 Apr 2016 01:56:41 -0400
-Subject: [PATCH] extlinux: pull in sys/sysmacros.h for major/minor/makedev
-
-These functions are defined in sys/sysmacros.h, so add the include to
-main.c.  This is already handled correctly in mountinfo.c.  Otherwise
-we get build failures like:
-
-main.o: In function 'find_device_sysfs':
-extlinux/main.c:1131: undefined reference to 'minor'
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-
-The first part wasn't enough in OE build, I had to add the same for syslinuxext.c.
----
- extlinux/main.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/extlinux/main.c b/extlinux/main.c
-index a7ebd49..ebff7ea 100644
---- a/extlinux/main.c
-+++ b/extlinux/main.c
-@@ -38,6 +38,7 @@
- #include <sysexits.h>
- #include <sys/ioctl.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <sys/types.h>
- #include <sys/mount.h>
- #include <sys/vfs.h>
---- a/libinstaller/syslinuxext.c	2017-02-22 20:17:05.336869181 +0100
-+++ b/libinstaller/syslinuxext.c	2017-02-22 20:16:47.500868751 +0100
-@@ -2,6 +2,7 @@
- 
- #include <sys/stat.h>
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <getopt.h>
- #include <ext2fs/ext2fs.h>
- 
diff --git a/meta/recipes-devtools/syslinux/syslinux/syslinux-fix-parallel-building-issue.patch b/meta/recipes-devtools/syslinux/syslinux/syslinux-fix-parallel-building-issue.patch
deleted file mode 100644
index 312b1e8aed..0000000000
--- a/meta/recipes-devtools/syslinux/syslinux/syslinux-fix-parallel-building-issue.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-syslinux-native: fix parallel building issue
-
-There might be an error when parallel build:
-
-[snip]
-cp: cannot create directory `tmp/sysroots/x86_64-linux/usr/share/
-syslinux/com32/include/gplinclude': No such file or directory
-make[4]: *** [install] Error 1
-make[3]: *** [gpllib] Error 2
-[snip]
-
-This is a potential issue. In ${S}/com32/gpllib/Makefile file,
-install target wants to copy $(SRC)/../gplinclude to
-$(INSTALLROOT)$(COM32DIR)/include/ directory, but in ${S}/com32/lib/Makefile
-file, the install target will remove $(INSTALLROOT)$(COM32DIR)/include
-directory. We need to do com32/lib first.
-
-The patch make com32/gpllib depends on com32/lib to fix this issue.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- com32/Makefile |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: syslinux-6.03/com32/Makefile
-===================================================================
---- syslinux-6.03.orig/com32/Makefile
-+++ syslinux-6.03/com32/Makefile
-@@ -21,3 +21,4 @@ rosh: lib libutil
- samples: libutil elflink/ldlinux
- sysdump: lib libutil libupload gpllib
- lua/src: cmenu modules
-+gpllib: lib
diff --git a/meta/recipes-devtools/syslinux/syslinux/syslinux-libupload-depend-lib.patch b/meta/recipes-devtools/syslinux/syslinux/syslinux-libupload-depend-lib.patch
deleted file mode 100644
index 6ba96aeb56..0000000000
--- a/meta/recipes-devtools/syslinux/syslinux/syslinux-libupload-depend-lib.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 490fc3bbd65c2c252c1fdf3da0fac9898aa9eea6 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Fri, 15 Aug 2014 21:09:16 -0700
-Subject: [PATCH] com32/Makefile: fix parallel issue
-
-Fixed:
-cp -r syslinux-6.01/com32/libupload/*.h image/usr/share/syslinux/com32/include/
-[snip]
-rm -rf image/usr/share/syslinux/com32/include
-[snip]
-cp: cannot create regular file `image/usr/share/syslinux/com32/include/serial.h': No such file or directory
-
-The cp is happened in the "libupload" dir, while "rm -fr" is happend in
-"lib" dir, let "libupload" depend "lib" will fix the problem.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- com32/Makefile |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: syslinux-6.03/com32/Makefile
-===================================================================
---- syslinux-6.03.orig/com32/Makefile
-+++ syslinux-6.03/com32/Makefile
-@@ -22,3 +22,4 @@ samples: libutil elflink/ldlinux
- sysdump: lib libutil libupload gpllib
- lua/src: cmenu modules
- gpllib: lib
-+libupload: lib
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
similarity index 85%
rename from meta/recipes-devtools/syslinux/syslinux_6.03.bb
rename to meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index f8b1094096..a7fc21e2fc 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native util-linux e2fsprogs"
+PV = "6.04-pre2"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/syslinux-${PV}.tar.xz \
-           file://syslinux-fix-parallel-building-issue.patch \
-           file://syslinux-libupload-depend-lib.patch \
+SRC_URI = "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${PV}.tar.xz \
            file://syslinux-remove-clean-script.patch \
            file://0001-linux-syslinux-support-ext2-3-4-device.patch \
            file://0002-linux-syslinux-implement-open_ext2_fs.patch \
@@ -21,13 +20,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/syslinux-${PV}.tar.xz \
            file://0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch \
            file://0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch \
            file://0009-linux-syslinux-implement-install_bootblock.patch \
-           file://0010-gcc46-compatibility.patch \
-           file://0011-mk-MMD-does-not-take-any-arguments.patch \
-           file://syslinux-6.03-sysmacros.patch \
+           file://0001-install-don-t-install-obsolete-file-com32.ld.patch \
            "
 
-SRC_URI[md5sum] = "92a253df9211e9c20172796ecf388f13"
-SRC_URI[sha256sum] = "26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e"
+SRC_URI[md5sum] = "2b31c78f087f99179feb357da312d7ec"
+SRC_URI[sha256sum] = "4441a5d593f85bb6e8d578cf6653fb4ec30f9e8f4a2315a3d8f2d0a8b3fadf94"
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 # Don't let the sanity checker trip on the 32 bit real mode BIOS binaries
@@ -62,7 +59,7 @@ do_compile() {
 }
 
 do_install() {
-	oe_runmake CC="${CC} ${CFLAGS}" LD="${LD}" install INSTALLROOT="${D}" firmware="bios"
+	oe_runmake CC="${CC} ${CFLAGS}" LD="${LD}" firmware="bios" install INSTALLROOT="${D}"
 
 	install -d ${D}${datadir}/syslinux/
 	install -m 644 ${S}/bios/core/ldlinux.sys ${D}${datadir}/syslinux/
-- 
2.17.1


