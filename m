Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UavdY-0000Zt-94
	for openembedded-core@lists.openembedded.org;
	Sat, 11 May 2013 00:18:03 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2013 14:59:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,651,1363158000"; d="scan'208";a="335732424"
Received: from unknown (HELO envy2.home) ([10.255.12.170])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2013 14:59:50 -0700
Message-ID: <518D6DD6.5080908@linux.intel.com>
Date: Fri, 10 May 2013 14:59:50 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
	<fcf98efeebf56cb36758a5c71c45bbd6100b7498.1367919920.git.liezhi.yang@windriver.com>
In-Reply-To: <fcf98efeebf56cb36758a5c71c45bbd6100b7498.1367919920.git.liezhi.yang@windriver.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] e2fsprogs: let debugfs do sparse copy
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
X-List-Received-Date: Fri, 10 May 2013 22:18:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/07/2013 02:48 AM, Robert Yang wrote:
> Let debugfs do sparse copy when src is a sparse file, just like
> "cp --sparse=auto"
> 
> [YOCTO #3848]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch   |  114 ++++++++++++++++++++
>  .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |    1 +
>  2 files changed, 115 insertions(+)
>  create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
> 
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
> new file mode 100644
> index 0000000..f20fcaf
> --- /dev/null
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
> @@ -0,0 +1,114 @@
> +debugfs.c: do sparse copy when src is a sparse file
> +
> +Let debugfs do sparse copy when src is a sparse file, just like
> +"cp --sparse=auto"
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + debugfs/debugfs.c | 54 ++++++++++++++++++++++++++++++++++++++++++++----------
> + 1 file changed, 44 insertions(+), 10 deletions(-)
> +
> +diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
> +index 5cdc86a..015bfad 100644
> +--- a/debugfs/debugfs.c
> ++++ b/debugfs/debugfs.c
> +@@ -37,6 +37,16 @@ extern char *optarg;
> + #include "../version.h"
> + #include "jfs_user.h"
> + 
> ++/* 32KiB is the minimium blksize to best minimize system call overhead. */

Why is that? Can you defend that to Ted and the ext4 developers?

> ++#ifndef IO_BUFSIZE
> ++#define IO_BUFSIZE 32*1024
> ++#endif
> ++
> ++/* Block size for `st_blocks'. */
> ++#ifndef S_BLKSIZE
> ++#define S_BLKSIZE 512
> ++#endif
> ++
> + ss_request_table *extra_cmds;
> + const char *debug_prog_name;
> + int sci_idx;
> +@@ -1559,13 +1569,13 @@ void do_find_free_inode(int argc, char *argv[])
> + }
> + 
> + #ifndef READ_ONLY
> +-static errcode_t copy_file(int fd, ext2_ino_t newfile)
> ++static errcode_t copy_file(int fd, ext2_ino_t newfile, int bufsiz, int make_holes)

Don't trim off single vowels in variable names. bufsize is fine.

> + {
> + 	ext2_file_t	e2_file;
> + 	errcode_t	retval;
> + 	int		got;
> + 	unsigned int	written;
> +-	char		buf[8192];
> ++	char		buf[bufsiz];
> + 	char		*ptr;
> + 
> + 	retval = ext2fs_file_open(current_fs, newfile,
> +@@ -1582,14 +1592,30 @@ static errcode_t copy_file(int fd, ext2_ino_t newfile)
> + 			goto fail;
> + 		}
> + 		ptr = buf;
> ++		char *cp = ptr;
> + 		while (got > 0) {
> +-			retval = ext2fs_file_write(e2_file, ptr,
> +-						   got, &written);
> +-			if (retval)
> +-				goto fail;
> +-
> +-			got -= written;
> +-			ptr += written;
> ++			int count = got;

Why declare this inside the while loop?

> ++			if (make_holes) {
> ++				/* Check whether all is zero */
> ++				while (count-- && *cp++ == 0) {
> ++					continue;
> ++				}


Could you improve this a bit by using larger chunks? u32 maybe? You
could ensure the bufsize rounds up to that, or just enforce it.


> ++				if (count < 0) {
> ++					/* The whole block is zero, make a hole */
> ++					retval = ext2fs_file_lseek(e2_file, got, EXT2_SEEK_CUR, 0);
> ++					if (retval)
> ++						goto fail;
> ++					got = 0;
> ++				}
> ++			}
> ++			/* Normal copy */
> ++			if (got > 0) {
> ++				retval = ext2fs_file_write(e2_file, ptr, got, &written);
> ++				if (retval)
> ++					goto fail;
> ++				got -= written;
> ++				ptr += written;
> ++			}
> + 		}
> + 	}
> + 	retval = ext2fs_file_close(e2_file);
> +@@ -1608,6 +1634,8 @@ void do_write(int argc, char *argv[])
> + 	ext2_ino_t	newfile;
> + 	errcode_t	retval;
> + 	struct ext2_inode inode;
> ++	int make_holes = 0;
> ++	int bufsiz = IO_BUFSIZE;

bufsize


> + 
> + 	if (common_args_process(argc, argv, 3, 3, "write",
> + 				"<native file> <new file>", CHECK_FS_RW))
> +@@ -1672,7 +1700,13 @@ void do_write(int argc, char *argv[])
> + 		return;
> + 	}
> + 	if (LINUX_S_ISREG(inode.i_mode)) {
> +-		retval = copy_file(fd, newfile);
> ++		if (statbuf.st_blocks < statbuf.st_size / S_BLKSIZE) {
> ++			make_holes = 1;
> ++			/* Use the I/O blocksize (st_blksize) as the buffer
> ++			 * size when copy sparse file */

"when copying sparse files"

Also, multiline comments should probably look like this:

 			/*
			 * Use I/O blocksize as buffer size when
			 * copying sparse files.
			 */

Although, honestly, this doesn't add any information. It is obvious that
is what the code does. It isn't obvious WHY that is necessary, a comment
to that effect might be worthwhile, but as is, this one can just be removed.

Thanks,

Darren


> ++			bufsiz = statbuf.st_blksize;
> ++		}
> ++		retval = copy_file(fd, newfile, bufsiz, make_holes);
> + 		if (retval)
> + 			com_err("copy_file", retval, 0);
> + 	}
> +-- 
> +1.7.11.2
> +
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
> index 898ee88..b547036 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
> @@ -5,6 +5,7 @@ PR = "r0"
>  SRC_URI += "file://acinclude.m4 \
>              file://remove.ldconfig.call.patch \
>              file://debugfs-too-short.patch \
> +            file://sparse_copy.patch \
>  "
>  
>  SRC_URI[md5sum] = "a1ec22ef003688dae9f76c74881b22b9"
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


