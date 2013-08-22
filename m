Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8287A61EC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 13:13:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7MDDQ5I018683
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2013 06:13:26 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 22 Aug 2013 06:13:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 09:13:11 -0400
Message-ID: <8e9bbd9609efd20317fd4c2617ec293b49ee84bb.1377175027.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377175027.git.liezhi.yang@windriver.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 3/6] e2fsprogs: only update the icache for ext2_inode
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
X-List-Received-Date: Thu, 22 Aug 2013 13:13:24 -0000
Content-Type: text/plain

We only read the cache when:

bufsize == sizeof(struct ext2_inode)

then we should only update the cache in the same condition, otherwise
there would be errors, for example:

cache[0]: cached ino 14 when bufsize = 128 by ext2fs_write_inode_full()
cache[1]: cached ino 14 when bufsize = 156 by ext2fs_read_inode_full()

Then update the cache:
cache[0]: cached ino 15 when bufsize = 156 by ext2fs_read_inode_full()

Then the ino 14 would hit the cache[1] when bufsize = 128 (but it was
cached by bufsize = 156), so there would be errors.

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/e2fsprogs-1.42.8/fix-icache.patch    |   69 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fix-icache.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fix-icache.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fix-icache.patch
new file mode 100644
index 0000000..ad4e343
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fix-icache.patch
@@ -0,0 +1,69 @@
+inode.c: only update the icache for ext2_inode
+
+We only read the cache when:
+
+bufsize == sizeof(struct ext2_inode)
+
+then we should only update the cache in the same condition, otherwise
+there would be errors, for example:
+
+cache[0]: cached ino 14 when bufsize = 128 by ext2fs_write_inode_full()
+cache[1]: cached ino 14 when bufsize = 156 by ext2fs_read_inode_full()
+
+Then update the cache:
+cache[0]: cached ino 15 when bufsize = 156 by ext2fs_read_inode_full()
+
+Then the ino 14 would hit the cache[1] when bufsize = 128 (but it was
+cached by bufsize = 156), so there would be errors.
+
+Note: the upstream has changed the icache lot, so this patch is
+inappropriate for the upstream, we can drop this patch when we update
+the package.
+
+Upstream-Status: [Inappropriate]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ lib/ext2fs/inode.c | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/lib/ext2fs/inode.c b/lib/ext2fs/inode.c
+--- a/lib/ext2fs/inode.c
++++ b/lib/ext2fs/inode.c
+@@ -612,10 +612,12 @@ errcode_t ext2fs_read_inode_full(ext2_filsys fs, ext2_ino_t ino,
+ #endif
+ 
+ 	/* Update the inode cache */
+-	fs->icache->cache_last = (fs->icache->cache_last + 1) %
+-		fs->icache->cache_size;
+-	fs->icache->cache[fs->icache->cache_last].ino = ino;
+-	fs->icache->cache[fs->icache->cache_last].inode = *inode;
++	if (bufsize == sizeof(struct ext2_inode)) {
++		fs->icache->cache_last = (fs->icache->cache_last + 1) %
++			fs->icache->cache_size;
++		fs->icache->cache[fs->icache->cache_last].ino = ino;
++		fs->icache->cache[fs->icache->cache_last].inode = *inode;
++	}
+ 
+ 	return 0;
+ }
+@@ -648,10 +650,12 @@ errcode_t ext2fs_write_inode_full(ext2_filsys fs, ext2_ino_t ino,
+ 
+ 	/* Check to see if the inode cache needs to be updated */
+ 	if (fs->icache) {
+-		for (i=0; i < fs->icache->cache_size; i++) {
+-			if (fs->icache->cache[i].ino == ino) {
+-				fs->icache->cache[i].inode = *inode;
+-				break;
++		if (bufsize == sizeof(struct ext2_inode)) {
++			for (i=0; i < fs->icache->cache_size; i++) {
++				if (fs->icache->cache[i].ino == ino) {
++					fs->icache->cache[i].inode = *inode;
++					break;
++				}
+ 			}
+ 		}
+ 	} else {
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
index 5d65bbc..b063bc0 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
             file://debugfs-too-short.patch \
             file://debugfs-sparse-copy.patch \
+            file://fix-icache.patch \
 "
 
 SRC_URI[md5sum] = "8ef664b6eb698aa6b733df59b17b9ed4"
-- 
1.7.10.4


