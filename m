Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A8AC273413
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:59:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8x9QO021318
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:59:09 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:59:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:59:08 -0800
Message-ID: <b372543bb43dc10b04c009159fd640117027d1d0.1423817921.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423817921.git.liezhi.yang@windriver.com>
References: <cover.1423817921.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] syslinux: support ext2/3/4 device
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
X-List-Received-Date: Fri, 13 Feb 2015 08:59:15 -0000
Content-Type: text/plain

* Support ext2/3/4 deivce.
* The open_ext2_fs() checks whether it is an ext2/3/4 device,
  do the ext2/3/4 installation (install_to_ext2()) if yes, otherwise go
  on to the fat/ntfs.
* The ext2/3/4 support doesn't require root privileges since it doesn't need
  mount (but write permission is required).

Next:
* Get rid of fat filesystem from the boot image.

These patches have been sent to upstream, we may adjust them (maybe put
the extX support to syslinux-mtools), I will go on working with the
upstream.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...01-linux-syslinux-support-ext2-3-4-device.patch |   84 ++++
 ...002-linux-syslinux-implement-open_ext2_fs.patch |  141 +++++++
 ...-linux-syslinux-implement-install_to_ext2.patch |  116 ++++++
 ...inux-add-ext_file_read-and-ext_file_write.patch |   91 +++++
 ...inux-syslinux-implement-handle_adv_on_ext.patch |  127 ++++++
 ...nux-implement-write_to_ext-and-add-syslin.patch |  215 ++++++++++
 ...slinux-implement-ext_construct_sectmap_fs.patch |   84 ++++
 ...r-syslinuxext-implement-syslinux_patch_bo.patch |  427 ++++++++++++++++++++
 ...inux-syslinux-implement-install_bootblock.patch |   50 +++
 meta/recipes-devtools/syslinux/syslinux_6.03.bb    |   11 +-
 10 files changed, 1345 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0002-linux-syslinux-implement-open_ext2_fs.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0003-linux-syslinux-implement-install_to_ext2.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0004-linux-syslinux-add-ext_file_read-and-ext_file_write.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0005-linux-syslinux-implement-handle_adv_on_ext.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0006-linux-syslinux-implement-write_to_ext-and-add-syslin.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0009-linux-syslinux-implement-install_bootblock.patch

