Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UY2Lc-0006zr-Jl
	for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 00:51:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 May 2013 15:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,599,1363158000"; d="scan'208";a="331551498"
Received: from unknown (HELO [10.255.12.170]) ([10.255.12.170])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2013 15:33:31 -0700
Message-ID: <5182E9BB.1010304@linux.intel.com>
Date: Thu, 02 May 2013 15:33:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1367528193-10516-1-git-send-email-net147@gmail.com>
	<1367528193-10516-3-git-send-email-net147@gmail.com>
In-Reply-To: <1367528193-10516-3-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] bootimg: Scope HDDDIR and ISODIR variables to avoid conflicts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 22:51:40 -0000
X-List-Received-Date: Thu, 02 May 2013 22:51:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2013 01:56 PM, Jonathan Liu wrote:
> These variables should not be shared with other image classes.
> The boot-directdisk class also has an HDDDIR variable that could be
> overwritten if executing concurrently in the same image recipe.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/classes/bootimg.bbclass | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index b7ddf42..11b3294 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -29,9 +29,6 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
>   PACKAGES = " "
>   EXCLUDE_FROM_WORLD = "1"
>
> -HDDDIR = "${S}/hddimg"
> -ISODIR = "${S}/iso"
> -
NAK!

What about the usage of these in grub-efi.bbclass and syslinux.bbclass?

Both are used in those classes via inherits of either the EFI_CLASS or 
PCBIOS_CLASS.

Sau!


>   BOOTIMG_VOLUME_ID   ?= "boot"
>   BOOTIMG_EXTRA_SPACE ?= "512"
>
> @@ -76,13 +73,15 @@ populate() {
>   }
>
>   build_iso() {
> +	ISODIR="${S}/iso"
> +
>   	# Only create an ISO if we have an INITRD and NOISO was not set
>   	if [ -z "${INITRD}" ] || [ ! -s "${INITRD}" ] || [ "${NOISO}" = "1" ]; then
>   		bbnote "ISO image will not be created."
>   		return
>   	fi
>
> -	populate ${ISODIR}
> +	populate $ISODIR
>
>   	if [ "${PCBIOS}" = "1" ]; then
>   		syslinux_iso_populate
> @@ -95,12 +94,12 @@ build_iso() {
>   		mkisofs -V ${BOOTIMG_VOLUME_ID} \
>   		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
>   			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
> -			${MKISOFS_OPTIONS} ${ISODIR}
> +			${MKISOFS_OPTIONS} $ISODIR
>   	else
>   		bbnote "EFI-only ISO images are untested, please provide feedback."
>   		mkisofs -V ${BOOTIMG_VOLUME_ID} \
>   		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
> -			-r ${ISODIR}
> +			-r $ISODIR
>   	fi
>
>   	isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
> @@ -111,9 +110,11 @@ build_iso() {
>   }
>
>   build_hddimg() {
> +	HDDDIR="${S}/hddimg"
> +
>   	# Create an HDD image
>   	if [ "${NOHDD}" != "1" ] ; then
> -		populate ${HDDDIR}
> +		populate $HDDDIR
>
>   		if [ "${PCBIOS}" = "1" ]; then
>   			syslinux_hddimg_populate
> @@ -128,7 +129,7 @@ build_hddimg() {
>   		#  Blocks: 1024 bytes
>
>   		# Determine the sector count just for the data
> -		SECTORS=$(expr $(du --apparent-size -ks ${HDDDIR} | cut -f 1) \* 2)
> +		SECTORS=$(expr $(du --apparent-size -ks $HDDDIR | cut -f 1) \* 2)
>
>   		# Account for the filesystem overhead. This includes directory
>   		# entries in the clusters as well as the FAT itself.
> @@ -140,13 +141,13 @@ build_hddimg() {
>   		#   8.3 filenames only
>
>   		# 32 bytes per dir entry
> -		DIR_BYTES=$(expr $(find ${HDDDIR} | tail -n +2 | wc -l) \* 32)
> +		DIR_BYTES=$(expr $(find $HDDDIR | tail -n +2 | wc -l) \* 32)
>   		# 32 bytes for every end-of-directory dir entry
> -		DIR_BYTES=$(expr $DIR_BYTES + $(expr $(find ${HDDDIR} -type d | tail -n +2 | wc -l) \* 32))
> +		DIR_BYTES=$(expr $DIR_BYTES + $(expr $(find $HDDDIR -type d | tail -n +2 | wc -l) \* 32))
>   		# 4 bytes per FAT entry per sector of data
>   		FAT_BYTES=$(expr $SECTORS \* 4)
>   		# 4 bytes per FAT entry per end-of-cluster list
> -		FAT_BYTES=$(expr $FAT_BYTES + $(expr $(find ${HDDDIR} -type d | tail -n +2 | wc -l) \* 4))
> +		FAT_BYTES=$(expr $FAT_BYTES + $(expr $(find $HDDDIR -type d | tail -n +2 | wc -l) \* 4))
>
>   		# Use a ceiling function to determine FS overhead in sectors
>   		DIR_SECTORS=$(expr $(expr $DIR_BYTES + 511) / 512)
> @@ -173,7 +174,7 @@ build_hddimg() {
>   		IMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
>   		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${IMG} ${BLOCKS}
>   		# Copy HDDDIR recursively into the image file directly
> -		mcopy -i ${IMG} -s ${HDDDIR}/* ::/
> +		mcopy -i ${IMG} -s $HDDDIR/* ::/
>
>   		if [ "${PCBIOS}" = "1" ]; then
>   			syslinux_hddimg_install
>


