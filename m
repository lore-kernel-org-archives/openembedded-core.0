Return-Path: <Meng.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 864898FFE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 03:23:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8J3NZNu014728
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 20:23:45 -0700
Received: from pek-mli1-d1.wrs.com (128.224.162.173) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 18 Sep 2019 20:23:24 -0700
From: <Meng.Li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2019 11:25:43 +0800
Message-ID: <1568863543-26393-2-git-send-email-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568863543-26393-1-git-send-email-Meng.Li@windriver.com>
References: <1568863543-26393-1-git-send-email-Meng.Li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] u-boot: add CVE patches for u-boot
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
X-List-Received-Date: Thu, 19 Sep 2019 03:23:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Limeng <Meng.Li@windriver.com>

Add 9 patches to fix below CVE issues.
CVE-2019-13103
CVE-2019-13104
CVE-2019-13105
CVE-2019-13106
CVE-2019-14192
CVE-2019-14193
CVE-2019-14194
CVE-2019-14195
CVE-2019-14196
CVE-2019-14197
CVE-2019-14198
CVE-2019-14199
CVE-2019-14200
CVE-2019-14201
CVE-2019-14202
CVE-2019-14203
CVE-2019-14204

Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 .../u-boot/files/0001-CVE-2019-13103.patch    | 69 +++++++++++++++++++
 .../u-boot/files/0002-CVE-2019-13104.patch    | 49 +++++++++++++
 .../u-boot/files/0003-CVE-2019-13105.patch    | 37 ++++++++++
 .../u-boot/files/0004-CVE-2019-13106.patch    | 56 +++++++++++++++
 .../0005-CVE-2019-14192-14193-14199.patch     | 43 ++++++++++++
 ...-14197-14200-14201-14202-14203-14204.patch | 44 ++++++++++++
 .../files/0007-CVE-2019-14194-14198.patch     | 42 +++++++++++
 .../u-boot/files/0008-CVE-2019-14195.patch    | 42 +++++++++++
 .../u-boot/files/0009-CVE-2019-14196.patch    | 48 +++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     | 12 +++-
 10 files changed, 441 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-CVE-2019-13103.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0002-CVE-2019-13104.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0003-CVE-2019-13105.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0004-CVE-2019-13106.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0005-CVE-2019-14192-14193-14199.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0006-CVE-2019-14197-14200-14201-14202-14203-14204.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0007-CVE-2019-14194-14198.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0008-CVE-2019-14195.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0009-CVE-2019-14196.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-CVE-2019-13103.patch b/meta/recipes-bsp/u-boot/files/0001-CVE-2019-13103.patch