diff --git a/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch b/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch
new file mode 100644
index 0000000..3ab7875
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch
@@ -0,0 +1,84 @@
+From 60f3833ab2b5899771b4eab654e88f9888b99501 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 31 Dec 2014 16:01:55 +0800
+Subject: [PATCH 1/9] linux/syslinux: support ext2/3/4 device
+
+* Support ext2/3/4 deivce.
+* The open_ext2_fs() checks whether it is an ext2/3/4 device,
+  do the ext2/3/4 installation (install_to_ext2()) if yes, otherwise go
+  on to the fat/ntfs.
+* The ext2/3/4 support doesn't require root privileges since it doesn't need
+  mount (but write permission is required).
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Tested-by: Du Dolpher <dolpher.du@intel.com>
+---
+ linux/syslinux.c | 36 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 36 insertions(+)
+
+diff --git a/linux/syslinux.c b/linux/syslinux.c
+index 912de71..36fc202 100755
+--- a/linux/syslinux.c
++++ b/linux/syslinux.c
+@@ -256,6 +256,23 @@ int do_open_file(char *name)
+     return fd;
+ }
+ 
++/*
++ * Check whether the device contains an ext2, ext3 or ext4 fs and open it if
++ * true.
++ * return value:
++ * 0: Everything is OK
++ * 1: Not an ext2, ext3 or ext4
++ * -1: unexpected error
++ */
++static int open_ext2_fs(const char *device, const char *subdir)
++{
++}
++
++/* The install func for ext2, ext3 and ext4 */
++static int install_to_ext2(const char *device, int dev_fd, const char *subdir)
++{
++}
++
+ int main(int argc, char *argv[])
+ {
+     static unsigned char sectbuf[SECTOR_SIZE];
+@@ -313,6 +330,24 @@ int main(int argc, char *argv[])
+ 	die("can't combine an offset with a block device");
+     }
+ 
++    /*
++     * Check if it is an ext2, ext3 or ext4
++     */
++    rv = open_ext2_fs(opt.device, subdir);
++    if (rv == 0) {
++        if (install_to_ext2(opt.device, dev_fd, subdir)) {
++            fprintf(stderr, "%s: installation failed\n", opt.device);
++            exit(1);
++        }
++        return 0;
++    /* Unexpected errors */
++    } else if (rv == -1) {
++        exit(1);
++    }
++
++    /* Reset rv */
++    rv = 0;
++
+     xpread(dev_fd, sectbuf, SECTOR_SIZE, opt.offset);
+     fsync(dev_fd);
+ 
+@@ -322,6 +357,7 @@ int main(int argc, char *argv[])
+      */
+     if ((errmsg = syslinux_check_bootsect(sectbuf, &fs_type))) {
+ 	fprintf(stderr, "%s: %s\n", opt.device, errmsg);
++	fprintf(stderr, "%s: supported fs: fat/ntfs/ext2/ex3/ext4\n", program);
+ 	exit(1);
+     }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux/0002-linux-syslinux-implement-open_ext2_fs.patch b/meta/recipes-devtools/syslinux/syslinux/0002-linux-syslinux-implement-open_ext2_fs.patch
new file mode 100644
index 0000000..77cf060
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0002-linux-syslinux-implement-open_ext2_fs.patch
@@ -0,0 +1,141 @@
+From 07fb737fb60c08eaaa41989d531fc23009523546 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 31 Dec 2014 16:09:18 +0800
+Subject: [PATCH 2/9] linux/syslinux: implement open_ext2_fs()
+
+The open_ext2_fs() checks whether it is an ext2/ext3/ext4 device, and
+return:
+0: It is an ext2, ext3 or ext4.
+1: Not an ext2, ext3 or ext4.
+-1: unexpected error.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Tested-by: Du Dolpher <dolpher.du@intel.com>
+---
+ linux/Makefile   |  2 +-
+ linux/syslinux.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 81 insertions(+), 1 deletion(-)
+
+diff --git a/linux/Makefile b/linux/Makefile
+index 11667e1..ac1ac58 100644
+--- a/linux/Makefile
++++ b/linux/Makefile
+@@ -51,7 +51,7 @@ spotless: clean
+ installer: syslinux syslinux-nomtools
+ 
+ syslinux: $(OBJS)
+-	$(CC) $(LDFLAGS) -o $@ $^
++	$(CC) $(LDFLAGS) -o $@ $^ -lext2fs
+ 
+ syslinux-nomtools: syslinux
+ 	ln -f $< $@
+diff --git a/linux/syslinux.c b/linux/syslinux.c
+index 36fc202..cc4e7da 100755
+--- a/linux/syslinux.c
++++ b/linux/syslinux.c
+@@ -72,6 +72,7 @@
+ #include "syslxfs.h"
+ #include "setadv.h"
+ #include "syslxopt.h" /* unified options */
++#include <ext2fs/ext2fs.h>
+ 
+ extern const char *program;	/* Name of program */
+ 
+@@ -82,6 +83,9 @@ char *mntpath = NULL;		/* Path on which to mount */
+ int loop_fd = -1;		/* Loop device */
+ #endif
+ 
++ext2_filsys     e2fs = NULL;    /* Ext2/3/4 filesystem */
++ext2_ino_t      root, cwd;      /* The root and cwd of e2fs */
++
+ void __attribute__ ((noreturn)) die(const char *msg)
+ {
+     fprintf(stderr, "%s: %s\n", program, msg);
+@@ -266,6 +270,82 @@ int do_open_file(char *name)
+  */
+ static int open_ext2_fs(const char *device, const char *subdir)
+ {
++    int         retval;
++    int         open_flag = EXT2_FLAG_RW, mount_flags;
++    ext2_ino_t  dirino;
++    char        opt_string[40];
++
++    if (opt.offset) {
++        sprintf(opt_string, "offset=%llu", (unsigned long long)opt.offset);
++        retval = ext2fs_open2(device, opt_string, open_flag, 0, 0, unix_io_manager, &e2fs);
++    } else
++        retval = ext2fs_open(device, open_flag, 0, 0, unix_io_manager, &e2fs);
++    if (retval) {
++        /* It might not be an extN fs, so we need check magic firstly */
++        if (retval == EXT2_ET_BAD_MAGIC) {
++            /* Do nothing, return silently */
++            return 1;
++        } else {
++            fprintf(stderr, "%s: error while trying to open: %s\n",
++                program, device);
++            return -1;
++        }
++    }
++
++    /* Stop if it is mounted */
++    retval = ext2fs_check_if_mounted(device, &mount_flags);
++    if (retval) {
++        fprintf(stderr, "%s: ext2fs_check_if_mount() error on %s\n",
++                program, device);
++        goto fail;
++    }
++
++    if (mount_flags & EXT2_MF_MOUNTED) {
++        fprintf(stderr, "%s: %s is mounted\n", program, device);
++        goto fail;
++    }
++
++    e2fs->default_bitmap_type = EXT2FS_BMAP64_RBTREE;
++
++    /* Read the inode map */
++    retval = ext2fs_read_inode_bitmap(e2fs);
++    if (retval) {
++        fprintf(stderr, "%s: while reading inode bitmap: %s\n",
++                program, device);
++        goto fail;
++    }
++
++    /* Read the block map */
++    retval = ext2fs_read_block_bitmap(e2fs);
++    if (retval) {
++        fprintf(stderr, "%s: while reading block bitmap: %s\n",
++                program, device);
++        goto fail;
++    }
++
++    root = cwd = EXT2_ROOT_INO;
++    /* Check the subdir */
++    if (strcmp(subdir, "/")) {
++	retval = ext2fs_namei(e2fs, root, cwd, subdir, &dirino);
++        if (retval) {
++            fprintf(stderr, "%s: failed to find dir %s on %s\n",
++                program, subdir, device);
++            goto fail;
++        }
++
++        retval = ext2fs_check_directory(e2fs, dirino);
++        if (retval) {
++            fprintf(stderr, "%s: failed to cd to: %s\n", program, subdir);
++                goto fail;
++        }
++        cwd = dirino;
++    }
++
++    return 0;
++
++fail:
++    (void) ext2fs_close(e2fs);
++    return -1;
+ }
+ 
+ /* The install func for ext2, ext3 and ext4 */
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux/0003-linux-syslinux-implement-install_to_ext2.patch b/meta/recipes-devtools/syslinux/syslinux/0003-linux-syslinux-implement-install_to_ext2.patch
new file mode 100644
index 0000000..84ba105
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0003-linux-syslinux-implement-install_to_ext2.patch
@@ -0,0 +1,116 @@
+From 64d856b243812907068776b204a003a3a8fa122a Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 31 Dec 2014 16:17:42 +0800
+Subject: [PATCH 3/9] linux/syslinux: implement install_to_ext2()
+
+* The handle_adv_on_ext() checks whether we only need update adv.
+* The write_to_ext() installs files (ldlinux.sys or ldlinux.c32) to the
+  device.
+* The install_bootblock() installs the boot block.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Tested-by: Du Dolpher <dolpher.du@intel.com>
+---
+ linux/syslinux.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 79 insertions(+)
+
+diff --git a/linux/syslinux.c b/linux/syslinux.c
+index cc4e7da..45f080d 100755
+--- a/linux/syslinux.c
++++ b/linux/syslinux.c
+@@ -346,11 +346,90 @@ static int open_ext2_fs(const char *device, const char *subdir)
+ fail:
+     (void) ext2fs_close(e2fs);
+     return -1;
++
++}
++
++/*
++ * Install the boot block on the specified device.
++ * Must be run AFTER file installed.
++ */
++int install_bootblock(int fd, const char *device)
++{
++}
++
++static int handle_adv_on_ext(void)
++{
++}
++
++/* Write files, adv, boot sector */
++static int write_to_ext(const char *filename, const char *str, int length,
++                        int i_flags, int dev_fd, const char *subdir)
++{
+ }
+ 
+ /* The install func for ext2, ext3 and ext4 */
+ static int install_to_ext2(const char *device, int dev_fd, const char *subdir)
+ {
++    int         retval;
++    ext2_ino_t  oldino;
++
++    const char *file = "ldlinux.sys";
++    const char *oldfile = "extlinux.sys";
++    const char *c32file = "ldlinux.c32";
++
++    /* Handle the adv */
++    if (handle_adv_on_ext() < 0) {
++        fprintf(stderr, "%s: error while handling ADV on %s\n",
++                program, device);
++        retval = 1;
++        goto fail;
++    }
++
++    /* Return if only need update the adv */
++    if (opt.update_only == -1) {
++        return ext2fs_close(e2fs);
++    }
++
++    /* Write ldlinux.sys, adv, boot sector */
++    retval = write_to_ext(file, (const char _force *)boot_image,
++                boot_image_len, EXT2_IMMUTABLE_FL, dev_fd, subdir);
++    if (retval) {
++        fprintf(stderr, "%s: ERROR: while writing: %s.\n",
++                program, file);
++        goto fail;
++    }
++
++    /* Write ldlinux.c32 */
++    retval = write_to_ext(c32file,
++                (const char _force *)syslinux_ldlinuxc32,
++                syslinux_ldlinuxc32_len, 0, dev_fd, subdir);
++    if (retval) {
++        fprintf(stderr, "%s: ERROR: while writing: %s.\n",
++                program, c32file);
++        goto fail;
++    }
++
++    /* Look if we have the extlinux.sys and remove it*/
++    retval = ext2fs_namei(e2fs, root, cwd, oldfile, &oldino);
++    if (retval == 0) {
++        retval = ext2fs_unlink(e2fs, cwd, oldfile, oldino, 0);
++        if (retval) {
++            fprintf(stderr, "%s: ERROR: failed to unlink: %s\n",
++                program, oldfile);
++            goto fail;
++        }
++    } else {
++        retval = 0;
++    }
++
++    sync();
++    retval = install_bootblock(dev_fd, device);
++    close(dev_fd);
++    sync();
++
++fail:
++    (void) ext2fs_close(e2fs);
++    return retval;
+ }
+ 
+ int main(int argc, char *argv[])
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux/0004-linux-syslinux-add-ext_file_read-and-ext_file_write.patch b/meta/recipes-devtools/syslinux/syslinux/0004-linux-syslinux-add-ext_file_read-and-ext_file_write.patch
new file mode 100644
index 0000000..64b56d9
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0004-linux-syslinux-add-ext_file_read-and-ext_file_write.patch
@@ -0,0 +1,91 @@
+From 35d3842cc4b930c5102eed2921e0189b7f4fd069 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 31 Dec 2014 16:43:37 +0800
+Subject: [PATCH 4/9] linux/syslinux: add ext_file_read() and ext_file_write()
+
+Will use them to read and write on the extX device.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Tested-by: Du Dolpher <dolpher.du@intel.com>
+---
+ linux/syslinux.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 62 insertions(+)
+
+diff --git a/linux/syslinux.c b/linux/syslinux.c
+index 45f080d..247c86a 100755
+--- a/linux/syslinux.c
++++ b/linux/syslinux.c
+@@ -349,6 +349,68 @@ fail:
+ 
+ }
+ 
++/* Read from an ext2_file */
++static int ext_file_read(ext2_file_t e2_file, void *buf, size_t count,
++                        off_t offset, const char *msg)
++{
++    int                 retval;
++    char                *ptr = (char *) buf;
++    unsigned int        got = 0;
++    size_t              done = 0;
++
++    /* Always lseek since e2_file is uncontrolled by this func */
++    if (ext2fs_file_lseek(e2_file, offset, EXT2_SEEK_SET, NULL)) {
++        fprintf(stderr, "%s: ext2fs_file_lseek() failed.\n",
++            program);
++        return -1;
++    }
++
++    while (1) {
++        retval = ext2fs_file_read(e2_file, ptr, count, &got);
++        if (retval) {
++            fprintf(stderr, "%s: error while reading %s\n",
++                    program, msg);
++            return -1;
++        }
++        count -= got;
++        ptr += got;
++        done += got;
++        if (got == 0 || count == 0)
++            break;
++    }
++
++    return done;
++}
++
++/* Write to an ext2_file */
++static int ext_file_write(ext2_file_t e2_file, const void *buf, size_t count,
++                        off_t offset)
++{
++    const char          *ptr = (const char *) buf;
++    unsigned int        written = 0;
++    size_t              done = 0;
++
++    /* Always lseek since e2_file is uncontrolled by this func */
++    if (ext2fs_file_lseek(e2_file, offset, EXT2_SEEK_SET, NULL)) {
++            fprintf(stderr, "%s: ext2fs_file_lseek() failed.\n",
++                program);
++            return -1;
++    }
++
++    while (count > 0) {
++        if (ext2fs_file_write(e2_file, ptr, count, &written)) {
++            fprintf(stderr, "%s: failed to write syslinux adv.\n",
++                    program);
++            return -1;
++        }
++        count -= written;
++        ptr += written;
++        done += written;
++    }
++
++    return done;
++}
++
+ /*
+  * Install the boot block on the specified device.
+  * Must be run AFTER file installed.
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux/0005-linux-syslinux-implement-handle_adv_on_ext.patch b/meta/recipes-devtools/syslinux/syslinux/0005-linux-syslinux-implement-handle_adv_on_ext.patch
new file mode 100644
index 0000000..829e7c4
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0005-linux-syslinux-implement-handle_adv_on_ext.patch
@@ -0,0 +1,127 @@
+From cdb980b37f40dc2c41891434c7736e49da53756e Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 31 Dec 2014 16:47:52 +0800
+Subject: [PATCH 5/9] linux/syslinux: implement handle_adv_on_ext()
+
+It reads adv if found on the device, or resets syslinux_adv, or update
+the adv if update adv only.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Tested-by: Du Dolpher <dolpher.du@intel.com>
+---
+ linux/syslinux.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 97 insertions(+)
+
+diff --git a/linux/syslinux.c b/linux/syslinux.c
+index 247c86a..de5d272 100755
+--- a/linux/syslinux.c
++++ b/linux/syslinux.c
+@@ -421,6 +421,103 @@ int install_bootblock(int fd, const char *device)
+ 
+ static int handle_adv_on_ext(void)
+ {
++    int                 i, retval, found_file;
++    int                 need_close = 2; /* 2 means no need extra close */
++    char                *filenames[2] = {"ldlinux.sys", "extlinux.sys"};
++    char                *filename;
++    ext2_ino_t          newino;
++    ext2_file_t         e2_file;
++    struct ext2_inode   inode;
++
++    for (i = 0; i < 2; i++) {
++        filename = filenames[i];
++        found_file = 0;
++        retval = ext2fs_namei(e2fs, root, cwd, filename, &newino);
++        if (retval == 0) {
++            found_file = 1;
++        } else
++            continue;
++
++        need_close = i;
++
++        retval = ext2fs_file_open(e2fs, newino, EXT2_FLAG_RW, &e2_file);
++        if (retval) {
++            fprintf(stderr, "%s: failed to open %s\n",
++                program, filename);
++            goto fail;
++        }
++
++        retval = ext2fs_read_inode(e2fs, newino, &inode);
++        if (retval) {
++            fprintf(stderr, "%s: error while reading inode: %u, file: %s\n",
++                program, newino, filename);
++            goto fail;
++        }
++
++        /* Check the size to see if too small to read */
++        if (inode.i_size < 2 * ADV_SIZE) {
++            if (opt.update_only == -1) {
++                fprintf(stderr, "%s: failed to write auxilliary data\n\
++                        the size of %s is too small (need --update)?\n",
++                        program, filename);
++                retval = -1;
++                goto fail;
++            }
++            syslinux_reset_adv(syslinux_adv);
++            found_file = 0;
++            break;
++        }
++
++        /* Read the adv */
++        retval = ext_file_read(e2_file, syslinux_adv, 2 * ADV_SIZE,
++                        inode.i_size - 2 * ADV_SIZE, "ADV");
++        if (retval == -1)
++                goto fail;
++        if (retval == 2 * ADV_SIZE) {
++            retval = syslinux_validate_adv(syslinux_adv);
++            /* Read the adv successfully */
++            if (retval == 0)
++                break;
++        }
++
++        /* Close the file if reaches here, otherwise we leave the file
++         * open in case we need write it */
++        need_close = 2;
++        retval = ext2fs_file_close(e2_file);
++        if (retval) {
++            fprintf(stderr, "%s: error while closing %s\n",
++                program, filename);
++            return retval;
++        }
++    }
++
++    if (!found_file) {
++        if (opt.update_only == -1) {
++            fprintf(stderr, "%s: no ldlinux.sys or extlinux.sys found on the device\n",
++                program);
++            return -1;
++        }
++        syslinux_reset_adv(syslinux_adv);
++    }
++
++    /* The modify_adv will reset the adv if opt.reset_adv */
++    if (modify_adv() < 0) {
++        fprintf(stderr, "%s: error while modifying adv\n", program);
++        retval = -1;
++        goto fail;
++    }
++
++    /* Write adv if update_only == -1 and found file */
++    if (opt.update_only == -1 && found_file) {
++        if (ext_file_write(e2_file, syslinux_adv, 2 * ADV_SIZE ,
++                        inode.i_size - 2 * ADV_SIZE) == -1)
++                goto fail;
++    }
++
++fail:
++    if (need_close != 2)
++        (void) ext2fs_file_close(e2_file);
++    return retval;
+ }
+ 
+ /* Write files, adv, boot sector */
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux/0006-linux-syslinux-implement-write_to_ext-and-add-syslin.patch b/meta/recipes-devtools/syslinux/syslinux/0006-linux-syslinux-implement-write_to_ext-and-add-syslin.patch
new file mode 100644
index 0000000..cba8725
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0006-linux-syslinux-implement-write_to_ext-and-add-syslin.patch
@@ -0,0 +1,215 @@
+From 922e56c10e36d876777580c84daef9a66bea6525 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 31 Dec 2014 17:20:43 +0800
+Subject: [PATCH 6/9] linux/syslinux: implement write_to_ext() and add
+ syslinuxext.c
+
+* The write_to_ext() write file to the extX device, and handle the boot
+  sector.
+* The syslinuxext.c is used for placing the code which are used by
+  extlinux and syslinux (which is syslinux_patch_bootsect()).
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Tested-by: Du Dolpher <dolpher.du@intel.com>
+---
+ libinstaller/syslinuxext.c |   7 +++
+ libinstaller/syslinuxext.h |   5 ++
+ linux/Makefile             |   3 +-
+ linux/syslinux.c           | 118 +++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 132 insertions(+), 1 deletion(-)
+ create mode 100644 libinstaller/syslinuxext.c
+ create mode 100644 libinstaller/syslinuxext.h
+
+diff --git a/libinstaller/syslinuxext.c b/libinstaller/syslinuxext.c
+new file mode 100644
+index 0000000..bb54cef
+--- /dev/null
++++ b/libinstaller/syslinuxext.c
+@@ -0,0 +1,7 @@
++#define _GNU_SOURCE
++
++/* Patch syslinux_bootsect */
++void syslinux_patch_bootsect(int dev_fd)
++{
++}
++
+diff --git a/libinstaller/syslinuxext.h b/libinstaller/syslinuxext.h
+new file mode 100644
+index 0000000..8abd8b9
+--- /dev/null
++++ b/libinstaller/syslinuxext.h
+@@ -0,0 +1,5 @@
++#ifndef EXT2_SUPER_OFFSET
++#define EXT2_SUPER_OFFSET 1024
++#endif
++
++void syslinux_patch_bootsect(int dev_fd);
+diff --git a/linux/Makefile b/linux/Makefile
+index ac1ac58..3b23867 100644
+--- a/linux/Makefile
++++ b/linux/Makefile
+@@ -30,7 +30,8 @@ SRCS     = syslinux.c \
+            ../libinstaller/syslxmod.c \
+ 	   ../libinstaller/bootsect_bin.c \
+ 	   ../libinstaller/ldlinuxc32_bin.c \
+-	   ../libinstaller/ldlinux_bin.c
++	   ../libinstaller/ldlinux_bin.c \
++	   ../libinstaller/syslinuxext.c
+ OBJS	 = $(patsubst %.c,%.o,$(notdir $(SRCS)))
+ 
+ .SUFFIXES: .c .o .i .s .S
+diff --git a/linux/syslinux.c b/linux/syslinux.c
+index de5d272..f0c97a8 100755
+--- a/linux/syslinux.c
++++ b/linux/syslinux.c
+@@ -46,6 +46,7 @@
+ #include <sys/types.h>
+ #include <sys/wait.h>
+ #include <sys/mount.h>
++#include <time.h>
+ 
+ #include "linuxioctl.h"
+ 
+@@ -72,6 +73,7 @@
+ #include "syslxfs.h"
+ #include "setadv.h"
+ #include "syslxopt.h" /* unified options */
++#include "syslinuxext.h"
+ #include <ext2fs/ext2fs.h>
+ 
+ extern const char *program;	/* Name of program */
+@@ -419,6 +421,12 @@ int install_bootblock(int fd, const char *device)
+ {
+ }
+ 
++/* Construct the boot file map */
++int ext_construct_sectmap_fs(ext2_filsys fs, ext2_ino_t newino,
++                                sector_t *sectors, int nsect)
++{
++}
++
+ static int handle_adv_on_ext(void)
+ {
+     int                 i, retval, found_file;
+@@ -524,6 +532,116 @@ fail:
+ static int write_to_ext(const char *filename, const char *str, int length,
+                         int i_flags, int dev_fd, const char *subdir)
+ {
++    ext2_ino_t          newino;
++    struct ext2_inode   inode;
++    int                 retval, i, modbytes, nsect;
++    ext2_file_t         e2_file;
++    sector_t            *sectors;
++
++    /* Remove it if it is already exists */
++    retval = ext2fs_namei(e2fs, root, cwd, filename, &newino);
++    if (retval == 0) {
++        retval = ext2fs_unlink(e2fs, cwd, filename, newino, 0);
++        if (retval) {
++            fprintf(stderr, "%s: failed to unlink: %s\n", program, filename);
++            return retval;
++        }
++    }
++
++    /* Create new inode */
++    retval = ext2fs_new_inode(e2fs, cwd, 010755, 0, &newino);
++    if (retval) {
++        fprintf(stderr, "%s: ERROR: failed to create inode for: %s\n",
++                program, filename);
++        return retval;
++    }
++
++    /* Link the inode and the filename */
++    retval = ext2fs_link(e2fs, cwd, filename, newino, EXT2_FT_REG_FILE);
++    if (retval) {
++        fprintf(stderr, "%s: ERROR: failed to link inode for: %s.\n",
++                program, filename);
++        return retval;
++    }
++
++    if (ext2fs_test_inode_bitmap2(e2fs->inode_map, newino))
++       fprintf(stderr, "%s: warning: inode already set %s.\n",
++            program, filename);
++
++        ext2fs_inode_alloc_stats2(e2fs, newino, +1, 0);
++        memset(&inode, 0, sizeof(inode));
++	inode.i_mode = LINUX_S_IFREG | LINUX_S_IRUSR | LINUX_S_IRGRP
++                        | LINUX_S_IROTH;
++	inode.i_flags |= i_flags;
++        inode.i_atime = inode.i_ctime = inode.i_mtime =
++            e2fs->now ? e2fs->now : time(0);
++        inode.i_links_count = 1;
++        if (e2fs->super->s_feature_incompat &
++            EXT3_FEATURE_INCOMPAT_EXTENTS) {
++            struct ext3_extent_header *eh;
++
++            eh = (struct ext3_extent_header *) &inode.i_block[0];
++            eh->eh_depth = 0;
++            eh->eh_entries = 0;
++            eh->eh_magic = ext2fs_cpu_to_le16(EXT3_EXT_MAGIC);
++            i = (sizeof(inode.i_block) - sizeof(*eh)) /
++                sizeof(struct ext3_extent);
++            eh->eh_max = ext2fs_cpu_to_le16(i);
++            inode.i_flags |= EXT4_EXTENTS_FL;
++    }
++
++    retval = ext2fs_write_new_inode(e2fs, newino, &inode);
++    if (retval) {
++        fprintf(stderr, "%s: ERROR: while writting inode %d.\n",
++                program, newino);
++        return 1;
++    }
++
++    retval = ext2fs_file_open(e2fs, newino, EXT2_FILE_WRITE, &e2_file);
++    if (retval) {
++        fprintf(stderr, "%s: ERROR: failed to open %s.\n",
++                program, filename);
++        return 1;
++    }
++
++    /* Write to file */
++    if (ext_file_write(e2_file, str, length, 0) == -1)
++        goto fail;
++
++    if (strcmp(filename, "ldlinux.sys") == 0) {
++        /* Write ADV */
++        if (ext_file_write(e2_file, syslinux_adv, 2 * ADV_SIZE,
++                boot_image_len) == -1)
++            goto fail;
++
++        /* Patch syslinux_bootsect */
++        syslinux_patch_bootsect(dev_fd);
++
++        /* Patch ldlinux.sys */
++        nsect = (boot_image_len + SECTOR_SIZE - 1) >> SECTOR_SHIFT;
++        nsect += 2;                        /* Two sectors for the ADV */
++        sectors = alloca(sizeof(sector_t) * nsect);
++        memset(sectors, 0, nsect * sizeof *sectors);
++        /* The sectors will be modified and used by syslinux_patch() */
++        retval = ext_construct_sectmap_fs(e2fs, newino, sectors, nsect);
++        if (retval)
++            goto fail;
++
++        /* Create the modified image in memory */
++        modbytes = syslinux_patch(sectors, nsect, opt.stupid_mode,
++                            opt.raid_mode, subdir, NULL);
++
++        /* Rewrite the first modbytes of ldlinux.sys */
++        if (ext_file_write(e2_file, str, modbytes, 0) == -1) {
++            fprintf(stderr, "%s: ERROR: failed to patch %s.\n", program,
++                    filename);
++            goto fail;
++        }
++    }
++
++fail:
++    (void) ext2fs_file_close(e2_file);
++    return retval;
+ }
+ 
+ /* The install func for ext2, ext3 and ext4 */
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux/0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch b/meta/recipes-devtools/syslinux/syslinux/0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch
new file mode 100644
index 0000000..3913811
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch
@@ -0,0 +1,84 @@
+From a95b831e18dd123f859bc5e6c4cecdcc0184ee37 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 2 Jan 2015 12:18:02 +0800
+Subject: [PATCH 7/9] linux/syslinux: implement ext_construct_sectmap_fs()
+
+The ext_construct_sectmap_fs() constucts the sector according to the
+bmap.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Tested-by: Du Dolpher <dolpher.du@intel.com>
+---
+ linux/syslinux.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 50 insertions(+)
+
+diff --git a/linux/syslinux.c b/linux/syslinux.c
+index f0c97a8..c741750 100755
+--- a/linux/syslinux.c
++++ b/linux/syslinux.c
+@@ -421,10 +421,60 @@ int install_bootblock(int fd, const char *device)
+ {
+ }
+ 
++/* The file's block count */
++int block_count = 0;
++static int get_block_count(ext2_filsys fs EXT2FS_ATTR((unused)),
++			     blk64_t *blocknr EXT2FS_ATTR((unused)),
++			     e2_blkcnt_t blockcnt EXT2FS_ATTR((unused)),
++			     blk64_t ref_block EXT2FS_ATTR((unused)),
++			     int ref_offset EXT2FS_ATTR((unused)),
++			     void *private EXT2FS_ATTR((unused)))
++{
++    block_count++;
++    return 0;
++}
++
+ /* Construct the boot file map */
+ int ext_construct_sectmap_fs(ext2_filsys fs, ext2_ino_t newino,
+                                 sector_t *sectors, int nsect)
+ {
++    blk64_t             pblk, blksize, blk = 0;
++    sector_t            sec;
++    unsigned int        i;
++    int                 retval;
++
++    blksize = fs->blocksize;
++    blksize >>= SECTOR_SHIFT;
++
++    /* Get the total blocks no. */
++    retval = ext2fs_block_iterate3(fs, newino, BLOCK_FLAG_READ_ONLY,
++            NULL, get_block_count, NULL);
++    if (retval) {
++        fprintf(stderr, "%s: ERROR: ext2fs_block_iterate3() failed.\n", program);
++        return -1;
++    }
++
++    while (nsect) {
++        if (block_count-- == 0)
++            break;
++
++        /* Get the physical block no. (bmap) */
++        retval = ext2fs_bmap2(fs, newino, 0, 0, 0, blk, 0, &pblk);
++        if (retval) {
++            fprintf(stderr, "%s: ERROR: ext2fs_bmap2() failed.\n", program);
++            return -1;
++        }
++
++        blk++;
++        sec = (sector_t)pblk * blksize;
++        for (i = 0; i < blksize; i++) {
++            *sectors++ = sec++;
++            if (! --nsect)
++                break;
++        }
++    }
++
++    return 0;
+ }
+ 
+ static int handle_adv_on_ext(void)
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch b/meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch
new file mode 100644
index 0000000..2400c98
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch
@@ -0,0 +1,427 @@
+From 78d76b87a4b855e6b661ae457283a63f385c04c9 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 2 Jan 2015 12:26:46 +0800
+Subject: [PATCH 8/9] libinstaller/syslinuxext: implement
+ syslinux_patch_bootsect()
+
+Move the related from extlinux/main.c to libinstaller/syslinuxext.c, the
+syslinux_patch_bootsect() are used by both extlinux/main.c and
+linux/syslinux.c.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Tested-by: Du Dolpher <dolpher.du@intel.com>
+---
+ extlinux/Makefile          |   3 +-
+ extlinux/main.c            | 167 +-------------------------------------------
+ libinstaller/syslinuxext.c | 170 +++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 175 insertions(+), 165 deletions(-)
+
+diff --git a/extlinux/Makefile b/extlinux/Makefile
+index 02d1db5..90dd92f 100644
+--- a/extlinux/Makefile
++++ b/extlinux/Makefile
+@@ -31,7 +31,8 @@ SRCS     = main.c \
+ 	   ../libinstaller/advio.c \
+ 	   ../libinstaller/bootsect_bin.c \
+ 	   ../libinstaller/ldlinuxc32_bin.c \
+-	   ../libinstaller/ldlinux_bin.c
++	   ../libinstaller/ldlinux_bin.c \
++	   ../libinstaller/syslinuxext.c
+ OBJS	 = $(patsubst %.c,%.o,$(notdir $(SRCS)))
+ 
+ .SUFFIXES: .c .o .i .s .S
+diff --git a/extlinux/main.c b/extlinux/main.c
+index 09740bd..6fe026e 100644
+--- a/extlinux/main.c
++++ b/extlinux/main.c
+@@ -60,6 +60,7 @@
+ #include "setadv.h"
+ #include "syslxopt.h" /* unified options */
+ #include "mountinfo.h"
++#include "syslinuxext.h"
+ 
+ #ifdef DEBUG
+ # define dprintf printf
+@@ -67,10 +68,6 @@
+ # define dprintf(...) ((void)0)
+ #endif
+ 
+-#ifndef EXT2_SUPER_OFFSET
+-#define EXT2_SUPER_OFFSET 1024
+-#endif
+-
+ /* Since we have unused 2048 bytes in the primary AG of an XFS partition,
+  * we will use the first 0~512 bytes starting from 2048 for the Syslinux
+  * boot sector.
+@@ -92,136 +89,6 @@ static char subvol[BTRFS_SUBVOL_MAX];
+ 			  - 2*ADV_SIZE)
+ 
+ /*
+- * Get the size of a block device
+- */
+-static uint64_t get_size(int devfd)
+-{
+-    uint64_t bytes;
+-    uint32_t sects;
+-    struct stat st;
+-
+-#ifdef BLKGETSIZE64
+-    if (!ioctl(devfd, BLKGETSIZE64, &bytes))
+-	return bytes;
+-#endif
+-    if (!ioctl(devfd, BLKGETSIZE, &sects))
+-	return (uint64_t) sects << 9;
+-    else if (!fstat(devfd, &st) && st.st_size)
+-	return st.st_size;
+-    else
+-	return 0;
+-}
+-
+-/*
+- * Get device geometry and partition offset
+- */
+-struct geometry_table {
+-    uint64_t bytes;
+-    struct hd_geometry g;
+-};
+-
+-static int sysfs_get_offset(int devfd, unsigned long *start)
+-{
+-    struct stat st;
+-    char sysfs_name[128];
+-    FILE *f;
+-    int rv;
+-
+-    if (fstat(devfd, &st))
+-	return -1;
+-
+-    if ((size_t)snprintf(sysfs_name, sizeof sysfs_name,
+-			 "/sys/dev/block/%u:%u/start",
+-			 major(st.st_rdev), minor(st.st_rdev))
+-	>= sizeof sysfs_name)
+-	return -1;
+-
+-    f = fopen(sysfs_name, "r");
+-    if (!f)
+-	return -1;
+-
+-    rv = fscanf(f, "%lu", start);
+-    fclose(f);
+-
+-    return (rv == 1) ? 0 : -1;
+-}
+-
+-/* Standard floppy disk geometries, plus LS-120.  Zipdisk geometry
+-   (x/64/32) is the final fallback.  I don't know what LS-240 has
+-   as its geometry, since I don't have one and don't know anyone that does,
+-   and Google wasn't helpful... */
+-static const struct geometry_table standard_geometries[] = {
+-    {360 * 1024, {2, 9, 40, 0}},
+-    {720 * 1024, {2, 9, 80, 0}},
+-    {1200 * 1024, {2, 15, 80, 0}},
+-    {1440 * 1024, {2, 18, 80, 0}},
+-    {1680 * 1024, {2, 21, 80, 0}},
+-    {1722 * 1024, {2, 21, 80, 0}},
+-    {2880 * 1024, {2, 36, 80, 0}},
+-    {3840 * 1024, {2, 48, 80, 0}},
+-    {123264 * 1024, {8, 32, 963, 0}},	/* LS120 */
+-    {0, {0, 0, 0, 0}}
+-};
+-
+-int get_geometry(int devfd, uint64_t totalbytes, struct hd_geometry *geo)
+-{
+-    struct floppy_struct fd_str;
+-    struct loop_info li;
+-    struct loop_info64 li64;
+-    const struct geometry_table *gp;
+-    int rv = 0;
+-
+-    memset(geo, 0, sizeof *geo);
+-
+-    if (!ioctl(devfd, HDIO_GETGEO, geo)) {
+-	goto ok;
+-    } else if (!ioctl(devfd, FDGETPRM, &fd_str)) {
+-	geo->heads = fd_str.head;
+-	geo->sectors = fd_str.sect;
+-	geo->cylinders = fd_str.track;
+-	geo->start = 0;
+-	goto ok;
+-    }
+-
+-    /* Didn't work.  Let's see if this is one of the standard geometries */
+-    for (gp = standard_geometries; gp->bytes; gp++) {
+-	if (gp->bytes == totalbytes) {
+-	    memcpy(geo, &gp->g, sizeof *geo);
+-	    goto ok;
+-	}
+-    }
+-
+-    /* Didn't work either... assign a geometry of 64 heads, 32 sectors; this is
+-       what zipdisks use, so this would help if someone has a USB key that
+-       they're booting in USB-ZIP mode. */
+-
+-    geo->heads = opt.heads ? : 64;
+-    geo->sectors = opt.sectors ? : 32;
+-    geo->cylinders = totalbytes / (geo->heads * geo->sectors << SECTOR_SHIFT);
+-    geo->start = 0;
+-
+-    if (!opt.sectors && !opt.heads) {
+-	fprintf(stderr,
+-		"Warning: unable to obtain device geometry (defaulting to %d heads, %d sectors)\n"
+-		"         (on hard disks, this is usually harmless.)\n",
+-		geo->heads, geo->sectors);
+-	rv = 1;			/* Suboptimal result */
+-    }
+-
+-ok:
+-    /* If this is a loopback device, try to set the start */
+-    if (!ioctl(devfd, LOOP_GET_STATUS64, &li64))
+-	geo->start = li64.lo_offset >> SECTOR_SHIFT;
+-    else if (!ioctl(devfd, LOOP_GET_STATUS, &li))
+-	geo->start = (unsigned int)li.lo_offset >> SECTOR_SHIFT;
+-    else if (!sysfs_get_offset(devfd, &geo->start)) {
+-	/* OK */
+-    }
+-
+-    return rv;
+-}
+-
+-/*
+  * Query the device geometry and put it into the boot sector.
+  * Map the file and put the map in the boot sector and file.
+  * Stick the "current directory" inode number into the file.
+@@ -231,11 +98,8 @@ ok:
+ static int patch_file_and_bootblock(int fd, const char *dir, int devfd)
+ {
+     struct stat dirst, xdst;
+-    struct hd_geometry geo;
+     sector_t *sectp;
+-    uint64_t totalbytes, totalsectors;
+     int nsect;
+-    struct fat_boot_sector *sbs;
+     char *dirpath, *subpath, *xdirpath;
+     int rv;
+ 
+@@ -279,33 +143,8 @@ static int patch_file_and_bootblock(int fd, const char *dir, int devfd)
+     /* Now subpath should contain the path relative to the fs base */
+     dprintf("subpath = %s\n", subpath);
+ 
+-    totalbytes = get_size(devfd);
+-    get_geometry(devfd, totalbytes, &geo);
+-
+-    if (opt.heads)
+-	geo.heads = opt.heads;
+-    if (opt.sectors)
+-	geo.sectors = opt.sectors;
+-
+-    /* Patch this into a fake FAT superblock.  This isn't because
+-       FAT is a good format in any way, it's because it lets the
+-       early bootstrap share code with the FAT version. */
+-    dprintf("heads = %u, sect = %u\n", geo.heads, geo.sectors);
+-
+-    sbs = (struct fat_boot_sector *)syslinux_bootsect;
+-
+-    totalsectors = totalbytes >> SECTOR_SHIFT;
+-    if (totalsectors >= 65536) {
+-	set_16(&sbs->bsSectors, 0);
+-    } else {
+-	set_16(&sbs->bsSectors, totalsectors);
+-    }
+-    set_32(&sbs->bsHugeSectors, totalsectors);
+-
+-    set_16(&sbs->bsBytesPerSec, SECTOR_SIZE);
+-    set_16(&sbs->bsSecPerTrack, geo.sectors);
+-    set_16(&sbs->bsHeads, geo.heads);
+-    set_32(&sbs->bsHiddenSecs, geo.start);
++    /* Patch syslinux_bootsect */
++    syslinux_patch_bootsect(devfd);
+ 
+     /* Construct the boot file map */
+ 
+diff --git a/libinstaller/syslinuxext.c b/libinstaller/syslinuxext.c
+index bb54cef..5a4423b 100644
+--- a/libinstaller/syslinuxext.c
++++ b/libinstaller/syslinuxext.c
+@@ -1,7 +1,177 @@
+ #define _GNU_SOURCE
+ 
++#include <sys/stat.h>
++#include <sys/types.h>
++#include <getopt.h>
++#include <ext2fs/ext2fs.h>
++
++#include "linuxioctl.h"
++#include "syslinux.h"
++#include "syslxint.h"
++#include "syslxopt.h"
++
++/*
++ * Get the size of a block device
++ */
++static uint64_t get_size(int dev_fd)
++{
++    uint64_t bytes;
++    uint32_t sects;
++    struct stat st;
++
++#ifdef BLKGETSIZE64
++    if (!ioctl(dev_fd, BLKGETSIZE64, &bytes))
++	return bytes;
++#endif
++    if (!ioctl(dev_fd, BLKGETSIZE, &sects))
++	return (uint64_t) sects << 9;
++    else if (!fstat(dev_fd, &st) && st.st_size)
++	return st.st_size;
++    else
++	return 0;
++}
++
++/*
++ * Get device geometry and partition offset
++ */
++static struct geometry_table {
++    uint64_t bytes;
++    struct hd_geometry g;
++};
++
++static int sysfs_get_offset(int dev_fd, unsigned long *start)
++{
++    struct stat st;
++    char sysfs_name[128];
++    FILE *f;
++    int rv;
++
++    if (fstat(dev_fd, &st))
++	return -1;
++
++    if ((size_t)snprintf(sysfs_name, sizeof sysfs_name,
++			 "/sys/dev/block/%u:%u/start",
++			 major(st.st_rdev), minor(st.st_rdev))
++	>= sizeof sysfs_name)
++	return -1;
++
++    f = fopen(sysfs_name, "r");
++    if (!f)
++	return -1;
++
++    rv = fscanf(f, "%lu", start);
++    fclose(f);
++
++    return (rv == 1) ? 0 : -1;
++}
++
++/* Standard floppy disk geometries, plus LS-120.  Zipdisk geometry
++   (x/64/32) is the final fallback.  I don't know what LS-240 has
++   as its geometry, since I don't have one and don't know anyone that does,
++   and Google wasn't helpful... */
++static const struct geometry_table standard_geometries[] = {
++    {360 * 1024, {2, 9, 40, 0}},
++    {720 * 1024, {2, 9, 80, 0}},
++    {1200 * 1024, {2, 15, 80, 0}},
++    {1440 * 1024, {2, 18, 80, 0}},
++    {1680 * 1024, {2, 21, 80, 0}},
++    {1722 * 1024, {2, 21, 80, 0}},
++    {2880 * 1024, {2, 36, 80, 0}},
++    {3840 * 1024, {2, 48, 80, 0}},
++    {123264 * 1024, {8, 32, 963, 0}},	/* LS120 */
++    {0, {0, 0, 0, 0}}
++};
++
++static int get_geometry(int dev_fd, uint64_t totalbytes, struct hd_geometry *geo)
++{
++    struct floppy_struct fd_str;
++    struct loop_info li;
++    struct loop_info64 li64;
++    const struct geometry_table *gp;
++    int rv = 0;
++
++    memset(geo, 0, sizeof *geo);
++
++    if (!ioctl(dev_fd, HDIO_GETGEO, geo)) {
++	goto ok;
++    } else if (!ioctl(dev_fd, FDGETPRM, &fd_str)) {
++	geo->heads = fd_str.head;
++	geo->sectors = fd_str.sect;
++	geo->cylinders = fd_str.track;
++	geo->start = 0;
++	goto ok;
++    }
++
++    /* Didn't work.  Let's see if this is one of the standard geometries */
++    for (gp = standard_geometries; gp->bytes; gp++) {
++	if (gp->bytes == totalbytes) {
++	    memcpy(geo, &gp->g, sizeof *geo);
++	    goto ok;
++	}
++    }
++
++    /* Didn't work either... assign a geometry of 64 heads, 32 sectors; this is
++       what zipdisks use, so this would help if someone has a USB key that
++       they're booting in USB-ZIP mode. */
++
++    geo->heads = opt.heads ? : 64;
++    geo->sectors = opt.sectors ? : 32;
++    geo->cylinders = totalbytes / (geo->heads * geo->sectors << SECTOR_SHIFT);
++    geo->start = 0;
++
++    if (!opt.sectors && !opt.heads) {
++	fprintf(stderr,
++		"Warning: unable to obtain device geometry (defaulting to %d heads, %d sectors)\n"
++		"         (on hard disks, this is usually harmless.)\n",
++		geo->heads, geo->sectors);
++	rv = 1;			/* Suboptimal result */
++    }
++
++ok:
++    /* If this is a loopback device, try to set the start */
++    if (!ioctl(dev_fd, LOOP_GET_STATUS64, &li64))
++	geo->start = li64.lo_offset >> SECTOR_SHIFT;
++    else if (!ioctl(dev_fd, LOOP_GET_STATUS, &li))
++	geo->start = (unsigned int)li.lo_offset >> SECTOR_SHIFT;
++    else if (!sysfs_get_offset(dev_fd, &geo->start)) {
++	/* OK */
++    }
++
++    return rv;
++}
++
++
+ /* Patch syslinux_bootsect */
+ void syslinux_patch_bootsect(int dev_fd)
+ {
++    uint64_t totalbytes, totalsectors;
++    struct hd_geometry geo;
++    struct fat_boot_sector *sbs;
++
++    totalbytes = get_size(dev_fd);
++    get_geometry(dev_fd, totalbytes, &geo);
++
++    if (opt.heads)
++	geo.heads = opt.heads;
++    if (opt.sectors)
++	geo.sectors = opt.sectors;
++
++    /* Patch this into a fake FAT superblock.  This isn't because
++       FAT is a good format in any way, it's because it lets the
++       early bootstrap share code with the FAT version. */
++    sbs = (struct fat_boot_sector *)syslinux_bootsect;
++
++    totalsectors = totalbytes >> SECTOR_SHIFT;
++    if (totalsectors >= 65536) {
++	set_16(&sbs->bsSectors, 0);
++    } else {
++	set_16(&sbs->bsSectors, totalsectors);
++    }
++    set_32(&sbs->bsHugeSectors, totalsectors);
++
++    set_16(&sbs->bsBytesPerSec, SECTOR_SIZE);
++    set_16(&sbs->bsSecPerTrack, geo.sectors);
++    set_16(&sbs->bsHeads, geo.heads);
++    set_32(&sbs->bsHiddenSecs, geo.start);
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux/0009-linux-syslinux-implement-install_bootblock.patch b/meta/recipes-devtools/syslinux/syslinux/0009-linux-syslinux-implement-install_bootblock.patch
new file mode 100644
index 0000000..cd89d92
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/syslinux/0009-linux-syslinux-implement-install_bootblock.patch
@@ -0,0 +1,50 @@
+From 76c465e87312dbc6cffd05427f1f4d2ebdee4f13 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 2 Jan 2015 12:28:35 +0800
+Subject: [PATCH 9/9] linux/syslinux: implement install_bootblock()
+
+Refer to the install_bootblock() in extlinux/main.c to make
+linux/syslinux.c's install_bootblock() which only supports ext2/3/4.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Tested-by: Du Dolpher <dolpher.du@intel.com>
+---
+ linux/syslinux.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/linux/syslinux.c b/linux/syslinux.c
+index c741750..917f83a 100755
+--- a/linux/syslinux.c
++++ b/linux/syslinux.c
+@@ -419,6 +419,26 @@ static int ext_file_write(ext2_file_t e2_file, const void *buf, size_t count,
+  */
+ int install_bootblock(int fd, const char *device)
+ {
++    struct ext2_super_block sb;
++
++    if (xpread(fd, &sb, sizeof sb, EXT2_SUPER_OFFSET + opt.offset) != sizeof sb) {
++        perror("reading superblock");
++        return 1;
++    }
++
++    if (sb.s_magic != EXT2_SUPER_MAGIC) {
++        fprintf(stderr,
++                "no ext2/3/4 superblock found on %s\n", device);
++        return 1;
++    }
++
++    if (xpwrite(fd, syslinux_bootsect, syslinux_bootsect_len, 0)
++        != (signed)syslinux_bootsect_len) {
++        perror("writing bootblock");
++        return 1;
++    }
++
++    return 0;
+ }
+ 
+ /* The file's block count */
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
index 7e3176e..33dd776 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
@@ -6,12 +6,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
-DEPENDS = "nasm-native util-linux"
+DEPENDS = "nasm-native util-linux e2fsprogs"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar.xz \
            file://syslinux-fix-parallel-building-issue.patch \
            file://syslinux-libupload-depend-lib.patch \
            file://syslinux-remove-clean-script.patch \
+           file://0001-linux-syslinux-support-ext2-3-4-device.patch \
+           file://0002-linux-syslinux-implement-open_ext2_fs.patch \
+           file://0003-linux-syslinux-implement-install_to_ext2.patch \
+           file://0004-linux-syslinux-add-ext_file_read-and-ext_file_write.patch \
+           file://0005-linux-syslinux-implement-handle_adv_on_ext.patch \
+           file://0006-linux-syslinux-implement-write_to_ext-and-add-syslin.patch \
+           file://0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch \
+           file://0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch \
+           file://0009-linux-syslinux-implement-install_bootblock.patch \
            "
 
 SRC_URI[md5sum] = "92a253df9211e9c20172796ecf388f13"
-- 
1.7.9.5


