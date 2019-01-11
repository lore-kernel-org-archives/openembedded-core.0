Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 925B97C0D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 08:14:44 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id u6so6439888plm.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 00:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nMXTysPrPdVOc4adSav4KyO8lDDqnrtZxxAug1o/Exk=;
	b=ncoKyZ1dOs6Iy67ymVecPlfWq8bSAINOg8lQm4ARtkoNNH3fGKlA2RzOuMHqUJ6qK+
	jVmBLETrjmYIfmRz7+/ZESu4zUyikRXz4D6rR8QKx9h9e6UnazkgoBjPXusVHWFhnbdl
	Qaz3Z7TCTLQ/Xyy8a73IxXHQKXNYa1xKRCbqoRzCFK1+92IcjlUYMIKaODpf5uHn/gDq
	azvmZmowsR9IVntGBQ53p7e1BFXxXc5GOyraurzQKaenTL0/ITiKbnzBMqI0Ujb4U5zQ
	KxdNKF8dzBuodW5SoLytgeUA6xzdPzUgIdHQYVKtKw7+hqj7UyUrjk8OpsozGFvlLW5y
	iitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nMXTysPrPdVOc4adSav4KyO8lDDqnrtZxxAug1o/Exk=;
	b=VOD/9RMCxb8pOQIsHrJQqNVY29aNDgi2Ow54kPK8KTCbIcaF2LUImycX1S96fPCuMJ
	M28MFJvB42O4WEzG+XZPLB6VpilZTCHRr71HdxyERV+uQ2phFife4W5C6h7QBepLN2fB
	LVvEINfrKmF9KhW3C7UudjIeuEGvyOmP7DfgrsmOY+eWNN/4XbJ9+FMvpD2HcUN+Qvlh
	IERCwLU7Hp4ul28XUbqy9DqNJRxCwmcVanJsV3sSjdz4XD2vCotJa1xDeKbRZhX9ppJ+
	P6SkV+Yavs8YkVoyVO1iyFQt4caQ+NGoGPBNr71PIW131LYKvlhgn4UNsOs3x/1mP50q
	gA2A==
X-Gm-Message-State: AJcUuke4iJzhud8Kcc9tVQHc6wNst0MCDP1sE3M0kOVOKzBG3Q1P9CKv
	MdsT/UlChBASU3jthB4xfPPI4I/i6LU=
X-Google-Smtp-Source: ALg8bN7ty9w3ccE3BGblFVIlwdYVTO4kxKREUlbM9eHEimnASG1NL2jWJLJ6F3l6uLmCBBo7PUc/yQ==
X-Received: by 2002:a17:902:6f09:: with SMTP id
	w9mr14000935plk.309.1547194485007; 
	Fri, 11 Jan 2019 00:14:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::d11e])
	by smtp.gmail.com with ESMTPSA id
	n73sm124429367pfj.148.2019.01.11.00.14.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 00:14:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2019 00:14:31 -0800
Message-Id: <20190111081431.42638-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [thud][PATCH] binutils: bfd doesn't handle ELF compressed data alignment
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
X-List-Received-Date: Fri, 11 Jan 2019 08:14:44 -0000
Content-Transfer-Encoding: 8bit

Backport patches for ld/gold from master

