Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E85C6E81A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 16:10:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s17GAGW7007019
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Feb 2014 08:10:16 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 7 Feb 2014 08:10:16 -0800
Message-ID: <52F50565.6090204@windriver.com>
Date: Fri, 7 Feb 2014 11:10:13 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
	<52CC1E02.9070102@windriver.com>
	<52CC633C.6000404@free-electrons.com>
	<52CC65E5.6010003@windriver.com>
	<20140129131021.GH24156@piout.net> <52F40344.907@windriver.com>
	<20140207140223.GA30901@piout.net> <52F4F796.2070101@windriver.com>
	<20140207154319.GA3070@piout.net>
In-Reply-To: <20140207154319.GA3070@piout.net>
Cc: darren.hart@intel.com, Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 07 Feb 2014 16:10:22 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 14-02-07 10:43 AM, Alexandre Belloni wrote:
> On 07/02/2014 at 10:11:18 -0500, Bruce Ashfield wrote :
>> On 14-02-07 09:02 AM, Alexandre Belloni wrote:
>>>>> cp defconfig .config
>>>>> make oldnoconfig
>>>> scripts/kconfig/conf --olddefconfig Kconfig
>>>> #
>>>> # configuration written to .config
>>>> #
>>>> yow-bashfiel-d3 [/home/bruc...rnel/linux]> grep USB_ETH .config
>>>> CONFIG_USB_ETH=m
>>>> CONFIG_USB_ETH_RNDIS=y
>>>> CONFIG_USB_ETH_EEM=y
>>>>
>>>> .. CONFIG_USB_ETH is still =m.
>>>>
>>>
>>> That is where I end up with:
>>
>> What's in your saved defconfig ? My point is that if you are saving
>> a defconfig, it is on the save where that value needs to be correct,
>> not on the application to the tree, since if it is set .. it will be
>> respected.
>>
>
> Exactly my point, using yes "" | make oldconfig DOESN'T respect the
> provided defconfig because that doesn't go through the correct kconfig
> code that is solving the issue:
>
> $ make savedefconfig
> scripts/kconfig/conf --savedefconfig=defconfig Kconfig
> $ grep USB_ETH defconfig
> CONFIG_USB_ETH=y
> CONFIG_USB_ETH_EEM=y
> $ cp defconfig .config
> ‘defconfig’ -> ‘.config’
> $ yes '' | make oldconfig > /dev/null
> $ grep USB_ETH .config
> CONFIG_USB_ETH=m
> CONFIG_USB_ETH_RNDIS=y
> CONFIG_USB_ETH_EEM=y

There are actually multiple workflows that can get this wrong .. or
right. So we are actually agreeing, it all just depends on how you
are handling the configs. savedefconfig can get do strange things
with the defaults as well:

  > git describe
v3.13-11367-g38dbfb59d117

  > cp arch/mips/configs/qi_lb60_defconfig .config
  > ARCH=mips make savedefconfig
scripts/kconfig/conf --savedefconfig=defconfig Kconfig
  > grep USB_ETH defconfig
CONFIG_USB_ETH=m
# CONFIG_USB_ETH_RNDIS is not set

.. but yes, as we've been saying ... if you run that through oldnoconfig
first, then save the config, you get the =y propagating.

I'd argue that the oldconfig and savedefconfig are bugs, but I'm not
motivated enough to actually try and fix them at the moment :P

Having authored my fair share of Kconfig patches, it is a strange
and wonderful world :)

>
>
> $ cp defconfig .config
> ‘defconfig’ -> ‘.config’
> $ make oldnoconfig
> scripts/kconfig/conf --olddefconfig Kconfig
> #
> # configuration written to .config
> #
> $ grep USB_ETH .config
> CONFIG_USB_ETH=y
> CONFIG_USB_ETH_RNDIS=y
> CONFIG_USB_ETH_EEM=y
>
>
>>> I believe my commit message is actually right and something went wrong
>>> in your tests.
>>
>> Heh, then we are at a stalemate. I used a stock 3.14 kernel, and my
>> results stand, and in my testing, your results with the savedefconfig
>> flow don't match.
>>
>
> Please check again, maybe you had CONFIG_USB_ETH=m in your defconfig ?

If you save it first, then yes, you do get it set to =m. It's all about
the flow.

>
>
>> Use the mips example in the changelog then .. since that one actually
>> is a consistent result.
>>
>
> Ok, I can do that.
>
>>>
>>> I understand that it may change the behaviour for some existing
>>> configurations but I believe it is the correct behaviour to actually
>>> respect what is in the kernel config provided by the user.
>>
>> On that point, I disagree. It is respecting the default values, not
>> the config provided by the user. If the user wants full control, they
>> can supply a full .config, or fragments.
>>
>
> I'm not sure I follow you. I have a defconfig with CONFIG_USB_ETH=y and
> I ended with a kernel compiled with CONFIG_USB_ETH=m. I don't think this
> is sane. It would not be necessary to provide a full kernel .config if
> the config options provided in the defconfig were respected.

See above, it varies based on the workflow, at least in my experience.

>
>
>>>
>>>>   kernel_do_configure() {
>>>>          # fixes extra + in /lib/modules/2.6.37+
>>>>          # $ scripts/setlocalversion . => +
>>>> @@ -325,7 +327,7 @@ kernel_do_configure() {
>>>>          if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
>>>>                  cp "${WORKDIR}/defconfig" "${B}/.config"
>>>>          fi
>>>> -       yes '' | oe_runmake oldconfig
>>>> +       eval ${KERNEL_CONFIG_COMMAND}
>>>>   }
>>>> --->----->--->----->--->----->--->----->
>>>>
>>>> Doing a v3 of the fallback version, with a checked commit log and
>>>> perhaps even the command flexibility would keep everyone happy and
>>>> I can add my Acked-by to that version.
>>>>
>>>
>>> BTW, I've been told by the kconfig maintainers that the preferred way of
>>> doing it would be to copy the provided defconfig to
>>> arch/${ARCH}/configs/oe_defconfig and then oe_runmake oe_defconfig. But
>>
>> linux-yocto* doesn't use defconfigs, and defconfigs can cause plenty of
>> pain, so opinions vary on this and anyone with a custom kernel recipe
>> is free to use defconfigs from within the tree, but making the generic
>> build change to that .. risks jiggling things for no obvious gain.
>>
>
> linux-yocto is not the only user of kernel.bbclass. meta-fsl-arm and

definitely not, that wasn't what I was trying to imply .. I'm looking
for flexibility precisely because there are many different users.

> meta-fs-arm-extra are using defconfigs and Otavio would prefer not
> having full configs which I understand (and isn't the name used by
> kernel.bbclass "defconfig" misleading then ?).

It's defconfig in the traditional sense, a collection of options that
are the default / baseline configuration for a board. These new fangled
savedefconfigs, olddeconfig, etc, options are all just too new :)

>
> Anyway, let me prepare a v3 and see if we all agree on that (and I
> believe we will :) ).

As do I!

Bruce

>


