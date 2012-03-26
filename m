Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SCEmK-0004Ff-D6
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 20:36:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Mar 2012 11:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="125294166"
Received: from unknown (HELO envy.home) ([10.7.199.147])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2012 11:27:27 -0700
Message-ID: <4F70B4E3.700@linux.intel.com>
Date: Mon, 26 Mar 2012 11:26:43 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332744104.git.sgw@linux.intel.com>
	<364f6a61d06cecb52e21639dc69f292a4b8a3591.1332744104.git.sgw@linux.intel.com>
In-Reply-To: <364f6a61d06cecb52e21639dc69f292a4b8a3591.1332744104.git.sgw@linux.intel.com>
X-Enigmail-Version: 1.4
Subject: Re: [Build App RFC 3/5] boot-directdisk: Fix Block Calcuation
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
X-List-Received-Date: Mon, 26 Mar 2012 18:36:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/25/2012 11:47 PM, Saul Wold wrote:
> This also changes the timeout to be settable
> 
> The block calcuation was not correctly rounding, see comment
> 
> Thanks to Darren Hart for fixing this.
> 
> Cc: Darren Hart <dvhart@linux.intel.com>

Thanks, but be sure to use the option to get that added to actual email
header :-)  That's "-c" for the send-pull-request script.

--
Darren

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/boot-directdisk.bbclass |   19 +++++++++++++------
>  1 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
> index 893164f..e9e1ba3 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -37,9 +37,8 @@ BOOTDD_EXTRA_SPACE ?= "16384"
>  # Get the build_syslinux_cfg() function from the syslinux class
>  
>  AUTO_SYSLINUXCFG = "1"
> -LABELS = "boot"
>  SYSLINUX_ROOT ?= "root=/dev/sda2"
> -SYSLINUX_TIMEOUT = "10" # 1 second
> +SYSLINUX_TIMEOUT ?= "10"
>  
>  SYSLINUXCFG  = "${HDDDIR}/syslinux.cfg"
>  SYSLINUXMENU = "${HDDDIR}/menu"
> @@ -55,15 +54,23 @@ build_boot_dd() {
>  	install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}/ldlinux.sys
>  
>  	BLOCKS=`du -bks ${HDDDIR} | cut -f 1`
> -	SIZE=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
> +	BLOCKS=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
> +
> +	# Ensure total sectors is an integral number of sectors per
> +	# track or mcopy will complain. Sectors are 512 bytes, and we
> +	# generate images with 32 sectors per track. This calculation is
> +	# done in blocks, thus the mod by 16 instead of 32.
> +	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
> +
> +	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C ${HDDIMG} $BLOCKS 
> +	mcopy -i ${HDDIMG} -s ${HDDDIR}/* ::/
>  
> -	mkdosfs -n ${BOOTDD_VOLUME_ID} -d ${HDDDIR} -C ${HDDIMG} $SIZE 
>  	syslinux ${HDDIMG}
>  	chmod 644 ${HDDIMG}
>  
>  	ROOTFSBLOCKS=`du -Lbks ${ROOTFS} | cut -f 1`
> -	TOTALSIZE=`expr $SIZE + $ROOTFSBLOCKS`
> -	END1=`expr $SIZE \* 1024`
> +	TOTALSIZE=`expr $BLOCKS + $ROOTFSBLOCKS`
> +	END1=`expr $BLOCKS \* 1024`
>  	END2=`expr $END1 + 512`
>  	END3=`expr \( $ROOTFSBLOCKS \* 1024 \) + $END1`
>  

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


