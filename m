Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6650273632
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1KHfI6s028452 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:41:18 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3pRYwsUwOao7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:41:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1KHf5Wn028445
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:41:17 GMT
Message-ID: <1424454065.11836.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Feb 2015 17:41:05 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] e2fsprogs: Add a patch to speedup mkfs
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
X-List-Received-Date: Fri, 20 Feb 2015 17:41:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

See the patch description, this adds a tweak to an algorithm to improve
core-image-sato-sdk mkfs time from over 8 minutes to about 35s.

Needs discussion upstream but seems reasonable for our uses of it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch
new file mode 100644
index 0000000..f9ef8e5
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch
@@ -0,0 +1,52 @@
+The comment to this function says:
+
+"""
+  * Stupid algorithm --- we now just search forward starting from the
+  * goal.  Should put in a smarter one someday....
+"""
+
+This adds in a rather hacky algorthim which starts where we finished
+searching previously using a static variable rather than starting 
+from scratch if a hint isn't provided.
+
+This was after noticing that mkfs.ext4 -F X -d Y was spending *lots*
+of time in ext2fs_new_block2 called from ext2fs_bmap from ext2fs_file_write().
+
+Numbers wise, this took a core-image-sato-sdk mkfs time from over 
+8 minutes to around 35 seconds.
+
+Upstream-Status: Pending
+
+RP 2015/02/20
+
+Index: e2fsprogs-1.42.9/lib/ext2fs/alloc.c
+===================================================================
+--- e2fsprogs-1.42.9.orig/lib/ext2fs/alloc.c
++++ e2fsprogs-1.42.9/lib/ext2fs/alloc.c
+@@ -160,6 +160,8 @@ errcode_t ext2fs_new_inode(ext2_filsys f
+ 	return 0;
+ }
+ 
++static blk64_t last_goal = 0;
++
+ /*
+  * Stupid algorithm --- we now just search forward starting from the
+  * goal.  Should put in a smarter one someday....
+@@ -170,6 +172,9 @@ errcode_t ext2fs_new_block2(ext2_filsys
+ 	blk64_t	i;
+ 	int	c_ratio;
+ 
++        if (!goal)
++            goal = last_goal;
++
+ 	EXT2_CHECK_MAGIC(fs, EXT2_ET_MAGIC_EXT2FS_FILSYS);
+ 
+ 	if (!map)
+@@ -194,6 +199,7 @@ errcode_t ext2fs_new_block2(ext2_filsys
+ 
+ 		if (!ext2fs_fast_test_block_bitmap2(map, i)) {
+ 			*ret = i;
++			last_goal = i;
+ 			return 0;
+ 		}
+ 		i = (i + c_ratio) & ~(c_ratio - 1);
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index f1fb3a7..656793f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://acinclude.m4 \
             file://0012-Fix-musl-build-failures.patch \
             file://0001-e2fsprogs-fix-cross-compilation-problem.patch \
             file://misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch \
+            file://cache_inode.patch \
 "
 
 SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"



