Return-Path: <B40290@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0249.outbound.messaging.microsoft.com [213.199.154.249])
	by mail.openembedded.org (Postfix) with ESMTP id 43A836B7C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 10:00:04 +0000 (UTC)
Received: from mail92-db9-R.bigfish.com (10.174.16.228) by
	DB9EHSOBE017.bigfish.com (10.174.14.80) with Microsoft SMTP Server id
	14.1.225.22; Thu, 15 Aug 2013 10:00:04 +0000
Received: from mail92-db9 (localhost [127.0.0.1])	by mail92-db9-R.bigfish.com
	(Postfix) with ESMTP id F3DE24801A7	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 10:00:03 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail92-db9 (localhost.localdomain [127.0.0.1]) by mail92-db9
	(MessageSwitch) id 1376560802417268_29115;
	Thu, 15 Aug 2013 10:00:02 +0000 (UTC)
Received: from DB9EHSMHS019.bigfish.com (unknown [10.174.16.250])	by
	mail92-db9.bigfish.com (Postfix) with ESMTP id 614F5340046	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 10:00:02 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS019.bigfish.com
	(10.174.14.29) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 15 Aug 2013 10:00:02 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.136.1; Thu, 15 Aug 2013 10:00:01 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r7F9xvEq026757;	Thu, 15 Aug 2013 02:59:58 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Aug 2013 17:59:55 +0800
Message-ID: <1376560795-8880-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH v2] genext2fs: fix memory corruption on powerpc
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
X-List-Received-Date: Thu, 15 Aug 2013 10:00:04 -0000
Content-Type: text/plain

    * fix memory corruption errors on powerpc64
    e.g.
    |$ genext2fs -b 30000 -d . -i 8192 /tmp/tstrootfs
    |  Segmentation fault

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../fix-memory-corruption-on-powerpc.patch         |   76 ++++++++++++++++++++
 meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb |    3 +-
 2 files changed, 78 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-memory-corruption-on-powerpc.patch

diff --git a/meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-memory-corruption-on-powerpc.patch b/meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-memory-corruption-on-powerpc.patch
new file mode 100644
index 0000000..0ef162c
--- /dev/null
+++ b/meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-memory-corruption-on-powerpc.patch
@@ -0,0 +1,76 @@
+Upstream-Status: Submitted
+
+fix memory corruption on powerpc
+
+Signed-off-by: Wrobel Heinz <Heinz.Wrobel@freescale.com>
+
+diff --unified a/genext2fs.c b/genext2fs.c
+--- a/genext2fs.c	2013-08-14 16:50:59.061623605 +0200
++++ b/genext2fs.c	2013-08-14 16:47:23.349623674 +0200
+@@ -675,21 +675,34 @@
+ }
+ 
+ static void
+-swap_nod(inode *nod)
++swap_nod(inode *nod, int fromdisk)
+ {
+ 	uint32 nblk;
++	uint32 i_blocks = nod->i_blocks;
++	uint32 i_size = nod->i_size;
++	uint16 i_mode = nod->i_mode;
++
+ 
+ #define this nod
+ 	inode_decl
+ #undef this
+ 
++	if (fromdisk) {
++		// Only now do we have the values in the correct
++		// endianess for the host. So we override the
++		// earlier assumption
++		i_blocks = nod->i_blocks;
++		i_size = nod->i_size;
++		i_mode = nod->i_mode;
++	}
++
+ 	// block and character inodes store the major and minor in the
+ 	// i_block, so we need to unswap to get those.  Also, if it's
+ 	// zero iblocks, put the data back like it belongs.
+-	nblk = nod->i_blocks / INOBLK;
+-	if ((nod->i_size && !nblk)
+-	    || ((nod->i_mode & FM_IFBLK) == FM_IFBLK)
+-	    || ((nod->i_mode & FM_IFCHR) == FM_IFCHR))
++	nblk = i_blocks / INOBLK;
++	if ((i_size && !nblk)
++	    || ((i_mode & FM_IFBLK) == FM_IFBLK)
++	    || ((i_mode & FM_IFCHR) == FM_IFCHR))
+ 	{
+ 		int i;
+ 		for(i = 0; i <= EXT2_TIND_BLOCK; i++)
+@@ -1066,7 +1079,7 @@
+ 	nod_info *ni = container_of(elem, nod_info, link);
+ 
+ 	if (ni->fs->swapit)
+-		swap_nod(ni->itab);
++		swap_nod(ni->itab, 0);
+ 	put_blk(ni->bi);
+ 	free(ni);
+ }
+@@ -1102,7 +1115,7 @@
+ 	ni->b = get_blk(fs, fs->gd[grp].bg_inode_table + boffset, &ni->bi);
+ 	ni->itab = ((inode *) ni->b) + offset;
+ 	if (fs->swapit)
+-		swap_nod(ni->itab);
++		swap_nod(ni->itab, 1);
+ 
+ out:
+ 	*rni = ni;
+@@ -1158,6 +1171,8 @@
+ 	if (dw->fs->swapit)
+ 		swap_dir(&dw->d);
+ 	memcpy(dw->last_d, &dw->d, sizeof(directory));
++	if (dw->fs->swapit)
++		swap_dir(&dw->d);
+ 
+ 	if (((int8 *) next_d) >= ((int8 *) dw->b + BLOCKSIZE))
+ 		return NULL;
diff --git a/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb b/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb
index 702245f..60fd0c2 100644
--- a/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb
+++ b/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb
@@ -22,7 +22,8 @@ SRC_URI += "file://update_to_1.95.patch \
             file://0017-Fix-file-same-comparison.patch \
             file://0018-Handle-files-changing-while-we-are-working.patch \
             file://0019-Make-sure-superblock-is-clear-on-allocation.patch \
-            file://fix-nbblocks-cast.patch"
+            file://fix-nbblocks-cast.patch \
+            file://fix-memory-corruption-on-powerpc.patch "
 
 SRC_URI[md5sum] = "b7b6361bcce2cedff1ae437fadafe53b"
 SRC_URI[sha256sum] = "404dbbfa7a86a6c3de8225c8da254d026b17fd288e05cec4df2cc7e1f4feecfc"
-- 
1.7.5.4



