Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7532571A31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 09:27:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 26 Oct 2016 02:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="894118908"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 26 Oct 2016 02:27:21 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 934496A4006;
	Wed, 26 Oct 2016 02:26:46 -0700 (PDT)
Date: Wed, 26 Oct 2016 12:27:15 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20161026092715.GA2297@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20161026015017.13160-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161026015017.13160-1-raj.khem@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: Add dosfstools-native mtools-native to dependencies
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
X-List-Received-Date: Wed, 26 Oct 2016 09:27:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Tue, Oct 25, 2016 at 06:50:17PM -0700, Khem Raj wrote:
> these tools are needed for building wic images for some
> boards e.g. overo/gumstix
NAK

Usage of native tools depends on .wks content: modules, partition types,
etc. Your change will cause unnecessary build activity for some
machines/wks files where those tools are not used.

I'd suggest to put these dependencies to board-dependent meta.
Please, look how it's done for genericx86, beaglebone and edgerouter:
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto-bsp/conf/machine/beaglebone.conf
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto-bsp/conf/machine/edgerouter.conf

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/image_types.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index a7fffbc..be7e38c 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -298,7 +298,7 @@ IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
>  IMAGE_DEPENDS_ubi = "mtd-utils-native"
>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>  IMAGE_DEPENDS_multiubi = "mtd-utils-native"
> -IMAGE_DEPENDS_wic = "parted-native"
> +IMAGE_DEPENDS_wic = "parted-native dosfstools-native mtools-native"
>  
>  # This variable is available to request which values are suitable for IMAGE_FSTYPES
>  IMAGE_TYPES = " \
> -- 
> 2.10.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Regards,
Ed

