Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 82DC67C5C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 01:12:37 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s22so327742pfh.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 17:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wLpErvlNqfQFmS5lEDuVMc2i2BfCmouI30ZghhTUsUA=;
	b=kBjoL8+2/wwDP+tg7nztHXw43EHYnoQO1dRHhTJ1R+PuI2XReDz/uhb0/omQB4yMdl
	FeKbbXMiRPmuYLESs91biB1HsbkvD9DAq9qD45WMIoM3gDAcLHsQjdtvwnXHYe1IZjno
	R6Feioc2QWH1tnLpxW7NW+zdFtQ33KevKnSCMv08VSFYRU/ITMCQdH7BV+vo8Ze6rcVN
	0W/GiTU8HJ5v4A9fNPuHaGbDOR5oVLAXaZTWwvCYnFYU0/fbYm8BW4rbpwAPcq0zbOcz
	khcEHBX78Ng64x+0F783IvIZL1YkBtx9t523vKkN+yWVJ8FuIaGLek121jL4PmgA2JC/
	i5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wLpErvlNqfQFmS5lEDuVMc2i2BfCmouI30ZghhTUsUA=;
	b=IRkmG0MH5p3fVeJsNr1He/ZatS/aMBlSblWZ0DDNTHZrPIkXzWM+DCRx9bHf2X25tB
	evFDMVfhbChbk/Gi8WpHCyaN8JrwVGG8DuTEp/enzaLFDPnH3GaUmFKLOdgas+P0Gds3
	Mt+i9iYD9cL3QQ+tDDID/XCDJyGsngvike7cMCRp7oYnROnFcDPOaeT+XGoNtDgGUrmJ
	Qs59aFtaHn3ZzqQ/a+VkQpZZNXtb6rDqaMzfSoHZIpNH0oEtozxBUP+Hzf1RcebNl+Fs
	1lw8SSNKp9SOaPQNdkHY93infu0xXHFD74LXVS9U8os/pxinupNYKxg8iKy1UtdpEkjG
	C5BQ==
X-Gm-Message-State: AHQUAub/gKgNxti9F8a5sMEoa1mJC59MnK8PQC8gwLK6MLsikDJsvqlq
	PlqkJZj4UzH5TkH+U5aGC3Y/fJxR
X-Google-Smtp-Source: AHgI3Ib/jkv7zD5dnFTEjaEqbp/V/cBVTeNTdcue6cM+XN9kAknvH/CIM5UfvMwW6BbiXyUzm3VR9g==
X-Received: by 2002:a63:a5b:: with SMTP id z27mr6236480pgk.78.1550020357973;
	Tue, 12 Feb 2019 17:12:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	e21sm67290133pfh.45.2019.02.12.17.12.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 17:12:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2019 17:12:24 -0800
Message-Id: <20190213011224.24701-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V2] grub2: Fix build with gcc9
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
X-List-Received-Date: Wed, 13 Feb 2019 01:12:37 -0000
Content-Transfer-Encoding: 8bit

Disable -Waddress-of-packed-member being treated as error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix fallout with gcc < 9

 .../disable-address-of-packed-member.patch    | 249 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 2 files changed, 250 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch

