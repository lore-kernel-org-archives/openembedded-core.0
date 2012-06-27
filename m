Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1SjzFB-00014C-V5
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 22:53:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id D906D138F86;
	Wed, 27 Jun 2012 14:33:07 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gW6PJVTibxIv; Wed, 27 Jun 2012 14:33:02 -0600 (MDT)
Received: from [172.20.202.96] (beast.camp.se-eng.com [172.20.202.96])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 15BEC138F82;
	Wed, 27 Jun 2012 14:33:01 -0600 (MDT)
Message-ID: <4FEB6E50.30203@se-eng.com>
Date: Wed, 27 Jun 2012 14:34:24 -0600
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1340396533-5386-1-git-send-email-ray.danks@se-eng.com>
	<4FE898B7.3050606@linux.intel.com>
In-Reply-To: <4FE898B7.3050606@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] image_types: Add elf image type
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ray.danks@se-eng.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 27 Jun 2012 20:53:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Darren,

Thanks for the feedback.

On 06/25/2012 10:58 AM, Darren Hart wrote:
> Hi Raymond,
>
> On 06/22/2012 01:22 PM, Raymond Danks wrote:
>> On x86, an ELF image file may be stored as a coreboot payload.
>> The image file is constructed, using the mkelfimage utility,
>> from a kernel and an initrd.
>>
> Is this usable solely as a coreboot payload?
>
> The reason I ask is there have been requests to be able to build the
> kernel+initramfs that the Linux make system supports. The coreboot wiki
> suggests that this may be sufficient in lieu of the mkelfimage format.
>
> http://www.coreboot.org/Mkelfimage
>
> If we can satisfy both goals with one image type, I would prefer we do
> that, at least for the core.
I have not tried this.

I prefer the mkelfimage mechanism over the linux kernel's mechanism due 
to the manner in which the OpenEmbedded build process is laid out.  In 
my experience, the rootfs/initrd is constructed *after* the kernel and 
is not necessarily available for inclusion by the kernel build.

Of course, if you have a patch for this, I'd be happy to give that a try.
>> Signed-off-by: Raymond Danks<ray.danks@se-eng.com>
>> ---
>> This was originally submitted to the openembedded project:
>> http://patches.openembedded.org/patch/7689/
>>
>> Resubmitting to oe-core for review prior to commit in openembedded-core.
>>
>>   meta/classes/image_types.bbclass |   18 +++++++++++++++++-
>>   1 files changed, 17 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index 55f122e..bbca20c 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -7,6 +7,12 @@ def get_imagecmds(d):
>>       ctypes = d.getVar('COMPRESSIONTYPES', True).split()
>>       cimages = {}
>>
>> +    if "elf" in alltypes:
>> +        alltypes.remove("elf")
>> +        if "cpio.gz" not in alltypes:
>> +                alltypes.append("cpio.gz")
>> +        alltypes.append("elf")
>> +
> What is the goal of this? Do you just need cpio.gz to appear before elf
> in the list?
Yes.  The cpio.gz is an input to the mkelfimage command below.
> If so, can that just be checked for at the time of adding
> elf the first time?
Possibly.  Can you tell me where this is done?
>
>>       # Filter out all the compressed images from types
>>       for type in alltypes:
>>           basetype = None
>> @@ -173,6 +179,14 @@ IMAGE_CMD_cpio () {
>>   	cd ${IMAGE_ROOTFS}&&  (find . | cpio -o -H newc>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>>   }
>>
>> +ELF_KERNEL ?= ${STAGING_DIR_HOST}/kernel/bzImage
> There are various kernel image types. Is the elf format only valid with
> bzImage?
The mkelfimage documentation indicates that bzImage and vmlinux are 
supported.  I have only worked with bzImage.  That said, I agree that 
this is more appropriate:

ELF_KERNEL ?= ${STAGING_DIR_HOST}/kernel/${KERNEL_IMAGETYPE}
>
>> +ELF_APPEND ?= "ramdisk_size=32768 root=/dev/ram0 rw console="
> We would need to parameterize ramdisk_size.
I am hoping that this initial patch will satisfy most needs.  I agree 
that changes may need to be made as needs become more specific.
>
> --
> Darren
>
>> +
>> +IMAGE_CMD_elf () {
>> +	test -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf&&  rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf
>> +	mkelfImage --kernel=${ELF_KERNEL} --initrd=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.elf --append='${ELF_APPEND}' ${EXTRA_IMAGECMD}
>> +}
>> +
>>   UBI_VOLNAME ?= "${MACHINE}-rootfs"
>>
>>   IMAGE_CMD_ubi () {
>> @@ -199,6 +213,7 @@ EXTRA_IMAGECMD_ext2 ?= "-i 8192"
>>   EXTRA_IMAGECMD_ext3 ?= "-i 8192"
>>   EXTRA_IMAGECMD_ext4 ?= "-i 8192"
>>   EXTRA_IMAGECMD_btrfs ?= ""
>> +EXTRA_IMAGECMD_elf ?= ""
>>
>>   IMAGE_DEPENDS = ""
>>   IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
>> @@ -210,11 +225,12 @@ IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
>>   IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
>>   IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
>>   IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
>> +IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
>>   IMAGE_DEPENDS_ubi = "mtd-utils-native"
>>   IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>>
>>   # This variable is available to request which values are suitable for IMAGE_FSTYPES
>> -IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk"
>> +IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
>>
>>   COMPRESSIONTYPES = "gz bz2 lzma xz"
>>   COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
>>



