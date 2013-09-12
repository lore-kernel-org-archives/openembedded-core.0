Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFC36B260
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 20:14:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8CKED3k025358
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Sep 2013 13:14:13 -0700 (PDT)
Received: from [147.11.119.100] (147.11.119.100) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 12 Sep 2013 13:14:12 -0700
Message-ID: <52322093.7010405@windriver.com>
Date: Thu, 12 Sep 2013 15:14:11 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
	<1379006387-20186-5-git-send-email-jason.wessel@windriver.com>
	<1379009349.1285.24.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1379009349.1285.24.camel@dvhart-mobl4.amr.corp.intel.com>
X-Enigmail-Version: 1.5.2
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] bootimage.bbclass: Improve EFI & PCBIOS+EFI ISO support
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
X-List-Received-Date: Thu, 12 Sep 2013 20:14:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 09/12/2013 01:09 PM, Darren Hart wrote:
> On Thu, 2013-09-12 at 12:19 -0500, Jason Wessel wrote:
>> Using the latest mkisofs it is possible to generate 3 different types
>> of ISO images, which can be used in various scenarios.
>>
>> 1) PCBIOS Only ISO
>>    - This option remains unchanged by this commit
>>    - Uses syslinux menus
>>    - Can be directly copied with dd to a USB device
>>    - Can be burned to optical media
>>
>> 2) EFI Only ISO
>>    - Uses grub 2 menus
>>    - Can be burned to optical media
>>    - If you want to use this image on a USB device
>>      extra steps must be taken in order to format the USB
>>      device with fat32, and copy an EFI loader which will
>>      in turn load the iso image
>>
>> 3) PCBIOS / EFI ISO
>>    - This is a hybrid image ISO that will work for case 1 or 2
>>      as above with the same restrictions and boot menu types
>>      depending on what type of firmware is installed on
>>      the hardware or depending on if EFI or "Legacy Boot" is
>>      enabled on some UEFI firmwares.
>>
>> [YOCTO #4100]
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>  meta/classes/bootimg.bbclass |   37 ++++++++++++++++++++++++++++++++++---
>>  1 file changed, 34 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
>> index 2ed7017..b4301e8 100644
>> --- a/meta/classes/bootimg.bbclass
>> +++ b/meta/classes/bootimg.bbclass
>> @@ -35,6 +35,7 @@ EXCLUDE_FROM_WORLD = "1"
>>  
>>  HDDDIR = "${S}/hddimg"
>>  ISODIR = "${S}/iso"
>> +EFIIMGDIR = "${S}/efi_img"
>>  COMPACT_ISODIR = "${S}/iso.z"
>>  
>>  BOOTIMG_VOLUME_ID   ?= "boot"
>> @@ -109,19 +110,49 @@ build_iso() {
>>  		mkisofs_opts="-R -z -D -l"
>>  	fi
>>  
> 
> Am I missing a patch? I don't have this mkisofs_opts in my
> bootimg.bbclass....
> 

Yes


> How are $mkisofs_opts and ${MKISOFS_OPTIONS} related? Do we need both?
> 

Yes.

I built this patch set on top of the zisofs support I posted a day or so ago.  I'll include that patch in the series next time, else it would create merge conflicts.


The piece from the other patch is:

 +       if [ "${COMPRESSISO}" = "1" ] ; then
 +               # create compact directory, compress iso
 +               mkdir -p ${COMPACT_ISODIR}
 +               mkzftree -z 9 -p 4 -F ${ISODIR}/rootfs.img ${COMPACT_ISODIR}/rootfs.img
 +
 +               # move compact iso to iso, then remove compact directory
 +               mv ${COMPACT_ISODIR}/rootfs.img ${ISODIR}/rootfs.img
 +               rm -Rf ${COMPACT_ISODIR}
 +               mkisofs_opts="-r"
 +       else
 +               mkisofs_opts="-R -z -D -l"
 +       fi
 +


The zisofs is a big win for some folks because it will cut their image size in 1/2 so they can use single layer media instead of dual layer media for example. 



>> -	if [ "${PCBIOS}" = "1" ]; then
>> +	if [ "${EFI}" = "1" ] ; then
>> +		# Build a EFI directory to create efi.img
>> +		mkdir -p ${EFIIMGDIR}/${EFIDIR}
>> +		cp ${ISODIR}/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
>> +		cp ${ISODIR}/vmlinuz ${EFIIMGDIR}
>> +		GRUB_IMAGE="bootia32.efi"
>> +		if [ "${TARGET_ARCH}" = "x86_64" ]; then
>> +			GRUB_IMAGE="bootx64.efi"
>> +		fi
>> +		echo "EFI\\BOOT\\${GRUB_IMAGE}" > ${EFIIMGDIR}/startup.nsh
>> +		if [ -f "${ISODIR}/initrd" ] ; then
>> +			cp ${ISODIR}/initrd ${EFIIMGDIR}
>> +		fi
>> +		build_fat_img ${EFIIMGDIR} ${ISODIR}/efi.img
>> +	fi
>> +
>> +	# Three ways to build the media
>> +	if [ "${PCBIOS}" = "1" -a "${EFI}" = "1" ]; then
> 
> Per the Dash as BinSh wiki, the -a syntax is discouraged, best practices
> seem to be the use of && and || instead:
> 
> if ([ "${PCBIOS}" = "1" ] && [ "${EFI}" = "1" ]); then
> 


Noted for the future :-)


> 
>> +		# 1) Build EFI + PCBIOS hybrid
>> +		mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
>> +		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
>> +			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} $mkisofs_opts \
>> +			${MKISOFS_OPTIONS} \
>> +			-eltorito-alt-boot -eltorito-platform efi \
>> +			-b efi.img -no-emul-boot \
>> +			${ISODIR}
> 
> Has this been verified on any 32 bit PCBIOS platforms?


