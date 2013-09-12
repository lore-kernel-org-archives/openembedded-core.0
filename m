Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C90F76BE11
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 17:48:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Sep 2013 10:45:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,891,1371106800"; d="scan'208";a="402459056"
Received: from unknown (HELO [10.255.14.117]) ([10.255.14.117])
	by orsmga002.jf.intel.com with ESMTP; 12 Sep 2013 10:48:29 -0700
Message-ID: <1379008109.1285.13.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Thu, 12 Sep 2013 10:48:29 -0700
In-Reply-To: <1379006387-20186-4-git-send-email-jason.wessel@windriver.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
	<1379006387-20186-4-git-send-email-jason.wessel@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] grub-efi-native: Add support for EFI ISO images
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
X-List-Received-Date: Thu, 12 Sep 2013 17:48:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-12 at 12:19 -0500, Jason Wessel wrote:
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
> ---
>  meta/recipes-bsp/grub/grub-efi-native_2.00.bb |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> index 2d3d68a..3cff838 100644
> --- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
> @@ -66,9 +66,13 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
>                  --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
>  
>  do_mkimage() {
> -	./grub-mkimage -p /EFI/BOOT -d ./grub-core/ \
> +	# Search for the grub.cfg on the local boot media with built in config file
> +	echo 'search.file /EFI/BOOT/grub.cfg root' > cfg\
> +	echo 'set prefix=($root)/EFI/BOOT' >> cfg

Hrm, I think adding a cfg as a file via the SRC_URI would be preferable
to dynamically creating it every time. This would make it easier to
modify the config in the future.

Otherwise, looks good. 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



