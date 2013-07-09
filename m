Return-Path: <net147@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 827EB619DD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 14:03:17 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id q10so5283746pdj.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=E4cadUy0ouLRCG95QcaKGtywlxQcgV6eTn0v9AwzWzE=;
	b=GDth8gMx+vN9MH87Nugo3K2iL3MbZ7fnhZI+K3ndtagSjOM2BLdD3YCLrkN2MNAFGT
	LTsHNt/BujMqM6Zy6VQauHXDHm9bBseznonn6uNeKdHW6/cPhLPdnqlv2kQU0yxeEEjO
	lUukZs9OpFckoEos+MwPiu+X9y9kT91jJLf4iLUsOL+OFMykPCd8CsbujMNFmpzDJuRv
	AcJIJzZor9gHxCynTJZH4Ue8qmuLd1IzXLAy5yYrWPqpP0aYifs+ocL8bvde93xwDK6i
	uBremiG88VeSzWvBLkSXrtUGMBo1R1+0Bas2ioNZ5RcwFV9rlBvjHgIieKzscPE679lR
	JyxA==
X-Received: by 10.66.40.136 with SMTP id x8mr27939571pak.33.1373378598749;
	Tue, 09 Jul 2013 07:03:18 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	mr3sm28446976pbb.27.2013.07.09.07.03.16 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Jul 2013 07:03:17 -0700 (PDT)
Message-ID: <51DC16FE.9070103@gmail.com>
Date: Tue, 09 Jul 2013 23:58:22 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1369283514-8837-1-git-send-email-net147@gmail.com>
	<51B26C98.1030002@linux.intel.com> <51B32B95.4040806@gmail.com>
	<51B5FE40.10107@linux.intel.com>
In-Reply-To: <51B5FE40.10107@linux.intel.com>
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
X-List-Received-Date: Tue, 09 Jul 2013 14:03:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2013 2:26 AM, Darren Hart wrote:
>
> On 06/08/2013 06:03 AM, Jonathan Liu wrote:
>> Hi Darren,
>>
>>>> +		sed -i "s|\broot=[^ ]*|root=PARTUUID=$DISK_SIGNATURE-02|" $HDDDIR/syslinux.cfg
>>> In bootimg.bbclass I have been abstracting out the boot loader so it is
>>> not explicitly referenced. Something like that is in order here. For
>>> example, an EFI boot-directdisk (which admittedly doesn't exist yet)
>>> would not have a syslinux.cfg but would still need the change. Consider
>>> using the syslinux class to abstract this necessary change. Then I can
>>> add the gummiboot change when EFI support is added.
>> Do you mean adding a function to the syslinux class which updates root=
>> in syslinux.cfg previously created by build_syslinux_cfg()?
> In the words of a wise director at a large technology company, "I meant
> whatever is the most intelligent." :-)
>
> This could be a new function in syslinux.bbclass. It could also be a
> parameter to build_syslinux_cfg which would allow it to be used from
> either bootimg.bbclass, boot-directdisk.bbclass, with or without EFI,
> with various kernel versions, etc. I suspect some parameterization will
> result in the cleanest, most maintainable approach, but investigation is
> required.
>
> Thanks!
>
> Darren
Submitted V3 patch which sets SYSLINUX_ROOT appropriately instead of 
modifying syslinux.cfg directly.

Regards,
Jonathan

>
>>> --
>>> Darren
>>>
>>>> +	fi
>>>> +
>>>>    	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS
>>>>    	mcopy -i $HDDIMG -s $HDDDIR/* ::/
>>>>    
>>>> @@ -71,10 +88,8 @@ build_boot_dd() {
>>>>    	END3=`expr \( $ROOTFSBLOCKS \* 1024 \) + $END1`
>>>>    
>>>>    	echo $ROOTFSBLOCKS $TOTALSIZE $END1 $END2 $END3
>>>> -	rm -rf $IMAGE
>>>>    	dd if=/dev/zero of=$IMAGE bs=1024 seek=$TOTALSIZE count=1
>>>>    
>>>> -	parted $IMAGE mklabel msdos
>>>>    	parted $IMAGE mkpart primary fat16 0 ${END1}B
>>>>    	parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
>>>>    	parted $IMAGE set 1 boot on
>>>>
>> Regards,
>> Jonathan
>>


