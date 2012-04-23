Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SMLUI-0006Vo-5i
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 17:47:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Apr 2012 08:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="132878712"
Received: from unknown (HELO envy.home) ([10.7.199.64])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2012 08:37:45 -0700
Message-ID: <4F95772B.2080007@linux.intel.com>
Date: Mon, 23 Apr 2012 08:37:15 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334872962.3028.2.camel@ted>
In-Reply-To: <1334872962.3028.2.camel@ted>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH] bootimg.bbclass: Tweak iso images to become hybrid images
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
X-List-Received-Date: Mon, 23 Apr 2012 15:47:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/19/2012 03:02 PM, Richard Purdie wrote:
> From: Damien Lespiau <damien.lespiau@intel.com>
> 
> This allows iso images to be written to usb keys and booted on systems which
> have a BIOS which support this. There is no real down side to tweaking the iso
> images in this way.

I like the idea, but there does appear to be one potential downside.
From the syslinux isolinux.txt documentation:

"The ISO 9660 filesystem is encapsulated in a partition (which starts
at offset zero, which may confuse some systems.)"

How many different systems and firmware has this been tested on?

I think it is a worthwhile patch, but we should be aware of the above in
case a regression is reported. In such an event, it seems a
NO_ISO_HYBRID flag could be set by the machine.conf to revert to the
older behavior.

--
Darren

> 
> [YOCTO #1763 partial]
> 
> Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index f4981d8..370b378 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -103,6 +103,8 @@ build_iso() {
>  			-r ${ISODIR}
>  	fi
>  
> +	isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
> +
>  	cd ${DEPLOY_DIR_IMAGE}
>  	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
>  	ln -s ${IMAGE_NAME}.iso ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