new file mode 100644
index 0000000000..1a5d1eb996
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-CVE-2019-13103.patch
@@ -0,0 +1,69 @@
+From 39a759494f734c4cdc3e2b919671bfb3134b41ae Mon Sep 17 00:00:00 2001
+From: Paul Emge <paulemge@forallsecure.com>
+Date: Mon, 8 Jul 2019 16:37:03 -0700
+Subject: [PATCH 1/9] CVE-2019-13103: disk: stop infinite recursion in DOS
+ Partitions
+
+part_get_info_extended and print_partition_extended can recurse infinitely
+while parsing a self-referential filesystem or one with a silly number of
+extended partitions. This patch adds a limit to the number of recursive
+partitions.
+
+Signed-off-by: Paul Emge <paulemge@forallsecure.com>
+
+Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
+                 h=232e2f4fd9a24bf08215ddc8c53ccadffc841fb5]
+
+CVE: CVE-2019-13103
+
+Signed-off-by: Meng Li <Meng.Li@windriver.com>
+---
+ disk/part_dos.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/disk/part_dos.c b/disk/part_dos.c
+index 936cee0d36..aae9d95906 100644
+--- a/disk/part_dos.c
++++ b/disk/part_dos.c
+@@ -23,6 +23,10 @@
+ 
+ #define DOS_PART_DEFAULT_SECTOR 512
+ 
++/* should this be configurable? It looks like it's not very common at all
++ * to use large numbers of partitions */
++#define MAX_EXT_PARTS 256
++
+ /* Convert char[4] in little endian format to the host format integer
+  */
+ static inline unsigned int le32_to_int(unsigned char *le32)
+@@ -126,6 +130,13 @@ static void print_partition_extended(struct blk_desc *dev_desc,
+ 	dos_partition_t *pt;
+ 	int i;
+ 
++	/* set a maximum recursion level */
++	if (part_num > MAX_EXT_PARTS)
++	{
++		printf("** Nested DOS partitions detected, stopping **\n");
++		return;
++    }
++
+ 	if (blk_dread(dev_desc, ext_part_sector, 1, (ulong *)buffer) != 1) {
+ 		printf ("** Can't read partition table on %d:" LBAFU " **\n",
+ 			dev_desc->devnum, ext_part_sector);
+@@ -191,6 +202,13 @@ static int part_get_info_extended(struct blk_desc *dev_desc,
+ 	int i;
+ 	int dos_type;
+ 
++	/* set a maximum recursion level */
++	if (part_num > MAX_EXT_PARTS)
++	{
++		printf("** Nested DOS partitions detected, stopping **\n");
++		return -1;
++    }
++
+ 	if (blk_dread(dev_desc, ext_part_sector, 1, (ulong *)buffer) != 1) {
+ 		printf ("** Can't read partition table on %d:" LBAFU " **\n",
+ 			dev_desc->devnum, ext_part_sector);
+-- 
+2.17.1
+
diff --git a/meta/recipes-bsp/u-boot/files/0002-CVE-2019-13104.patch b/meta/recipes-bsp/u-boot/files/0002-CVE-2019-13104.patch
new file mode 100644
index 0000000000..de122b27d0
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0002-CVE-2019-13104.patch
@@ -0,0 +1,49 @@
+From 1d36545e43003f4b1bb3a303a3b468abd482fa2f Mon Sep 17 00:00:00 2001
+From: Paul Emge <paulemge@forallsecure.com>
+Date: Mon, 8 Jul 2019 16:37:05 -0700
+Subject: [PATCH 2/9] CVE-2019-13104: ext4: check for underflow in
+ ext4fs_read_file
+
+in ext4fs_read_file, it is possible for a broken/malicious file
+system to cause a memcpy of a negative number of bytes, which
+overflows all memory. This patch fixes the issue by checking for
+a negative length.
+
+Signed-off-by: Paul Emge <paulemge@forallsecure.com>
+
+Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
+                 h=878269dbe74229005dd7f27aca66c554e31dad8e]
+
+CVE: CVE-2019-13104
+
+Signed-off-by: Meng Li <Meng.Li@windriver.com>
+---
+ fs/ext4/ext4fs.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/fs/ext4/ext4fs.c b/fs/ext4/ext4fs.c
+index 26db677a1f..c8c8655ed8 100644
+--- a/fs/ext4/ext4fs.c
++++ b/fs/ext4/ext4fs.c
+@@ -66,13 +66,15 @@ int ext4fs_read_file(struct ext2fs_node *node, loff_t pos,
+ 
+ 	ext_cache_init(&cache);
+ 
+-	if (blocksize <= 0)
+-		return -1;
+-
+ 	/* Adjust len so it we can't read past the end of the file. */
+ 	if (len + pos > filesize)
+ 		len = (filesize - pos);
+ 
++	if (blocksize <= 0 || len <= 0) {
++		ext_cache_fini(&cache);
++		return -1;
++	}
++
+ 	blockcnt = lldiv(((len + pos) + blocksize - 1), blocksize);
+ 
+ 	for (i = lldiv(pos, blocksize); i < blockcnt; i++) {
+-- 
+2.17.1
+
diff --git a/meta/recipes-bsp/u-boot/files/0003-CVE-2019-13105.patch b/meta/recipes-bsp/u-boot/files/0003-CVE-2019-13105.patch
new file mode 100644
index 0000000000..f525147e57
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0003-CVE-2019-13105.patch
@@ -0,0 +1,37 @@
+From 4e937d0de669ee69cf41c20494cbf66c339c3174 Mon Sep 17 00:00:00 2001
+From: Paul Emge <paulemge@forallsecure.com>
+Date: Mon, 8 Jul 2019 16:37:04 -0700
+Subject: [PATCH 3/9] CVE-2019-13105: ext4: fix double-free in ext4_cache_read
+
+ext_cache_read doesn't null cache->buf, after freeing, which results
+in a later function double-freeing it. This patch fixes
+ext_cache_read to call ext_cache_fini instead of free.
+
+Signed-off-by: Paul Emge <paulemge@forallsecure.com>
+
+Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
+                 h=6e5a79de658cb1c8012c86e0837379aa6eabd024]
+
+CVE: CVE-2019-13105
+
+Signed-off-by: Meng Li <Meng.Li@windriver.com>
+---
+ fs/ext4/ext4fs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fs/ext4/ext4fs.c b/fs/ext4/ext4fs.c
+index c8c8655ed8..e2b740cac4 100644
+--- a/fs/ext4/ext4fs.c
++++ b/fs/ext4/ext4fs.c
+@@ -288,7 +288,7 @@ int ext_cache_read(struct ext_block_cache *cache, lbaint_t block, int size)
+ 	if (!cache->buf)
+ 		return 0;
+ 	if (!ext4fs_devread(block, 0, size, cache->buf)) {
+-		free(cache->buf);
++		ext_cache_fini(cache);
+ 		return 0;
+ 	}
+ 	cache->block = block;
+-- 
+2.17.1
+
diff --git a/meta/recipes-bsp/u-boot/files/0004-CVE-2019-13106.patch b/meta/recipes-bsp/u-boot/files/0004-CVE-2019-13106.patch
new file mode 100644
index 0000000000..8e1a1a9943
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0004-CVE-2019-13106.patch
@@ -0,0 +1,56 @@
+From 1307dabf5422372483f840dda3963f9dbd2e8e6f Mon Sep 17 00:00:00 2001
+From: Paul Emge <paulemge@forallsecure.com>
+Date: Mon, 8 Jul 2019 16:37:07 -0700
+Subject: [PATCH 4/9] CVE-2019-13106: ext4: fix out-of-bounds memset
+
+In ext4fs_read_file in ext4fs.c, a memset can overwrite the bounds of
+the destination memory region. This patch adds a check to disallow
+this.
+
+Signed-off-by: Paul Emge <paulemge@forallsecure.com>
+
+Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
+                 h=e205896c5383c938274262524adceb2775fb03ba]
+
+CVE: CVE-2019-13106
+
+Signed-off-by: Meng Li <Meng.Li@windriver.com>
+---
+ fs/ext4/ext4fs.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/fs/ext4/ext4fs.c b/fs/ext4/ext4fs.c
+index e2b740cac4..37b31d9f0f 100644
+--- a/fs/ext4/ext4fs.c
++++ b/fs/ext4/ext4fs.c
+@@ -61,6 +61,7 @@ int ext4fs_read_file(struct ext2fs_node *node, loff_t pos,
+ 	lbaint_t delayed_skipfirst = 0;
+ 	lbaint_t delayed_next = 0;
+ 	char *delayed_buf = NULL;
++	char *start_buf = buf;
+ 	short status;
+ 	struct ext_block_cache cache;
+ 
+@@ -139,6 +140,7 @@ int ext4fs_read_file(struct ext2fs_node *node, loff_t pos,
+ 			}
+ 		} else {
+ 			int n;
++			int n_left;
+ 			if (previous_block_number != -1) {
+ 				/* spill */
+ 				status = ext4fs_devread(delayed_start,
+@@ -153,8 +155,9 @@ int ext4fs_read_file(struct ext2fs_node *node, loff_t pos,
+ 			}
+ 			/* Zero no more than `len' bytes. */
+ 			n = blocksize - skipfirst;
+-			if (n > len)
+-				n = len;
++			n_left = len - ( buf - start_buf );
++			if (n > n_left)
++				n = n_left;
+ 			memset(buf, 0, n);
+ 		}
+ 		buf += blocksize - skipfirst;
+-- 
+2.17.1
+
diff --git a/meta/recipes-bsp/u-boot/files/0005-CVE-2019-14192-14193-14199.patch b/meta/recipes-bsp/u-boot/files/0005-CVE-2019-14192-14193-14199.patch
new file mode 100644
index 0000000000..a19545a2d3
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0005-CVE-2019-14192-14193-14199.patch
@@ -0,0 +1,43 @@
+From e8e602f4a4b2aacfb3da32bb8a838be15ea70e7b Mon Sep 17 00:00:00 2001
+From: "liucheng (G)" <liucheng32@huawei.com>
+Date: Thu, 29 Aug 2019 13:47:33 +0000
+Subject: [PATCH 5/9] CVE: net: fix unbounded memcpy of UDP packet
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch adds a check to udp_len to fix unbounded memcpy for
+CVE-2019-14192, CVE-2019-14193 and CVE-2019-14199.
+
+Signed-off-by: Cheng Liu <liucheng32@huawei.com>
+Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
+Reported-by: Fermín Serna <fermin@semmle.com>
+Acked-by: Joe Hershberger <joe.hershberger@ni.com>
+
+Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
+                 h=fe7288069d2e6659117049f7d27e261b550bb725]
+
+CVE: CVE-2019-14192, CVE-2019-14193 and CVE-2019-14199
+
+Signed-off-by: Meng Li <Meng.Li@windriver.com>
+---
+ net/net.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/net/net.c b/net/net.c
+index 58b0417cbe..38105f1142 100644
+--- a/net/net.c
++++ b/net/net.c
+@@ -1252,6 +1252,9 @@ void net_process_received_packet(uchar *in_packet, int len)
+ 			return;
+ 		}
+ 
++		if (ntohs(ip->udp_len) < UDP_HDR_SIZE || ntohs(ip->udp_len) > ntohs(ip->ip_len))
++			return;
++
+ 		debug_cond(DEBUG_DEV_PKT,
+ 			   "received UDP (to=%pI4, from=%pI4, len=%d)\n",
+ 			   &dst_ip, &src_ip, len);
+-- 
+2.17.1
+
diff --git a/meta/recipes-bsp/u-boot/files/0006-CVE-2019-14197-14200-14201-14202-14203-14204.patch b/meta/recipes-bsp/u-boot/files/0006-CVE-2019-14197-14200-14201-14202-14203-14204.patch
new file mode 100644
index 0000000000..04a09e46df
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0006-CVE-2019-14197-14200-14201-14202-14203-14204.patch
@@ -0,0 +1,44 @@
+From 261658ddaf24bb35edd477cf09ec055569fd9894 Mon Sep 17 00:00:00 2001
+From: "liucheng (G)" <liucheng32@huawei.com>
+Date: Thu, 29 Aug 2019 13:47:40 +0000
+Subject: [PATCH 6/9] CVE: nfs: fix stack-based buffer overflow in some
+ nfs_handler reply helper functions
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch adds a check to nfs_handler to fix buffer overflow for CVE-2019-14197,
+CVE-2019-14200, CVE-2019-14201, CVE-2019-14202, CVE-2019-14203 and CVE-2019-14204.
+
+Signed-off-by: Cheng Liu <liucheng32@huawei.com>
+Reported-by: Fermín Serna <fermin@semmle.com>
+Acked-by: Joe Hershberger <joe.hershberger@ni.com>
+
+Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
+                 h=741a8a08ebe5bc3ccfe3cde6c2b44ee53891af21]
+
+CVE: CVE-2019-14197, CVE-2019-14200, CVE-2019-14201, CVE-2019-14202,
+     CVE-2019-14203 and CVE-2019-14204
+
+Signed-off-by: Meng Li <Meng.Li@windriver.com>
+---
+ net/nfs.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/net/nfs.c b/net/nfs.c
+index d6a7f8e827..b7cf3b3a18 100644
+--- a/net/nfs.c
++++ b/net/nfs.c
+@@ -732,6 +732,9 @@ static void nfs_handler(uchar *pkt, unsigned dest, struct in_addr sip,
+ 
+ 	debug("%s\n", __func__);
+ 
++	if (len > sizeof(struct rpc_t))
++		return;
++
+ 	if (dest != nfs_our_port)
+ 		return;
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-bsp/u-boot/files/0007-CVE-2019-14194-14198.patch b/meta/recipes-bsp/u-boot/files/0007-CVE-2019-14194-14198.patch
new file mode 100644
index 0000000000..b3e3b72ebf
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0007-CVE-2019-14194-14198.patch
@@ -0,0 +1,42 @@
+From fb6dc193bf2685b7574b218f7ca558aa54659e11 Mon Sep 17 00:00:00 2001
+From: "liucheng (G)" <liucheng32@huawei.com>
+Date: Thu, 29 Aug 2019 13:47:48 +0000
+Subject: [PATCH 7/9] CVE-2019-14194/CVE-2019-14198: nfs: fix unbounded memcpy
+ with a failed length check at nfs_read_reply
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch adds a check to rpc_pkt.u.reply.data at nfs_read_reply.
+
+Signed-off-by: Cheng Liu <liucheng32@huawei.com>
+Reported-by: Fermín Serna <fermin@semmle.com>
+Acked-by: Joe Hershberger <joe.hershberger@ni.com>
+
+Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
+                 h=aa207cf3a6d68f39d64cd29057a4fb63943e9078]
+
+CVE: CVE-2019-14194 and CVE-2019-14198
+
+Signed-off-by: Meng Li <Meng.Li@windriver.com>
+---
+ net/nfs.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/net/nfs.c b/net/nfs.c
+index b7cf3b3a18..11941fad1a 100644
+--- a/net/nfs.c
++++ b/net/nfs.c
+@@ -701,6 +701,9 @@ static int nfs_read_reply(uchar *pkt, unsigned len)
+ 			&(rpc_pkt.u.reply.data[4 + nfsv3_data_offset]);
+ 	}
+ 
++	if (((uchar *)&(rpc_pkt.u.reply.data[0]) - (uchar *)(&rpc_pkt) + rlen) > len)
++			return -9999;
++
+ 	if (store_block(data_ptr, nfs_offset, rlen))
+ 			return -9999;
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-bsp/u-boot/files/0008-CVE-2019-14195.patch b/meta/recipes-bsp/u-boot/files/0008-CVE-2019-14195.patch
new file mode 100644
index 0000000000..bf9fb0ef52
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0008-CVE-2019-14195.patch
@@ -0,0 +1,42 @@
+From 2236973b8a173ff54ae1ebf8ec2300928e69bd1b Mon Sep 17 00:00:00 2001
+From: "liucheng (G)" <liucheng32@huawei.com>
+Date: Thu, 29 Aug 2019 13:47:54 +0000
+Subject: [PATCH 8/9] CVE-2019-14195: nfs: fix unbounded memcpy with
+ unvalidated length at nfs_readlink_reply
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch adds a check to rpc_pkt.u.reply.data at nfs_readlink_reply.
+
+Signed-off-by: Cheng Liu <liucheng32@huawei.com>
+Reported-by: Fermín Serna <fermin@semmle.com>
+Acked-by: Joe Hershberger <joe.hershberger@ni.com>
+
+Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
+                 h=cf3a4f1e86ecdd24f87b615051b49d8e1968c230]
+
+CVE: CVE-2019-14195
+
+Signed-off-by: Meng Li <Meng.Li@windriver.com>
+---
+ net/nfs.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/net/nfs.c b/net/nfs.c
+index 11941fad1a..915acd95cf 100644
+--- a/net/nfs.c
++++ b/net/nfs.c
+@@ -634,6 +634,9 @@ static int nfs_readlink_reply(uchar *pkt, unsigned len)
+ 	/* new path length */
+ 	rlen = ntohl(rpc_pkt.u.reply.data[1 + nfsv3_data_offset]);
+ 
++	if (((uchar *)&(rpc_pkt.u.reply.data[0]) - (uchar *)(&rpc_pkt) + rlen) > len)
++		return -NFS_RPC_DROP;
++
+ 	if (*((char *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset])) != '/') {
+ 		int pathlen;
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-bsp/u-boot/files/0009-CVE-2019-14196.patch b/meta/recipes-bsp/u-boot/files/0009-CVE-2019-14196.patch
new file mode 100644
index 0000000000..f06e025297
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0009-CVE-2019-14196.patch
@@ -0,0 +1,48 @@
+From 74c468caa95c86cdb12c4b8073e154c435ac0bf7 Mon Sep 17 00:00:00 2001
+From: "liucheng (G)" <liucheng32@huawei.com>
+Date: Thu, 29 Aug 2019 13:48:02 +0000
+Subject: [PATCH 9/9] CVE-2019-14196: nfs: fix unbounded memcpy with a failed
+ length check at nfs_lookup_reply
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch adds a check to rpc_pkt.u.reply.data at nfs_lookup_reply.
+
+Signed-off-by: Cheng Liu <liucheng32@huawei.com>
+Reported-by: Fermín Serna <fermin@semmle.com>
+Acked-by: Joe Hershberger <joe.hershberger@ni.com>
+
+Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
+                 h=5d14ee4e53a81055d34ba280cb8fd90330f22a96]
+
+CVE: CVE-2019-14196
+
+Signed-off-by: Meng Li <Meng.Li@windriver.com>
+---
+ net/nfs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/net/nfs.c b/net/nfs.c
+index 915acd95cf..89952aeb66 100644
+--- a/net/nfs.c
++++ b/net/nfs.c
+@@ -566,11 +566,15 @@ static int nfs_lookup_reply(uchar *pkt, unsigned len)
+ 	}
+ 
+ 	if (supported_nfs_versions & NFSV2_FLAG) {
++		if (((uchar *)&(rpc_pkt.u.reply.data[0]) - (uchar *)(&rpc_pkt) + NFS_FHSIZE) > len)
++			return -NFS_RPC_DROP;
+ 		memcpy(filefh, rpc_pkt.u.reply.data + 1, NFS_FHSIZE);
+ 	} else {  /* NFSV3_FLAG */
+ 		filefh3_length = ntohl(rpc_pkt.u.reply.data[1]);
+ 		if (filefh3_length > NFS3_FHSIZE)
+ 			filefh3_length  = NFS3_FHSIZE;
++		if (((uchar *)&(rpc_pkt.u.reply.data[0]) - (uchar *)(&rpc_pkt) + filefh3_length) > len)
++			return -NFS_RPC_DROP;
+ 		memcpy(filefh, rpc_pkt.u.reply.data + 2, filefh3_length);
+ 	}
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index ad043dbcde..b4525181eb 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -10,6 +10,16 @@ PE = "1"
 # repo during parse
 SRCREV = "e5aee22e4be75e75a854ab64503fc80598bc2004"
 
-SRC_URI = "git://git.denx.de/u-boot.git"
+SRC_URI = "git://git.denx.de/u-boot.git \
+           file://0001-CVE-2019-13103.patch \
+           file://0002-CVE-2019-13104.patch \
+           file://0003-CVE-2019-13105.patch \
+           file://0004-CVE-2019-13106.patch \
+           file://0005-CVE-2019-14192-14193-14199.patch \
+           file://0006-CVE-2019-14197-14200-14201-14202-14203-14204.patch \
+           file://0007-CVE-2019-14194-14198.patch \
+           file://0008-CVE-2019-14195.patch \
+           file://0009-CVE-2019-14196.patch \
+"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


