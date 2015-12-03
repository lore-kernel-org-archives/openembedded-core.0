Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1943C6012C;
	Thu,  3 Dec 2015 16:45:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 03 Dec 2015 08:45:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="833614418"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.40])
	([10.219.16.40])
	by orsmga001.jf.intel.com with ESMTP; 03 Dec 2015 08:45:02 -0800
Message-ID: <566071A5.4010005@linux.intel.com>
Date: Thu, 03 Dec 2015 10:45:25 -0600
From: Mariano Lopez <mariano.lopez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: roman@khimov.ru, Mark Hatle <mark.hatle@windriver.com>
References: <56538808.5050606@linux.intel.com>
	<90526450.BhUWnDVvgQ@masala.hex>	<5654AC12.9060808@windriver.com>
	<11874234.lUveKP5eiY@masala.hex>
In-Reply-To: <11874234.lUveKP5eiY@masala.hex>
Cc: openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 03 Dec 2015 16:45:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/24/2015 12:47 PM, Roman Khimov wrote:
> В письме от 24 ноября 2015 12:27:30 пользователь Mark Hatle написал:
>> On 11/24/15 12:05 PM, Roman Khimov wrote:
>>> В письме от 24 ноября 2015 07:47:38 пользователь Mark Hatle написал:
>>>> On 11/24/15 4:39 AM, Roman Khimov wrote:
>>>>> В письме от 23 ноября 2015 15:41:28 пользователь Mariano Lopez написал:
>>>>>> 1. Use a separate partition for the configuration.
>>>>>>
>>>>>>     a. The pro of this method is the partition is not touched during the
>>>>>>
>>>>>> update.
>>>>>>
>>>>>>     b. The con of this method is the configuration is not directly in
>>>>>>
>>>>>> rootfs (example: /etc).
>>>>> That's the right solution, although to do it really right (at least IMO)
>>>>> you need to implement the /usr merge [1] (and that's orthogonal to using
>>>>> or not using systemd), which can also help you make your /usr read-only
>>>>> (because that's just code and static data) with read-write / for user
>>>>> data of various sorts.
>>>> Why does merging /usr have anything to do with this?  I've read the case
>>>> for merging /usr and / and still don't understand why it "helps".  The
>>>> key is that if you have separate partitions for /usr and /, then you
>>>> need to update both of them in sequence.  Merging these two just seems
>>>> like a lazy solution to people not wanting to deal with early boot being
>>>> self-contained.
>>> It helps in that you can achieve a clear separation of your software and
>>> users data (whatever that is, even if that's just some configuration
>>> files) and only update your part (which is /usr).
>> This can easily be archived using different partitions like /opt as well.
> Usually it leads to more complicated partitioning and more complicated startup
> (as well as update) procedure. Of course it can vary from system to system,
> but in my experience /usr merge was exactly the thing needed to clearly
> separate and simplify things. One way or another you want to have your code
> and users data to be separated, /usr merge makes it quite simple.
>
>> Bandwidth is a big deal in areas that are not serviced by anything but very
>> GPRS or worse.  So 100 MB is even too big in some cases.  Cost is a factor
>> as is overall bandwidth.
>>
>> Again, it depends on the product and what you are building if this matters.
>>
>> The point is we don't want to make some assumptions that preclude
>> alternative implementations.
> Sure.
>

Thanks to all for your input. The conclusion of this thread is:

1. One size doesn't fit all.
2. Most of the people was fine with the image based update.
3. The recommended way to keep the configuration is to have a separated 
data partition.
4. The partition scheme would be:
     1. boot. This is the usual boot partition
     2. rootfs. Partition used for normal operation.
     3. maintenance. This partition will be used to update rootfs.
     4. data. This will hold the configuration files. Not modified by
     updates.


-- 
Mariano Lopez

