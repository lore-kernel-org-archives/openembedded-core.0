Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A27D165E0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 17:28:18 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by fmsmga103.fm.intel.com with ESMTP; 17 Sep 2014 10:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,541,1406617200"; d="scan'208";a="478182442"
Received: from cfitzsim-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.123])
	by azsmga001.ch.intel.com with ESMTP; 17 Sep 2014 10:28:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Wed, 17 Sep 2014 18:28:17 +0100
Message-ID: <2371464.H1mKfG7UmT@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.16.2-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1406650385-23946-1-git-send-email-dwatkins@sierrawireless.com>
References: <1406650385-23946-1-git-send-email-dwatkins@sierrawireless.com>
MIME-Version: 1.0
Cc: Darcy Watkins <dwatkins@sierrawireless.com>
Subject: Re: [daisy][PATCH] binutils: Add fix for recent patch on older gcc
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
X-List-Received-Date: Wed, 17 Sep 2014 17:28:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 29 July 2014 09:13:05 Darcy Watkins wrote:
> From: Darcy Watkins <dwatkins>
> 
> The recent bintuils patch update breaks on older gccs such as CentOS 6.
> Backport a patch to address this.
> 
> (From master: 540b7a196a00c4dc1bf8f7c87e68e80ab310756e)
> (From OE-Core rev: 76f65e73081f52cea718ef164f9d1d7a5c65d537)
> 
> Signed-off-by: Darcy Watkins <dwatkins@sierrawireless.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.24.inc   |  1 +
>  .../binutils/binutils-uninitialised-warning.patch  | 50
> ++++++++++++++++++++++ 2 files changed, 51 insertions(+)
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/binutils-uninitialised-warning.patc
> h
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.24.inc
> b/meta/recipes-devtools/binutils/binutils-2.24.inc index ef6a4eb..8f3216f
> 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.24.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.24.inc
> @@ -31,6 +31,7 @@ SRC_URI = "\
>       file://fix-pr16428.patch \
>       file://replace_macros_with_static_inline.patch \
>       file://0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch
> \ +     file://binutils-uninitialised-warning.patch \
>       "
> 
>  SRC_URI[md5sum] = "e0f71a7b2ddab0f8612336ac81d9636b"
> diff --git
> a/meta/recipes-devtools/binutils/binutils/binutils-uninitialised-warning.pa
> tch
> b/meta/recipes-devtools/binutils/binutils/binutils-uninitialised-warning.pa
> tch new file mode 100644
> index 0000000..2feb80c
> --- /dev/null
> +++
> b/meta/recipes-devtools/binutils/binutils/binutils-uninitialised-warning.pa
> tch @@ -0,0 +1,50 @@
> +From f9c316c4d75be236bbaa8464ef803ed2d3859d6d Mon Sep 17 00:00:00 2001
> +From: H.J. Lu <hjl.tools@gmail.com>
> +Date: Wed, 15 Jan 2014 07:43:19 -0800
> +Subject: [PATCH 1/1] Silence uninitialized warning on ehdr_start_save
> +
> +Older GCC, like 4.1/4.2, will issue an uninitialized warning on
> +ehdr_start_save.  This patch silences by using
> +
> +struct bfd_link_hash_entry ehdr_start_save = ehdr_start_save;
> +
> +	* emultempl/elf32.em (gld${EMULATION_NAME}_before_allocation):
> +	Silence uninitialized warning on ehdr_start_save with older
> +	GCC.
> +
> +Upstream-Status: Backport
> +---
> + ld/ChangeLog          |    6 ++++++
> + ld/emultempl/elf32.em |    2 +-
> + 2 files changed, 7 insertions(+), 1 deletions(-)
> +
> +#diff --git a/ld/ChangeLog b/ld/ChangeLog
> +#index eaa6b93..91055de 100644
> +#--- a/ld/ChangeLog
> +#+++ b/ld/ChangeLog
> +#@@ -1,3 +1,9 @@
> +#+2014-01-15  H.J. Lu  <hongjiu.lu@intel.com>
> +#+
> +#+	* emultempl/elf32.em (gld${EMULATION_NAME}_before_allocation):
> +#+	Silence uninitialized warning on ehdr_start_save with older
> +#+	GCC.
> +#+
> +# 2014-01-15  Alan Modra  <amodra@gmail.com>
> +#
> +# 	* emultempl/elf32.em (gld${EMULATION_NAME}_before_allocation): Define
> +diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
> +index 13f86f0..569c7f7 100644
> +--- a/ld/emultempl/elf32.em
> ++++ b/ld/emultempl/elf32.em
> +@@ -1481,7 +1481,7 @@ gld${EMULATION_NAME}_before_allocation (void)
> +   asection *sinterp;
> +   bfd *abfd;
> +   struct elf_link_hash_entry *ehdr_start = NULL;
> +-  struct bfd_link_hash_entry ehdr_start_save;
> ++  struct bfd_link_hash_entry ehdr_start_save = ehdr_start_save;
> +
> +   if (is_elf_hash_table (link_info.hash))
> +     {
> +--
> +1.7.1
> +

ping - I can confirm the issue on CentOS 6 with daisy and that this patch (or 
at least the master patch cherry-picked) fixes it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

