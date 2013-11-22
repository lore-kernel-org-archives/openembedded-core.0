Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD8EF6CEF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 03:37:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAM3bOTn014306
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 19:37:25 -0800 (PST)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 21 Nov 2013 19:37:24 -0800
Message-ID: <528ED172.3020702@windriver.com>
Date: Fri, 22 Nov 2013 11:37:22 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1384854113.git.jackie.huang@windriver.com>
	<60e1553243c2b4d99fcb18246b516c1b4e03e2e9.1384854113.git.jackie.huang@windriver.com>
	<1385088545.3614.28.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1385088545.3614.28.camel@dvhart-mobl4.amr.corp.intel.com>
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
X-List-Received-Date: Fri, 22 Nov 2013 03:37:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/22/2013 10:49 AM, Darren Hart wrote:
> On Wed, 2013-11-20 at 09:40 +0800, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> -mcmodel=large is not supported by gcc with version lower
>> than 4.4, but we don't need to use memory over 4GiB, so add
>> a patch to allow compilation without large model support.
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   ...allow-a-compilation-without-mcmodel-large.patch | 69 ++++++++++++++++++++++
>>   meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
>>   2 files changed, 70 insertions(+)
>>   create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
>>
>> diff --git a/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
>> new file mode 100644
>> index 0000000..b2be74a
>> --- /dev/null
>> +++ b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
>> @@ -0,0 +1,69 @@
>> +From 0cea0e4266214da1f11e812834f5d5c47a6e04e6 Mon Sep 17 00:00:00 2001
>> +From: Jackie Huang <jackie.huang@windriver.com>
>> +Date: Tue, 5 Nov 2013 07:23:32 -0500
>> +Subject: [PATCH] Allow a compilation without -mcmodel=large
>> +
>> +* kern/efi/mm.c (grub_efi_allocate_pages): don't allocate >4GiB
>> +  when compiled without -mcmodel=large
>> +  (filter_memory_map): remove memory post 4 GiB when compiled
>> +  without -mcmodel=large
>> +* configure.ac: add -DMCMODEL_SMALL=1 to TARGET_CFLAGS when
>> +  -mcmodel=large isn't supported
>> +
>> +Upstream-Status: Inappropriate [configuration]
>
> Nice try ;-) This is compatibility, not configuration. If grub-efi
> maintainers refuse to accept the patch that's up to them, but we need to

Actually it's ported from old version of grub which means that they 
allowed the comilation without large model support before, but not now. 
 From the Changelog, it was added in 2009:

2009-06-04  Vladimir Serbinenko  <phcoder@gmail.com>

         Allow a compilation without -mcmodel=large

         * kern/efi/mm.c (grub_efi_allocate_pages): don't allocate >4GiB
         when compiled without -mcmodel=large
         (filter_memory_map): remove memory post 4 GiB when compiled
         without -mcmodel=large
         * configure.ac: fail gracefully and add -DMCMODEL_SMALL=1 to
         TARGET_CFLAGS when -mcmodel=large isn't supported

but it was removed in 2010:
2010-04-21  Vladimir Serbinenko  <phcoder@gmail.com>

         * configure.ac: Refuse to compile for x86_64-efi is mcmodel=large
         is not supported.

So I think they may not accept this patch again.

Thanks,
Jackie

> work upstream first. Please prepare a patch for upstream and submit it
> for review.
>
> --
> Darren
>
>> +
>> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> +---
>> + configure.ac            |    4 +++-
>> + grub-core/kern/efi/mm.c |    6 +++---
>> + 2 files changed, 6 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 319d063..ee72fee 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -567,7 +567,9 @@ if test "$target_cpu"-"$platform" = x86_64-efi; then
>> + 		      [grub_cv_cc_mcmodel=no])
>> +   ])
>> +   if test "x$grub_cv_cc_mcmodel" = xno; then
>> +-    AC_MSG_ERROR([-mcmodel=large not supported. Upgrade your gcc.])
>> ++    CFLAGS="$SAVED_CFLAGS -m64 -DMCMODEL_SMALL=1"
>> ++    TARGET_CFLAGS="$TARGET_CFLAGS -DMCMODEL_SMALL=1"
>> ++    AC_MSG_WARN([-mcmodel=large not supported. You won't be able to use the memory over 4GiB. Upgrade your gcc.])
>> +   else
>> +     TARGET_CFLAGS="$TARGET_CFLAGS -mcmodel=large"
>> +   fi
>> +diff --git a/grub-core/kern/efi/mm.c b/grub-core/kern/efi/mm.c
>> +index a2edc84..c67dd13 100644
>> +--- a/grub-core/kern/efi/mm.c
>> ++++ b/grub-core/kern/efi/mm.c
>> +@@ -62,7 +62,7 @@ grub_efi_allocate_pages (grub_efi_physical_address_t address,
>> +     return 0;
>> + #endif
>> +
>> +-#if 1
>> ++#if defined (MCMODEL_SMALL)
>> +   if (address == 0)
>> +     {
>> +       type = GRUB_EFI_ALLOCATE_MAX_ADDRESS;
>> +@@ -305,7 +305,7 @@ filter_memory_map (grub_efi_memory_descriptor_t *memory_map,
>> +        desc = NEXT_MEMORY_DESCRIPTOR (desc, desc_size))
>> +     {
>> +       if (desc->type == GRUB_EFI_CONVENTIONAL_MEMORY
>> +-#if 1
>> ++#if defined (MCMODEL_SMALL)
>> + 	  && desc->physical_start <= 0xffffffff
>> + #endif
>> + 	  && desc->physical_start + PAGES_TO_BYTES (desc->num_pages) > 0x100000
>> +@@ -321,7 +321,7 @@ filter_memory_map (grub_efi_memory_descriptor_t *memory_map,
>> + 	      desc->physical_start = 0x100000;
>> + 	    }
>> +
>> +-#if 1
>> ++#if defined (MCMODEL_SMALL)
>> + 	  if (BYTES_TO_PAGES (filtered_desc->physical_start)
>> + 	      + filtered_desc->num_pages
>> + 	      > BYTES_TO_PAGES (0x100000000LL))
>> +--
>> +1.7.1
>> +
>> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> index 2fe688c..deb9514 100644
>> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> @@ -27,6 +27,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>>              file://grub-no-unused-result.patch \
>>              file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
>>              file://fix-issue-with-flex-2.5.37.patch \
>> +           file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
>>             "
>>   SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
>>   SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

