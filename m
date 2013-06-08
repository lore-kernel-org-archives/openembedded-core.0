Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0726B6A887
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2013 13:08:11 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so2391451pad.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jun 2013 06:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=gtc3v7nLk6QIWdxYaX9XSPCmgkgy19KZQ61z8Vpya+I=;
	b=sCmGd4fhf/CpNUujSwQycHXwdh4fmgHGgnQUEXjJSH4VpJ45CyoEvQ+2p9S9LNzkwp
	I7fVVj62LuNsdTilVa85gCw2tAPwaGCJ4UilDOxZNsBEbhClaLhWjZiPmmZqj2NA5TNq
	p7rrymgbGsmUM5zn0ZVGyOuKwbQCQHD8Wtg5xwwBDvCuUnMnv2nMtiXAR9rxOLbWXngV
	Zbi9UwQJMEtQpRQq7Ja7y02127df+G4HyUsT4rvvwfiUHANJfCKLnTP4z0UHC703De9L
	zdv2uvYg/KyfDbBzdzn3mz/GhIwhuFPRSkz8reohiVtcU9WvwrQ1l66wZwzTiygCCCeT
	2mOw==
X-Received: by 10.68.222.7 with SMTP id qi7mr2934554pbc.7.1370696891957;
	Sat, 08 Jun 2013 06:08:11 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id ih1sm3001321pbb.44.2013.06.08.06.08.09
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Jun 2013 06:08:11 -0700 (PDT)
Message-ID: <51B32B95.4040806@gmail.com>
Date: Sat, 08 Jun 2013 23:03:17 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1369283514-8837-1-git-send-email-net147@gmail.com>
	<51B26C98.1030002@linux.intel.com>
In-Reply-To: <51B26C98.1030002@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boot-directdisk: mount root by MBR disk signature for Linux 3.8+
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
X-List-Received-Date: Sat, 08 Jun 2013 13:08:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Darren,

On 8/06/2013 9:28 AM, Darren Hart wrote:
> Hi Jon,
>
> Please include a complete commit message. For specifics on contributing
> patches, please see:
>
> https://wiki.yoctoproject.org/wiki/Contribution_Guidelines
>
> What is the problem? What is the cause? How are you addressing it? How
> was it tested?
>
> Is this 3.8 feature you are referring to something must be configured
> into the kernel? Or is it always present?
>
> There is also the concern with dual kernel systems (but that perhaps can
> wait until that is commonplace and the infrastructure is in place).
Ok.
> See inline for additional comments:
>
> On 05/22/2013 09:31 PM, Jonathan Liu wrote:
>> Signed-off-by: Jonathan Liu<net147@gmail.com>
>> ---
>>   meta/classes/boot-directdisk.bbclass | 21 ++++++++++++++++++---
>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
>> index 3169043..736bee0 100644
>> --- a/meta/classes/boot-directdisk.bbclass
>> +++ b/meta/classes/boot-directdisk.bbclass
>> @@ -23,7 +23,8 @@ do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
>>                                  syslinux:do_populate_sysroot \
>>                                  syslinux-native:do_populate_sysroot \
>>                                  parted-native:do_populate_sysroot \
>> -                               mtools-native:do_populate_sysroot "
>> +                               mtools-native:do_populate_sysroot \
>> +                               util-linux-native:do_populate_sysroot "
>>   
>>   PACKAGES = " "
>>   EXCLUDE_FROM_WORLD = "1"
>> @@ -58,6 +59,22 @@ build_boot_dd() {
>>   	# done in blocks, thus the mod by 16 instead of 32.
>>   	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
>>   
>> +	KERNEL_VERSION=$(grep '^VERSION\s*=' ${STAGING_KERNEL_DIR}/Makefile | grep -o '[0-9]*$')
>> +	KERNEL_PATCHLEVEL=$(grep '^PATCHLEVEL\s*=' ${STAGING_KERNEL_DIR}/Makefile | grep -o '[0-9]*$')
> Could you use LINUX_VERSION here and void delving into the Linux sources
> directly?
It's not available in the context of the image recipe if I do bitbake -e 
core-image-minimal.
>> +
>> +	rm -rf $IMAGE
>> +	dd if=/dev/zero of=$IMAGE bs=512 seek=1 count=0
>> +	parted $IMAGE mklabel msdos
>> +
>> +	# If using Linux 3.8 or later, mount root by MBR disk signature
>> +	if [[ $KERNEL_VERSION -eq 3 && $KERNEL_PATCHLEVEL -ge 8 ]] || [ $KERNEL_VERSION -gt 3 ]; then
> [[ is a bashism, use portable tests please, for example:
>
> if ([ $KERNEL_VERSION -eq 3 ] && [$KERNEL_PATCHLEVEL -ge 8 ]) || [
> $KERNEL_VERSION -gt 3 ]; then
>
> This is easily tested by writing test.sh and executing with bash and
> dash and ensuring consistent behavior.
Ok.
> Is the version sufficient? No CONFIG_ value to test for?
It needs CONFIG_BLOCK so I will test for that.
>> +		# The disk signature generated by GNU Parted isn't really random, so regenerate it
>> +		echo -ne "$(uuidgen | sed 's/-//g;s/\(..\)/\\x&/g')" | dd of=$IMAGE bs=1 seek=440 count=4 conv=notrunc
>> +
>> +		DISK_SIGNATURE=$(hexdump -s 440 -n 4 -e '4 1 "%02x\n" "\n"' $IMAGE | tac | paste -sd '')
> Seems like it would be more efficient to just store this in a variable
> initially
> rather than opening, seeking, and dumping the value that you just wrote
> in...
Ok.
>> +		sed -i "s|\broot=[^ ]*|root=PARTUUID=$DISK_SIGNATURE-02|" $HDDDIR/syslinux.cfg
> In bootimg.bbclass I have been abstracting out the boot loader so it is
> not explicitly referenced. Something like that is in order here. For
> example, an EFI boot-directdisk (which admittedly doesn't exist yet)
> would not have a syslinux.cfg but would still need the change. Consider
> using the syslinux class to abstract this necessary change. Then I can
> add the gummiboot change when EFI support is added.
Do you mean adding a function to the syslinux class which updates root= 
in syslinux.cfg previously created by build_syslinux_cfg()?

> --
> Darren
>
>> +	fi
>> +
>>   	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS
>>   	mcopy -i $HDDIMG -s $HDDDIR/* ::/
>>   
>> @@ -71,10 +88,8 @@ build_boot_dd() {
>>   	END3=`expr \( $ROOTFSBLOCKS \* 1024 \) + $END1`
>>   
>>   	echo $ROOTFSBLOCKS $TOTALSIZE $END1 $END2 $END3
>> -	rm -rf $IMAGE
>>   	dd if=/dev/zero of=$IMAGE bs=1024 seek=$TOTALSIZE count=1
>>   
>> -	parted $IMAGE mklabel msdos
>>   	parted $IMAGE mkpart primary fat16 0 ${END1}B
>>   	parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
>>   	parted $IMAGE set 1 boot on
>>
Regards,
Jonathan

