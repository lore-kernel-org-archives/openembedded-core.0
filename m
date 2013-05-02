Received: from mail-vb0-f42.google.com ([209.85.212.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UY2hC-0000Zr-Hq
	for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 01:13:53 +0200
Received: by mail-vb0-f42.google.com with SMTP id w16so948552vbf.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 15:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:references:from:mime-version:in-reply-to:date:message-id
	:subject:to:cc:content-type;
	bh=T0sBtZp7YWTAOG+lFs8SXY2d391tHX8ZflUDqRR5lOc=;
	b=0YUW6hY2i/7PPHXFU5ft7H0PWAAPjsgsLpuVfZunbvQx3AkxJ3yoFPp/LbN4ueTy1X
	cYTbtwLuc0dWF9rZAIGWgjKf498IZe3oJGNyySLFbrHmRQFZg8L6WBbacyEpfslyOrFp
	iwibw1lsW2n22J4nnTFUdzw1GXPQbAMv+gMFecD5gk6SLBp4XtglGiUdKhgSMX0d3PXb
	krk0Wd6OnfCpQ5gUB1ltSD7Tx88pLoxAMsVvsQ3LVcElGYR+MZwRQ/0ZGK2Ifrbe4atU
	EQPHBqoxSvtysd8IeFfh5y8K6ws5IyInyxhrP8W0bkT7RDWHxCpZEkMqQwQoVwSGDX6a
	L0Iw==
X-Received: by 10.220.188.201 with SMTP id db9mr2845372vcb.30.1367535356105;
	Thu, 02 May 2013 15:55:56 -0700 (PDT)
References: <1367528193-10516-1-git-send-email-net147@gmail.com>
	<1367528193-10516-3-git-send-email-net147@gmail.com>
	<5182E9BB.1010304@linux.intel.com>
From: Jonathan Liu <net147@gmail.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <5182E9BB.1010304@linux.intel.com>
Date: Fri, 3 May 2013 08:55:55 +1000
Message-ID: <-9204440360155240007@unknownmsgid>
To: Saul Wold <sgw@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 02 May 2013 23:13:58 -0000
Content-Type: text/plain; charset=UTF-8

I guess it is enough to scope just the variables in boot-directdisk
for now then.

Regards,
Jonathan

On 03/05/2013, at 8:33 AM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/02/2013 01:56 PM, Jonathan Liu wrote:
>> These variables should not be shared with other image classes.
>> The boot-directdisk class also has an HDDDIR variable that could be
>> overwritten if executing concurrently in the same image recipe.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  meta/classes/bootimg.bbclass | 25 +++++++++++++------------
>>  1 file changed, 13 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
>> index b7ddf42..11b3294 100644
>> --- a/meta/classes/bootimg.bbclass
>> +++ b/meta/classes/bootimg.bbclass
>> @@ -29,9 +29,6 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
>>  PACKAGES = " "
>>  EXCLUDE_FROM_WORLD = "1"
>>
>> -HDDDIR = "${S}/hddimg"
>> -ISODIR = "${S}/iso"
>> -
> NAK!
>
> What about the usage of these in grub-efi.bbclass and syslinux.bbclass?
>
> Both are used in those classes via inherits of either the EFI_CLASS or PCBIOS_CLASS.
>
> Sau!
>
>
>>  BOOTIMG_VOLUME_ID   ?= "boot"
>>  BOOTIMG_EXTRA_SPACE ?= "512"
>>
>> @@ -76,13 +73,15 @@ populate() {
>>  }
>>
>>  build_iso() {
>> +    ISODIR="${S}/iso"
>> +
>>      # Only create an ISO if we have an INITRD and NOISO was not set
>>      if [ -z "${INITRD}" ] || [ ! -s "${INITRD}" ] || [ "${NOISO}" = "1" ]; then
>>          bbnote "ISO image will not be created."
>>          return
>>      fi
>>
>> -    populate ${ISODIR}
>> +    populate $ISODIR
>>
>>      if [ "${PCBIOS}" = "1" ]; then
>>          syslinux_iso_populate
>> @@ -95,12 +94,12 @@ build_iso() {
>>          mkisofs -V ${BOOTIMG_VOLUME_ID} \
>>                  -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
>>              -b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
>> -            ${MKISOFS_OPTIONS} ${ISODIR}
>> +            ${MKISOFS_OPTIONS} $ISODIR
>>      else
>>          bbnote "EFI-only ISO images are untested, please provide feedback."
>>          mkisofs -V ${BOOTIMG_VOLUME_ID} \
>>                  -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
>> -            -r ${ISODIR}
>> +            -r $ISODIR
>>      fi
>>
>>      isohybrid ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso
>> @@ -111,9 +110,11 @@ build_iso() {
>>  }
>>
>>  build_hddimg() {
>> +    HDDDIR="${S}/hddimg"
>> +
>>      # Create an HDD image
>>      if [ "${NOHDD}" != "1" ] ; then
>> -        populate ${HDDDIR}
>> +        populate $HDDDIR
>>
>>          if [ "${PCBIOS}" = "1" ]; then
>>              syslinux_hddimg_populate
>> @@ -128,7 +129,7 @@ build_hddimg() {
>>          #  Blocks: 1024 bytes
>>
>>          # Determine the sector count just for the data
>> -        SECTORS=$(expr $(du --apparent-size -ks ${HDDDIR} | cut -f 1) \* 2)
>> +        SECTORS=$(expr $(du --apparent-size -ks $HDDDIR | cut -f 1) \* 2)
>>
>>          # Account for the filesystem overhead. This includes directory
>>          # entries in the clusters as well as the FAT itself.
>> @@ -140,13 +141,13 @@ build_hddimg() {
>>          #   8.3 filenames only
>>
>>          # 32 bytes per dir entry
>> -        DIR_BYTES=$(expr $(find ${HDDDIR} | tail -n +2 | wc -l) \* 32)
>> +        DIR_BYTES=$(expr $(find $HDDDIR | tail -n +2 | wc -l) \* 32)
>>          # 32 bytes for every end-of-directory dir entry
>> -        DIR_BYTES=$(expr $DIR_BYTES + $(expr $(find ${HDDDIR} -type d | tail -n +2 | wc -l) \* 32))
>> +        DIR_BYTES=$(expr $DIR_BYTES + $(expr $(find $HDDDIR -type d | tail -n +2 | wc -l) \* 32))
>>          # 4 bytes per FAT entry per sector of data
>>          FAT_BYTES=$(expr $SECTORS \* 4)
>>          # 4 bytes per FAT entry per end-of-cluster list
>> -        FAT_BYTES=$(expr $FAT_BYTES + $(expr $(find ${HDDDIR} -type d | tail -n +2 | wc -l) \* 4))
>> +        FAT_BYTES=$(expr $FAT_BYTES + $(expr $(find $HDDDIR -type d | tail -n +2 | wc -l) \* 4))
>>
>>          # Use a ceiling function to determine FS overhead in sectors
>>          DIR_SECTORS=$(expr $(expr $DIR_BYTES + 511) / 512)
>> @@ -173,7 +174,7 @@ build_hddimg() {
>>          IMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
>>          mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${IMG} ${BLOCKS}
>>          # Copy HDDDIR recursively into the image file directly
>> -        mcopy -i ${IMG} -s ${HDDDIR}/* ::/
>> +        mcopy -i ${IMG} -s $HDDDIR/* ::/
>>
>>          if [ "${PCBIOS}" = "1" ]; then
>>              syslinux_hddimg_install
>>


