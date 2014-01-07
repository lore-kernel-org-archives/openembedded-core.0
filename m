Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C31246CEB3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 20:39:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s07KdITI023292
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Jan 2014 12:39:18 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 7 Jan 2014 12:39:18 -0800
Message-ID: <52CC65E5.6010003@windriver.com>
Date: Tue, 7 Jan 2014 15:39:01 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	<openembedded-core@lists.openembedded.org>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
	<52CC1E02.9070102@windriver.com>
	<52CC633C.6000404@free-electrons.com>
In-Reply-To: <52CC633C.6000404@free-electrons.com>
Cc: darren.hart@intel.com, Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH] kernel: use oldnoconfig instead of yes '' | make oldconfig
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
X-List-Received-Date: Tue, 07 Jan 2014 20:39:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 14-01-07 03:27 PM, Alexandre Belloni wrote:
> On 07/01/2014 16:32, Bruce Ashfield wrote:
>> On 14-01-07 09:18 AM, Alexandre Belloni wrote:
>>> When using a defconfig, using yes '' | make oldconfig may not result in
>>> the correct configuration being set. For example:
>>>
>>>    $ grep USB_ETH .config
>>>    CONFIG_USB_ETH=y
>>>    CONFIG_USB_ETH_RNDIS=y
>>>    CONFIG_USB_ETH_EEM=y
>>>    $ make savedefconfig
>>>    scripts/kconfig/conf --savedefconfig=defconfig Kconfig
>>>    $ cp defconfig .config
>>>    ‘defconfig’ -> ‘.config’
>>>    $ yes '' | make oldconfig
>>>    [...]
>>>    #
>>>    # configuration written to .config
>>>    #
>>>    $ grep USB_ETH .config
>>>    CONFIG_USB_ETH=m
>>>    CONFIG_USB_ETH_RNDIS=y
>>>    CONFIG_USB_ETH_EEM=y
>>>
>>> Using make olddefconfig solves that but we'll use oldnoconfig for
>>> backward compatibility with older kernels.
>>>
>>>    $ cp defconfig .config
>>>    ‘defconfig’ -> ‘.config’
>>>    $ make oldnoconfig
>>>    scripts/kconfig/conf --olddefconfig Kconfig
>>>    #
>>>    # configuration written to .config
>>>    #
>>>    $ grep USB_ETH .config
>>>    CONFIG_USB_ETH=y
>>>    CONFIG_USB_ETH_RNDIS=y
>>>    CONFIG_USB_ETH_EEM=y
>>>
>>> For more information, please refer to:
>>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=fbe98bb9ed3dae23e320c6b113e35f129538d14a
>>>
>>
>> It was my understanding that this commit changed the Kconfig behaviour
>> to set the selected options to =y and prevent the menu choice from
>> "hiding" the options in a depedent choice menu. But maybe I'm remembering
>> wrong.
>>
>> The point being, that with that commit in place. Doesn't the behaviour
>> match what we want with yes and oldconfig ?
>>
>
> Nope, that commit is fixing the issue when using make <target>_defconfig
> or make olddefconfig. Note that using make menuconfig already had the
> correct behavior before that commit.

right. I'm pretty familiar with that code, so I knew this worked.

>
> As shown in my commit log, using yes '' | make oldconfig is still
> getting it wrong.

But that was also my point. Since the target suggested in this
patch hasn't always existed (and hence has a kernel version binding),
why not use olddefconfig with this patch, and leave the functionality
closer to its existing behaviour ? We'd still have a kernel capability
binding, but we'd not have the =y converted to =m, and the default of
'y' for new functionality would be maintained.

>
>> .. I'll run some tests to confirm for myself, but I thought I'd throw
>> the question out as well. I don't typically use defconfigs, so I need
>> to do a bit of leg work.
>>
>
> Yeah, using a full .config doesn't trigger that behavior.

I don't use those either :) but the end result is the same.

Cheers,

Bruce

>
>> I don't have any big issues with the patch, but I just want to be sure,
>> since changing this default could change the configs of many defconfig
>> users, and they may have been unknowingly relying on the old behaviour.
>>
>
> I can understand that. But I don't see any other way to make the really
> expected behavior to work without risking breaking anything.
>


