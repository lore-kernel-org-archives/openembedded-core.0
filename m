Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA5F608A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 06:46:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7N6kChF017333
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2013 02:46:13 -0400 (EDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 23:46:12 -0700
Message-ID: <5217051D.8060405@windriver.com>
Date: Fri, 23 Aug 2013 14:45:49 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Rongqing Li <rongqing.li@windriver.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
	<c860af16cf9ffd4ba171206e5e9a36c50d771bdf.1377175027.git.liezhi.yang@windriver.com>
	<5216CA03.60108@windriver.com>
In-Reply-To: <5216CA03.60108@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] e2fsprogs: let debugfs do sparse copy
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
X-List-Received-Date: Fri, 23 Aug 2013 06:46:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/23/2013 10:33 AM, Rongqing Li wrote:
>
>
> On 08/22/2013 09:13 PM, Robert Yang wrote:
>> Let debugfs do sparse copy when src is a sparse file, just like
>> "cp --sparse=auto"
>>
>> This patch has been reviewed by the linux-ext4 mailing list, but isn't
>> merged atm.
>>
>> [YOCTO #3848]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../e2fsprogs-1.42.8/debugfs-sparse-copy.patch     |  147 ++++++++++++++++++++
>>   .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    1 +
>>   2 files changed, 148 insertions(+)
>>   create mode 100644
>> meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-sparse-copy.patch
>>
>> diff --git
>> a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-sparse-copy.patch
>> b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-sparse-copy.patch
>> new file mode 100644
>> index 0000000..c87bcbf
>> --- /dev/null
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-sparse-copy.patch
>> @@ -0,0 +1,147 @@
>> +debugfs.c: do sparse copy when src is a sparse file
>> +
>> +Let debugfs do sparse copy when src is a sparse file, just like
>> +"cp --sparse=auto"
>> +
>> +* For the:
>> +  #define IO_BUFSIZE 64*1024
>> +  this is a suggested value from gnu coreutils:
>> +
>> http://git.savannah.gnu.org/gitweb/?p=coreutils.git;a=blob;f=src/ioblksize.h;h=1ae93255e7d0ccf0855208c7ae5888209997bf16;hb=HEAD
>>
>> +
>> +* Use malloc() to allocate memory for the buffer since put 64K (or
>> +  more) on the stack seems not a good idea.
>> +
>> +Upstream-Status: Submitted
>> +
>> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> +Acked-by: Darren Hart <dvhart@linux.intel.com>
>> +---
>> + debugfs/debugfs.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++----
>> + 1 file changed, 57 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
>> +--- a/debugfs/debugfs.c
>> ++++ b/debugfs/debugfs.c
>> +@@ -41,6 +41,16 @@ extern char *optarg;
>> + #define BUFSIZ 8192
>> + #endif
>> +
>> ++/* 64KiB is the minimium blksize to best minimize system call overhead. */
>> ++#ifndef IO_BUFSIZE
>> ++#define IO_BUFSIZE 64*1024
>> ++#endif
>> ++
>> ++/* Block size for `st_blocks' */
>> ++#ifndef S_BLKSIZE
>> ++#define S_BLKSIZE 512
>> ++#endif
>> ++
>> + ss_request_table *extra_cmds;
>> + const char *debug_prog_name;
>> + int sci_idx;
>> +@@ -1575,22 +1585,36 @@ void do_find_free_inode(int argc, char *argv[])
>> + }
>> +
>> + #ifndef READ_ONLY
>> +-static errcode_t copy_file(int fd, ext2_ino_t newfile)
>> ++static errcode_t copy_file(int fd, ext2_ino_t newfile, int bufsize, int
>> make_holes)
>> + {
>> +     ext2_file_t    e2_file;
>> +     errcode_t    retval;
>> +     int        got;
>> +     unsigned int    written;
>> +-    char        buf[8192];
>> ++    char        *buf;
>> +     char        *ptr;
>> ++    char        *zero_buf;
>> ++    int        cmp;
>> +
>> +     retval = ext2fs_file_open(current_fs, newfile,
>> +                   EXT2_FILE_WRITE, &e2_file);
>> +     if (retval)
>> +         return retval;
>> +
>> ++    if (!(buf = (char *) malloc(bufsize))){
>> ++        com_err("copy_file", errno, "can't allocate buffer\n");
>> ++        return;
>> ++    }
>> ++
>> ++        /* This is used for checking whether the whole block is zero */
>> ++    retval = ext2fs_get_memzero(bufsize, &zero_buf);
>> ++    if (retval) {
>> ++        com_err("copy_file", retval, "can't allocate buffer\n");
>
> should free(buf), or memory leak.
>

Add a free(buf) and updated the PR:

git://git.pokylinux.org/poky-contrib robert/extX

// Robert

> -Roy
>
>> ++        return retval;
>> ++    }
>> ++
>> +     while (1) {
>> +-        got = read(fd, buf, sizeof(buf));
>> ++        got = read(fd, buf, bufsize);
>> +         if (got == 0)
>> +             break;
>> +         if (got < 0) {
>> +@@ -1598,6 +1622,21 @@ static errcode_t copy_file(int fd, ext2_ino_t newfile)
>> +             goto fail;
>> +         }
>> +         ptr = buf;
>> ++
>> ++        /* Sparse copy */
>> ++        if (make_holes) {
>> ++            /* Check whether all is zero */
>> ++            cmp = memcmp(ptr, zero_buf, got);
>> ++            if (cmp == 0) {
>> ++                 /* The whole block is zero, make a hole */
>> ++                retval = ext2fs_file_lseek(e2_file, got, EXT2_SEEK_CUR, NULL);
>> ++                if (retval)
>> ++                    goto fail;
>> ++                got = 0;
>> ++            }
>> ++        }
>> ++
>> ++        /* Normal copy */
>> +         while (got > 0) {
>> +             retval = ext2fs_file_write(e2_file, ptr,
>> +                            got, &written);
>> +@@ -1608,10 +1647,14 @@ static errcode_t copy_file(int fd, ext2_ino_t newfile)
>> +             ptr += written;
>> +         }
>> +     }
>> ++    free(buf);
>> ++    ext2fs_free_mem(&zero_buf);
>> +     retval = ext2fs_file_close(e2_file);
>> +     return retval;
>> +
>> + fail:
>> ++    free(buf);
>> ++    ext2fs_free_mem(&zero_buf);
>> +     (void) ext2fs_file_close(e2_file);
>> +     return retval;
>> + }
>> +@@ -1624,6 +1667,8 @@ void do_write(int argc, char *argv[])
>> +     ext2_ino_t    newfile;
>> +     errcode_t    retval;
>> +     struct ext2_inode inode;
>> ++    int        bufsize = IO_BUFSIZE;
>> ++    int        make_holes = 0;
>> +
>> +     if (common_args_process(argc, argv, 3, 3, "write",
>> +                 "<native file> <new file>", CHECK_FS_RW))
>> +@@ -1699,7 +1744,15 @@ void do_write(int argc, char *argv[])
>> +         return;
>> +     }
>> +     if (LINUX_S_ISREG(inode.i_mode)) {
>> +-        retval = copy_file(fd, newfile);
>> ++        if (statbuf.st_blocks < statbuf.st_size / S_BLKSIZE) {
>> ++            make_holes = 1;
>> ++            /*
>> ++             * Use I/O blocksize as buffer size when
>> ++             * copying sparse files.
>> ++             */
>> ++            bufsize = statbuf.st_blksize;
>> ++        }
>> ++        retval = copy_file(fd, newfile, bufsize, make_holes);
>> +         if (retval)
>> +             com_err("copy_file", retval, 0);
>> +     }
>> +--
>> +1.8.1.2
>> +
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
>> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
>> index f97de7f..5d65bbc 100644
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
>> @@ -4,6 +4,7 @@ require e2fsprogs.inc
>>   SRC_URI += "file://acinclude.m4 \
>>               file://remove.ldconfig.call.patch \
>>               file://debugfs-too-short.patch \
>> +            file://debugfs-sparse-copy.patch \
>>   "
>>
>>   SRC_URI[md5sum] = "8ef664b6eb698aa6b733df59b17b9ed4"
>>
>

