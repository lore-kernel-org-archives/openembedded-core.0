Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C19616EAB5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 15:11:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s17FBLFQ028103
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Feb 2014 07:11:21 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 7 Feb 2014 07:11:21 -0800
Message-ID: <52F4F796.2070101@windriver.com>
Date: Fri, 7 Feb 2014 10:11:18 -0500
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
	<20140207140223.GA30901@piout.net>
In-Reply-To: <20140207140223.GA30901@piout.net>
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
X-List-Received-Date: Fri, 07 Feb 2014 15:11:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 14-02-07 09:02 AM, Alexandre Belloni wrote:
> Hi,
>
> So, I did the same tests with an x86_64 config and an ARM config.
>
> On 06/02/2014 at 16:48:52 -0500, Bruce Ashfield wrote :
>>> git branch --contains fbe98bb9ed3dae23e320c6b113e35f129538d14a
>> * master
>>
>>> grep -C 2 ^VERSION Makefile
>> VERSION = 3
>> PATCHLEVEL = 14
>> SUBLEVEL = 0
>>
>
> I'm also on 3.14, commit 9343224bfd4be6a02e6ae0c0d66426c955c7d76e
>
>> So we have all the relevant commits, and a up to date tree. Operating
>> on the .config from a 64 bit x86 build:
>>
>>> grep USB_ETH .config
>> CONFIG_USB_ETH=y
>> CONFIG_USB_ETH_RNDIS=y
>> CONFIG_USB_ETH_EEM=y
>>
>>> make savedefconfig
>> scripts/kconfig/conf --savedefconfig=defconfig Kconfig
>> .config:5333:warning: override: USB_ETH changes choice state
>> .config:5336:warning: USB_G_NCM creates inconsistent choice state
>> .config:5337:warning: USB_GADGETFS creates inconsistent choice state
>> .config:5338:warning: USB_FUNCTIONFS creates inconsistent choice state
>> .config:5342:warning: USB_MASS_STORAGE creates inconsistent choice state
>> .config:5343:warning: USB_GADGET_TARGET creates inconsistent choice state
>> .config:5344:warning: USB_G_SERIAL creates inconsistent choice state
>> .config:5345:warning: USB_MIDI_GADGET creates inconsistent choice state
>> .config:5346:warning: USB_G_PRINTER creates inconsistent choice state
>> .config:5347:warning: USB_CDC_COMPOSITE creates inconsistent choice state
>> .config:5348:warning: USB_G_NOKIA creates inconsistent choice state
>> .config:5349:warning: USB_G_ACM_MS creates inconsistent choice state
>> .config:5351:warning: USB_G_HID creates inconsistent choice state
>> .config:5352:warning: USB_G_DBGP creates inconsistent choice state
>> .config:5355:warning: USB_G_WEBCAM creates inconsistent choice state
>> .config:6201:warning: symbol value 'm' invalid for VME_BUS
>>
>
> I don't get those warnings.

The warnings are unimportant, they are because of the base config
that I used, and they are talking about how the default symbol processing
can be applied to a config when migrating kernels. Which is the point
I'm trying to make.

>
>>> cp defconfig .config
>>
>>> yes '' | make oldconfig
>>
>>> grep USB_ETH .config
>> CONFIG_USB_ETH=m
>> CONFIG_USB_ETH_RNDIS=y
>> CONFIG_USB_ETH_EEM=y
>>
>> So far so good, this matches what I'd expect. Now with olddefconfig
>> / oldnoconfig
>>
>
> Exactly what I have and what I'm trying to fix.
>
>>> cp defconfig .config
>>> make oldnoconfig
>> scripts/kconfig/conf --olddefconfig Kconfig
>> #
>> # configuration written to .config
>> #
>> yow-bashfiel-d3 [/home/bruc...rnel/linux]> grep USB_ETH .config
>> CONFIG_USB_ETH=m
>> CONFIG_USB_ETH_RNDIS=y
>> CONFIG_USB_ETH_EEM=y
>>
>> .. CONFIG_USB_ETH is still =m.
>>
>
> That is where I end up with:

What's in your saved defconfig ? My point is that if you are saving
a defconfig, it is on the save where that value needs to be correct,
not on the application to the tree, since if it is set .. it will be
respected.

