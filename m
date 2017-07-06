Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1F9471B27
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 08:43:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v668hURO018997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jul 2017 01:43:30 -0700
Received: from [128.224.163.137] (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 01:43:29 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1499330451-117347-1-git-send-email-zhixiong.chi@windriver.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <595DF830.9080401@windriver.com>
Date: Thu, 6 Jul 2017 16:43:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1499330451-117347-1-git-send-email-zhixiong.chi@windriver.com>
Subject: Re: [PATCH] grub: CVE-2017-9763
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
X-List-Received-Date: Thu, 06 Jul 2017 08:43:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Please ignore this, I will resent one updated patch.

Thanks.

On 2017年07月06日 16:40, Zhixiong Chi wrote:
> Issue: LIN9-4520
>
> The grub_ext2_read_block function in fs/ext2.c in GNU GRUB before
> 2013-11-12, allows remote attackers to cause a denial of service
> (excessive stack use and application crash) via a crafted binary
> file, related to use of a variable-size stack array.
>
> patch from http://git.savannah.gnu.org/cgit/grub.git commit
> f797ec85a02c0137a739fba7ee3f40d063bb7ade
> ac8cac1dac50daaf1c390d701cca3b55e16ee768
>
> CVE: CVE-2017-9763
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>   meta/recipes-bsp/grub/files/CVE-2017-9763.patch    | 252 +++++++++++++++++++++
>   .../grub-core-fs-ext2-use-shifts-rather-than.patch | 105 +++++++++
>   meta/recipes-bsp/grub/grub2.inc                    |   2 +
>   3 files changed, 359 insertions(+)
>   create mode 100644 meta/recipes-bsp/grub/files/CVE-2017-9763.patch
>   create mode 100644 meta/recipes-bsp/grub/files/grub-core-fs-ext2-use-shifts-rather-than.patch
>
> diff --git a/meta/recipes-bsp/grub/files/CVE-2017-9763.patch b/meta/recipes-bsp/grub/files/CVE-2017-9763.patch
> new file mode 100644
> index 0000000..4286730
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2017-9763.patch
> @@ -0,0 +1,252 @@
> +From ac8cac1dac50daaf1c390d701cca3b55e16ee768 Mon Sep 17 00:00:00 2001
> +From: Vladimir Serbinenko <phcoder@gmail.com>
> +Date: Tue, 12 Nov 2013 03:04:19 +0100
> +Subject: 	* grub-core/fs/ext2.c: Remove variable length arrays.
> +
> +Upstream-Status: Backport
> +
> +CVE: CVE-2017-9763
> +
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +
> +---
> + ChangeLog           |  4 +++
> + grub-core/fs/ext2.c | 79 +++++++++++++++++++++++++++++++++--------------------
> + 2 files changed, 53 insertions(+), 30 deletions(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 269a841..75034e0 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,7 @@
> ++2013-11-12  Vladimir Serbinenko  <phcoder@gmail.com>
> ++
> ++	* grub-core/fs/ext2.c: Remove variable length arrays.
> ++
> + 2013-01-05  Vladimir Serbinenko  <phcoder@gmail.com>
> +
> + 	* grub-core/fs/ext2.c (grub_ext2_read_block): Use shifts rather than
> +diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
> +index 6941ef2..aba5cb1 100644
> +--- a/grub-core/fs/ext2.c
> ++++ b/grub-core/fs/ext2.c
> +@@ -247,6 +247,7 @@ struct ext2_dirent
> + {
> +   grub_uint32_t inode;
> +   grub_uint16_t direntlen;
> ++#define MAX_NAMELEN 255
> +   grub_uint8_t namelen;
> +   grub_uint8_t filetype;
> + };
> +@@ -344,11 +345,12 @@ grub_ext2_blockgroup (struct grub_ext2_data *data, int group,
> + }
> +
> + static struct grub_ext4_extent_header *
> +-grub_ext4_find_leaf (struct grub_ext2_data *data, grub_properly_aligned_t *buf,
> ++grub_ext4_find_leaf (struct grub_ext2_data *data,
> +                      struct grub_ext4_extent_header *ext_block,
> +                      grub_uint32_t fileblock)
> + {
> +   struct grub_ext4_extent_idx *index;
> ++  void *buf = NULL;
> +
> +   while (1)
> +     {
> +@@ -357,8 +359,8 @@ grub_ext4_find_leaf (struct grub_ext2_data *data, grub_properly_aligned_t *buf,
> +
> +       index = (struct grub_ext4_extent_idx *) (ext_block + 1);
> +
> +-      if (grub_le_to_cpu16(ext_block->magic) != EXT4_EXT_MAGIC)
> +-        return 0;
> ++      if (ext_block->magic != grub_cpu_to_le16_compile_time (EXT4_EXT_MAGIC))
> ++	goto fail;
> +
> +       if (ext_block->depth == 0)
> +         return ext_block;
> +@@ -370,17 +372,24 @@ grub_ext4_find_leaf (struct grub_ext2_data *data, grub_properly_aligned_t *buf,
> +         }
> +
> +       if (--i < 0)
> +-        return 0;
> ++	goto fail;
> +
> +       block = grub_le_to_cpu16 (index[i].leaf_hi);
> +       block = (block << 32) + grub_le_to_cpu32 (index[i].leaf);
> ++      if (!buf)
> ++	buf = grub_malloc (EXT2_BLOCK_SIZE(data));
> ++      if (!buf)
> ++	goto fail;
> +       if (grub_disk_read (data->disk,
> +                           block << LOG2_EXT2_BLOCK_SIZE (data),
> +                           0, EXT2_BLOCK_SIZE(data), buf))
> +-        return 0;
> ++	goto fail;
> +
> +-      ext_block = (struct grub_ext4_extent_header *) buf;
> ++      ext_block = buf;
> +     }
> ++ fail:
> ++  grub_free (buf);
> ++  return 0;
> + }
> +
> + static grub_disk_addr_t
> +@@ -394,14 +403,12 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +
> +   if (inode->flags & grub_cpu_to_le32_compile_time (EXT4_EXTENTS_FLAG))
> +     {
> +-      GRUB_PROPERLY_ALIGNED_ARRAY (buf, EXT2_BLOCK_SIZE(data));
> +       struct grub_ext4_extent_header *leaf;
> +       struct grub_ext4_extent *ext;
> +       int i;
> ++      grub_disk_addr_t ret;
> +
> +-      leaf = grub_ext4_find_leaf (data, buf,
> +-                                  (struct grub_ext4_extent_header *) inode->blocks.dir_blocks,
> +-                                  fileblock);
> ++      leaf = grub_ext4_find_leaf (data, (struct grub_ext4_extent_header *) inode->blocks.dir_blocks, fileblock);
> +       if (! leaf)
> +         {
> +           grub_error (GRUB_ERR_BAD_FS, "invalid extent");
> +@@ -419,7 +426,7 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +         {
> +           fileblock -= grub_le_to_cpu32 (ext[i].block);
> +           if (fileblock >= grub_le_to_cpu16 (ext[i].len))
> +-            return 0;
> ++	    ret = 0;
> +           else
> +             {
> +               grub_disk_addr_t start;
> +@@ -427,14 +434,19 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +               start = grub_le_to_cpu16 (ext[i].start_hi);
> +               start = (start << 32) + grub_le_to_cpu32 (ext[i].start);
> +
> +-              return fileblock + start;
> ++              ret = fileblock + start;
> +             }
> +         }
> +       else
> +         {
> +           grub_error (GRUB_ERR_BAD_FS, "something wrong with extent");
> +-          return -1;
> ++	  ret = -1;
> +         }
> ++
> ++      if (leaf != (struct grub_ext4_extent_header *) inode->blocks.dir_blocks)
> ++	grub_free (leaf);
> ++
> ++      return ret;
> +     }
> +   /* Direct blocks.  */
> +   if (fileblock < INDIRECT_BLOCKS)
> +@@ -442,16 +454,17 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +   /* Indirect.  */
> +   else if (fileblock < INDIRECT_BLOCKS + blksz / 4)
> +     {
> +-      grub_uint32_t indir[blksz / 4];
> ++      grub_uint32_t indir;
> +
> +       if (grub_disk_read (data->disk,
> + 			  ((grub_disk_addr_t)
> + 			   grub_le_to_cpu32 (inode->blocks.indir_block))
> + 			  << log2_blksz,
> +-			  0, blksz, indir))
> ++			  (fileblock - INDIRECT_BLOCKS) * sizeof (indir),
> ++			  sizeof (indir), &indir))
> + 	return grub_errno;
> +
> +-      blknr = grub_le_to_cpu32 (indir[fileblock - INDIRECT_BLOCKS]);
> ++      blknr = grub_le_to_cpu32 (indir);
> +     }
> +   /* Double indirect.  */
> +   else if (fileblock < INDIRECT_BLOCKS
> +@@ -460,24 +473,26 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +       int log_perblock = log2_blksz + 9 - 2;
> +       grub_disk_addr_t rblock = fileblock - (INDIRECT_BLOCKS
> + 					     + blksz / 4);
> +-      grub_uint32_t indir[blksz / 4];
> ++      grub_uint32_t indir;
> +
> +       if (grub_disk_read (data->disk,
> + 			  ((grub_disk_addr_t)
> + 			   grub_le_to_cpu32 (inode->blocks.double_indir_block))
> + 			  << log2_blksz,
> +-			  0, blksz, indir))
> ++			  (rblock >> log_perblock) * sizeof (indir),
> ++			  sizeof (indir), &indir))
> + 	return grub_errno;
> +
> +       if (grub_disk_read (data->disk,
> + 			  ((grub_disk_addr_t)
> +-			   grub_le_to_cpu32 (indir[rblock >> log_perblock]))
> ++			   grub_le_to_cpu32 (indir))
> + 			  << log2_blksz,
> +-			  0, blksz, indir))
> ++			  (rblock & ((1 << log_perblock) - 1)) * sizeof (indir),
> ++			  sizeof (indir), &indir))
> + 	return grub_errno;
> +
> +
> +-      blknr = grub_le_to_cpu32 (indir[rblock & ((1 << log_perblock) - 1)]);
> ++      blknr = grub_le_to_cpu32 (indir);
> +     }
> +   /* triple indirect.  */
> +   else if (fileblock < INDIRECT_BLOCKS + blksz / 4 * ((grub_disk_addr_t) blksz / 4 + 1)
> +@@ -487,34 +502,38 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +       int log_perblock = log2_blksz + 9 - 2;
> +       grub_disk_addr_t rblock = fileblock - (INDIRECT_BLOCKS + blksz / 4
> + 					     * (blksz / 4 + 1));
> +-      grub_uint32_t indir[blksz / 4];
> ++      grub_uint32_t indir;
> +
> +       if (grub_disk_read (data->disk,
> + 			  ((grub_disk_addr_t)
> + 			   grub_le_to_cpu32 (inode->blocks.triple_indir_block))
> + 			  << log2_blksz,
> +-			  0, blksz, indir))
> ++			  ((rblock >> log_perblock) >> log_perblock)
> ++			  * sizeof (indir), sizeof (indir), &indir))
> + 	return grub_errno;
> +
> +       if (grub_disk_read (data->disk,
> + 			  ((grub_disk_addr_t)
> +-			   grub_le_to_cpu32 (indir[(rblock >> log_perblock) >> log_perblock]))
> ++			   grub_le_to_cpu32 (indir))
> + 			  << log2_blksz,
> +-			  0, blksz, indir))
> ++			  ((rblock >> log_perblock)
> ++			   & ((1 << log_perblock) - 1)) * sizeof (indir),
> ++			  sizeof (indir), &indir))
> + 	return grub_errno;
> +
> +       if (grub_disk_read (data->disk,
> + 			  ((grub_disk_addr_t)
> +-			   grub_le_to_cpu32 (indir[(rblock >> log_perblock) & ((1 << log_perblock) - 1)]))
> ++			   grub_le_to_cpu32 (indir))
> + 			  << log2_blksz,
> +-			  0, blksz, indir))
> ++			  (rblock  & ((1 << log_perblock) - 1))
> ++			  * sizeof (indir), sizeof (indir), &indir))
> + 	return grub_errno;
> +
> +-      blknr = grub_le_to_cpu32 (indir[rblock  & ((1 << log_perblock) - 1)]);
> ++      blknr = grub_le_to_cpu32 (indir);
> +     }
> +   else
> +     {
> +-      grub_error (GRUB_ERR_NOT_IMPLEMENTED_YET,
> ++      grub_error (GRUB_ERR_BAD_FS,
> + 		  "ext2fs doesn't support quadruple indirect blocks");
> +     }
> +
> +@@ -719,7 +738,7 @@ grub_ext2_iterate_dir (grub_fshelp_node_t dir,
> +
> +       if (dirent.inode != 0 && dirent.namelen != 0)
> + 	{
> +-	  char filename[dirent.namelen + 1];
> ++	  char filename[MAX_NAMELEN + 1];
> + 	  struct grub_fshelp_node *fdiro;
> + 	  enum grub_fshelp_filetype type = GRUB_FSHELP_UNKNOWN;
> +
> +--
> +cgit v1.0-41-gc330
> diff --git a/meta/recipes-bsp/grub/files/grub-core-fs-ext2-use-shifts-rather-than.patch b/meta/recipes-bsp/grub/files/grub-core-fs-ext2-use-shifts-rather-than.patch
> new file mode 100644
> index 0000000..d7fca89
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/grub-core-fs-ext2-use-shifts-rather-than.patch
> @@ -0,0 +1,105 @@
> +From f797ec85a02c0137a739fba7ee3f40d063bb7ade Mon Sep 17 00:00:00 2001
> +From: Vladimir 'phcoder' Serbinenko <phcoder@gmail.com>
> +Date: Sat, 5 Jan 2013 18:37:34 +0100
> +Subject: 	* grub-core/fs/ext2.c (grub_ext2_read_block): Use shifts
> + rather than 	divisions.
> +
> +Upstream-Status: Backport
> +
> +This patch is for CVE-2017-9763 patch.
> +
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + ChangeLog           |  5 +++++
> + grub-core/fs/ext2.c | 30 ++++++++++++++++--------------
> + 2 files changed, 21 insertions(+), 14 deletions(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 88fd763..af29161 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,8 @@
> ++2013-01-05  Vladimir Serbinenko  <phcoder@gmail.com>
> ++
> ++	* grub-core/fs/ext2.c (grub_ext2_read_block): Use shifts rather than
> ++	divisions.
> ++
> + 2013-01-20  Colin Watson  <cjwatson@ubuntu.com>
> +
> +        * grub-core/loader/i386/linux.c (grub_cmd_initrd): Don't add the
> +diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
> +index bd1ab24..cf2e2f4 100644
> +--- a/grub-core/fs/ext2.c
> ++++ b/grub-core/fs/ext2.c
> +@@ -454,11 +454,12 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +       blknr = grub_le_to_cpu32 (indir[fileblock - INDIRECT_BLOCKS]);
> +     }
> +   /* Double indirect.  */
> +-  else if (fileblock < INDIRECT_BLOCKS + blksz / 4 * (blksz / 4 + 1))
> ++  else if (fileblock < INDIRECT_BLOCKS
> ++	   + blksz / 4 * ((grub_disk_addr_t) blksz / 4 + 1))
> +     {
> +-      unsigned int perblock = blksz / 4;
> +-      unsigned int rblock = fileblock - (INDIRECT_BLOCKS
> +-					 + blksz / 4);
> ++      int log_perblock = log2_blksz + 9 - 2;
> ++      grub_disk_addr_t rblock = fileblock - (INDIRECT_BLOCKS
> ++					     + blksz / 4);
> +       grub_uint32_t indir[blksz / 4];
> +
> +       if (grub_disk_read (data->disk,
> +@@ -470,21 +471,22 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +
> +       if (grub_disk_read (data->disk,
> + 			  ((grub_disk_addr_t)
> +-			   grub_le_to_cpu32 (indir[rblock / perblock]))
> ++			   grub_le_to_cpu32 (indir[rblock >> log_perblock]))
> + 			  << log2_blksz,
> + 			  0, blksz, indir))
> + 	return grub_errno;
> +
> +
> +-      blknr = grub_le_to_cpu32 (indir[rblock % perblock]);
> ++      blknr = grub_le_to_cpu32 (indir[rblock & ((1 << log_perblock) - 1)]);
> +     }
> +   /* triple indirect.  */
> +-  else if (fileblock < INDIRECT_BLOCKS + blksz / 4 * (blksz / 4 + 1)
> +-	   + (blksz / 4) * (blksz / 4) * (blksz / 4 + 1))
> ++  else if (fileblock < INDIRECT_BLOCKS + blksz / 4 * ((grub_disk_addr_t) blksz / 4 + 1)
> ++	   + ((grub_disk_addr_t) blksz / 4) * ((grub_disk_addr_t) blksz / 4)
> ++	   * ((grub_disk_addr_t) blksz / 4 + 1))
> +     {
> +-      unsigned int perblock = blksz / 4;
> +-      unsigned int rblock = fileblock - (INDIRECT_BLOCKS + blksz / 4
> +-					 * (blksz / 4 + 1));
> ++      int log_perblock = log2_blksz + 9 - 2;
> ++      grub_disk_addr_t rblock = fileblock - (INDIRECT_BLOCKS + blksz / 4
> ++					     * (blksz / 4 + 1));
> +       grub_uint32_t indir[blksz / 4];
> +
> +       if (grub_disk_read (data->disk,
> +@@ -496,19 +498,19 @@ grub_ext2_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
> +
> +       if (grub_disk_read (data->disk,
> + 			  ((grub_disk_addr_t)
> +-			   grub_le_to_cpu32 (indir[(rblock / perblock) / perblock]))
> ++			   grub_le_to_cpu32 (indir[(rblock >> log_perblock) >> log_perblock]))
> + 			  << log2_blksz,
> + 			  0, blksz, indir))
> + 	return grub_errno;
> +
> +       if (grub_disk_read (data->disk,
> + 			  ((grub_disk_addr_t)
> +-			   grub_le_to_cpu32 (indir[(rblock / perblock) % perblock]))
> ++			   grub_le_to_cpu32 (indir[(rblock >> log_perblock) & ((1 << log_perblock) - 1)]))
> + 			  << log2_blksz,
> + 			  0, blksz, indir))
> + 	return grub_errno;
> +
> +-      blknr = grub_le_to_cpu32 (indir[rblock % perblock]);
> ++      blknr = grub_le_to_cpu32 (indir[rblock  & ((1 << log_perblock) - 1)]);
> +     }
> +   else
> +     {
> +--
> +cgit v1.0-41-gc330
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index ef893b3..a51c5ac 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -36,6 +36,8 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>              file://0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch \
>              file://0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch \
>              file://0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch \
> +           file://grub-core-fs-ext2-use-shifts-rather-than.patch \
> +           file://CVE-2017-9763.patch \
>               "
>   
>   DEPENDS = "flex-native bison-native autogen-native"

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


