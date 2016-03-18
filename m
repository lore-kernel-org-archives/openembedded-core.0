Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 57E3A605BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 18:00:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 18 Mar 2016 11:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,356,1455004800"; d="scan'208";a="69137824"
Received: from skkumar1-mobl.amr.corp.intel.com (HELO [10.254.182.123])
	([10.254.182.123])
	by fmsmga004.fm.intel.com with ESMTP; 18 Mar 2016 11:00:09 -0700
To: "Randle, William C" <william.c.randle@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1458264628.9397.10.camel@intel.com>
From: "Lopez, Mariano" <mariano.lopez@linux.intel.com>
Message-ID: <56EC4228.5040700@linux.intel.com>
Date: Fri, 18 Mar 2016 12:00:08 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1458264628.9397.10.camel@intel.com>
Subject: Re: [PATCH v2] grub: add -Wno-error=trampolines to native CFLAGS
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
X-List-Received-Date: Fri, 18 Mar 2016 18:00:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/17/2016 7:30 PM, Randle, William C wrote:
> Previous patch was not against master. Updated against master branch.
>
> Fixes YOCTO 9201
> Adds -Wno-error=trampolines to native CFLAGS prevent multiple compile
> errors when using gcc 5.3.0 for gentoo.
>
> Signed-off-by: Bill Randle <william.c.randle@intel.com>
> ---
>   meta/recipes-bsp/grub/grub-efi_2.00.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> index 4e80e18..ca73234 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
> @@ -35,6 +35,10 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
>   
>   EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile ac_cv_sizeof_off_t=8', '--disable-largefile', d)}"
>   
> +# ldm.c:114:7: error: trampoline generated for nested function 'hook' [-Werror=trampolines]
> +# and many other places in the grub code when compiled with some native gcc 5.3 compilers
> +CFLAGS_append_class-native = " -Wno-error=trampolines"
> +
>   do_install_class-native() {
>      install -d ${D}${bindir}
>      install -m 755 grub-mkimage ${D}${bindir}
> --
> 2.5.0

I'm a gentoo user and I have the trampoline issue with gcc 4.9.3. I just 
tested this patch in gentoo and it works, I can remove my bbappend file 
from my personal layer!

Mariano