diff --git a/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch b/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch
new file mode 100644
index 0000000000..4af6a599d5
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/disable-address-of-packed-member.patch
@@ -0,0 +1,249 @@
+Disable address-of-packed-member warnings with gcc9
+
+gcc9 has turned this warning into error when -Werror is used, lets paper
+it over by turning it into a warning for now
+
+Fixes
+    error: taking address of packed member of 'struct head' may result in an unaligned pointer value [-Werror=address-of-packed-member]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/grub-core/commands/lsacpi.c
++++ b/grub-core/commands/lsacpi.c
+@@ -26,6 +26,9 @@
+ #include <grub/dl.h>
+ 
+ #pragma GCC diagnostic ignored "-Wcast-align"
++#if __GNUC__ >= 9
++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
++#endif
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+--- a/grub-core/commands/lspci.c
++++ b/grub-core/commands/lspci.c
+@@ -26,6 +26,9 @@
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
++#if __GNUC__ >= 9
++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
++#endif
+ struct grub_pci_classname
+ {
+   int class;
+@@ -171,7 +174,7 @@ grub_lspci_iter (grub_pci_device_t dev,
+ 
+ 	  if (space == 0)
+ 	    continue;
+-	 
++
+ 	  switch (space & GRUB_PCI_ADDR_SPACE_MASK)
+ 	    {
+ 	    case GRUB_PCI_ADDR_SPACE_IO:
+@@ -195,13 +198,13 @@ grub_lspci_iter (grub_pci_device_t dev,
+ 			       (space & GRUB_PCI_ADDR_MEM_MASK),
+ 			       space & GRUB_PCI_ADDR_MEM_PREFETCH
+ 			       ? "prefetchable" : "non-prefetchable");
+-		 
++
+ 		}
+ 	      else
+ 		grub_printf ("\t32-bit memory space %d at 0x%016llx [%s]\n",
+ 			     (unsigned) ((reg - GRUB_PCI_REG_ADDRESSES)
+ 			      / sizeof (grub_uint32_t)) - 1,
+-			     (unsigned long long) 
++			     (unsigned long long)
+ 			     (space & GRUB_PCI_ADDR_MEM_MASK),
+ 			     space & GRUB_PCI_ADDR_MEM_PREFETCH
+ 			     ? "prefetchable" : "non-prefetchable");
+--- a/grub-core/fs/cpio_common.c
++++ b/grub-core/fs/cpio_common.c
+@@ -26,7 +26,9 @@
+ #include <grub/archelp.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+-
++#if __GNUC__ >= 9
++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
++#endif
+ struct grub_archelp_data
+ {
+   grub_disk_t disk;
+@@ -108,7 +110,7 @@ grub_cpio_get_link_target (struct grub_a
+   if (!ret)
+     return NULL;
+ 
+-  err = grub_disk_read (data->disk, 0, data->dofs, data->size, 
++  err = grub_disk_read (data->disk, 0, data->dofs, data->size,
+ 			ret);
+   if (err)
+     {
+--- a/grub-core/fs/hfs.c
++++ b/grub-core/fs/hfs.c
+@@ -32,6 +32,9 @@
+ #include <grub/fshelp.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
++#if __GNUC__ >= 9
++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
++#endif
+ 
+ #define	GRUB_HFS_SBLOCK		2
+ #define GRUB_HFS_EMBED_HFSPLUS_SIG 0x482B
+@@ -882,7 +885,7 @@ grub_hfs_iterate_dir_it_dir (struct grub
+ {
+   struct grub_hfs_catalog_key *ckey = rec->key;
+   struct grub_hfs_iterate_dir_node_found_ctx *ctx = hook_arg;
+-  
++
+   /* Stop when the entries do not match anymore.  */
+   if (ckey->parent_dir != ctx->dir_be)
+     return 1;
+@@ -1076,7 +1079,7 @@ macroman_to_utf8 (char *to, const grub_u
+ 	{
+ 	  *optr++ = ':';
+ 	  continue;
+-	}	
++	}
+       if (!(*iptr & 0x80))
+ 	{
+ 	  *optr++ = *iptr;
+@@ -1093,7 +1096,7 @@ utf8_to_macroman (grub_uint8_t *to, cons
+   grub_uint8_t *end = to + 31;
+   grub_uint8_t *optr = to;
+   const char *iptr = from;
+-  
++
+   while (*iptr && optr < end)
+     {
+       int i, clen;
+@@ -1103,7 +1106,7 @@ utf8_to_macroman (grub_uint8_t *to, cons
+ 	  *optr++ = '/';
+ 	  iptr++;
+ 	  continue;
+-	}	
++	}
+       if (!(*iptr & 0x80))
+ 	{
+ 	  *optr++ = *iptr++;
+@@ -1164,7 +1167,7 @@ lookup_file (grub_fshelp_node_t dir,
+   *foundnode = grub_malloc (sizeof (struct grub_fshelp_node));
+   if (!*foundnode)
+     return grub_errno;
+-  
++
+   (*foundnode)->inode = grub_be_to_cpu32 (fdrec.dir.dirid);
+   (*foundnode)->fdrec = fdrec;
+   (*foundnode)->data = dir->data;
+@@ -1265,7 +1268,7 @@ grub_hfs_dir (grub_device_t device, cons
+       .hook_data = hook_data
+     };
+   grub_fshelp_node_t found = NULL;
+-  
++
+   grub_dl_ref (my_mod);
+ 
+   data = grub_hfs_mount (device->disk);
+@@ -1294,7 +1297,7 @@ grub_hfs_open (struct grub_file *file, c
+ {
+   struct grub_hfs_data *data;
+   grub_fshelp_node_t found = NULL;
+-  
++
+   grub_dl_ref (my_mod);
+ 
+   data = grub_hfs_mount (file->device->disk);
+--- a/grub-core/fs/hfsplus.c
++++ b/grub-core/fs/hfsplus.c
+@@ -19,7 +19,7 @@
+ 
+ /* HFS+ is documented at http://developer.apple.com/technotes/tn/tn1150.html */
+ 
+-#define grub_fshelp_node grub_hfsplus_file 
++#define grub_fshelp_node grub_hfsplus_file
+ #include <grub/err.h>
+ #include <grub/file.h>
+ #include <grub/mm.h>
+@@ -34,6 +34,9 @@
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
++#if __GNUC__ >= 9
++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
++#endif
+ /* The type of node.  */
+ enum grub_hfsplus_btnode_type
+   {
+@@ -145,7 +148,7 @@ grub_hfsplus_read_block (grub_fshelp_nod
+ {
+   struct grub_hfsplus_btnode *nnode = 0;
+   grub_disk_addr_t blksleft = fileblock;
+-  struct grub_hfsplus_extent *extents = node->compressed 
++  struct grub_hfsplus_extent *extents = node->compressed
+     ? &node->resource_extents[0] : &node->extents[0];
+ 
+   while (1)
+@@ -461,7 +464,7 @@ grub_hfsplus_cmp_extkey (struct grub_hfs
+ 
+   if (extkey_a->type < extkey_b->type)
+     return -1;
+-  
++
+   akey = grub_be_to_cpu32 (extkey_a->start);
+   if (akey > extkey_b->start)
+     return 1;
+@@ -548,7 +551,7 @@ grub_hfsplus_btree_search (struct grub_h
+ 			   struct grub_hfsplus_key_internal *key,
+ 			   int (*compare_keys) (struct grub_hfsplus_key *keya,
+ 						struct grub_hfsplus_key_internal *keyb),
+-			   struct grub_hfsplus_btnode **matchnode, 
++			   struct grub_hfsplus_btnode **matchnode,
+ 			   grub_off_t *keyoffset)
+ {
+   grub_uint64_t currnode;
+--- a/grub-core/fs/jfs.c
++++ b/grub-core/fs/jfs.c
+@@ -28,6 +28,9 @@
+ #include <grub/i18n.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
++#if __GNUC__ >= 9
++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
++#endif
+ 
+ #define GRUB_JFS_MAX_SYMLNK_CNT	8
+ #define GRUB_JFS_FILETYPE_MASK	0170000
+--- a/grub-core/kern/efi/efi.c
++++ b/grub-core/kern/efi/efi.c
+@@ -29,6 +29,9 @@
+ #include <grub/mm.h>
+ #include <grub/loader.h>
+ 
++#if __GNUC__ >= 9
++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
++#endif
+ /* The handle of GRUB itself. Filled in by the startup code.  */
+ grub_efi_handle_t grub_efi_image_handle;
+ 
+@@ -201,7 +204,7 @@ grub_efi_set_variable(const char *var, c
+ 
+   r = grub_efi_system_table->runtime_services;
+ 
+-  status = efi_call_5 (r->set_variable, var16, guid, 
++  status = efi_call_5 (r->set_variable, var16, guid,
+ 		       (GRUB_EFI_VARIABLE_NON_VOLATILE
+ 			| GRUB_EFI_VARIABLE_BOOTSERVICE_ACCESS
+ 			| GRUB_EFI_VARIABLE_RUNTIME_ACCESS),
+--- a/grub-core/loader/efi/chainloader.c
++++ b/grub-core/loader/efi/chainloader.c
+@@ -41,6 +41,9 @@
+ #endif
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
++#if __GNUC__ >= 9
++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
++#endif
+ 
+ static grub_dl_t my_mod;
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 8e0f86217c..3f3165c264 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -21,6 +21,7 @@ SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://gcc8.patch \
            file://0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch \
            file://0001-grub-setup-Debug-message-cleanup.patch \
+           file://disable-address-of-packed-member.patch \
 "
 SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
 SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
-- 
2.20.1


