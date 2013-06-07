Return-Path: <dvhart@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2376A5AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 23:31:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jun 2013 16:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,825,1363158000"; d="scan'208";a="349937425"
Received: from unknown (HELO envy.home) ([10.255.12.182])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jun 2013 16:31:15 -0700
Message-ID: <51B26D43.4050909@linux.intel.com>
Date: Fri, 07 Jun 2013 16:31:15 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1368069844-13706-1-git-send-email-net147@gmail.com>
	<1368069844-13706-2-git-send-email-net147@gmail.com>
In-Reply-To: <1368069844-13706-2-git-send-email-net147@gmail.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] boot-directdisk: Scope HDDDIR and HDDIMG variables to avoid conflicts
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
X-List-Received-Date: Fri, 07 Jun 2013 23:31:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/08/2013 08:24 PM, Jonathan Liu wrote:
> These variables should not be shared with other image classes.
> The bootimg class also has an HDDDIR variable that could be overwritten
> if executing concurrently in the same image recipe.
> 

Nice catch. Would you considering sending a patch against the bootimg
class as well?

Thanks,

Darren

> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/classes/boot-directdisk.bbclass | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
> index aa172c6..9673760 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -28,9 +28,6 @@ do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
>  PACKAGES = " "
>  EXCLUDE_FROM_WORLD = "1"
>  
> -HDDDIR = "${S}/hdd/boot"
> -HDDIMG = "${S}/hdd.image"
> -
>  BOOTDD_VOLUME_ID   ?= "boot"
>  BOOTDD_EXTRA_SPACE ?= "16384"
>  
> @@ -43,14 +40,16 @@ SYSLINUX_TIMEOUT ?= "10"
>  inherit syslinux
>  		
>  build_boot_dd() {
> +	HDDDIR="${S}/hdd/boot"
> +	HDDIMG="${S}/hdd.image"
>  	IMAGE=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect
>  
> -	install -d ${HDDDIR}
> -	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage ${HDDDIR}/vmlinuz
> -	install -m 0644 ${S}/syslinux.cfg ${HDDDIR}/syslinux.cfg
> -	install -m 444 ${STAGING_DATADIR}/syslinux/ldlinux.sys ${HDDDIR}/ldlinux.sys
> +	install -d $HDDDIR
> +	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage $HDDDIR/vmlinuz
> +	install -m 0644 ${S}/syslinux.cfg $HDDDIR/syslinux.cfg
> +	install -m 444 ${STAGING_DATADIR}/syslinux/ldlinux.sys $HDDDIR/ldlinux.sys
>  
> -	BLOCKS=`du -bks ${HDDDIR} | cut -f 1`
> +	BLOCKS=`du -bks $HDDDIR | cut -f 1`
>  	BLOCKS=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
>  
>  	# Ensure total sectors is an integral number of sectors per
> @@ -59,11 +58,11 @@ build_boot_dd() {
>  	# done in blocks, thus the mod by 16 instead of 32.
>  	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
>  
> -	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C ${HDDIMG} $BLOCKS 
> -	mcopy -i ${HDDIMG} -s ${HDDDIR}/* ::/
> +	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS 
> +	mcopy -i $HDDIMG -s $HDDDIR/* ::/
>  
> -	syslinux ${HDDIMG}
> -	chmod 644 ${HDDIMG}
> +	syslinux $HDDIMG
> +	chmod 644 $HDDIMG
>  
>  	ROOTFSBLOCKS=`du -Lbks ${ROOTFS} | cut -f 1`
>  	TOTALSIZE=`expr $BLOCKS + $ROOTFSBLOCKS`
> @@ -83,7 +82,7 @@ build_boot_dd() {
>  
>  	OFFSET=`expr $END2 / 512`
>  	dd if=${STAGING_DATADIR}/syslinux/mbr.bin of=$IMAGE conv=notrunc
> -	dd if=${HDDIMG} of=$IMAGE conv=notrunc seek=1 bs=512
> +	dd if=$HDDIMG of=$IMAGE conv=notrunc seek=1 bs=512
>  	dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
>  
>  	cd ${DEPLOY_DIR_IMAGE}
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel

