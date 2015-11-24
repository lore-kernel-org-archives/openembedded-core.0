Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7F46012C;
	Tue, 24 Nov 2015 16:30:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 24 Nov 2015 08:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,338,1444719600"; d="scan'208";a="828092191"
Received: from jwbarz-mobl2.amr.corp.intel.com (HELO [10.254.191.22])
	([10.254.191.22])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2015 08:30:18 -0800
To: Roman Khimov <khimov@pkcc-tb.ru>, openembedded-devel@lists.openembedded.org
References: <56538808.5050606@linux.intel.com> <60350861.Ng52JMGuMb@bancha.hex>
From: "Lopez, Mariano" <mariano.lopez@linux.intel.com>
Message-ID: <56549099.6070301@linux.intel.com>
Date: Tue, 24 Nov 2015 10:30:17 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <60350861.Ng52JMGuMb@bancha.hex>
Cc: yocto@yoctoproject.org, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: Reference updater filesystem
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
X-List-Received-Date: Tue, 24 Nov 2015 16:30:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/24/2015 4:30 AM, Roman Khimov wrote:
> В письме от 23 ноября 2015 15:41:28 пользователь Mariano Lopez написал:
>> 1. Use a separate partition for the configuration.
>>     a. The pro of this method is the partition is not touched during the
>> update.
>>     b. The con of this method is the configuration is not directly in
>> rootfs (example: /etc).
> That's the right solution, although to do it really right (at least IMO) you
> need to implement the /usr merge [1] (and that's orthogonal to using or not
> using systemd), which can also help you make your /usr read-only (because
> that's just code and static data) with read-write / for user data of various
> sorts.

To be honest I'm not familiar with /usr merge, I need to check on that 
to see if it is a good option with the current OE-core infrastructure.

>
>> 3. Have an OverlayFS for the rootfs or the partition that have the
>> configuration.
>>     a. The pro is the configuration is  "directly" in rootfs.
>>     b. The con is there is need to provide a custom init to guarantee the
>> Overlay is mounted before the boot process.
> And this is the approach I would recommend not doing. I've used UnionFS for
> thing like that (overlaying whole root file system) some 6 years ago, it
> sounded nice and it kinda worked, but it wasn't difficult to make it fail
> (just a little playing with power), we've even seen failures on production
> devices, like when you have whiteout file for directory already written, but
> don't have new files in it yet and that can completely ruin the system.
>
> Also, it usually works better when you don't have any changes in the lower
> layer, but we're talking about updating it here, you can easily end up in a
> situation where you have updated something in the rootfs but that was
> overriden by upper layer and thus your user doesn't see any change.

Thanks for sharing your experience, this is another big con for the 
Overlay option.

>
>> With the above information I'm proposing to use a separate partition for
>> the configuration; this is because is more reliable and doesn't require
>> big changes in the current architecture.
>>
>> So, the idea is to have 4 partitions in the media:
>> 1. boot. This is the usual boot partition
>> 2. data. This will hold the configuration files. Not modified by updates.
>> 3. maintenance. This partition will be used to update rootfs.
>> 4. rootfs. Partition used for normal operation.
> You probably don't need to separate 1 and 3, all the code for system update
> should easily fit into initramfs and just making /boot a bit larger would
> allow you to store some backup rootfs.

I left the /boot partition separate just in case there is need to 
replace the kernel or the bootloader. This way it would be easier to 
change using the same method as the upgrading the rootfs.

>
> Also, you can swap 4 and 2 which will be useful if you're installing on
> different sized storage devices, usually you know good enough the size of your
> rootfs, but you probably want to leave more space for user data if there is an
> opportunity to do so, that's just easier to do with data partition at the end.

I was thinking in the same thinking just backwards, usually 
configuration files are just small text files that don't require too 
much space. If you require a new feature in the target that will make 
rootfs to grow depending on the feature. I plan to use wic to accomplish 
the filesystem structure. A good thing about wic is that it will be very 
easy to do the swap, just need to modify two options in the .wks file.

>
>
> [1] http://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/


