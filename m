Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id E38586C6F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 11:23:03 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so11044157wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Z7FCgTzRD3KdLXqIpffotFtRLMdg9CG6/Hs0jtV1Zlk=;
	b=vZgjaKfQ7SQiDtBSBeEi9OQGTFp5XD9+T0pGbXDJkQzflwRdF8IOUw5WZ6EdN3cjDh
	CkC7VmuEiiUwyjL+kbynjYr32oj4oRhJ07TzBpqCEKKAEVYTb2EgqxaFiCDjwQsS4MsD
	lEGiwwKra/veG/D/ING51Za9svrzc33AKUbPlWz2A1E7oLs05R5bUy4uJLCDIo96GbK0
	TnOzs5c1XI8gxv80+bc0TXLZaZOoE4+Q0JxsGvKd7mtbXo9MjRLNoJWj/LgPm8NndMJi
	L9t4seGOewVErBHxyaHVUQLXFEEmaJx4a7awAxdJ8HnznrhKT8/tOx47zuz9Ym4WCvU9
	kZEQ==
X-Received: by 10.180.74.208 with SMTP id w16mr5296140wiv.31.1432207384476;
	Thu, 21 May 2015 04:23:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	bg4sm31630880wjc.10.2015.05.21.04.23.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 May 2015 04:23:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 13:23:15 +0200
Message-Id: <1432207395-31589-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.1
Subject: [daisy][PATCH] squashfs-tools: enable building unsquashfs and fix squashfs-4.2-fix-CVE-2012-4025.patch
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
X-List-Received-Date: Thu, 21 May 2015 11:23:04 -0000

* build unsqaushfs, useful when debuging corrupt squashfs from
  mksquashfs
* squashfs-4.2-fix-CVE-2012-4025.patch fixes CVE in unsquashfs which we
  weren't building and it actually breaks building it, because someone
  missed squashfs_fs.h change from the original change
* add git headers in all patches and fix references to new github
  repository

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../squashfs-4.2-fix-CVE-2012-4024.patch           | 32 ++++++++++++-----
 .../squashfs-4.2-fix-CVE-2012-4025.patch           | 40 ++++++++++++++++++----
 ...dd-a-commment-and-fix-some-other-comments.patch | 27 +++++++++++----
 .../squashfs-fix-open-file-limit.patch             | 29 +++++++++++-----
 .../squashfs-tools/squashfs-tools_4.2.bb           |  7 ++--
 5 files changed, 101 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-4.2-fix-CVE-2012-4024.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-4.2-fix-CVE-2012-4024.patch
index 8b9904f..52af602 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-4.2-fix-CVE-2012-4024.patch
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-4.2-fix-CVE-2012-4024.patch
@@ -1,7 +1,12 @@
+From bf9776123b854ce30a21403e4df4d4f5deb6af91 Mon Sep 17 00:00:00 2001
+From: "yanjun.zhu" <yanjun.zhu@windriver.com>
+Date: Wed, 20 May 2015 18:14:12 +0200
+Subject: [PATCH 3/4] Fix CVE-2012-4024
+
 Upstream-Status: Backport
 
-Reference:http://squashfs.git.sourceforge.net/git/gitweb.cgi?p=
-squashfs/squashfs;a=commit;h=19c38fba0be1ce949ab44310d7f49887576cc123
+Reference:
+https://github.com/plougher/squashfs-tools/commit/19c38fba0be1ce949ab44310d7f49887576cc123
 
 Fix potential stack overflow in get_component() where an individual
 pathname component in an extract file (specified on the command line
@@ -12,10 +17,16 @@ Fix by dynamically allocating targname rather than storing it as
 a fixed size on the stack.
 
 Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
-diff -urpN a/unsquashfs.c b/unsquashfs.c
---- a/unsquashfs.c	2012-11-29 17:04:08.000000000 +0800
-+++ b/unsquashfs.c	2012-11-29 17:04:25.000000000 +0800
-@@ -1034,15 +1034,18 @@ void squashfs_closedir(struct dir *dir)
+Signed-off-by: Martin Jansa <martin.jansa@lge.com>
+---
+ squashfs-tools/unsquashfs.c | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/unsquashfs.c b/unsquashfs.c
+index d532486..4fc04e8 100644
+--- a/unsquashfs.c
++++ b/unsquashfs.c
+@@ -1076,15 +1076,18 @@ void squashfs_closedir(struct dir *dir)
  }
  
  
