Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1B19077BB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 21:09:57 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id z67so214753itb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 14:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9AdIgD8y2b9KSFRsuwX1hW6IpuLMDP7oDbFyA9OaRzY=;
	b=T+FT3byUNkjqinrVuhwEzo4V9+7dlHDR/eaaXLKl3tvTPSUc2GawASVtdmwSBhsbDB
	M/t5ULRWqBxtTc0syPBbG93QLLhX3clqIQQgwGh4b74DtRe4EApL9y2hy94my2NdN1Ce
	DJwgJUFqdJ5995UpxzGtZwPMa+v2jjMyyL0uLHZvYmKszHSZHr9xf2KFJBirL+lPbSH0
	aRErgf+9N4zdQiREcb0qc3cJkaw1sNVmvHgEPY05KJmMTMuAixd9BBHpHmykSzCtJD6j
	LcFS9wP4L4o3QibKKskCZiq/rRJDaAvdq/M2B4rubi5NT/zSyyvfhNW0cqybgnrnUIWP
	/uQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9AdIgD8y2b9KSFRsuwX1hW6IpuLMDP7oDbFyA9OaRzY=;
	b=CWoMiZJuKFDN7LEZt2dcp3ooGngKsw9485FSIQN+5Ukpz8VY1zDDTvXkQXLY3x8coK
	sTjjs5yoQa3XM0xTyoSd94hCnYoGAOIsH1Vlr9CaLCRBpeHVjbttmu+/Xo7ZQbQFd9Zf
	JqpEuECgXWg2RWQDa8Thi/HG0K+qTcrA9QPG9zKc8VIVGNMm7j7ns5TrRqAbmefGstt2
	BBv/Z3zU4naSRK1ED48LMVHwyOUBcjdN4MSC6SGQdlnxB5vBfDQfwU9PProSDuZl67Ns
	0Yf9yOAeGeaViwUaI4dBT2vnrYNBNMhhp671wdBZRI5wWn2bM0MFkfpE9yFURSjnZW6E
	nXPQ==
X-Gm-Message-State: AN3rC/70m16BOYXyTJm8qnslgHxP6BfqARbUEBozrSQP7HKVGEIT8qfI
	W4IjHVWqFAxsig==
X-Received: by 10.99.55.78 with SMTP id g14mr14082839pgn.191.1492808998476;
	Fri, 21 Apr 2017 14:09:58 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o10sm17709954pgc.18.2017.04.21.14.09.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Apr 2017 14:09:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 14:09:47 -0700
Message-Id: <20170421210948.2656-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH 1/2] grub: Fix build with gcc7
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
X-List-Received-Date: Fri, 21 Apr 2017 21:09:58 -0000

backport patches from upsteam and adapt them to 2.0 codebase

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-avoid-used-uninitialized-error-with-GCC7.patch |  36 +++
 ...-ppc-fix-switch-fallthrough-cases-with-GC.patch | 248 +++++++++++++++++++++
 ...0003-Add-gnulib-fix-gcc7-fallthrough.diff.patch |  38 ++++
 ...aining-cases-of-gcc-7-fallthrough-warning.patch | 175 +++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |   4 +
 5 files changed, 501 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-btrfs-avoid-used-uninitialized-error-with-GCC7.patch
 create mode 100644 meta/recipes-bsp/grub/files/0002-i386-x86_64-ppc-fix-switch-fallthrough-cases-with-GC.patch
 create mode 100644 meta/recipes-bsp/grub/files/0003-Add-gnulib-fix-gcc7-fallthrough.diff.patch
 create mode 100644 meta/recipes-bsp/grub/files/0004-Fix-remaining-cases-of-gcc-7-fallthrough-warning.patch

