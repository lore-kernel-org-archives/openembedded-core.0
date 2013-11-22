Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 217596DBEA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:01:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAMA16xQ015444
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Nov 2013 02:01:06 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 22 Nov 2013 02:01:04 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Nov 2013 18:00:59 +0800
Message-ID: <ad8e0d90b31413651a29270546493a6b3ce32865.1385113330.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1385113330.git.jackie.huang@windriver.com>
References: <cover.1385113330.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: phcoder@gmail.com, dvhart@linux.intel.com
Subject: [PATCH 2/2] grub-efi: allow compilation without large model support
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
X-List-Received-Date: Fri, 22 Nov 2013 10:01:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

-mcmodel=large is not supported by gcc with version lower
than 4.4, but we don't need to use memory over 4GiB, so add
a patch to allow compilation without large model support.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...allow-a-compilation-without-mcmodel-large.patch | 141 +++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch

diff --git a/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
new file mode 100644
index 0000000..b4b948f
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
@@ -0,0 +1,141 @@
+Allow a compilation without -mcmodel=large
+
+It's provided by Vladimir Serbinenko, and it's not going to
+upstream since this was deliberately removed in current
+and newer version:
+
+2009-06-04  Vladimir Serbinenko  <phcoder@gmail.com>
+
+         Allow a compilation without -mcmodel=large
+
+2010-04-21  Vladimir Serbinenko  <phcoder@gmail.com>
+
+   * configure.ac: Refuse to compile for x86_64-efi is mcmodel=large
+     is not supported.
+
+Upstream-Status: Inappropriate [compatibility]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+--
+diff --git a/configure.ac b/configure.ac
+index 9f8fb8a..2c5e6ed 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -723,9 +723,7 @@ if test "$target_cpu" = x86_64; then
+ 		      [grub_cv_cc_mcmodel=yes],
+ 		      [grub_cv_cc_mcmodel=no])
+   ])
+-  if test "x$grub_cv_cc_mcmodel" = xno; then
+-    AC_MSG_ERROR([-mcmodel=large not supported. Upgrade your gcc.])
+-  else
++  if test "x$grub_cv_cc_mcmodel" = xyes; then
+     TARGET_CFLAGS="$TARGET_CFLAGS -mcmodel=large"
+   fi
+ fi
+diff --git a/grub-core/kern/efi/mm.c b/grub-core/kern/efi/mm.c
+index 1409b5d..6e9dace 100644
+--- a/grub-core/kern/efi/mm.c
++++ b/grub-core/kern/efi/mm.c
+@@ -32,6 +32,12 @@
+ #define BYTES_TO_PAGES(bytes)	(((bytes) + 0xfff) >> 12)
+ #define PAGES_TO_BYTES(pages)	((pages) << 12)
+
++#if defined (__code_model_large__) || !defined (__x86_64__)
++#define MAX_USABLE_ADDRESS 0xffffffff
++#else
++#define MAX_USABLE_ADDRESS 0x7fffffff
++#endif
++
+ /* The size of a memory map obtained from the firmware. This must be
+    a multiplier of 4KB.  */
+ #define MEMORY_MAP_SIZE	0x3000
+@@ -58,7 +64,7 @@ grub_efi_allocate_pages (grub_efi_physical_address_t address,
+
+ #if 1
+   /* Limit the memory access to less than 4GB for 32-bit platforms.  */
+-  if (address > 0xffffffff)
++  if (address > MAX_USABLE_ADDRESS)
+     return 0;
+ #endif
+
+@@ -66,7 +72,7 @@ grub_efi_allocate_pages (grub_efi_physical_address_t address,
+   if (address == 0)
+     {
+       type = GRUB_EFI_ALLOCATE_MAX_ADDRESS;
+-      address = 0xffffffff;
++      address = MAX_USABLE_ADDRESS;
+     }
+   else
+     type = GRUB_EFI_ALLOCATE_ADDRESS;
+@@ -86,7 +92,7 @@ grub_efi_allocate_pages (grub_efi_physical_address_t address,
+     {
+       /* Uggh, the address 0 was allocated... This is too annoying,
+ 	 so reallocate another one.  */
+-      address = 0xffffffff;
++      address = MAX_USABLE_ADDRESS;
+       status = efi_call_4 (b->allocate_pages, type, GRUB_EFI_LOADER_DATA, pages, &address);
+       grub_efi_free_pages (0, pages);
+       if (status != GRUB_EFI_SUCCESS)
+@@ -319,7 +325,7 @@ filter_memory_map (grub_efi_memory_descriptor_t *memory_map,
+     {
+       if (desc->type == GRUB_EFI_CONVENTIONAL_MEMORY
+ #if 1
+-	  && desc->physical_start <= 0xffffffff
++	  && desc->physical_start <= MAX_USABLE_ADDRESS
+ #endif
+ 	  && desc->physical_start + PAGES_TO_BYTES (desc->num_pages) > 0x100000
+ 	  && desc->num_pages != 0)
+@@ -337,9 +343,9 @@ filter_memory_map (grub_efi_memory_descriptor_t *memory_map,
+ #if 1
+ 	  if (BYTES_TO_PAGES (filtered_desc->physical_start)
+ 	      + filtered_desc->num_pages
+-	      > BYTES_TO_PAGES (0x100000000LL))
++	      > BYTES_TO_PAGES (MAX_USABLE_ADDRESS+1LL))
+ 	    filtered_desc->num_pages
+-	      = (BYTES_TO_PAGES (0x100000000LL)
++	      = (BYTES_TO_PAGES (MAX_USABLE_ADDRESS+1LL)
+ 		 - BYTES_TO_PAGES (filtered_desc->physical_start));
+ #endif
+
+diff --git a/grub-core/kern/x86_64/dl.c b/grub-core/kern/x86_64/dl.c
+index 65f09ef..17c1215 100644
+--- a/grub-core/kern/x86_64/dl.c
++++ b/grub-core/kern/x86_64/dl.c
+@@ -100,14 +100,32 @@ grub_arch_dl_relocate_symbols (grub_dl_t mod, void *ehdr)
+ 		    break;
+
+ 		  case R_X86_64_PC32:
+-		    *addr32 += rel->r_addend + sym->st_value -
+-		              (Elf64_Xword) seg->addr - rel->r_offset;
++		    {
++		      grub_int64_t value;
++		      value = ((grub_int32_t) *addr32) + rel->r_addend + sym->st_value -
++			(Elf64_Xword) seg->addr - rel->r_offset;
++		      if (value != (grub_int32_t) value)
++			return grub_error (GRUB_ERR_BAD_MODULE, "relocation out of range");
++		      *addr32 = value;
++		    }
+ 		    break;
+
+                   case R_X86_64_32:
++		    {
++		      grub_uint64_t value = *addr32 + rel->r_addend + sym->st_value;
++		      if (value != (grub_uint32_t) value)
++			return grub_error (GRUB_ERR_BAD_MODULE, "relocation out of range");
++		      *addr32 = value;
++		    }
++		    break;
+                   case R_X86_64_32S:
+-                    *addr32 += rel->r_addend + sym->st_value;
+-                    break;
++		    {
++		      grub_int64_t value = ((grub_int32_t) *addr32) + rel->r_addend + sym->st_value;
++		      if (value != (grub_int32_t) value)
++			return grub_error (GRUB_ERR_BAD_MODULE, "relocation out of range");
++		      *addr32 = value;
++		    }
++		    break;
+
+ 		  default:
+ 		    return grub_error (GRUB_ERR_NOT_IMPLEMENTED_YET,
diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 2fe688c..deb9514 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -27,6 +27,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://grub-no-unused-result.patch \
            file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
            file://fix-issue-with-flex-2.5.37.patch \
+           file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
           "
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
 SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
-- 
1.8.3