@@ -37,7 +48,7 @@ diff -urpN a/unsquashfs.c b/unsquashfs.c
  
  	return target;
  }
-@@ -1068,12 +1071,12 @@ void free_path(struct pathname *paths)
+@@ -1110,12 +1113,12 @@ void free_path(struct pathname *paths)
  
  struct pathname *add_path(struct pathname *paths, char *target, char *alltarget)
  {
@@ -52,7 +63,7 @@ diff -urpN a/unsquashfs.c b/unsquashfs.c
  
  	if(paths == NULL) {
  		paths = malloc(sizeof(struct pathname));
-@@ -1097,7 +1100,7 @@ struct pathname *add_path(struct pathnam
+@@ -1139,7 +1142,7 @@ struct pathname *add_path(struct pathname *paths, char *target, char *alltarget)
  			sizeof(struct path_entry));
  		if(paths->name == NULL)
  			EXIT_UNSQUASH("Out of memory in add_path\n");	
@@ -61,7 +72,7 @@ diff -urpN a/unsquashfs.c b/unsquashfs.c
  		paths->name[i].paths = NULL;
  		if(use_regex) {
  			paths->name[i].preg = malloc(sizeof(regex_t));
-@@ -1130,6 +1133,8 @@ struct pathname *add_path(struct pathnam
+@@ -1172,6 +1175,8 @@ struct pathname *add_path(struct pathname *paths, char *target, char *alltarget)
  		/*
  		 * existing matching entry
  		 */
@@ -70,3 +81,6 @@ diff -urpN a/unsquashfs.c b/unsquashfs.c
  		if(paths->name[i].paths == NULL) {
  			/*
  			 * No sub-directory which means this is the leaf
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-4.2-fix-CVE-2012-4025.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-4.2-fix-CVE-2012-4025.patch
index 0dabfba..a5cdecf 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-4.2-fix-CVE-2012-4025.patch
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-4.2-fix-CVE-2012-4025.patch
@@ -1,7 +1,11 @@
+From fef997df2a1d6609af55e30eb67b65c786588fcb Mon Sep 17 00:00:00 2001
+From: "yanjun.zhu" <yanjun.zhu@windriver.com>
+Date: Wed, 20 May 2015 18:18:47 +0200
+Subject: [PATCH 4/4] Fix CVE-2012-4025
+
 Upstream-Status: Backport
 
-Reference: http://squashfs.git.sourceforge.net/git/gitweb.cgi?
-p=squashfs/squashfs;a=patch;h=8515b3d420f502c5c0236b86e2d6d7e3b23c190e
+Reference: https://github.com/plougher/squashfs-tools/commit/8515b3d420f502c5c0236b86e2d6d7e3b23c190e
 
 Integer overflow in the queue_init function in unsquashfs.c in
 unsquashfs in Squashfs 4.2 and earlier allows remote attackers
@@ -10,10 +14,29 @@ superblock of a .sqsh file, leading to a heap-based buffer overflow.
 
 http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4025
 
-Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com> 
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
+Signed-off-by: Martin Jansa <martin.jansa@lge.com>
+---
+ squashfs-tools/squashfs_fs.h |   1 +
+ squashfs-tools/unsquashfs.c  | 110 +++++++++++++++++++++++++++++++++++++++----
+ 2 files changed, 103 insertions(+), 8 deletions(-)
 
---- a/unsquashfs.c	2012-11-30 17:57:57.000000000 +0800
-+++ b/unsquashfs.c	2012-11-30 17:58:09.000000000 +0800
+diff --git a/squashfs_fs.h b/squashfs_fs.h
+index d4fba1b..6227be2 100644
+--- a/squashfs_fs.h
++++ b/squashfs_fs.h
+@@ -39,6 +39,7 @@
+ #define SQUASHFS_FILE_LOG		17
+ 
+ #define SQUASHFS_FILE_MAX_SIZE		1048576
++#define SQUASHFS_FILE_MAX_LOG		20
+ 
+ /* Max number of uids and gids */
+ #define SQUASHFS_IDS			65536
+diff --git a/unsquashfs.c b/unsquashfs.c
+index 4fc04e8..078d6ca 100644
+--- a/unsquashfs.c
++++ b/unsquashfs.c
 @@ -33,6 +33,7 @@
  #include <sys/types.h>
  #include <sys/time.h>
@@ -58,7 +81,7 @@ Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
  	queue->data = malloc(sizeof(void *) * (size + 1));
  	if(queue->data == NULL)
  		EXIT_UNSQUASH("Out of memory in queue_init\n");
-@@ -1948,13 +1971,30 @@ void initialise_threads(int fragment_buf
+@@ -1948,13 +1971,30 @@ void initialise_threads(int fragment_buffer_size, int data_buffer_size)
  	 * allocate to_reader, to_deflate and to_writer queues.  Set based on
  	 * open file limit and cache size, unless open file limit is unlimited,
  	 * in which case set purely based on cache limits
@@ -90,7 +113,7 @@ Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
  
  		to_reader = queue_init(all_buffers_size);
  		to_deflate = queue_init(all_buffers_size);
-@@ -2059,6 +2099,32 @@ void progress_bar(long long current, lon
+@@ -2059,6 +2099,32 @@ void progress_bar(long long current, long long max, int columns)
  }
  
  
@@ -188,3 +211,6 @@ Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
  	initialise_threads(fragment_buffer_size, data_buffer_size);
  
  	fragment_data = malloc(block_size);
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-add-a-commment-and-fix-some-other-comments.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-add-a-commment-and-fix-some-other-comments.patch
index fa075f9..9d3a300 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-add-a-commment-and-fix-some-other-comments.patch
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-add-a-commment-and-fix-some-other-comments.patch
@@ -1,13 +1,23 @@
+From 376dcb8ce2c9a6dab59e0a62a86549a490dee014 Mon Sep 17 00:00:00 2001
+From: "yanjun.zhu" <yanjun.zhu@windriver.com>
+Date: Wed, 20 May 2015 18:16:53 +0200
+Subject: [PATCH 1/4] Add a comment and fix some other comments
+
 Upstream-Status: Backport
 
 unsquashfs: add a commment and fix some other comments
 
-Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com> 
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
+Signed-off-by: Martin Jansa <martin.jansa@lge.com>
+---
+ squashfs-tools/unsquashfs.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
-diff -urpN a/unsquashfs.c b/unsquashfs.c
---- a/unsquashfs.c	2012-11-30 15:27:14.000000000 +0800
-+++ b/unsquashfs.c	2012-11-30 15:27:56.000000000 +0800
-@@ -814,7 +814,7 @@ int write_file(struct inode *inode, char
+diff --git a/unsquashfs.c b/unsquashfs.c
+index 529dfac..4f26e18 100644
+--- a/unsquashfs.c
++++ b/unsquashfs.c
+@@ -814,7 +814,7 @@ int write_file(struct inode *inode, char *pathname)
  
  	/*
  	 * the writer thread is queued a squashfs_file structure describing the
@@ -16,7 +26,7 @@ diff -urpN a/unsquashfs.c b/unsquashfs.c
   	 * queued separately (references to blocks in the cache).
   	 */
  	file->fd = file_fd;
-@@ -838,7 +838,7 @@ int write_file(struct inode *inode, char
+@@ -838,7 +838,7 @@ int write_file(struct inode *inode, char *pathname)
  		block->offset = 0;
  		block->size = i == file_end ? inode->data & (block_size - 1) :
  			block_size;
@@ -25,7 +35,7 @@ diff -urpN a/unsquashfs.c b/unsquashfs.c
  			block->buffer = NULL;
  		else {
  			block->buffer = cache_get(data_cache, start,
-@@ -2161,6 +2161,10 @@ options:
+@@ -2156,6 +2156,10 @@ options:
  	block_size = sBlk.s.block_size;
  	block_log = sBlk.s.block_log;
  
@@ -36,3 +46,6 @@ diff -urpN a/unsquashfs.c b/unsquashfs.c
  	fragment_buffer_size <<= 20 - block_log;
  	data_buffer_size <<= 20 - block_log;
  	initialise_threads(fragment_buffer_size, data_buffer_size);
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-fix-open-file-limit.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-fix-open-file-limit.patch
index c60f7b4..7c89dc0 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-fix-open-file-limit.patch
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/squashfs-fix-open-file-limit.patch
@@ -1,3 +1,8 @@
+From b8047131516fb39adce68f4734ff5fc178be275b Mon Sep 17 00:00:00 2001
+From: "yanjun.zhu" <yanjun.zhu@windriver.com>
+Date: Wed, 20 May 2015 18:17:45 +0200
+Subject: [PATCH 2/4] Fix open file limit
+
 Upstream-Status: Backport
 
 unsquashfs: fix open file limit
@@ -30,11 +35,16 @@ track the amount of open files.
 
 Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
 
-Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com> 
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
+Signed-off-by: Martin Jansa <martin.jansa@lge.com>
+---
+ squashfs-tools/unsquashfs.c | 134 +++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 126 insertions(+), 8 deletions(-)
 
-diff -urpN a/unsquashfs.c b/unsquashfs.c
---- a/unsquashfs.c	2012-11-30 15:31:29.000000000 +0800
-+++ b/unsquashfs.c	2012-11-30 15:32:03.000000000 +0800
+diff --git a/unsquashfs.c b/unsquashfs.c
+index 4f26e18..d532486 100644
+--- a/unsquashfs.c
++++ b/unsquashfs.c
 @@ -31,6 +31,8 @@
  
  #include <sys/sysinfo.h>
@@ -91,7 +101,7 @@ diff -urpN a/unsquashfs.c b/unsquashfs.c
  int write_file(struct inode *inode, char *pathname)
  {
  	unsigned int file_fd, i;
-@@ -794,8 +836,8 @@ int write_file(struct inode *inode, char
+@@ -794,8 +836,8 @@ int write_file(struct inode *inode, char *pathname)
  
  	TRACE("write_file: regular file, blocks %d\n", inode->blocks);
  
@@ -102,7 +112,7 @@ diff -urpN a/unsquashfs.c b/unsquashfs.c
  	if(file_fd == -1) {
  		ERROR("write_file: failed to create file %s, because %s\n",
  			pathname, strerror(errno));
-@@ -1712,7 +1754,7 @@ void *writer(void *arg)
+@@ -1707,7 +1749,7 @@ void *writer(void *arg)
  			}
  		}
  
@@ -111,7 +121,7 @@ diff -urpN a/unsquashfs.c b/unsquashfs.c
  		if(failed == FALSE)
  			set_attributes(file->pathname, file->mode, file->uid,
  				file->gid, file->time, file->xattr, force);
-@@ -1803,9 +1845,9 @@ void *progress_thread(void *arg)
+@@ -1798,9 +1840,9 @@ void *progress_thread(void *arg)
  
  void initialise_threads(int fragment_buffer_size, int data_buffer_size)
  {
@@ -123,7 +133,7 @@ diff -urpN a/unsquashfs.c b/unsquashfs.c
  
  	sigemptyset(&sigmask);
  	sigaddset(&sigmask, SIGINT);
-@@ -1841,10 +1883,86 @@ void initialise_threads(int fragment_buf
+@@ -1836,10 +1878,86 @@ void initialise_threads(int fragment_buffer_size, int data_buffer_size)
  		EXIT_UNSQUASH("Out of memory allocating thread descriptors\n");
  	deflator_thread = &thread[3];
  
@@ -213,3 +223,6 @@ diff -urpN a/unsquashfs.c b/unsquashfs.c
  	fragment_cache = cache_init(block_size, fragment_buffer_size);
  	data_cache = cache_init(block_size, data_buffer_size);
  	pthread_create(&thread[0], NULL, reader, NULL);
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
index 57400cd..8fdb810 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
@@ -30,11 +30,12 @@ S = "${WORKDIR}/squashfs${PV}/squashfs-tools"
 EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1"
 
 do_compile() {
-        oe_runmake mksquashfs
+	oe_runmake mksquashfs unsquashfs
 }
 do_install () {
-        install -d ${D}${sbindir}
-        install -m 0755 mksquashfs ${D}${sbindir}/
+	install -d ${D}${sbindir}
+	install -m 0755 mksquashfs ${D}${sbindir}/
+	install -m 0755 unsquashfs ${D}${sbindir}/
 }
 
 ARM_INSTRUCTION_SET = "arm"
-- 
2.4.1


