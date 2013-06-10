Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 405486A66B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 16:26:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jun 2013 09:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,838,1363158000"; d="scan'208";a="327157742"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.154])
	by orsmga001.jf.intel.com with ESMTP; 10 Jun 2013 09:26:41 -0700
Message-ID: <51B5FE40.10107@linux.intel.com>
Date: Mon, 10 Jun 2013 09:26:40 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1369283514-8837-1-git-send-email-net147@gmail.com>
	<51B26C98.1030002@linux.intel.com> <51B32B95.4040806@gmail.com>
In-Reply-To: <51B32B95.4040806@gmail.com>
X-Enigmail-Version: 1.5.1
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
X-List-Received-Date: Mon, 10 Jun 2013 16:26:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/08/2013 06:03 AM, Jonathan Liu wrote:
> Hi Darren,
> 

>>> +		sed -i "s|\broot=[^ ]*|root=PARTUUID=$DISK_SIGNATURE-02|" $HDDDIR/syslinux.cfg
>> In bootimg.bbclass I have been abstracting out the boot loader so it is
>> not explicitly referenced. Something like that is in order here. For
>> example, an EFI boot-directdisk (which admittedly doesn't exist yet)
>> would not have a syslinux.cfg but would still need the change. Consider
>> using the syslinux class to abstract this necessary change. Then I can
>> add the gummiboot change when EFI support is added.
> Do you mean adding a function to the syslinux class which updates root= 
> in syslinux.cfg previously created by build_syslinux_cfg()?

In the words of a wise director at a large technology company, "I meant
whatever is the most intelligent." :-)

This could be a new function in syslinux.bbclass. It could also be a
parameter to build_syslinux_cfg which would allow it to be used from
either bootimg.bbclass, boot-directdisk.bbclass, with or without EFI,
with various kernel versions, etc. I suspect some parameterization will
result in the cleanest, most maintainable approach, but investigation is
required.

Thanks!

Darren

> 
>> --
>> Darren
>>
>>> +	fi
>>> +
>>>   	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS
>>>   	mcopy -i $HDDIMG -s $HDDDIR/* ::/
>>>   
>>> @@ -71,10 +88,8 @@ build_boot_dd() {
>>>   	END3=`expr \( $ROOTFSBLOCKS \* 1024 \) + $END1`
>>>   
>>>   	echo $ROOTFSBLOCKS $TOTALSIZE $END1 $END2 $END3
>>> -	rm -rf $IMAGE
>>>   	dd if=/dev/zero of=$IMAGE bs=1024 seek=$TOTALSIZE count=1
>>>   
>>> -	parted $IMAGE mklabel msdos
>>>   	parted $IMAGE mkpart primary fat16 0 ${END1}B
>>>   	parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
>>>   	parted $IMAGE set 1 boot on
>>>
> Regards,
> Jonathan
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel

