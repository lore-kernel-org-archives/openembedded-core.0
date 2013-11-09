Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD766D132
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 07:56:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA97uPY7026176
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 23:56:25 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 23:56:24 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Nov 2013 15:56:20 +0800
Message-ID: <bf046fb4257653b95134c99caaef12ece5d7e424.1383982908.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1383982908.git.jackie.huang@windriver.com>
References: <cover.1383982908.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [v2 PATCH 2/2] grub-efi: allow compilation without large model support
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
X-List-Received-Date: Sat, 09 Nov 2013 07:56:22 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

-mcmodel=large is not supported by gcc with version lower
than 4.4, but we don't need to use memory over 4GiB, so add
a patch to allow compilation without large model support.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...allow-a-compilation-without-mcmodel-large.patch | 69 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi.inc                 |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch

diff --git a/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
new file mode 100644
index 0000000..b2be74a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
@@ -0,0 +1,69 @@
+From 0cea0e4266214da1f11e812834f5d5c47a6e04e6 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Tue, 5 Nov 2013 07:23:32 -0500
+Subject: [PATCH] Allow a compilation without -mcmodel=large
+
+* kern/efi/mm.c (grub_efi_allocate_pages): don't allocate >4GiB
+  when compiled without -mcmodel=large
+  (filter_memory_map): remove memory post 4 GiB when compiled
+  without -mcmodel=large
+* configure.ac: add -DMCMODEL_SMALL=1 to TARGET_CFLAGS when
+  -mcmodel=large isn't supported
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac            |    4 +++-
+ grub-core/kern/efi/mm.c |    6 +++---
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 319d063..ee72fee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -567,7 +567,9 @@ if test "$target_cpu"-"$platform" = x86_64-efi; then
+ 		      [grub_cv_cc_mcmodel=no])
+   ])
+   if test "x$grub_cv_cc_mcmodel" = xno; then
+-    AC_MSG_ERROR([-mcmodel=large not supported. Upgrade your gcc.])
++    CFLAGS="$SAVED_CFLAGS -m64 -DMCMODEL_SMALL=1"
++    TARGET_CFLAGS="$TARGET_CFLAGS -DMCMODEL_SMALL=1"
++    AC_MSG_WARN([-mcmodel=large not supported. You won't be able to use the memory over 4GiB. Upgrade your gcc.])
+   else
+     TARGET_CFLAGS="$TARGET_CFLAGS -mcmodel=large"
+   fi
+diff --git a/grub-core/kern/efi/mm.c b/grub-core/kern/efi/mm.c
+index a2edc84..c67dd13 100644
+--- a/grub-core/kern/efi/mm.c
++++ b/grub-core/kern/efi/mm.c
+@@ -62,7 +62,7 @@ grub_efi_allocate_pages (grub_efi_physical_address_t address,
+     return 0;
+ #endif
+
+-#if 1
++#if defined (MCMODEL_SMALL)
+   if (address == 0)
+     {
+       type = GRUB_EFI_ALLOCATE_MAX_ADDRESS;
+@@ -305,7 +305,7 @@ filter_memory_map (grub_efi_memory_descriptor_t *memory_map,
+        desc = NEXT_MEMORY_DESCRIPTOR (desc, desc_size))
+     {
+       if (desc->type == GRUB_EFI_CONVENTIONAL_MEMORY
+-#if 1
++#if defined (MCMODEL_SMALL)
+ 	  && desc->physical_start <= 0xffffffff
+ #endif
+ 	  && desc->physical_start + PAGES_TO_BYTES (desc->num_pages) > 0x100000
+@@ -321,7 +321,7 @@ filter_memory_map (grub_efi_memory_descriptor_t *memory_map,
+ 	      desc->physical_start = 0x100000;
+ 	    }
+
+-#if 1
++#if defined (MCMODEL_SMALL)
+ 	  if (BYTES_TO_PAGES (filtered_desc->physical_start)
+ 	      + filtered_desc->num_pages
+ 	      > BYTES_TO_PAGES (0x100000000LL))
+--
+1.7.1
+
diff --git a/meta/recipes-bsp/grub/grub-efi.inc b/meta/recipes-bsp/grub/grub-efi.inc
index 1c64646..e452167 100644
--- a/meta/recipes-bsp/grub/grub-efi.inc
+++ b/meta/recipes-bsp/grub/grub-efi.inc
@@ -26,6 +26,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://grub-no-unused-result.patch \
            file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
            file://fix-issue-with-flex-2.5.37.patch \
+           file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
           "
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
 SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
-- 
1.8.3