>
> $ grep USB_ETH .config
> CONFIG_USB_ETH=y
> CONFIG_USB_ETH_RNDIS=y
> CONFIG_USB_ETH_EEM=y
>
>> I've also been running a whole series of configuration tests on the
>> defconfigs found in the various arch/platforms in the mainline kernel,
>> and on a modern (3.14-rc) kernel, getting the same results from
>> yes "" | oldconfig and olddefconfig. i.e. migrating their configs with
>> either technique results in the same resulting .config,
>>
>> Which if you recall the above question was my big concern, was the
>> migration between kernel versions using the different techniques going
>> to yield different results on the same .config.
>>
>> The answer to that is "it appears not", and really, taking a Kconfig's
>> default IS the right thing to do if you must make a choice, and aren't
>> familiar with the option.
>>
>
> But it should be different because using 'yes "" | oldconfig' is wrong.

It isn't wrong .. it is just one way of processing a config. And
again to my point, one that may have been implicitly relied upon by
some use cases.

> Let's have a look at qi_lb60_defconfig:
>
> $ ARCH=mips make qi_lb60_defconfig
> #
> # configuration written to .config
> #
> $ grep USB_ETH .config
> CONFIG_USB_ETH=y
> # CONFIG_USB_ETH_RNDIS is not set
> # CONFIG_USB_ETH_EEM is not set
>
> $ cp arch/mips/configs/qi_lb60_defconfig .config
> ‘arch/mips/configs/qi_lb60_defconfig’ -> ‘.config’
> $ yes '' | make oldconfig
> [...]
> $ grep USB_ETH .config
> CONFIG_USB_ETH=m
> # CONFIG_USB_ETH_RNDIS is not set
> # CONFIG_USB_ETH_EEM is not set

This is a different use case, there's no save defconfig happening
between the copy and the run, which is what was happening in the
other one.

>
>
>> ** So, that leaves me with agreeing that the change should be ok from
>> that front, and that we definitely need the fallback to the yes "" |
>> oldconfig variant if the newer targets don't exist. But from my tests,
>> the commit log is slightly off .. again, maybe I messed something up
>> in my tests with 3.14, but it is worth double checking.
>>
>
> I believe my commit message is actually right and something went wrong
> in your tests.

Heh, then we are at a stalemate. I used a stock 3.14 kernel, and my
results stand, and in my testing, your results with the savedefconfig
flow don't match.

Use the mips example in the changelog then .. since that one actually
is a consistent result.

>
>> And finally, to allow someone who really doesn't like the command full
>> flexibility, I'm running with the following change, and it offers
>> an easy way to change behaviour .. opinions ?
>>
>> --->----->--->----->--->----->--->----->
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index b76a65699755..9510996d52c1 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -313,6 +313,8 @@ python sysroot_stage_all () {
>>       oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"),
>> d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
>>   }
>>
>> +KERNEL_CONFIG_COMMAND ?= "yes '' | oe_runmake oldconfig"
>> +
>
> If we go that route, shouldn't we have sane default and use
> KERNEL_CONFIG_COMMAND ?= "oe_runmake oldnoconfig || yes '' | oe_runmake oldconfig"

Of course, that's what I was referencing when I said "the fallback",
I just didn't need it for my testing.

>
> I understand that it may change the behaviour for some existing
> configurations but I believe it is the correct behaviour to actually
> respect what is in the kernel config provided by the user.

On that point, I disagree. It is respecting the default values, not
the config provided by the user. If the user wants full control, they
can supply a full .config, or fragments.

>
>>   kernel_do_configure() {
>>          # fixes extra + in /lib/modules/2.6.37+
>>          # $ scripts/setlocalversion . => +
>> @@ -325,7 +327,7 @@ kernel_do_configure() {
>>          if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
>>                  cp "${WORKDIR}/defconfig" "${B}/.config"
>>          fi
>> -       yes '' | oe_runmake oldconfig
>> +       eval ${KERNEL_CONFIG_COMMAND}
>>   }
>> --->----->--->----->--->----->--->----->
>>
>> Doing a v3 of the fallback version, with a checked commit log and
>> perhaps even the command flexibility would keep everyone happy and
>> I can add my Acked-by to that version.
>>
>
> BTW, I've been told by the kconfig maintainers that the preferred way of
> doing it would be to copy the provided defconfig to
> arch/${ARCH}/configs/oe_defconfig and then oe_runmake oe_defconfig. But

linux-yocto* doesn't use defconfigs, and defconfigs can cause plenty of
pain, so opinions vary on this and anyone with a custom kernel recipe
is free to use defconfigs from within the tree, but making the generic
build change to that .. risks jiggling things for no obvious gain.

Cheers,

Bruce

> unfortunately, that doesn't work for architectures without a 'configs'
> directory. For 3.14, this is only alpha and frv but x86 got it starting
> with 2266cfd50de3872e877eeca3dd4a6f940f22ba60, this is v2.6.24 and I
> remember being asked to support older kernels.
>
>