Yes, on tunnel creek based hardware. 


> It was my understanding the many 32 bit PCBIOS systems had very buggy
> el-torito support and didn't deal well with multiple el-torito images on
> the same disk. Although... looking at the command above, I'm not sure
> you're doing this with mutliple images. Do you have the syslinux and the
> efi image combined in the same efi.img?


My testing showed it worked for both EFI only and EFI+PCBIOS.  In the case of the EFI+PCBIOS image there are two eltorito images, but in the case of the EFI only, there is only one, so at least you have two options.  The Fedora install media uses the EFI+PCBIOS style image, so if that booted on the hardware you had problems with, this will too. 


> 
> Has this been verified to work on USB media?


The image only works on USB media with the PCBIOS. 


> It was explained to me that, at least for some implementations, if the
> boot device selection code will not look for ISO9660 on anything that
> doesn't have a block size of 2048, making it give up on a USB device
> before even attempting to find the ISO9660 FS.


Is there some magic argument to mkisofs that would cause this to change the block size?  Given that the ISO's I created with EFI would not work directly as a USB image I suspect I have one of the of those implementations.  Of course it can be worked around by copying the ISO onto a partition and using a different loader to deal with it. 

I guess my point here is that some further work is probably needed down the road, but the first pass works for the important cases (like real optical media). 


> 
> 
> 
>> +	elif [ "${PCBIOS}" = "1" ] ; then
>> +		# 2) Build PCBIOS only media
>>  		mkisofs -V ${BOOTIMG_VOLUME_ID} \
>>  		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
>>  			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} $mkisofs_opts \
>>  			${MKISOFS_OPTIONS} ${ISODIR}
>>  	else
> 
> This should also verify that we are building for EFI. !PCBIOS != EFI. If
> none of these options eval to true, an error should be printed



This case cannot actually happen, thanks to you and Richard (which I got from git blame)

# Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
# contain "efi". This way legacy is supported by default if neither is
# specified, maintaining the original behavior.
def pcbios(d):
    pcbios = base_contains("MACHINE_FEATURES", "pcbios", "1", "0", d)
    if pcbios == "0":
        pcbios = base_contains("MACHINE_FEATURES", "efi", "0", "1", d)
    return pcbios

One or the other will always be set.

> 
>> -		bbnote "EFI-only ISO images are untested, please provide feedback."
>>  		mkisofs -V ${BOOTIMG_VOLUME_ID} \
>>  		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
>> +			-eltorito-alt-boot -eltorito-platform efi \
>> +			-b efi.img -no-emul-boot \
>>  			-r ${ISODIR}
>>  	fi
>>  
>> -	isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
>> +	if [ "${PCBIOS}" = "1" ]; then
>> +		isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
>> +	fi
> 
> A comment would be good around the isohybrid block describing what it is
> doing and why it only applies to PCBIOS.


The isohybrid is what allows you to boot the via a USB with a PCBIOS by populating the MBR.  The EFI firmware skips it entirely, but sure I'll add a comment. 


Cheers,
Jason.

> 
>>  
>>  	cd ${DEPLOY_DIR_IMAGE}
>>  	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.iso
> 
> 
> Thanks Jason, this is long overdue. Your effort here is very much
> appreciated.
> 


