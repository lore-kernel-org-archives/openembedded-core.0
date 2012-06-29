Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkfS9-0006E4-KW
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 19:57:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Jun 2012 10:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117441751"
Received: from unknown (HELO envy.home) ([10.255.13.25])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Jun 2012 10:47:00 -0700
Message-ID: <4FEDE9B8.8010605@linux.intel.com>
Date: Fri, 29 Jun 2012 10:45:28 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340396533-5386-2-git-send-email-ray.danks@se-eng.com>
	<1340984497-32423-1-git-send-email-ray.danks@se-eng.com>
In-Reply-To: <1340984497-32423-1-git-send-email-ray.danks@se-eng.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [PATCH 1/2 v2] image_types: Add elf image type
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 17:57:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/29/2012 08:41 AM, Raymond Danks wrote:
> On x86, an ELF image file may be stored as a coreboot payload.
> The image file is constructed, using the mkelfimage utility,
> from a kernel and an initrd.
> 
> Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
> ---
> This was originally submitted to the openembedded project:
> http://patches.openembedded.org/patch/7689/
> 
> v2:
>  Include KERNEL_IMAGETYPE for location of ELF_KERNEL
> 
>  meta/classes/image_types.bbclass |   18 +++++++++++++++++-
>  1 files changed, 17 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 55f122e..12419f4 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -7,6 +7,12 @@ def get_imagecmds(d):
>      ctypes = d.getVar('COMPRESSIONTYPES', True).split()
>      cimages = {}
>  
> +    if "elf" in alltypes:
> +        alltypes.remove("elf")
> +        if "cpio.gz" not in alltypes:
> +                alltypes.append("cpio.gz")
> +        alltypes.append("elf")
> +
>      # Filter out all the compressed images from types
>      for type in alltypes:
>          basetype = None
> @@ -173,6 +179,14 @@ IMAGE_CMD_cpio () {
>  	cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>  }
>  
> +ELF_KERNEL ?= ${STAGING_DIR_HOST}/kernel/${KERNEL_IMAGETYPE}

This should be ${STAGING_KERNEL_DIR} I believe. I have a patch series
under review currently which would break the above as it is now in
/usr/src/kernel-headers

Note that you could also collect this from the DEPLOY_DIR_IMAGE, which
is probably more appropriate for assembling images

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




