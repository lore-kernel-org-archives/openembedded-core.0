Return-Path: <dvhart@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9796D782
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 02:49:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2013 18:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,749,1378882800"; d="scan'208";a="437736132"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2013 18:49:06 -0800
Message-ID: <1385088545.3614.28.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: jackie.huang@windriver.com
Date: Thu, 21 Nov 2013 18:49:05 -0800
In-Reply-To: <60e1553243c2b4d99fcb18246b516c1b4e03e2e9.1384854113.git.jackie.huang@windriver.com>
References: <cover.1384854113.git.jackie.huang@windriver.com>
	<60e1553243c2b4d99fcb18246b516c1b4e03e2e9.1384854113.git.jackie.huang@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] grub-efi: allow compilation without large model support
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
X-List-Received-Date: Fri, 22 Nov 2013 02:49:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-20 at 09:40 +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> -mcmodel=large is not supported by gcc with version lower
> than 4.4, but we don't need to use memory over 4GiB, so add
> a patch to allow compilation without large model support.
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  ...allow-a-compilation-without-mcmodel-large.patch | 69 ++++++++++++++++++++++
>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
>  2 files changed, 70 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
> 
> diff --git a/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
> new file mode 100644
> index 0000000..b2be74a
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
> @@ -0,0 +1,69 @@
> +From 0cea0e4266214da1f11e812834f5d5c47a6e04e6 Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Tue, 5 Nov 2013 07:23:32 -0500
> +Subject: [PATCH] Allow a compilation without -mcmodel=large
> +
> +* kern/efi/mm.c (grub_efi_allocate_pages): don't allocate >4GiB
> +  when compiled without -mcmodel=large
> +  (filter_memory_map): remove memory post 4 GiB when compiled
> +  without -mcmodel=large
> +* configure.ac: add -DMCMODEL_SMALL=1 to TARGET_CFLAGS when
> +  -mcmodel=large isn't supported
> +
> +Upstream-Status: Inappropriate [configuration]

Nice try ;-) This is compatibility, not configuration. If grub-efi
maintainers refuse to accept the patch that's up to them, but we need to
work upstream first. Please prepare a patch for upstream and submit it
for review.

--
Darren

> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + configure.ac            |    4 +++-
> + grub-core/kern/efi/mm.c |    6 +++---
> + 2 files changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 319d063..ee72fee 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -567,7 +567,9 @@ if test "$target_cpu"-"$platform" = x86_64-efi; then
> + 		      [grub_cv_cc_mcmodel=no])
> +   ])
> +   if test "x$grub_cv_cc_mcmodel" = xno; then
> +-    AC_MSG_ERROR([-mcmodel=large not supported. Upgrade your gcc.])
> ++    CFLAGS="$SAVED_CFLAGS -m64 -DMCMODEL_SMALL=1"
> ++    TARGET_CFLAGS="$TARGET_CFLAGS -DMCMODEL_SMALL=1"
> ++    AC_MSG_WARN([-mcmodel=large not supported. You won't be able to use the memory over 4GiB. Upgrade your gcc.])
> +   else
> +     TARGET_CFLAGS="$TARGET_CFLAGS -mcmodel=large"
> +   fi
> +diff --git a/grub-core/kern/efi/mm.c b/grub-core/kern/efi/mm.c
> +index a2edc84..c67dd13 100644
> +--- a/grub-core/kern/efi/mm.c
> ++++ b/grub-core/kern/efi/mm.c
> +@@ -62,7 +62,7 @@ grub_efi_allocate_pages (grub_efi_physical_address_t address,
> +     return 0;
> + #endif
> +
> +-#if 1
> ++#if defined (MCMODEL_SMALL)
> +   if (address == 0)
> +     {
> +       type = GRUB_EFI_ALLOCATE_MAX_ADDRESS;
> +@@ -305,7 +305,7 @@ filter_memory_map (grub_efi_memory_descriptor_t *memory_map,
> +        desc = NEXT_MEMORY_DESCRIPTOR (desc, desc_size))
> +     {
> +       if (desc->type == GRUB_EFI_CONVENTIONAL_MEMORY
> +-#if 1
> ++#if defined (MCMODEL_SMALL)
> + 	  && desc->physical_start <= 0xffffffff
> + #endif
> + 	  && desc->physical_start + PAGES_TO_BYTES (desc->num_pages) > 0x100000
> +@@ -321,7 +321,7 @@ filter_memory_map (grub_efi_memory_descriptor_t *memory_map,
> + 	      desc->physical_start = 0x100000;
> + 	    }
> +
> +-#if 1
> ++#if defined (MCMODEL_SMALL)
> + 	  if (BYTES_TO_PAGES (filtered_desc->physical_start)
> + 	      + filtered_desc->num_pages
> + 	      > BYTES_TO_PAGES (0x100000000LL))
> +--
> +1.7.1
> +
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> index 2fe688c..deb9514 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> @@ -27,6 +27,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>             file://grub-no-unused-result.patch \
>             file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
>             file://fix-issue-with-flex-2.5.37.patch \
> +           file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
>            "
>  SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
>  SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



