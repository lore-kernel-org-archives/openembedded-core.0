Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8376CDE4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 20:27:42 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id CB5437FA; Tue,  7 Jan 2014 21:27:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from [192.168.1.65] (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 61B237BD;
	Tue,  7 Jan 2014 21:27:47 +0100 (CET)
Message-ID: <52CC633C.6000404@free-electrons.com>
Date: Tue, 07 Jan 2014 21:27:40 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Organization: Free Electrons
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
	<52CC1E02.9070102@windriver.com>
In-Reply-To: <52CC1E02.9070102@windriver.com>
X-Enigmail-Version: 1.5.2
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
X-List-Received-Date: Tue, 07 Jan 2014 20:27:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/01/2014 16:32, Bruce Ashfield wrote:
> On 14-01-07 09:18 AM, Alexandre Belloni wrote:
>> When using a defconfig, using yes '' | make oldconfig may not result in
>> the correct configuration being set. For example:
>>
>>   $ grep USB_ETH .config
>>   CONFIG_USB_ETH=y
>>   CONFIG_USB_ETH_RNDIS=y
>>   CONFIG_USB_ETH_EEM=y
>>   $ make savedefconfig
>>   scripts/kconfig/conf --savedefconfig=defconfig Kconfig
>>   $ cp defconfig .config
>>   ‘defconfig’ -> ‘.config’
>>   $ yes '' | make oldconfig
>>   [...]
>>   #
>>   # configuration written to .config
>>   #
>>   $ grep USB_ETH .config
>>   CONFIG_USB_ETH=m
>>   CONFIG_USB_ETH_RNDIS=y
>>   CONFIG_USB_ETH_EEM=y
>>
>> Using make olddefconfig solves that but we'll use oldnoconfig for
>> backward compatibility with older kernels.
>>
>>   $ cp defconfig .config
>>   ‘defconfig’ -> ‘.config’
>>   $ make oldnoconfig
>>   scripts/kconfig/conf --olddefconfig Kconfig
>>   #
>>   # configuration written to .config
>>   #
>>   $ grep USB_ETH .config
>>   CONFIG_USB_ETH=y
>>   CONFIG_USB_ETH_RNDIS=y
>>   CONFIG_USB_ETH_EEM=y
>>
>> For more information, please refer to:
>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=fbe98bb9ed3dae23e320c6b113e35f129538d14a
>>
> 
> It was my understanding that this commit changed the Kconfig behaviour
> to set the selected options to =y and prevent the menu choice from
> "hiding" the options in a depedent choice menu. But maybe I'm remembering
> wrong.
> 
> The point being, that with that commit in place. Doesn't the behaviour
> match what we want with yes and oldconfig ?
> 

Nope, that commit is fixing the issue when using make <target>_defconfig
or make olddefconfig. Note that using make menuconfig already had the
correct behavior before that commit.

As shown in my commit log, using yes '' | make oldconfig is still
getting it wrong.

> .. I'll run some tests to confirm for myself, but I thought I'd throw
> the question out as well. I don't typically use defconfigs, so I need
> to do a bit of leg work.
> 

Yeah, using a full .config doesn't trigger that behavior.

> I don't have any big issues with the patch, but I just want to be sure,
> since changing this default could change the configs of many defconfig
> users, and they may have been unknowingly relying on the old behaviour.
> 

I can understand that. But I don't see any other way to make the really
expected behavior to work without risking breaking anything.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

