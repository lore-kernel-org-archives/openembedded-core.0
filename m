Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1TiMrk-0007w7-LT
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 11:15:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBBA0ZxN005473
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 02:00:35 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 11 Dec 2012 02:00:35 -0800
From: "yanjun.zhu" <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Dec 2012 18:00:32 +0800
Message-ID: <1355220032-8914-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.11
In-Reply-To: <3564>
References: <3564>
MIME-Version: 1.0
Subject: [PATCH 1/1] squashfs: fix CVE-2012-4025
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
X-List-Received-Date: Tue, 11 Dec 2012 10:15:13 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

CQID:WIND00366813

Reference: http://squashfs.git.sourceforge.net/git/gitweb.cgi?
p=squashfs/squashfs;a=patch;h=8515b3d420f502c5c0236b86e2d6d7e3b23c190e

Integer overflow in the queue_init function in unsquashfs.c in
unsquashfs in Squashfs 4.2 and earlier allows remote attackers
to execute arbitrary code via a crafted block_log field in the
superblock of a .sqsh file, leading to a heap-based buffer overflow.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4025

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>

[YOCTO #3564]
---
 .../patches/squashfs-4.2-fix-CVE-2012-4025.patch   | 190 ++++++++++++++++++
 ...dd-a-commment-and-fix-some-other-comments.patch |  38 ++++
 .../patches/squashfs-fix-open-file-limit.patch     | 215 +++++++++++++++++++++
 .../squashfs-tools/squashfs-tools_4.2.bb           |   3 +
 4 files changed, 446 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4025.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/patches/squashfs-add-a-commment-and-fix-some-other-comments.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/patches/squashfs-fix-open-file-limit.patch

diff --git a/meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4025.patch b/meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4025.patch
new file mode 100644
index 0000000..0dabfba
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4025.patch
@@ -0,0 +1,190 @@
+Upstream-Status: Backport
+
+Reference: http://squashfs.git.sourceforge.net/git/gitweb.cgi?
+p=squashfs/squashfs;a=patch;h=8515b3d420f502c5c0236b86e2d6d7e3b23c190e
+
+Integer overflow in the queue_init function in unsquashfs.c in
+unsquashfs in Squashfs 4.2 and earlier allows remote attackers
+to execute arbitrary code via a crafted block_log field in the
+superblock of a .sqsh file, leading to a heap-based buffer overflow.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4025
+
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com> 
+
+--- a/unsquashfs.c	2012-11-30 17:57:57.000000000 +0800
++++ b/unsquashfs.c	2012-11-30 17:58:09.000000000 +0800
+@@ -33,6 +33,7 @@
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <sys/resource.h>
++#include <limits.h>
+ 
+ struct cache *fragment_cache, *data_cache;
+ struct queue *to_reader, *to_deflate, *to_writer, *from_writer;
+@@ -138,6 +139,24 @@ void sigalrm_handler()
+ }
+ 
+ 
++int add_overflow(int a, int b)
++{
++	return (INT_MAX - a) < b;
++}
++
++
++int shift_overflow(int a, int shift)
++{
++	return (INT_MAX >> shift) < a;
++}
++
++ 
++int multiply_overflow(int a, int multiplier)
++{
++	return (INT_MAX / multiplier) < a;
++}
++
++
+ struct queue *queue_init(int size)
+ {
+ 	struct queue *queue = malloc(sizeof(struct queue));
+@@ -145,6 +164,10 @@ struct queue *queue_init(int size)
+ 	if(queue == NULL)
+ 		EXIT_UNSQUASH("Out of memory in queue_init\n");
+ 
++	if(add_overflow(size, 1) ||
++				multiply_overflow(size + 1, sizeof(void *)))
++		EXIT_UNSQUASH("Size too large in queue_init\n");
++
+ 	queue->data = malloc(sizeof(void *) * (size + 1));
+ 	if(queue->data == NULL)
+ 		EXIT_UNSQUASH("Out of memory in queue_init\n");
+@@ -1948,13 +1971,30 @@ void initialise_threads(int fragment_buf
+ 	 * allocate to_reader, to_deflate and to_writer queues.  Set based on
+ 	 * open file limit and cache size, unless open file limit is unlimited,
+ 	 * in which case set purely based on cache limits
++	 *
++	 * In doing so, check that the user supplied values do not overflow
++	 * a signed int
+ 	 */
+ 	if (max_files != -1) {
++		if(add_overflow(data_buffer_size, max_files) ||
++				add_overflow(data_buffer_size, max_files * 2))
++			EXIT_UNSQUASH("Data queue size is too large\n");
++
+ 		to_reader = queue_init(max_files + data_buffer_size);
+ 		to_deflate = queue_init(max_files + data_buffer_size);
+ 		to_writer = queue_init(max_files * 2 + data_buffer_size);
+ 	} else {
+-		int all_buffers_size = fragment_buffer_size + data_buffer_size;
++		int all_buffers_size;
++
++		if(add_overflow(fragment_buffer_size, data_buffer_size))
++			EXIT_UNSQUASH("Data and fragment queues combined are"
++							" too large\n");
++
++		all_buffers_size = fragment_buffer_size + data_buffer_size;
++
++		if(add_overflow(all_buffers_size, all_buffers_size))
++			EXIT_UNSQUASH("Data and fragment queues combined are"
++							" too large\n");
+ 
+ 		to_reader = queue_init(all_buffers_size);
+ 		to_deflate = queue_init(all_buffers_size);
+@@ -2059,6 +2099,32 @@ void progress_bar(long long current, lon
+ }
+ 
+ 
++int parse_number(char *arg, int *res)
++{
++	char *b;
++	long number = strtol(arg, &b, 10);
++
++	/* check for trailing junk after number */
++	if(*b != '\0')
++		return 0;
++
++	/* check for strtol underflow or overflow in conversion */
++	if(number == LONG_MIN || number == LONG_MAX)
++		return 0;
++
++	/* reject negative numbers as invalid */
++	if(number < 0)
++		return 0;
++
++	/* check if long result will overflow signed int */
++	if(number > INT_MAX)
++		return 0;
++
++	*res = number;
++	return 1;
++}
++
++
+ #define VERSION() \
+ 	printf("unsquashfs version 4.2 (2011/02/28)\n");\
+ 	printf("copyright (C) 2011 Phillip Lougher "\
+@@ -2140,8 +2206,8 @@ int main(int argc, char *argv[])
+ 		} else if(strcmp(argv[i], "-data-queue") == 0 ||
+ 					 strcmp(argv[i], "-da") == 0) {
+ 			if((++i == argc) ||
+-					(data_buffer_size = strtol(argv[i], &b,
+-					 10), *b != '\0')) {
++					!parse_number(argv[i],
++						&data_buffer_size)) {
+ 				ERROR("%s: -data-queue missing or invalid "
+ 					"queue size\n", argv[0]);
+ 				exit(1);
+@@ -2154,8 +2220,8 @@ int main(int argc, char *argv[])
+ 		} else if(strcmp(argv[i], "-frag-queue") == 0 ||
+ 					strcmp(argv[i], "-fr") == 0) {
+ 			if((++i == argc) ||
+-					(fragment_buffer_size = strtol(argv[i],
+-					 &b, 10), *b != '\0')) {
++					!parse_number(argv[i],
++						&fragment_buffer_size)) {
+ 				ERROR("%s: -frag-queue missing or invalid "
+ 					"queue size\n", argv[0]);
+ 				exit(1);
+@@ -2280,11 +2346,39 @@ options:
+ 	block_log = sBlk.s.block_log;
+ 
+ 	/*
++	 * Sanity check block size and block log.
++	 *
++	 * Check they're within correct limits
++	 */
++	if(block_size > SQUASHFS_FILE_MAX_SIZE ||
++					block_log > SQUASHFS_FILE_MAX_LOG)
++		EXIT_UNSQUASH("Block size or block_log too large."
++			"  File system is corrupt.\n");
++
++	/*
++	 * Check block_size and block_log match
++	 */
++	if(block_size != (1 << block_log))
++		EXIT_UNSQUASH("Block size and block_log do not match."
++			"  File system is corrupt.\n");
++
++	/*
+ 	 * convert from queue size in Mbytes to queue size in
+-	 * blocks
++	 * blocks.
++	 *
++	 * In doing so, check that the user supplied values do not
++	 * overflow a signed int
+ 	 */
+-	fragment_buffer_size <<= 20 - block_log;
+-	data_buffer_size <<= 20 - block_log;
++	if(shift_overflow(fragment_buffer_size, 20 - block_log))
++		EXIT_UNSQUASH("Fragment queue size is too large\n");
++	else
++		fragment_buffer_size <<= 20 - block_log;
++
++	if(shift_overflow(data_buffer_size, 20 - block_log))
++		EXIT_UNSQUASH("Data queue size is too large\n");
++	else
++		data_buffer_size <<= 20 - block_log;
++
+ 	initialise_threads(fragment_buffer_size, data_buffer_size);
+ 
+ 	fragment_data = malloc(block_size);
diff --git a/meta/recipes-devtools/squashfs-tools/patches/squashfs-add-a-commment-and-fix-some-other-comments.patch b/meta/recipes-devtools/squashfs-tools/patches/squashfs-add-a-commment-and-fix-some-other-comments.patch
new file mode 100644
index 0000000..fa075f9
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/patches/squashfs-add-a-commment-and-fix-some-other-comments.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Backport
+
+unsquashfs: add a commment and fix some other comments
+
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com> 
+
+diff -urpN a/unsquashfs.c b/unsquashfs.c
+--- a/unsquashfs.c	2012-11-30 15:27:14.000000000 +0800
++++ b/unsquashfs.c	2012-11-30 15:27:56.000000000 +0800
+@@ -814,7 +814,7 @@ int write_file(struct inode *inode, char
+ 
+ 	/*
+ 	 * the writer thread is queued a squashfs_file structure describing the
+- 	 * file.  If the file has one or more blocks or a fragments they are
++ 	 * file.  If the file has one or more blocks or a fragment they are
+  	 * queued separately (references to blocks in the cache).
+  	 */
+ 	file->fd = file_fd;
+@@ -838,7 +838,7 @@ int write_file(struct inode *inode, char
+ 		block->offset = 0;
+ 		block->size = i == file_end ? inode->data & (block_size - 1) :
+ 			block_size;
+-		if(block_list[i] == 0) /* sparse file */
++		if(block_list[i] == 0) /* sparse block */
+ 			block->buffer = NULL;
+ 		else {
+ 			block->buffer = cache_get(data_cache, start,
+@@ -2161,6 +2161,10 @@ options:
+ 	block_size = sBlk.s.block_size;
+ 	block_log = sBlk.s.block_log;
+ 
++	/*
++	 * convert from queue size in Mbytes to queue size in
++	 * blocks
++	 */
+ 	fragment_buffer_size <<= 20 - block_log;
+ 	data_buffer_size <<= 20 - block_log;
+ 	initialise_threads(fragment_buffer_size, data_buffer_size);
diff --git a/meta/recipes-devtools/squashfs-tools/patches/squashfs-fix-open-file-limit.patch b/meta/recipes-devtools/squashfs-tools/patches/squashfs-fix-open-file-limit.patch
new file mode 100644
index 0000000..c60f7b4
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/patches/squashfs-fix-open-file-limit.patch
@@ -0,0 +1,215 @@
+Upstream-Status: Backport
+
+unsquashfs: fix open file limit
+
+Previously Unsquashfs relied on the to_writer queue being
+set to 1000 to limit the amount of open file read-ahead to a
+maximum of 500.  For the default process limit of 1024 open files
+this was perhaps acceptable, but it obviously breaks if ulimit has
+been used to set the open file limit to below 504 (this includes
+stdin, stdout, stderr and the Squashfs filesystem being unsquashed).
+
+More importantly setting the to_writer queue to 1000 to limit
+the amount of files open has always been an inherent performance
+hit because the to_writer queue queues blocks.  It limits the
+block readhead to 1000 blocks, irrespective of how many files
+that represents.  A single file containing more than 1000 blocks
+will still be limited to a 1000 block readahead even though the
+data block cache typically can buffer more than this (at the
+default data cache size of 256 Mbytes and the default block size
+of 128 Kbytes, it can buffer 2048 blocks).  Obviously the
+caches serve more than just a read-ahead role (they also
+cache decompressed blocks in case they're referenced later e.g.
+by duplicate files), but the artificial limit imposed on
+the read-ahead due to setting the to_writer queue to 1000 is
+unnecessary.
+
+This commit does away with the need to limit the to_writer queue,
+by introducing open_wait() and close_wake() calls which correctly
+track the amount of open files.
+
+Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
+
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com> 
+
+diff -urpN a/unsquashfs.c b/unsquashfs.c
+--- a/unsquashfs.c	2012-11-30 15:31:29.000000000 +0800
++++ b/unsquashfs.c	2012-11-30 15:32:03.000000000 +0800
+@@ -31,6 +31,8 @@
+ 
+ #include <sys/sysinfo.h>
+ #include <sys/types.h>
++#include <sys/time.h>
++#include <sys/resource.h>
+ 
+ struct cache *fragment_cache, *data_cache;
+ struct queue *to_reader, *to_deflate, *to_writer, *from_writer;
+@@ -784,6 +786,46 @@ failure:
+ }
+ 
+ 
++pthread_mutex_t open_mutex = PTHREAD_MUTEX_INITIALIZER;
++pthread_cond_t open_empty = PTHREAD_COND_INITIALIZER;
++int open_unlimited, open_count;
++#define OPEN_FILE_MARGIN 10
++
++
++void open_init(int count)
++{
++	open_count = count;
++	open_unlimited = count == -1;
++}
++
++
++int open_wait(char *pathname, int flags, mode_t mode)
++{
++	if (!open_unlimited) {
++		pthread_mutex_lock(&open_mutex);
++		while (open_count == 0)
++			pthread_cond_wait(&open_empty, &open_mutex);
++		open_count --;
++		pthread_mutex_unlock(&open_mutex);
++	}
++
++	return open(pathname, flags, mode);
++}
++
++
++void close_wake(int fd)
++{
++	close(fd);
++
++	if (!open_unlimited) {
++		pthread_mutex_lock(&open_mutex);
++		open_count ++;
++		pthread_cond_signal(&open_empty);
++		pthread_mutex_unlock(&open_mutex);
++	}
++}
++
++
+ int write_file(struct inode *inode, char *pathname)
+ {
+ 	unsigned int file_fd, i;
+@@ -794,8 +836,8 @@ int write_file(struct inode *inode, char
+ 
+ 	TRACE("write_file: regular file, blocks %d\n", inode->blocks);
+ 
+-	file_fd = open(pathname, O_CREAT | O_WRONLY | (force ? O_TRUNC : 0),
+-		(mode_t) inode->mode & 0777);
++	file_fd = open_wait(pathname, O_CREAT | O_WRONLY |
++		(force ? O_TRUNC : 0), (mode_t) inode->mode & 0777);
+ 	if(file_fd == -1) {
+ 		ERROR("write_file: failed to create file %s, because %s\n",
+ 			pathname, strerror(errno));
+@@ -1712,7 +1754,7 @@ void *writer(void *arg)
+ 			}
+ 		}
+ 
+-		close(file_fd);
++		close_wake(file_fd);
+ 		if(failed == FALSE)
+ 			set_attributes(file->pathname, file->mode, file->uid,
+ 				file->gid, file->time, file->xattr, force);
+@@ -1803,9 +1845,9 @@ void *progress_thread(void *arg)
+ 
+ void initialise_threads(int fragment_buffer_size, int data_buffer_size)
+ {
+-	int i;
++	struct rlimit rlim;
++	int i, max_files, res;
+ 	sigset_t sigmask, old_mask;
+-	int all_buffers_size = fragment_buffer_size + data_buffer_size;
+ 
+ 	sigemptyset(&sigmask);
+ 	sigaddset(&sigmask, SIGINT);
+@@ -1841,10 +1883,86 @@ void initialise_threads(int fragment_buf
+ 		EXIT_UNSQUASH("Out of memory allocating thread descriptors\n");
+ 	deflator_thread = &thread[3];
+ 
+-	to_reader = queue_init(all_buffers_size);
+-	to_deflate = queue_init(all_buffers_size);
+-	to_writer = queue_init(1000);
++	/*
++	 * dimensioning the to_reader and to_deflate queues.  The size of
++	 * these queues is directly related to the amount of block
++	 * read-ahead possible.  To_reader queues block read requests to
++	 * the reader thread and to_deflate queues block decompression
++	 * requests to the deflate thread(s) (once the block has been read by
++	 * the reader thread).  The amount of read-ahead is determined by
++	 * the combined size of the data_block and fragment caches which
++	 * determine the total number of blocks which can be "in flight"
++	 * at any one time (either being read or being decompressed)
++	 *
++	 * The maximum file open limit, however, affects the read-ahead
++	 * possible, in that for normal sizes of the fragment and data block
++	 * caches, where the incoming files have few data blocks or one fragment
++	 * only, the file open limit is likely to be reached before the
++	 * caches are full.  This means the worst case sizing of the combined
++	 * sizes of the caches is unlikely to ever be necessary.  However, is is
++	 * obvious read-ahead up to the data block cache size is always possible
++	 * irrespective of the file open limit, because a single file could
++	 * contain that number of blocks.
++	 *
++	 * Choosing the size as "file open limit + data block cache size" seems
++	 * to be a reasonable estimate.  We can reasonably assume the maximum
++	 * likely read-ahead possible is data block cache size + one fragment
++	 * per open file.
++	 *
++	 * dimensioning the to_writer queue.  The size of this queue is
++	 * directly related to the amount of block read-ahead possible.
++	 * However, unlike the to_reader and to_deflate queues, this is
++	 * complicated by the fact the to_writer queue not only contains
++	 * entries for fragments and data_blocks but it also contains
++	 * file entries, one per open file in the read-ahead.
++	 *
++	 * Choosing the size as "2 * (file open limit) +
++	 * data block cache size" seems to be a reasonable estimate.
++	 * We can reasonably assume the maximum likely read-ahead possible
++	 * is data block cache size + one fragment per open file, and then
++	 * we will have a file_entry for each open file.
++	 */
++	res = getrlimit(RLIMIT_NOFILE, &rlim);
++	if (res == -1) {
++		ERROR("failed to get open file limit!  Defaulting to 1\n");
++		rlim.rlim_cur = 1;
++	}
++
++	if (rlim.rlim_cur != RLIM_INFINITY) {
++		/*
++		 * leave OPEN_FILE_MARGIN free (rlim_cur includes fds used by
++		 * stdin, stdout, stderr and filesystem fd
++		 */
++		if (rlim.rlim_cur <= OPEN_FILE_MARGIN)
++			/* no margin, use minimum possible */
++			max_files = 1;
++		else
++			max_files = rlim.rlim_cur - OPEN_FILE_MARGIN;
++	} else
++		max_files = -1;
++
++	/* set amount of available files for use by open_wait and close_wake */
++	open_init(max_files);
++
++	/*
++	 * allocate to_reader, to_deflate and to_writer queues.  Set based on
++	 * open file limit and cache size, unless open file limit is unlimited,
++	 * in which case set purely based on cache limits
++	 */
++	if (max_files != -1) {
++		to_reader = queue_init(max_files + data_buffer_size);
++		to_deflate = queue_init(max_files + data_buffer_size);
++		to_writer = queue_init(max_files * 2 + data_buffer_size);
++	} else {
++		int all_buffers_size = fragment_buffer_size + data_buffer_size;
++
++		to_reader = queue_init(all_buffers_size);
++		to_deflate = queue_init(all_buffers_size);
++		to_writer = queue_init(all_buffers_size * 2);
++	}
++
+ 	from_writer = queue_init(1);
++
+ 	fragment_cache = cache_init(block_size, fragment_buffer_size);
+ 	data_cache = cache_init(block_size, data_buffer_size);
+ 	pthread_create(&thread[0], NULL, reader, NULL);
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
index 213a700..5b3e644 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
@@ -14,6 +14,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=squashfs \
            http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
           "
 SRC_URI += "file://squashfs-4.2-fix-CVE-2012-4024.patch \
+            file://squashfs-add-a-commment-and-fix-some-other-comments.patch \
+            file://squashfs-fix-open-file-limit.patch \
+            file://squashfs-4.2-fix-CVE-2012-4025.patch \
            "
  
 SRC_URI[squashfs.md5sum] = "1b7a781fb4cf8938842279bd3e8ee852"
-- 
1.7.11



