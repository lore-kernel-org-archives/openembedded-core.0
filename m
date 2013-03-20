Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UIMSJ-0008P3-B7
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 18:05:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2013 09:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,879,1355126400"; d="scan'208";a="309544458"
Received: from unknown (HELO envy.home) ([10.255.13.129])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2013 09:48:46 -0700
Message-ID: <5149E86E.8030500@linux.intel.com>
Date: Wed, 20 Mar 2013 09:48:46 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1363731212.git.dvhart@linux.intel.com>
	<4937a2369946171db2f84833e997702f820d37bc.1363731212.git.dvhart@linux.intel.com>
	<719374A5-E704-46DB-8D1E-11A5387A72B2@dominion.thruhere.net>
In-Reply-To: <719374A5-E704-46DB-8D1E-11A5387A72B2@dominion.thruhere.net>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] mkefidisk: Use msdos partition tables
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
X-List-Received-Date: Wed, 20 Mar 2013 17:05:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/20/2013 12:49 AM, Koen Kooi wrote:
> 
> Op 19 mrt. 2013, om 23:15 heeft Darren Hart <dvhart@linux.intel.com> het volgende geschreven:
> 
>> While GPT works fine when writing to actual media, it cannot be reliably
>> used for distributing disk images as it requires the backup table to be
>> on the last block on the device, which of course varies from device to
>> device. Use MSDOS tables instead.
>>
>> Use mkfs to label the filesystems as msdos tables do not support
>> partition labeling.
> 
> I was wondering if it's possible to run parted in fixup mode
> manually. I did that on the target itself to fix the off-by-one
> error, so running it on the host should work as well.

I thought of that as well, but that doesn't help with the disk image
problem. I don't like the idea of shipping images that have to be fixed
on first boot without any clear motivation. For the purposes of these
images, I don't see any clear advantage of GPT.

--
Darren

> 
> regards,
> 
> Koen
> 
> 
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> ---
>> scripts/contrib/mkefidisk.sh | 16 +++++++---------
>> 1 file changed, 7 insertions(+), 9 deletions(-)
>>
>> diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
>> index 6ff12af..acadd49 100755
>> --- a/scripts/contrib/mkefidisk.sh
>> +++ b/scripts/contrib/mkefidisk.sh
>> @@ -156,20 +156,18 @@ echo "*****************"
>> echo "Deleting partition table on $DEVICE ..."
>> dd if=/dev/zero of=$DEVICE bs=512 count=2
>>
>> -echo "Creating new partition table (GPT) on $DEVICE ..."
>> -parted $DEVICE mklabel gpt
>> +# Use MSDOS by default as GPT cannot be reliably distributed in disk image form
>> +# as it requires the backup table to be on the last block of the device, which
>> +# of course varies from device to device.
>> +echo "Creating new partition table (MSDOS) on $DEVICE ..."
>> +parted $DEVICE mklabel msdos
>>
>> echo "Creating boot partition on $BOOTFS"
>> parted $DEVICE mkpart primary 0% $BOOT_SIZE
>>
>> -# GPT doesn't have a real boot flag, parted will change the GUID to EFI System
>> -# Partition, which is what we want
>> echo "Enabling boot flag on $BOOTFS"
>> parted $DEVICE set 1 boot on
>>
>> -echo "Labeling $BOOTFS as EFI System Partition"
>> -parted $DEVICE name 1 "EFI System Partition"
>> -
>> echo "Creating ROOTFS partition on $ROOTFS"
>> parted $DEVICE mkpart primary $ROOTFS_START $ROOTFS_END
>>
>> @@ -184,10 +182,10 @@ parted $DEVICE print
>> #
>> echo ""
>> echo "Formatting $BOOTFS as vfat..."
>> -mkfs.vfat $BOOTFS
>> +mkfs.vfat $BOOTFS -n "efi"
>>
>> echo "Formatting $ROOTFS as ext3..."
>> -mkfs.ext3 $ROOTFS
>> +mkfs.ext3 $ROOTFS -L "root"
>>
>> echo "Formatting swap partition...($SWAP)"
>> mkswap $SWAP
>> -- 
>> 1.8.1.2
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


