Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 77C7C608CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 13:58:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 22 Jul 2013 06:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,719,1367996400"; d="scan'208";a="369134474"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jul 2013 06:58:36 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2013 16:58:32 +0300
Message-Id: <78ccb04fc526be5eb9c8a6e06b848bc7180856af.1374501371.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374501371.git.laurentiu.palcu@intel.com>
References: <cover.1374501371.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1374501371.git.laurentiu.palcu@intel.com>
References: <cover.1374501371.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] elfutils: fix backends' Makefile.am
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
X-List-Received-Date: Mon, 22 Jul 2013 13:58:36 -0000

The mips, m68k and parisc backend libraries were not generated. This
patch fixes that.

[YOCTO #4849]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../elfutils/elfutils-0.155/hppa_backend.diff      |   15 ++++++++++-----
 .../elfutils/elfutils-0.155/m68k_backend.diff      |   12 +++++++++---
 .../elfutils/elfutils-0.155/mips_backend.diff      |   16 +++++++++++-----
 3 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.155/hppa_backend.diff
index e8d8df5..3fb2523 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.155/hppa_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/hppa_backend.diff
@@ -729,7 +729,7 @@ Index: elfutils-0.155/backends/Makefile.am
 ===================================================================
 --- elfutils-0.155.orig/backends/Makefile.am
 +++ elfutils-0.155/backends/Makefile.am
-@@ -32,7 +32,7 @@ INCLUDES += -I$(top_srcdir)/libebl -I$(t
+@@ -32,11 +32,11 @@
  	   -I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
  
  
@@ -738,7 +738,12 @@ Index: elfutils-0.155/backends/Makefile.am
  libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a \
  	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a \
  	     libebl_sparc_pic.a libebl_ppc_pic.a libebl_ppc64_pic.a \
-@@ -103,6 +103,9 @@ tilegx_SRCS = tilegx_init.c tilegx_symbo
+-	     libebl_s390_pic.a libebl_tilegx_pic.a
++	     libebl_s390_pic.a libebl_tilegx_pic.a libebl_parisc_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -103,6 +103,9 @@
  libebl_tilegx_pic_a_SOURCES = $(tilegx_SRCS)
  am_libebl_tilegx_pic_a_OBJECTS = $(tilegx_SRCS:.c=.os)
  
@@ -752,7 +757,7 @@ Index: elfutils-0.155/libelf/elf.h
 ===================================================================
 --- elfutils-0.155.orig/libelf/elf.h
 +++ elfutils-0.155/libelf/elf.h
-@@ -1780,16 +1780,24 @@ typedef Elf32_Addr Elf32_Conflict;
+@@ -1780,16 +1780,24 @@
  #define R_PARISC_PCREL17F	12	/* 17 bits of rel. address.  */
  #define R_PARISC_PCREL14R	14	/* Right 14 bits of rel. address.  */
  #define R_PARISC_DPREL21L	18	/* Left 21 bits of rel. address.  */
@@ -777,7 +782,7 @@ Index: elfutils-0.155/libelf/elf.h
  #define R_PARISC_LTOFF_FPTR32	57	/* 32 bits LT-rel. function pointer. */
  #define R_PARISC_LTOFF_FPTR21L	58	/* LT-rel. fct ptr, left 21 bits. */
  #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
-@@ -1798,6 +1806,7 @@ typedef Elf32_Addr Elf32_Conflict;
+@@ -1798,6 +1806,7 @@
  #define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address.  */
  #define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address.  */
  #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
@@ -785,7 +790,7 @@ Index: elfutils-0.155/libelf/elf.h
  #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
  #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
  #define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
-@@ -1823,6 +1832,8 @@ typedef Elf32_Addr Elf32_Conflict;
+@@ -1823,6 +1832,8 @@
  #define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
  #define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
  #define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.155/m68k_backend.diff
index e9b5c40..79a8f0e 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.155/m68k_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/m68k_backend.diff
@@ -219,7 +219,7 @@ Index: elfutils-0.155/libelf/elf.h
 ===================================================================
 --- elfutils-0.155.orig/libelf/elf.h
 +++ elfutils-0.155/libelf/elf.h
-@@ -1126,6 +1126,9 @@ typedef struct
+@@ -1126,6 +1126,9 @@
  #define R_68K_GLOB_DAT	20		/* Create GOT entry */
  #define R_68K_JMP_SLOT	21		/* Create PLT entry */
  #define R_68K_RELATIVE	22		/* Adjust by program base */
@@ -233,7 +233,7 @@ Index: elfutils-0.155/backends/Makefile.am
 ===================================================================
 --- elfutils-0.155.orig/backends/Makefile.am
 +++ elfutils-0.155/backends/Makefile.am
-@@ -32,7 +32,7 @@ INCLUDES += -I$(top_srcdir)/libebl -I$(t
+@@ -32,12 +32,12 @@
  	   -I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
  
  
@@ -242,7 +242,13 @@ Index: elfutils-0.155/backends/Makefile.am
  libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a \
  	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a \
  	     libebl_sparc_pic.a libebl_ppc_pic.a libebl_ppc64_pic.a \
-@@ -111,6 +111,10 @@ mips_SRCS = mips_init.c mips_symbol.c mi
+ 	     libebl_s390_pic.a libebl_tilegx_pic.a libebl_parisc_pic.a \
+-	     libebl_mips_pic.a
++	     libebl_mips_pic.a libebl_m68k_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -112,6 +112,10 @@
  libebl_mips_pic_a_SOURCES = $(mips_SRCS)
  am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
  
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.155/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.155/mips_backend.diff
index 8e07c33..8fc06c5 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.155/mips_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.155/mips_backend.diff
@@ -645,7 +645,7 @@ Index: elfutils-0.155/libebl/eblopenbackend.c
 ===================================================================
 --- elfutils-0.155.orig/libebl/eblopenbackend.c
 +++ elfutils-0.155/libebl/eblopenbackend.c
-@@ -71,6 +71,8 @@ static const struct
+@@ -71,6 +71,8 @@
    { "sparc", "elf_sparc", "sparc", 5, EM_SPARC, 0, 0 },
    { "sparc", "elf_sparcv8plus", "sparc", 5, EM_SPARC32PLUS, 0, 0 },
    { "s390", "ebl_s390", "s390", 4, EM_S390, 0, 0 },
@@ -658,7 +658,7 @@ Index: elfutils-0.155/backends/common-reloc.c
 ===================================================================
 --- elfutils-0.155.orig/backends/common-reloc.c
 +++ elfutils-0.155/backends/common-reloc.c
-@@ -112,11 +112,13 @@ EBLHOOK(reloc_valid_use) (Elf *elf, int
+@@ -112,11 +112,13 @@
  }
  
  
@@ -672,7 +672,7 @@ Index: elfutils-0.155/backends/common-reloc.c
  
  bool
  EBLHOOK(none_reloc_p) (int reloc)
-@@ -138,7 +140,9 @@ EBLHOOK(init_reloc) (Ebl *ebl)
+@@ -138,7 +140,9 @@
    ebl->reloc_type_name = EBLHOOK(reloc_type_name);
    ebl->reloc_type_check = EBLHOOK(reloc_type_check);
    ebl->reloc_valid_use = EBLHOOK(reloc_valid_use);
@@ -686,7 +686,7 @@ Index: elfutils-0.155/backends/Makefile.am
 ===================================================================
 --- elfutils-0.155.orig/backends/Makefile.am
 +++ elfutils-0.155/backends/Makefile.am
-@@ -32,7 +32,7 @@ INCLUDES += -I$(top_srcdir)/libebl -I$(t
+@@ -32,11 +32,12 @@
  	   -I$(top_srcdir)/libelf -I$(top_srcdir)/libdw
  
  
@@ -695,7 +695,13 @@ Index: elfutils-0.155/backends/Makefile.am
  libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a \
  	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a \
  	     libebl_sparc_pic.a libebl_ppc_pic.a libebl_ppc64_pic.a \
-@@ -107,6 +107,10 @@ parisc_SRCS = parisc_init.c parisc_symbo
+-	     libebl_s390_pic.a libebl_tilegx_pic.a libebl_parisc_pic.a
++	     libebl_s390_pic.a libebl_tilegx_pic.a libebl_parisc_pic.a \
++	     libebl_mips_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -107,6 +108,10 @@
  libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
  am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
  
-- 
1.7.9.5


