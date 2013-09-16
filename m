Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 145E060F28
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 17:24:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2013 10:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,917,1371106800"; d="scan'208";a="379036062"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.128]) ([10.7.201.128])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2013 10:24:29 -0700
Message-ID: <1379352268.1285.149.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Mon, 16 Sep 2013 10:24:28 -0700
In-Reply-To: <1379117343-29877-4-git-send-email-jason.wessel@windriver.com>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
	<1379117343-29877-4-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 3/7] grub-efi-native: Add support for EFI ISO images
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
X-List-Received-Date: Mon, 16 Sep 2013 17:24:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-13 at 19:08 -0500, Jason Wessel wrote:
> The iso9660 file system support needs to be added to grub in order to
> be able to correctly find the grub.cfg.  The grub commands to locate
> the grub.cfg also needs to be encoded into grub's default
> configuration.
> 
> This change allows the resulting grub binary to work both in the hard
> drive / USB boot case or the optical media boot case.
> 
> [YOCTO #4100]
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>


Reviewed-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/recipes-bsp/grub/files/cfg               |    2 ++
>  meta/recipes-bsp/grub/grub-efi-native_2.00.bb |    7 +++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-bsp/grub/files/cfg
> 
> diff --git a/meta/recipes-bsp/grub/files/cfg b/meta/recipes-bsp/grub/files/cfg
> new file mode 100644
> index 0000000..ffffe47
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/cfg
> @@ -0,0 +1,2 @@
> +search.file /EFI/BOOT/grub.cfg root
> +set prefix=($root)/EFI/BOOT
> diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> index 2d3d68a..04973b5 100644
> --- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> @@ -23,6 +23,7 @@ PR = "r2"
>  PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
>  
>  SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
> +           file://cfg \
>             file://grub-2.00-fpmath-sse-387-fix.patch \
>             file://grub-2.00-fix-enable_execute_stack-check.patch \
>             file://grub-2.00-disable-help2man.patch \
> @@ -66,9 +67,11 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
>                  --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
>  
>  do_mkimage() {
> -	./grub-mkimage -p /EFI/BOOT -d ./grub-core/ \
> +	# Search for the grub.cfg on the local boot media by using the
> +	# built in cfg file provided via this recipe
> +	./grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
>  	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
> -	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop
> +	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search
>  }
>  addtask mkimage after do_compile before do_install
>  

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