diff --git a/meta/recipes-bsp/grub/files/0001-btrfs-avoid-used-uninitialized-error-with-GCC7.patch b/meta/recipes-bsp/grub/files/0001-btrfs-avoid-used-uninitialized-error-with-GCC7.patch
new file mode 100644
index 00000000000..217a775609e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-btrfs-avoid-used-uninitialized-error-with-GCC7.patch
@@ -0,0 +1,36 @@
+From 6cef7f6079550af3bf91dbff824398eaef08c3c5 Mon Sep 17 00:00:00 2001
+From: Andrei Borzenkov <arvidjaar@gmail.com>
+Date: Tue, 4 Apr 2017 19:22:32 +0300
+Subject: [PATCH 1/4] btrfs: avoid "used uninitialized" error with GCC7
+
+sblock was local and so considered new variable on every loop
+iteration.
+
+Closes: 50597
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ grub-core/fs/btrfs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
+index 9cffa91..4849c1c 100644
+--- a/grub-core/fs/btrfs.c
++++ b/grub-core/fs/btrfs.c
+@@ -227,11 +227,11 @@ grub_btrfs_read_logical (struct grub_btrfs_data *data,
+ static grub_err_t
+ read_sblock (grub_disk_t disk, struct grub_btrfs_superblock *sb)
+ {
++  struct grub_btrfs_superblock sblock;
+   unsigned i;
+   grub_err_t err = GRUB_ERR_NONE;
+   for (i = 0; i < ARRAY_SIZE (superblock_sectors); i++)
+     {
+-      struct grub_btrfs_superblock sblock;
+       /* Don't try additional superblocks beyond device size.  */
+       if (i && (grub_le_to_cpu64 (sblock.this_device.size)
+ 		>> GRUB_DISK_SECTOR_BITS) <= superblock_sectors[i])
+-- 
+1.9.1
+
diff --git a/meta/recipes-bsp/grub/files/0002-i386-x86_64-ppc-fix-switch-fallthrough-cases-with-GC.patch b/meta/recipes-bsp/grub/files/0002-i386-x86_64-ppc-fix-switch-fallthrough-cases-with-GC.patch
new file mode 100644
index 00000000000..94f048c28b0
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0002-i386-x86_64-ppc-fix-switch-fallthrough-cases-with-GC.patch
@@ -0,0 +1,248 @@
+From 4bd4a88725604471fdbd86316c91967a7f4dba5a Mon Sep 17 00:00:00 2001
+From: Andrei Borzenkov <arvidjaar@gmail.com>
+Date: Tue, 4 Apr 2017 19:23:55 +0300
+Subject: [PATCH 2/4] i386, x86_64, ppc: fix switch fallthrough cases with GCC7
+
+In util/getroot and efidisk slightly modify exitsing comment to mostly
+retain it but still make GCC7 compliant with respect to fall through
+annotation.
+
+In grub-core/lib/xzembed/xz_dec_lzma2.c it adds same comments as
+upstream.
+
+In grub-core/tests/setjmp_tets.c declare functions as "noreturn" to
+suppress GCC7 warning.
+
+In grub-core/gnulib/regexec.c use new __attribute__, because existing
+annotation is not recognized by GCC7 parser (which requires that comment
+immediately precedes case statement).
+
+Otherwise add FALLTHROUGH comment.
+
+Closes: 50598
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ grub-core/commands/hdparm.c           | 1 +
+ grub-core/commands/nativedisk.c       | 1 +
+ grub-core/disk/cryptodisk.c           | 1 +
+ grub-core/disk/efi/efidisk.c          | 2 +-
+ grub-core/efiemu/mm.c                 | 1 +
+ grub-core/gdb/cstub.c                 | 1 +
+ grub-core/gnulib/regexec.c            | 3 +++
+ grub-core/lib/xzembed/xz_dec_lzma2.c  | 4 ++++
+ grub-core/lib/xzembed/xz_dec_stream.c | 6 ++++++
+ grub-core/loader/i386/linux.c         | 3 +++
+ grub-core/tests/setjmp_test.c         | 5 ++++-
+ grub-core/video/ieee1275.c            | 1 +
+ grub-core/video/readers/jpeg.c        | 1 +
+ util/getroot.c                        | 2 +-
+ util/grub-install.c                   | 1 +
+ util/grub-mkimagexx.c                 | 1 +
+ util/grub-mount.c                     | 1 +
+ 17 files changed, 32 insertions(+), 3 deletions(-)
+
+Index: grub-2.00/grub-core/commands/hdparm.c
+===================================================================
+--- grub-2.00.orig/grub-core/commands/hdparm.c
++++ grub-2.00/grub-core/commands/hdparm.c
+@@ -328,6 +328,7 @@ grub_cmd_hdparm (grub_extcmd_context_t c
+ 	  ata = ((struct grub_scsi *) disk->data)->data;
+ 	  break;
+ 	}
++      /* FALLTHROUGH */
+     default:
+       return grub_error (GRUB_ERR_IO, "not an ATA device");
+     }
+Index: grub-2.00/grub-core/disk/cryptodisk.c
+===================================================================
+--- grub-2.00.orig/grub-core/disk/cryptodisk.c
++++ grub-2.00/grub-core/disk/cryptodisk.c
+@@ -268,6 +268,7 @@ grub_cryptodisk_endecrypt (struct grub_c
+ 	  break;
+ 	case GRUB_CRYPTODISK_MODE_IV_PLAIN64:
+ 	  iv[1] = grub_cpu_to_le32 (sector >> 32);
++	  /* FALLTHROUGH */
+ 	case GRUB_CRYPTODISK_MODE_IV_PLAIN:
+ 	  iv[0] = grub_cpu_to_le32 (sector & 0xFFFFFFFF);
+ 	  break;
+Index: grub-2.00/grub-core/disk/efi/efidisk.c
+===================================================================
+--- grub-2.00.orig/grub-core/disk/efi/efidisk.c
++++ grub-2.00/grub-core/disk/efi/efidisk.c
+@@ -262,7 +262,7 @@ name_devices (struct grub_efidisk_data *
+ 	    {
+ 	    case GRUB_EFI_HARD_DRIVE_DEVICE_PATH_SUBTYPE:
+ 	      is_hard_drive = 1;
+-	      /* Fall through by intention.  */
++	      /* Intentionally fall through.  */
+ 	    case GRUB_EFI_CDROM_DEVICE_PATH_SUBTYPE:
+ 	      {
+ 		struct grub_efidisk_data *parent, *parent2;
+Index: grub-2.00/grub-core/efiemu/mm.c
+===================================================================
+--- grub-2.00.orig/grub-core/efiemu/mm.c
++++ grub-2.00/grub-core/efiemu/mm.c
+@@ -410,6 +410,7 @@ grub_efiemu_mmap_fill (void)
+ 	default:
+ 	  grub_dprintf ("efiemu",
+ 			"Unknown memory type %d. Assuming unusable\n", type);
++	/* FALLTHROUGH */
+ 	case GRUB_MEMORY_RESERVED:
+ 	  return grub_efiemu_add_to_mmap (addr, size,
+ 					  GRUB_EFI_UNUSABLE_MEMORY);
+Index: grub-2.00/grub-core/gdb/cstub.c
+===================================================================
+--- grub-2.00.orig/grub-core/gdb/cstub.c
++++ grub-2.00/grub-core/gdb/cstub.c
+@@ -336,6 +336,7 @@ grub_gdb_trap (int trap_no)
+ 	/* sAA..AA: Step one instruction from AA..AA(optional).  */
+ 	case 's':
+ 	  stepping = 1;
++	  /* FALLTHROUGH */
+ 
+ 	/* cAA..AA: Continue at address AA..AA(optional).  */
+ 	case 'c':
+Index: grub-2.00/grub-core/gnulib/regexec.c
+===================================================================
+--- grub-2.00.orig/grub-core/gnulib/regexec.c
++++ grub-2.00/grub-core/gnulib/regexec.c
+@@ -4104,6 +4104,9 @@ check_node_accept (const re_match_contex
+     case OP_UTF8_PERIOD:
+       if (ch >= ASCII_CHARS)
+         return false;
++#if defined __GNUC__ && __GNUC__ >= 7
++      __attribute__ ((fallthrough));
++#endif
+       /* FALLTHROUGH */
+ #endif
+     case OP_PERIOD:
+Index: grub-2.00/grub-core/lib/xzembed/xz_dec_lzma2.c
+===================================================================
+--- grub-2.00.orig/grub-core/lib/xzembed/xz_dec_lzma2.c
++++ grub-2.00/grub-core/lib/xzembed/xz_dec_lzma2.c
+@@ -1042,6 +1042,8 @@ enum xz_ret xz_dec_lzma2_run(
+ 
+ 			s->lzma2.sequence = SEQ_LZMA_PREPARE;
+ 
++		/* Fall through */
++
+ 		case SEQ_LZMA_PREPARE:
+ 			if (s->lzma2.compressed < RC_INIT_BYTES)
+ 				return XZ_DATA_ERROR;
+@@ -1052,6 +1054,8 @@ enum xz_ret xz_dec_lzma2_run(
+ 			s->lzma2.compressed -= RC_INIT_BYTES;
+ 			s->lzma2.sequence = SEQ_LZMA_RUN;
+ 
++		/* Fall through */
++
+ 		case SEQ_LZMA_RUN:
+ 			/*
+ 			 * Set dictionary limit to indicate how much we want
+Index: grub-2.00/grub-core/lib/xzembed/xz_dec_stream.c
+===================================================================
+--- grub-2.00.orig/grub-core/lib/xzembed/xz_dec_stream.c
++++ grub-2.00/grub-core/lib/xzembed/xz_dec_stream.c
+@@ -749,6 +749,7 @@ static enum xz_ret dec_main(struct xz_de
+ 
+ 			s->sequence = SEQ_BLOCK_START;
+ 
++			/* FALLTHROUGH */
+ 		case SEQ_BLOCK_START:
+ 			/* We need one byte of input to continue. */
+ 			if (b->in_pos == b->in_size)
+@@ -772,6 +773,7 @@ static enum xz_ret dec_main(struct xz_de
+ 			s->temp.pos = 0;
+ 			s->sequence = SEQ_BLOCK_HEADER;
+ 
++			/* FALLTHROUGH */
+ 		case SEQ_BLOCK_HEADER:
+ 			if (!fill_temp(s, b))
+ 				return XZ_OK;
+@@ -782,6 +784,7 @@ static enum xz_ret dec_main(struct xz_de
+ 
+ 			s->sequence = SEQ_BLOCK_UNCOMPRESS;
+ 
++			/* FALLTHROUGH */
+ 		case SEQ_BLOCK_UNCOMPRESS:
+ 			ret = dec_block(s, b);
+ 			if (ret != XZ_STREAM_END)
+@@ -809,6 +812,7 @@ static enum xz_ret dec_main(struct xz_de
+ 
+ 			s->sequence = SEQ_BLOCK_CHECK;
+ 
++			/* FALLTHROUGH */
+ 		case SEQ_BLOCK_CHECK:
+ 			ret = hash_validate(s, b, 0);
+ 			if (ret != XZ_STREAM_END)
+@@ -863,6 +867,7 @@ static enum xz_ret dec_main(struct xz_de
+ 
+ 			s->sequence = SEQ_INDEX_CRC32;
+ 
++			/* FALLTHROUGH */
+ 		case SEQ_INDEX_CRC32:
+ 			ret = hash_validate(s, b, 1);
+ 			if (ret != XZ_STREAM_END)
+@@ -871,6 +876,7 @@ static enum xz_ret dec_main(struct xz_de
+ 			s->temp.size = STREAM_HEADER_SIZE;
+ 			s->sequence = SEQ_STREAM_FOOTER;
+ 
++			/* FALLTHROUGH */
+ 		case SEQ_STREAM_FOOTER:
+ 			if (!fill_temp(s, b))
+ 				return XZ_OK;
+Index: grub-2.00/grub-core/loader/i386/linux.c
+===================================================================
+--- grub-2.00.orig/grub-core/loader/i386/linux.c
++++ grub-2.00/grub-core/loader/i386/linux.c
+@@ -977,10 +977,13 @@ grub_cmd_linux (grub_command_t cmd __att
+ 	      {
+ 	      case 'g':
+ 		shift += 10;
++		/* FALLTHROUGH */
+ 	      case 'm':
+ 		shift += 10;
++		/* FALLTHROUGH */
+ 	      case 'k':
+ 		shift += 10;
++		/* FALLTHROUGH */
+ 	      default:
+ 		break;
+ 	      }
+Index: grub-2.00/grub-core/video/readers/jpeg.c
+===================================================================
+--- grub-2.00.orig/grub-core/video/readers/jpeg.c
++++ grub-2.00/grub-core/video/readers/jpeg.c
+@@ -701,6 +701,7 @@ grub_jpeg_decode_jpeg (struct grub_jpeg_
+ 	case JPEG_MARKER_SOS:	/* Start Of Scan.  */
+ 	  if (grub_jpeg_decode_sos (data))
+ 	    break;
++	  /* FALLTHROUGH */
+ 	case JPEG_MARKER_RST0:	/* Restart.  */
+ 	case JPEG_MARKER_RST1:
+ 	case JPEG_MARKER_RST2:
+Index: grub-2.00/util/grub-mkimagexx.c
+===================================================================
+--- grub-2.00.orig/util/grub-mkimagexx.c
++++ grub-2.00/util/grub-mkimagexx.c
+@@ -485,6 +485,7 @@ SUFFIX (relocate_addresses) (Elf_Ehdr *e
+ 									    + sym->st_value
+ 									    - image_target->vaddr_offset));
+ 		  }
++		/* FALLTHROUGH */
+ 		case R_IA64_LTOFF_FPTR22:
+ 		  *gpptr = grub_host_to_target64 (addend + sym_addr);
+ 		  add_value_to_slot_21 ((grub_addr_t) target,
+Index: grub-2.00/util/grub-mount.c
+===================================================================
+--- grub-2.00.orig/util/grub-mount.c
++++ grub-2.00/util/grub-mount.c
+@@ -487,6 +487,7 @@ argp_parser (int key, char *arg, struct
+       if (arg[0] != '-')
+ 	break;
+ 
++    /* FALLTHROUGH */
+     default:
+       if (!arg)
+ 	return 0;
diff --git a/meta/recipes-bsp/grub/files/0003-Add-gnulib-fix-gcc7-fallthrough.diff.patch b/meta/recipes-bsp/grub/files/0003-Add-gnulib-fix-gcc7-fallthrough.diff.patch
new file mode 100644
index 00000000000..fcfbf5cdf6c
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0003-Add-gnulib-fix-gcc7-fallthrough.diff.patch
@@ -0,0 +1,38 @@
+From 007f0b407f72314ec832d77e15b83ea40b160037 Mon Sep 17 00:00:00 2001
+From: Andrei Borzenkov <arvidjaar@gmail.com>
+Date: Tue, 4 Apr 2017 19:37:47 +0300
+Subject: [PATCH 3/4] Add gnulib-fix-gcc7-fallthrough.diff
+
+As long as the code is not upstream, add it as explicit patch for the
+case of gnulib refresh.
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ grub-core/gnulib-fix-gcc7-fallthrough.diff | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+ create mode 100644 grub-core/gnulib-fix-gcc7-fallthrough.diff
+
+diff --git a/grub-core/gnulib-fix-gcc7-fallthrough.diff b/grub-core/gnulib-fix-gcc7-fallthrough.diff
+new file mode 100644
+index 0000000..9802e2d
+--- /dev/null
++++ b/grub-core/gnulib-fix-gcc7-fallthrough.diff
+@@ -0,0 +1,14 @@
++diff --git grub-core/gnulib/regexec.c grub-core/gnulib/regexec.c
++index f632cd4..a7776f0 100644
++--- grub-core/gnulib/regexec.c
+++++ grub-core/gnulib/regexec.c
++@@ -4099,6 +4099,9 @@ check_node_accept (const re_match_context_t *mctx, const re_token_t *node,
++     case OP_UTF8_PERIOD:
++       if (ch >= ASCII_CHARS)
++         return false;
+++#if defined __GNUC__ && __GNUC__ >= 7
+++      __attribute__ ((fallthrough));
+++#endif
++       /* FALLTHROUGH */
++ #endif
++     case OP_PERIOD:
+-- 
+1.9.1
+
diff --git a/meta/recipes-bsp/grub/files/0004-Fix-remaining-cases-of-gcc-7-fallthrough-warning.patch b/meta/recipes-bsp/grub/files/0004-Fix-remaining-cases-of-gcc-7-fallthrough-warning.patch
new file mode 100644
index 00000000000..78a70a2dab3
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0004-Fix-remaining-cases-of-gcc-7-fallthrough-warning.patch
@@ -0,0 +1,175 @@
+From d454509bb866d4eaefbb558d94dd0ef0228830eb Mon Sep 17 00:00:00 2001
+From: Vladimir Serbinenko <phcoder@gmail.com>
+Date: Wed, 12 Apr 2017 01:42:38 +0000
+Subject: [PATCH 4/4] Fix remaining cases of gcc 7 fallthrough warning.
+
+They are all intended, so just add the relevant comment.
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ grub-core/kern/ia64/dl.c                     | 1 +
+ grub-core/kern/mips/dl.c                     | 1 +
+ grub-core/kern/sparc64/dl.c                  | 1 +
+ grub-core/loader/i386/coreboot/chainloader.c | 1 +
+ 4 files changed, 4 insertions(+)
+
+Index: grub-2.00/grub-core/kern/ia64/dl.c
+===================================================================
+--- grub-2.00.orig/grub-core/kern/ia64/dl.c
++++ grub-2.00/grub-core/kern/ia64/dl.c
+@@ -257,6 +257,7 @@ grub_arch_dl_relocate_symbols (grub_dl_t
+ 		  case R_IA64_LTOFF22:
+ 		    if (ELF_ST_TYPE (sym->st_info) == STT_FUNC)
+ 		      value = *(grub_uint64_t *) sym->st_value + rel->r_addend;
++		  /* Fallthrough.  */
+ 		  case R_IA64_LTOFF_FPTR22:
+ 		    *gpptr = value;
+ 		    add_value_to_slot_21 (addr, (grub_addr_t) gpptr - (grub_addr_t) gp);
+Index: grub-2.00/grub-core/disk/diskfilter.c
+===================================================================
+--- grub-2.00.orig/grub-core/disk/diskfilter.c
++++ grub-2.00/grub-core/disk/diskfilter.c
+@@ -71,10 +71,12 @@ is_lv_readable (struct grub_diskfilter_l
+ 	case GRUB_DISKFILTER_RAID6:
+ 	  if (!easily)
+ 	    need--;
++	  /* Fallthrough.  */
+ 	case GRUB_DISKFILTER_RAID4:
+ 	case GRUB_DISKFILTER_RAID5:
+ 	  if (!easily)
+ 	    need--;
++	  /* Fallthrough.  */
+ 	case GRUB_DISKFILTER_STRIPED:
+ 	  break;
+ 
+@@ -507,6 +509,7 @@ read_segment (struct grub_diskfilter_seg
+       if (seg->node_count == 1)
+ 	return grub_diskfilter_read_node (&seg->nodes[0],
+ 					  sector, size, buf);
++    /* Fallthrough.  */
+     case GRUB_DISKFILTER_MIRROR:
+     case GRUB_DISKFILTER_RAID10:
+       {
+Index: grub-2.00/grub-core/font/font.c
+===================================================================
+--- grub-2.00.orig/grub-core/font/font.c
++++ grub-2.00/grub-core/font/font.c
+@@ -1297,6 +1297,7 @@ blit_comb (const struct grub_unicode_gly
+ 	    - grub_font_get_xheight (combining_glyphs[i]->font) - 1;
+ 	  if (space <= 0)
+ 	    space = 1 + (grub_font_get_xheight (main_glyph->font)) / 8;
++        /* Fallthrough.  */
+ 
+ 	case GRUB_UNICODE_STACK_ATTACHED_ABOVE:
+ 	  do_blit (combining_glyphs[i], targetx,
+@@ -1338,6 +1339,7 @@ blit_comb (const struct grub_unicode_gly
+ 		    + combining_glyphs[i]->height);
+ 	  if (space <= 0)
+ 	    space = 1 + (grub_font_get_xheight (main_glyph->font)) / 8;
++        /* Fallthrough.  */
+ 
+ 	case GRUB_UNICODE_STACK_ATTACHED_BELOW:
+ 	  do_blit (combining_glyphs[i], targetx, -(bounds.y - space));
+Index: grub-2.00/grub-core/fs/udf.c
+===================================================================
+--- grub-2.00.orig/grub-core/fs/udf.c
++++ grub-2.00/grub-core/fs/udf.c
+@@ -970,6 +970,7 @@ grub_udf_read_symlink (grub_fshelp_node_
+ 	case 1:
+ 	  if (ptr[1])
+ 	    goto fail;
++	  break;
+ 	case 2:
+ 	  /* in 4 bytes. out: 1 byte.  */
+ 	  optr = out;
+Index: grub-2.00/grub-core/lib/legacy_parse.c
+===================================================================
+--- grub-2.00.orig/grub-core/lib/legacy_parse.c
++++ grub-2.00/grub-core/lib/legacy_parse.c
+@@ -626,6 +626,7 @@ grub_legacy_parse (const char *buf, char
+ 	  {
+ 	  case TYPE_FILE_NO_CONSUME:
+ 	    hold_arg = 1;
++	  /* Fallthrough.  */
+ 	  case TYPE_PARTITION:
+ 	  case TYPE_FILE:
+ 	    args[i] = adjust_file (curarg, curarglen);
+Index: grub-2.00/grub-core/lib/libgcrypt-grub/cipher/rijndael.c
+===================================================================
+--- grub-2.00.orig/grub-core/lib/libgcrypt-grub/cipher/rijndael.c
++++ grub-2.00/grub-core/lib/libgcrypt-grub/cipher/rijndael.c
+@@ -96,7 +96,8 @@ do_setkey (RIJNDAEL_context *ctx, const
+   static int initialized = 0;
+   static const char *selftest_failed=0;
+   int ROUNDS;
+-  int i,j, r, t, rconpointer = 0;
++  unsigned int i, t, rconpointer = 0;
++  int j, r;
+   int KC;
+   union
+   {
+Index: grub-2.00/grub-core/mmap/efi/mmap.c
+===================================================================
+--- grub-2.00.orig/grub-core/mmap/efi/mmap.c
++++ grub-2.00/grub-core/mmap/efi/mmap.c
+@@ -72,6 +72,7 @@ grub_efi_mmap_iterate (grub_memory_hook_
+ 		    GRUB_MEMORY_AVAILABLE);
+ 	      break;
+ 	    }
++	  /* Fallthrough.  */
+ 	case GRUB_EFI_RUNTIME_SERVICES_CODE:
+ 	  hook (desc->physical_start, desc->num_pages * 4096,
+ 		GRUB_MEMORY_CODE);
+@@ -86,6 +87,7 @@ grub_efi_mmap_iterate (grub_memory_hook_
+ 	  grub_printf ("Unknown memory type %d, considering reserved\n",
+ 		       desc->type);
+ 
++	  /* Fallthrough.  */
+ 	case GRUB_EFI_BOOT_SERVICES_DATA:
+ 	  if (!avoid_efi_boot_services)
+ 	    {
+@@ -93,6 +95,7 @@ grub_efi_mmap_iterate (grub_memory_hook_
+ 		    GRUB_MEMORY_AVAILABLE);
+ 	      break;
+ 	    }
++	  /* Fallthrough.  */
+ 	case GRUB_EFI_RESERVED_MEMORY_TYPE:
+ 	case GRUB_EFI_RUNTIME_SERVICES_DATA:
+ 	case GRUB_EFI_MEMORY_MAPPED_IO:
+Index: grub-2.00/grub-core/normal/charset.c
+===================================================================
+--- grub-2.00.orig/grub-core/normal/charset.c
++++ grub-2.00/grub-core/normal/charset.c
+@@ -858,6 +858,7 @@ grub_bidi_line_logical_to_visual (const
+ 	  case GRUB_BIDI_TYPE_R:
+ 	  case GRUB_BIDI_TYPE_AL:
+ 	    bidi_needed = 1;
++	  /* Fallthrough.  */
+ 	  default:
+ 	    {
+ 	      if (join_state == JOIN_FORCE)
+Index: grub-2.00/grub-core/video/bochs.c
+===================================================================
+--- grub-2.00.orig/grub-core/video/bochs.c
++++ grub-2.00/grub-core/video/bochs.c
+@@ -351,6 +351,7 @@ grub_video_bochs_setup (unsigned int wid
+     case 32:
+       framebuffer.mode_info.reserved_mask_size = 8;
+       framebuffer.mode_info.reserved_field_pos = 24;
++      /* Fallthrough.  */
+ 
+     case 24:
+       framebuffer.mode_info.red_mask_size = 8;
+Index: grub-2.00/grub-core/video/cirrus.c
+===================================================================
+--- grub-2.00.orig/grub-core/video/cirrus.c
++++ grub-2.00/grub-core/video/cirrus.c
+@@ -431,6 +431,7 @@ grub_video_cirrus_setup (unsigned int wi
+     case 32:
+       framebuffer.mode_info.reserved_mask_size = 8;
+       framebuffer.mode_info.reserved_field_pos = 24;
++      /* Fallthrough.  */
+ 
+     case 24:
+       framebuffer.mode_info.red_mask_size = 8;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index ef893b327f2..a93c99e6c9d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -36,6 +36,10 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch \
            file://0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch \
            file://0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch \
+           file://0001-btrfs-avoid-used-uninitialized-error-with-GCC7.patch \
+           file://0002-i386-x86_64-ppc-fix-switch-fallthrough-cases-with-GC.patch \
+           file://0003-Add-gnulib-fix-gcc7-fallthrough.diff.patch \
+           file://0004-Fix-remaining-cases-of-gcc-7-fallthrough-warning.patch \
             "
 
 DEPENDS = "flex-native bison-native autogen-native"
-- 
2.12.2


