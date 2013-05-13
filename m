Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Ubq88-0000f6-13
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 12:37:46 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4DAJ8xW019397
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 May 2013 03:19:08 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 13 May 2013 03:19:08 -0700
Message-ID: <5190BE16.7060401@windriver.com>
Date: Mon, 13 May 2013 18:19:02 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1367919920.git.liezhi.yang@windriver.com>
	<fcf98efeebf56cb36758a5c71c45bbd6100b7498.1367919920.git.liezhi.yang@windriver.com>
	<518D6DD6.5080908@linux.intel.com>
In-Reply-To: <518D6DD6.5080908@linux.intel.com>
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
X-List-Received-Date: Mon, 13 May 2013 10:37:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Darren,

Thank you very much for your detailed review, I will fix them and send
to you and Saul again (but not to oe-core mailing list atm), then send
to ext4 mailing list, please see my comments inline.

On 05/11/2013 05:59 AM, Darren Hart wrote:
>
>
> On 05/07/2013 02:48 AM, Robert Yang wrote:
>> Let debugfs do sparse copy when src is a sparse file, just like
>> "cp --sparse=auto"
>>
>> [YOCTO #3848]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch   |  114 ++++++++++++++++++++
>>   .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |    1 +
>>   2 files changed, 115 insertions(+)
>>   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
>>
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
>> new file mode 100644
>> index 0000000..f20fcaf
>> --- /dev/null
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch
>> @@ -0,0 +1,114 @@
>> +debugfs.c: do sparse copy when src is a sparse file
>> +
>> +Let debugfs do sparse copy when src is a sparse file, just like
>> +"cp --sparse=auto"
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> +---
>> + debugfs/debugfs.c | 54 ++++++++++++++++++++++++++++++++++++++++++++----------
>> + 1 file changed, 44 insertions(+), 10 deletions(-)
>> +
>> +diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
>> +index 5cdc86a..015bfad 100644
>> +--- a/debugfs/debugfs.c
>> ++++ b/debugfs/debugfs.c
>> +@@ -37,6 +37,16 @@ extern char *optarg;
>> + #include "../version.h"
>> + #include "jfs_user.h"
>> +
>> ++/* 32KiB is the minimium blksize to best minimize system call overhead. */
>
> Why is that? Can you defend that to Ted and the ext4 developers?
>

I saw it from coreutils-8.13/src/ioblksize.h:

/* As of Mar 2009, 32KiB is determined to be the minimium
    blksize to best minimize system call overhead.
    This can be tested with this script with the results
    shown for a 1.7GHz pentium-m with 2GB of 400MHz DDR2 RAM:

    for i in $(seq 0 10); do
      size=$((8*1024**3)) #ensure this is big enough
      bs=$((1024*2**$i))
      printf "%7s=" $bs
      dd bs=$bs if=/dev/zero of=/dev/null count=$(($size/$bs)) 2>&1 |
      sed -n 's/.* \([0-9.]* [GM]B\/s\)/\1/p'
    done

       1024=734 MB/s
       2048=1.3 GB/s
       4096=2.4 GB/s
       8192=3.5 GB/s
      16384=3.9 GB/s
      32768=5.2 GB/s
      65536=5.3 GB/s
     131072=5.5 GB/s
     262144=5.7 GB/s
     524288=5.7 GB/s
    1048576=5.8 GB/s

    Note that this is to minimize system call overhead.
    Other values may be appropriate to minimize file system
    or disk overhead.  For example on my current GNU/Linux system
    the readahead setting is 128KiB which was read using:

    file="."
    device=$(df -P --local "$file" | tail -n1 | cut -d' ' -f1)
    echo $(( $(blockdev --getra $device) * 512 ))

    However there isn't a portable way to get the above.
    In the future we could use the above method if available
    and default to io_blksize() if not.
  */


>> ++#ifndef IO_BUFSIZE
>> ++#define IO_BUFSIZE 32*1024
>> ++#endif
>> ++
>> ++/* Block size for `st_blocks'. */
>> ++#ifndef S_BLKSIZE
>> ++#define S_BLKSIZE 512
>> ++#endif
>> ++
>> + ss_request_table *extra_cmds;
>> + const char *debug_prog_name;
>> + int sci_idx;
>> +@@ -1559,13 +1569,13 @@ void do_find_free_inode(int argc, char *argv[])
>> + }
>> +
>> + #ifndef READ_ONLY
>> +-static errcode_t copy_file(int fd, ext2_ino_t newfile)
>> ++static errcode_t copy_file(int fd, ext2_ino_t newfile, int bufsiz, int make_holes)
>
> Don't trim off single vowels in variable names. bufsize is fine.
>
>> + {
>> + 	ext2_file_t	e2_file;
>> + 	errcode_t	retval;
>> + 	int		got;
>> + 	unsigned int	written;
>> +-	char		buf[8192];
>> ++	char		buf[bufsiz];
>> + 	char		*ptr;
>> +
>> + 	retval = ext2fs_file_open(current_fs, newfile,
>> +@@ -1582,14 +1592,30 @@ static errcode_t copy_file(int fd, ext2_ino_t newfile)
>> + 			goto fail;
>> + 		}
>> + 		ptr = buf;
>> ++		char *cp = ptr;
>> + 		while (got > 0) {
>> +-			retval = ext2fs_file_write(e2_file, ptr,
>> +-						   got, &written);
>> +-			if (retval)
>> +-				goto fail;
>> +-
>> +-			got -= written;
>> +-			ptr += written;
>> ++			int count = got;
>
> Why declare this inside the while loop?
>

I think that you mean we should:

int count;
while got > 0) {
	...
	count = got;
}

I will update it.

>> ++			if (make_holes) {
>> ++				/* Check whether all is zero */
>> ++				while (count-- && *cp++ == 0) {
>> ++					continue;
>> ++				}
>
>
> Could you improve this a bit by using larger chunks? u32 maybe? You
> could ensure the bufsize rounds up to that, or just enforce it.
>

I think that you mean use a larger "count" ? Usually, the bufsize is 4096
(the I/O block size) when doing sparse copy, so I used "int", but use "u32"
seems reasonable since it is unsigned here. For the bufsize, the suggested
value is 32K, please see my comments in previous.

// Robert

>
>> ++				if (count < 0) {
>> ++					/* The whole block is zero, make a hole */
>> ++					retval = ext2fs_file_lseek(e2_file, got, EXT2_SEEK_CUR, 0);
>> ++					if (retval)
>> ++						goto fail;
>> ++					got = 0;
>> ++				}
>> ++			}
>> ++			/* Normal copy */
>> ++			if (got > 0) {
>> ++				retval = ext2fs_file_write(e2_file, ptr, got, &written);
>> ++				if (retval)
>> ++					goto fail;
>> ++				got -= written;
>> ++				ptr += written;
>> ++			}
>> + 		}
>> + 	}
>> + 	retval = ext2fs_file_close(e2_file);
>> +@@ -1608,6 +1634,8 @@ void do_write(int argc, char *argv[])
>> + 	ext2_ino_t	newfile;
>> + 	errcode_t	retval;
>> + 	struct ext2_inode inode;
>> ++	int make_holes = 0;
>> ++	int bufsiz = IO_BUFSIZE;
>
> bufsize
>
>
>> +
>> + 	if (common_args_process(argc, argv, 3, 3, "write",
>> + 				"<native file> <new file>", CHECK_FS_RW))
>> +@@ -1672,7 +1700,13 @@ void do_write(int argc, char *argv[])
>> + 		return;
>> + 	}
>> + 	if (LINUX_S_ISREG(inode.i_mode)) {
>> +-		retval = copy_file(fd, newfile);
>> ++		if (statbuf.st_blocks < statbuf.st_size / S_BLKSIZE) {
>> ++			make_holes = 1;
>> ++			/* Use the I/O blocksize (st_blksize) as the buffer
>> ++			 * size when copy sparse file */
>
> "when copying sparse files"
>
> Also, multiline comments should probably look like this:
>
>   			/*
> 			 * Use I/O blocksize as buffer size when
> 			 * copying sparse files.
> 			 */
>
> Although, honestly, this doesn't add any information. It is obvious that
> is what the code does. It isn't obvious WHY that is necessary, a comment
> to that effect might be worthwhile, but as is, this one can just be removed.
>
> Thanks,
>
> Darren
>
>
>> ++			bufsiz = statbuf.st_blksize;
>> ++		}
>> ++		retval = copy_file(fd, newfile, bufsiz, make_holes);
>> + 		if (retval)
>> + 			com_err("copy_file", retval, 0);
>> + 	}
>> +--
>> +1.7.11.2
>> +
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
>> index 898ee88..b547036 100644
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb
>> @@ -5,6 +5,7 @@ PR = "r0"
>>   SRC_URI += "file://acinclude.m4 \
>>               file://remove.ldconfig.call.patch \
>>               file://debugfs-too-short.patch \
>> +            file://sparse_copy.patch \
>>   "
>>
>>   SRC_URI[md5sum] = "a1ec22ef003688dae9f76c74881b22b9"
>>
>


