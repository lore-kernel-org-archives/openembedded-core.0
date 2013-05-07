Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UZemm-0003Wl-2D
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:06:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r479mE8p011039
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 May 2013 02:48:14 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 7 May 2013 02:48:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <dvhart@linux.intel.com>
Date: Tue, 7 May 2013 05:48:06 -0400
Message-ID: <fcf98efeebf56cb36758a5c71c45bbd6100b7498.1367919920.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1367919920.git.liezhi.yang@windriver.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] e2fsprogs: let debugfs do sparse copy
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
X-List-Received-Date: Tue, 07 May 2013 10:06:50 -0000
Content-Type: text/plain

Let debugfs do sparse copy when src is a sparse file, just like
"cp --sparse=auto"

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch   |  114 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |    1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
new file mode 100644
index 0000000..f20fcaf
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
@@ -0,0 +1,114 @@
+debugfs.c: do sparse copy when src is a sparse file
+
+Let debugfs do sparse copy when src is a sparse file, just like
+"cp --sparse=auto"
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ debugfs/debugfs.c | 54 ++++++++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 44 insertions(+), 10 deletions(-)
+
+diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
+index 5cdc86a..015bfad 100644
+--- a/debugfs/debugfs.c
++++ b/debugfs/debugfs.c
+@@ -37,6 +37,16 @@ extern char *optarg;
+ #include "../version.h"
+ #include "jfs_user.h"
+ 
++/* 32KiB is the minimium blksize to best minimize system call overhead. */
++#ifndef IO_BUFSIZE
++#define IO_BUFSIZE 32*1024
++#endif
++
++/* Block size for `st_blocks'. */
++#ifndef S_BLKSIZE
++#define S_BLKSIZE 512
++#endif
++
+ ss_request_table *extra_cmds;
+ const char *debug_prog_name;
+ int sci_idx;
+@@ -1559,13 +1569,13 @@ void do_find_free_inode(int argc, char *argv[])
+ }
+ 
+ #ifndef READ_ONLY
+-static errcode_t copy_file(int fd, ext2_ino_t newfile)
++static errcode_t copy_file(int fd, ext2_ino_t newfile, int bufsiz, int make_holes)
+ {
+ 	ext2_file_t	e2_file;
+ 	errcode_t	retval;
+ 	int		got;
+ 	unsigned int	written;
+-	char		buf[8192];
++	char		buf[bufsiz];
+ 	char		*ptr;
+ 
+ 	retval = ext2fs_file_open(current_fs, newfile,
+@@ -1582,14 +1592,30 @@ static errcode_t copy_file(int fd, ext2_ino_t newfile)
+ 			goto fail;
+ 		}
+ 		ptr = buf;
++		char *cp = ptr;
+ 		while (got > 0) {
+-			retval = ext2fs_file_write(e2_file, ptr,
+-						   got, &written);
+-			if (retval)
+-				goto fail;
+-
+-			got -= written;
+-			ptr += written;
++			int count = got;
++			if (make_holes) {
++				/* Check whether all is zero */
++				while (count-- && *cp++ == 0) {
++					continue;
++				}
++				if (count < 0) {
++					/* The whole block is zero, make a hole */
++					retval = ext2fs_file_lseek(e2_file, got, EXT2_SEEK_CUR, 0);
++					if (retval)
++						goto fail;
++					got = 0;
++				}
++			}
++			/* Normal copy */
++			if (got > 0) {
++				retval = ext2fs_file_write(e2_file, ptr, got, &written);
++				if (retval)
++					goto fail;
++				got -= written;
++				ptr += written;
++			}
+ 		}
+ 	}
+ 	retval = ext2fs_file_close(e2_file);
+@@ -1608,6 +1634,8 @@ void do_write(int argc, char *argv[])
+ 	ext2_ino_t	newfile;
+ 	errcode_t	retval;
+ 	struct ext2_inode inode;
++	int make_holes = 0;
++	int bufsiz = IO_BUFSIZE;
+ 
+ 	if (common_args_process(argc, argv, 3, 3, "write",
+ 				"<native file> <new file>", CHECK_FS_RW))
+@@ -1672,7 +1700,13 @@ void do_write(int argc, char *argv[])
+ 		return;
+ 	}
+ 	if (LINUX_S_ISREG(inode.i_mode)) {
+-		retval = copy_file(fd, newfile);
++		if (statbuf.st_blocks < statbuf.st_size / S_BLKSIZE) {
++			make_holes = 1;
++			/* Use the I/O blocksize (st_blksize) as the buffer
++			 * size when copy sparse file */
++			bufsiz = statbuf.st_blksize;
++		}
++		retval = copy_file(fd, newfile, bufsiz, make_holes);
+ 		if (retval)
+ 			com_err("copy_file", retval, 0);
+ 	}
+-- 
+1.7.11.2
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
index 898ee88..b547036 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
@@ -5,6 +5,7 @@ PR = "r0"
 SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
             file://debugfs-too-short.patch \
+            file://sparse_copy.patch \
 "
 
 SRC_URI[md5sum] = "a1ec22ef003688dae9f76c74881b22b9"
-- 
1.7.10.4