[YOCTO# 13136]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils-2.31.inc                |   2 +
 ...essed-header-alignment-correctly-by-.patch | 332 ++++++++++++++++++
 ...nt-of-uncompressed-section-from-ch_a.patch | 200 +++++++++++
 3 files changed, 534 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-Handle-ELF-compressed-header-alignment-correctly-by-.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0023-gold-Get-alignment-of-uncompressed-section-from-ch_a.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
index 0c9d4cef21..588224fd4d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -41,6 +41,8 @@ SRC_URI = "\
      file://0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch \
      file://0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch \
      file://0021-PLT-information-was-still-being-generated-when-symbo.patch \
+     file://0022-Handle-ELF-compressed-header-alignment-correctly-by-.patch \
+     file://0023-gold-Get-alignment-of-uncompressed-section-from-ch_a.patch \
      file://CVE-2018-17358.patch \
      file://CVE-2018-17360.patch \
      file://CVE-2018-18309.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0022-Handle-ELF-compressed-header-alignment-correctly-by-.patch b/meta/recipes-devtools/binutils/binutils/0022-Handle-ELF-compressed-header-alignment-correctly-by-.patch
new file mode 100644
index 0000000000..650de9b9a3
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0022-Handle-ELF-compressed-header-alignment-correctly-by-.patch
@@ -0,0 +1,332 @@
+From bb9c8cc3c5f4ffd6019a8c53adead429954162e1 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Tue, 27 Nov 2018 11:59:10 +0000
+Subject: [PATCH 1/2] Handle ELF compressed header alignment correctly by
+ setting up the section alignment correctly for the Elf32_Chdr or Elf64_Chdr
+ type and respect the ch_addralign field when decompressing the section data.
+
+	PR binutils/23919
+binutils* readelf.c (dump_sections_as_strings): Remove bogus addralign check.
+	(dump_sections_as_bytes): Likewise.
+	(load_specific_debug_sections): Likewise.
+	* testsuite/binutils-all/dw2-3.rS: Adjust alignment.
+	* testsuite/binutils-all/dw2-3.rt: Likewise.
+
+bfd	* bfd.c (bfd_update_compression_header): Explicitly set alignment.
+	(bfd_check_compression_header): Add uncompressed_alignment_power
+	argument. Check ch_addralign is a power of 2.
+	* bfd-in2.h: Regenerated.
+	* compress.c (bfd_compress_section_contents): Get and set
+	orig_uncompressed_alignment_pow if section is decompressed.
+	(bfd_is_section_compressed_with_header): Add and get
+	uncompressed_align_pow_p argument.
+	(bfd_is_section_compressed): Add uncompressed_align_power argument
+	to bfd_is_section_compressed_with_header call.
+	(bfd_init_section_decompress_status): Get and set
+	uncompressed_alignment_power.
+	* elf.c (_bfd_elf_make_section_from_shdr): Add
+	uncompressed_align_power argument to
+	bfd_is_section_compressed_with_header call.
+---
+ bfd/bfd-in2.h                            |  6 ++--
+ bfd/bfd.c                                | 20 ++++++++++----
+ bfd/compress.c                           | 35 +++++++++++++++++-------
+ bfd/elf.c                                |  5 ++--
+ binutils/readelf.c                       | 18 ------------
+ binutils/testsuite/binutils-all/dw2-3.rS |  2 +-
+ binutils/testsuite/binutils-all/dw2-3.rt |  2 +-
+ 7 files changed, 49 insertions(+), 39 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=4207142d6a5d2359170c5f9a140fc1a2351fbda9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
+index f53dbb5e8c..d0c2190d0b 100644
+--- a/bfd/bfd-in2.h
++++ b/bfd/bfd-in2.h
+@@ -7279,7 +7279,8 @@ void bfd_update_compression_header
+ 
+ bfd_boolean bfd_check_compression_header
+    (bfd *abfd, bfd_byte *contents, asection *sec,
+-    bfd_size_type *uncompressed_size);
++    bfd_size_type *uncompressed_size,
++    unsigned int *uncompressed_alignment_power);
+ 
+ int bfd_get_compression_header_size (bfd *abfd, asection *sec);
+ 
+@@ -7855,7 +7856,8 @@ void bfd_cache_section_contents
+ bfd_boolean bfd_is_section_compressed_with_header
+    (bfd *abfd, asection *section,
+     int *compression_header_size_p,
+-    bfd_size_type *uncompressed_size_p);
++    bfd_size_type *uncompressed_size_p,
++    unsigned int *uncompressed_alignment_power_p);
+ 
+ bfd_boolean bfd_is_section_compressed
+    (bfd *abfd, asection *section);
+diff --git a/bfd/bfd.c b/bfd/bfd.c
+index 851710401e..ea10d7b185 100644
+--- a/bfd/bfd.c
++++ b/bfd/bfd.c
+@@ -2332,6 +2332,8 @@ bfd_update_compression_header (bfd *abfd, bfd_byte *contents,
+ 		  bfd_put_32 (abfd, sec->size, &echdr->ch_size);
+ 		  bfd_put_32 (abfd, 1 << sec->alignment_power,
+ 			      &echdr->ch_addralign);
++		  /* bfd_log2 (alignof (Elf32_Chdr)) */
++		  bfd_set_section_alignment (abfd, sec, 2);
+ 		}
+ 	      else
+ 		{
+@@ -2342,6 +2344,8 @@ bfd_update_compression_header (bfd *abfd, bfd_byte *contents,
+ 		  bfd_put_64 (abfd, sec->size, &echdr->ch_size);
+ 		  bfd_put_64 (abfd, 1 << sec->alignment_power,
+ 			      &echdr->ch_addralign);
++		  /* bfd_log2 (alignof (Elf64_Chdr)) */
++		  bfd_set_section_alignment (abfd, sec, 3);
+ 		}
+ 	    }
+ 	  else
+@@ -2354,6 +2358,8 @@ bfd_update_compression_header (bfd *abfd, bfd_byte *contents,
+ 		 order.  */
+ 	      memcpy (contents, "ZLIB", 4);
+ 	      bfd_putb64 (sec->size, contents + 4);
++	      /* No way to keep the original alignment, just use 1 always. */
++	      bfd_set_section_alignment (abfd, sec, 0);
+ 	    }
+ 	}
+     }
+@@ -2368,12 +2374,14 @@ bfd_update_compression_header (bfd *abfd, bfd_byte *contents,
+    SYNOPSIS
+ 	bfd_boolean bfd_check_compression_header
+ 	  (bfd *abfd, bfd_byte *contents, asection *sec,
+-	  bfd_size_type *uncompressed_size);
++	  bfd_size_type *uncompressed_size,
++	  unsigned int *uncompressed_alignment_power);
+ 
+ DESCRIPTION
+ 	Check the compression header at CONTENTS of SEC in ABFD and
+-	store the uncompressed size in UNCOMPRESSED_SIZE if the
+-	compression header is valid.
++	store the uncompressed size in UNCOMPRESSED_SIZE and the
++	uncompressed data alignment in UNCOMPRESSED_ALIGNMENT_POWER
++	if the compression header is valid.
+ 
+ RETURNS
+ 	Return TRUE if the compression header is valid.
+@@ -2382,7 +2390,8 @@ RETURNS
+ bfd_boolean
+ bfd_check_compression_header (bfd *abfd, bfd_byte *contents,
+ 			      asection *sec,
+-			      bfd_size_type *uncompressed_size)
++			      bfd_size_type *uncompressed_size,
++			      unsigned int *uncompressed_alignment_power)
+ {
+   if (bfd_get_flavour (abfd) == bfd_target_elf_flavour
+       && (elf_section_flags (sec) & SHF_COMPRESSED) != 0)
+@@ -2404,9 +2413,10 @@ bfd_check_compression_header (bfd *abfd, bfd_byte *contents,
+ 	  chdr.ch_addralign = bfd_get_64 (abfd, &echdr->ch_addralign);
+ 	}
+       if (chdr.ch_type == ELFCOMPRESS_ZLIB
+-	  && chdr.ch_addralign == 1U << sec->alignment_power)
++	  && chdr.ch_addralign == (1U << bfd_log2 (chdr.ch_addralign)))
+ 	{
+ 	  *uncompressed_size = chdr.ch_size;
++	  *uncompressed_alignment_power = bfd_log2 (chdr.ch_addralign);
+ 	  return TRUE;
+ 	}
+     }
+diff --git a/bfd/compress.c b/bfd/compress.c
+index 53e566e498..97ea624eb8 100644
+--- a/bfd/compress.c
++++ b/bfd/compress.c
+@@ -84,11 +84,13 @@ bfd_compress_section_contents (bfd *abfd, sec_ptr sec,
+   int zlib_size = 0;
+   int orig_compression_header_size;
+   bfd_size_type orig_uncompressed_size;
++  unsigned int orig_uncompressed_alignment_pow;
+   int header_size = bfd_get_compression_header_size (abfd, NULL);
+   bfd_boolean compressed
+     = bfd_is_section_compressed_with_header (abfd, sec,
+ 					     &orig_compression_header_size,
+-					     &orig_uncompressed_size);
++					     &orig_uncompressed_size,
++					     &orig_uncompressed_alignment_pow);
+ 
+   /* Either ELF compression header or the 12-byte, "ZLIB" + 8-byte size,
+      overhead in .zdebug* section.  */
+@@ -153,6 +155,9 @@ bfd_compress_section_contents (bfd *abfd, sec_ptr sec,
+ 	      return 0;
+ 	    }
+ 	  free (uncompressed_buffer);
++	  bfd_set_section_alignment (abfd, sec,
++				     orig_uncompressed_alignment_pow);
++
+ 	  sec->contents = buffer;
+ 	  sec->compress_status = COMPRESS_SECTION_DONE;
+ 	  return orig_uncompressed_size;
+@@ -364,20 +369,24 @@ SYNOPSIS
+ 	bfd_boolean bfd_is_section_compressed_with_header
+ 	  (bfd *abfd, asection *section,
+ 	  int *compression_header_size_p,
+-	  bfd_size_type *uncompressed_size_p);
++	  bfd_size_type *uncompressed_size_p,
++	  unsigned int *uncompressed_alignment_power_p);
+ 
+ DESCRIPTION
+ 	Return @code{TRUE} if @var{section} is compressed.  Compression
+-	header size is returned in @var{compression_header_size_p} and
+-	uncompressed size is returned in @var{uncompressed_size_p}.  If
+-	compression is unsupported, compression header size is returned
+-	with -1 and uncompressed size is returned with 0.
++	header size is returned in @var{compression_header_size_p},
++	uncompressed size is returned in @var{uncompressed_size_p}
++	and the uncompressed data alignement power is returned in
++	@var{uncompressed_align_pow_p}.  If compression is
++	unsupported, compression header size is returned with -1
++	and uncompressed size is returned with 0.
+ */
+ 
+ bfd_boolean
+ bfd_is_section_compressed_with_header (bfd *abfd, sec_ptr sec,
+ 				       int *compression_header_size_p,
+-				       bfd_size_type *uncompressed_size_p)
++				       bfd_size_type *uncompressed_size_p,
++				       unsigned int *uncompressed_align_pow_p)
+ {
+   bfd_byte header[MAX_COMPRESSION_HEADER_SIZE];
+   int compression_header_size;
+@@ -412,7 +421,8 @@ bfd_is_section_compressed_with_header (bfd *abfd, sec_ptr sec,
+       if (compression_header_size != 0)
+ 	{
+ 	  if (!bfd_check_compression_header (abfd, header, sec,
+-					     uncompressed_size_p))
++					     uncompressed_size_p,
++					     uncompressed_align_pow_p))
+ 	    compression_header_size = -1;
+ 	}
+       /* Check for the pathalogical case of a debug string section that
+@@ -449,9 +459,11 @@ bfd_is_section_compressed (bfd *abfd, sec_ptr sec)
+ {
+   int compression_header_size;
+   bfd_size_type uncompressed_size;
++  unsigned int uncompressed_align_power;
+   return (bfd_is_section_compressed_with_header (abfd, sec,
+ 						 &compression_header_size,
+-						 &uncompressed_size)
++						 &uncompressed_size,
++						 &uncompressed_align_power)
+ 	  && compression_header_size >= 0
+ 	  && uncompressed_size > 0);
+ }
+@@ -480,6 +492,7 @@ bfd_init_section_decompress_status (bfd *abfd, sec_ptr sec)
+   int compression_header_size;
+   int header_size;
+   bfd_size_type uncompressed_size;
++  unsigned int uncompressed_alignment_power = 0;
+ 
+   compression_header_size = bfd_get_compression_header_size (abfd, sec);
+   if (compression_header_size > MAX_COMPRESSION_HEADER_SIZE)
+@@ -508,7 +521,8 @@ bfd_init_section_decompress_status (bfd *abfd, sec_ptr sec)
+       uncompressed_size = bfd_getb64 (header + 4);
+     }
+   else if (!bfd_check_compression_header (abfd, header, sec,
+-					 &uncompressed_size))
++					  &uncompressed_size,
++					  &uncompressed_alignment_power))
+     {
+       bfd_set_error (bfd_error_wrong_format);
+       return FALSE;
+@@ -516,6 +530,7 @@ bfd_init_section_decompress_status (bfd *abfd, sec_ptr sec)
+ 
+   sec->compressed_size = sec->size;
+   sec->size = uncompressed_size;
++  bfd_set_section_alignment (abfd, sec, uncompressed_alignment_power);
+   sec->compress_status = DECOMPRESS_SECTION_SIZED;
+ 
+   return TRUE;
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 828241d48a..c4f131ddcf 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -1177,11 +1177,12 @@ _bfd_elf_make_section_from_shdr (bfd *abfd,
+       enum { nothing, compress, decompress } action = nothing;
+       int compression_header_size;
+       bfd_size_type uncompressed_size;
++      unsigned int uncompressed_align_power;
+       bfd_boolean compressed
+ 	= bfd_is_section_compressed_with_header (abfd, newsect,
+ 						 &compression_header_size,
+-						 &uncompressed_size);
+-
++						 &uncompressed_size,
++						 &uncompressed_align_power);
+       if (compressed)
+ 	{
+ 	  /* Compressed section.  Check if we should decompress.  */
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index f4df697a7d..4b0efa884f 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -13345,12 +13345,6 @@ dump_section_as_strings (Elf_Internal_Shdr * section, Filedata * filedata)
+ 		    printable_section_name (filedata, section), chdr.ch_type);
+ 	      return FALSE;
+ 	    }
+-	  else if (chdr.ch_addralign != section->sh_addralign)
+-	    {
+-	      warn (_("compressed section '%s' is corrupted\n"),
+-		    printable_section_name (filedata, section));
+-	      return FALSE;
+-	    }
+ 	  uncompressed_size = chdr.ch_size;
+ 	  start += compression_header_size;
+ 	  new_size -= compression_header_size;
+@@ -13492,12 +13486,6 @@ dump_section_as_bytes (Elf_Internal_Shdr *  section,
+ 		    printable_section_name (filedata, section), chdr.ch_type);
+ 	      return FALSE;
+ 	    }
+-	  else if (chdr.ch_addralign != section->sh_addralign)
+-	    {
+-	      warn (_("compressed section '%s' is corrupted\n"),
+-		    printable_section_name (filedata, section));
+-	      return FALSE;
+-	    }
+ 	  uncompressed_size = chdr.ch_size;
+ 	  start += compression_header_size;
+ 	  new_size -= compression_header_size;
+@@ -13667,12 +13655,6 @@ load_specific_debug_section (enum dwarf_section_display_enum  debug,
+ 		    section->name, chdr.ch_type);
+ 	      return FALSE;
+ 	    }
+-	  else if (chdr.ch_addralign != sec->sh_addralign)
+-	    {
+-	      warn (_("compressed section '%s' is corrupted\n"),
+-		    section->name);
+-	      return FALSE;
+-	    }
+ 	  uncompressed_size = chdr.ch_size;
+ 	  start += compression_header_size;
+ 	  size -= compression_header_size;
+diff --git a/binutils/testsuite/binutils-all/dw2-3.rS b/binutils/testsuite/binutils-all/dw2-3.rS
+index f1637e9149..86bc73d9a2 100644
+--- a/binutils/testsuite/binutils-all/dw2-3.rS
++++ b/binutils/testsuite/binutils-all/dw2-3.rS
+@@ -1,3 +1,3 @@
+ #...
+- +\[[ 0-9]+\] .debug_info +(PROGBITS|MIPS_DWARF) +0+ +[0-9a-f]+ +[0-9a-f]+ [0-9a-f]+ +C +0 +0 +1
++ +\[[ 0-9]+\] .debug_info +(PROGBITS|MIPS_DWARF) +0+ +[0-9a-f]+ +[0-9a-f]+ [0-9a-f]+ +C +0 +0 +(4|8)
+ #pass
+diff --git a/binutils/testsuite/binutils-all/dw2-3.rt b/binutils/testsuite/binutils-all/dw2-3.rt
+index f59cbaa22b..74e7f8deca 100644
+--- a/binutils/testsuite/binutils-all/dw2-3.rt
++++ b/binutils/testsuite/binutils-all/dw2-3.rt
+@@ -1,6 +1,6 @@
+ #...
+  +\[[ 0-9]+\] .debug_info
+- +(PROGBITS|MIPS_DWARF) +0+ +[0-9a-f]+ +[0-9a-f]+ +[0-9a-f]+ +0 +0 +1
++ +(PROGBITS|MIPS_DWARF) +0+ +[0-9a-f]+ +[0-9a-f]+ +[0-9a-f]+ +0 +0 +(4|8)
+  +\[0+800\]: COMPRESSED
+  +ZLIB, 0+9d, 1
+ #pass
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/binutils/binutils/0023-gold-Get-alignment-of-uncompressed-section-from-ch_a.patch b/meta/recipes-devtools/binutils/binutils/0023-gold-Get-alignment-of-uncompressed-section-from-ch_a.patch
new file mode 100644
index 0000000000..1f072a6057
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0023-gold-Get-alignment-of-uncompressed-section-from-ch_a.patch
@@ -0,0 +1,200 @@
+From 0261ec511ac07177fa488133e0bb3c03860977b3 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sun, 2 Dec 2018 05:42:36 -0800
+Subject: [PATCH 2/2] gold: Get alignment of uncompressed section from
+ ch_addralign
+
+The ELF compression header has a field (ch_addralign) that is set to
+the alignment of the uncompressed section. This way the section itself
+can have a different alignment than the decompressed section.  Update
+decompress_input_section to get alignment of the decompressed section
+and use it when merging decompressed strings.
+
+	PR binutils/23919
+	* merge.cc (Output_merge_string<Char_type>::do_add_input_section):
+	Get addralign from decompressed_section_contents.
+	* object.cc (build_compressed_section_map): Set info.addralign.
+	(Object::decompressed_section_contents): Add a palign
+	argument and store p->second.addralign in *palign if it isn't
+	NULL.
+	* object.h (Compressed_section_info): Add addralign.
+	(section_is_compressed): Add a palign argument, default it
+	to NULL, store p->second.addralign in *palign if it isn't NULL.
+	(Object::decompressed_section_contents): Likewise.
+	* output.cc (Output_section::add_input_section): Get addralign
+	from section_is_compressed.
+---
+ gold/merge.cc  |  8 +++++---
+ gold/object.cc | 11 +++++++++--
+ gold/object.h  |  8 ++++++--
+ gold/output.cc | 11 ++++++-----
+ 4 files changed, 26 insertions(+), 12 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5f6c22aee74f17393b82934a5682d985672e011a]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+diff --git a/gold/merge.cc b/gold/merge.cc
+index de00ee9ae9..d7de11789f 100644
+--- a/gold/merge.cc
++++ b/gold/merge.cc
+@@ -440,9 +440,11 @@ Output_merge_string<Char_type>::do_add_input_section(Relobj* object,
+ {
+   section_size_type sec_len;
+   bool is_new;
++  uint64_t addralign = this->addralign();
+   const unsigned char* pdata = object->decompressed_section_contents(shndx,
+ 								     &sec_len,
+-								     &is_new);
++								     &is_new,
++								     &addralign);
+ 
+   const Char_type* p = reinterpret_cast<const Char_type*>(pdata);
+   const Char_type* pend = p + sec_len / sizeof(Char_type);
+@@ -494,7 +496,7 @@ Output_merge_string<Char_type>::do_add_input_section(Relobj* object,
+   // aligned, so each string within the section must retain the same
+   // modulo.
+   uintptr_t init_align_modulo = (reinterpret_cast<uintptr_t>(pdata)
+-				 & (this->addralign() - 1));
++				 & (addralign - 1));
+   bool has_misaligned_strings = false;
+ 
+   while (p < pend)
+@@ -503,7 +505,7 @@ Output_merge_string<Char_type>::do_add_input_section(Relobj* object,
+ 
+       // Within merge input section each string must be aligned.
+       if (len != 0
+-	  && ((reinterpret_cast<uintptr_t>(p) & (this->addralign() - 1))
++	  && ((reinterpret_cast<uintptr_t>(p) & (addralign - 1))
+ 	      != init_align_modulo))
+ 	  has_misaligned_strings = true;
+ 
+diff --git a/gold/object.cc b/gold/object.cc
+index 374340fa16..711793e5e4 100644
+--- a/gold/object.cc
++++ b/gold/object.cc
+@@ -751,11 +751,13 @@ build_compressed_section_map(
+ 	      const unsigned char* contents =
+ 		  obj->section_contents(i, &len, false);
+ 	      uint64_t uncompressed_size;
++	      Compressed_section_info info;
+ 	      if (is_zcompressed)
+ 		{
+ 		  // Skip over the ".zdebug" prefix.
+ 		  name += 7;
+ 		  uncompressed_size = get_uncompressed_size(contents, len);
++		  info.addralign = shdr.get_sh_addralign();
+ 		}
+ 	      else
+ 		{
+@@ -763,8 +765,8 @@ build_compressed_section_map(
+ 		  name += 6;
+ 		  elfcpp::Chdr<size, big_endian> chdr(contents);
+ 		  uncompressed_size = chdr.get_ch_size();
++		  info.addralign = chdr.get_ch_addralign();
+ 		}
+-	      Compressed_section_info info;
+ 	      info.size = convert_to_section_size_type(uncompressed_size);
+ 	      info.flag = shdr.get_sh_flags();
+ 	      info.contents = NULL;
+@@ -3060,7 +3062,8 @@ const unsigned char*
+ Object::decompressed_section_contents(
+     unsigned int shndx,
+     section_size_type* plen,
+-    bool* is_new)
++    bool* is_new,
++    uint64_t* palign)
+ {
+   section_size_type buffer_size;
+   const unsigned char* buffer = this->do_section_contents(shndx, &buffer_size,
+@@ -3087,6 +3090,8 @@ Object::decompressed_section_contents(
+     {
+       *plen = uncompressed_size;
+       *is_new = false;
++      if (palign != NULL)
++	*palign = p->second.addralign;
+       return p->second.contents;
+     }
+ 
+@@ -3108,6 +3113,8 @@ Object::decompressed_section_contents(
+   // once in this pass.
+   *plen = uncompressed_size;
+   *is_new = true;
++  if (palign != NULL)
++    *palign = p->second.addralign;
+   return uncompressed_data;
+ }
+ 
+diff --git a/gold/object.h b/gold/object.h
+index 0b786a5471..b99548463d 100644
+--- a/gold/object.h
++++ b/gold/object.h
+@@ -373,6 +373,7 @@ struct Compressed_section_info
+ {
+   section_size_type size;
+   elfcpp::Elf_Xword flag;
++  uint64_t addralign;
+   const unsigned char* contents;
+ };
+ typedef std::map<unsigned int, Compressed_section_info> Compressed_section_map;
+@@ -808,7 +809,8 @@ class Object
+ 
+   bool
+   section_is_compressed(unsigned int shndx,
+-			section_size_type* uncompressed_size) const
++			section_size_type* uncompressed_size,
++			elfcpp::Elf_Xword* palign = NULL) const
+   {
+     if (this->compressed_sections_ == NULL)
+       return false;
+@@ -818,6 +820,8 @@ class Object
+       {
+ 	if (uncompressed_size != NULL)
+ 	  *uncompressed_size = p->second.size;
++	if (palign != NULL)
++	  *palign = p->second.addralign;
+ 	return true;
+       }
+     return false;
+@@ -828,7 +832,7 @@ class Object
+   // by the caller.
+   const unsigned char*
+   decompressed_section_contents(unsigned int shndx, section_size_type* plen,
+-				bool* is_cached);
++				bool* is_cached, uint64_t* palign = NULL);
+ 
+   // Discard any buffers of decompressed sections.  This is done
+   // at the end of the Add_symbols task.
+diff --git a/gold/output.cc b/gold/output.cc
+index 1701db1c99..75ac3bcf97 100644
+--- a/gold/output.cc
++++ b/gold/output.cc
+@@ -2448,7 +2448,13 @@ Output_section::add_input_section(Layout* layout,
+ 				  unsigned int reloc_shndx,
+ 				  bool have_sections_script)
+ {
++  section_size_type input_section_size = shdr.get_sh_size();
++  section_size_type uncompressed_size;
+   elfcpp::Elf_Xword addralign = shdr.get_sh_addralign();
++  if (object->section_is_compressed(shndx, &uncompressed_size,
++				    &addralign))
++    input_section_size = uncompressed_size;
++
+   if ((addralign & (addralign - 1)) != 0)
+     {
+       object->error(_("invalid alignment %lu for section \"%s\""),
+@@ -2498,11 +2504,6 @@ Output_section::add_input_section(Layout* layout,
+ 	}
+     }
+ 
+-  section_size_type input_section_size = shdr.get_sh_size();
+-  section_size_type uncompressed_size;
+-  if (object->section_is_compressed(shndx, &uncompressed_size))
+-    input_section_size = uncompressed_size;
+-
+   off_t offset_in_section;
+ 
+   if (this->has_fixed_layout())
+-- 
+2.20.1
+
-- 
2.20.1


