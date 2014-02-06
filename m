Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C486C6CBB2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 21:49:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s16LmtE1007446
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Feb 2014 13:48:55 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 6 Feb 2014 13:48:54 -0800
Message-ID: <52F40344.907@windriver.com>
Date: Thu, 6 Feb 2014 16:48:52 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
	<52CC1E02.9070102@windriver.com>
	<52CC633C.6000404@free-electrons.com>
	<52CC65E5.6010003@windriver.com> <20140129131021.GH24156@piout.net>
In-Reply-To: <20140129131021.GH24156@piout.net>
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
X-List-Received-Date: Thu, 06 Feb 2014 21:49:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 14-01-29 08:10 AM, Alexandre Belloni wrote:
> Hi Bruce,
>
> Any news on that ?

work with me on the triple nesting of this response, but it should be
easier to just reply to this email, and consolidate all the questions
I had.

This is also a bit long .. so apologies for that as well.

I've been running migration tests with the 3.14 yocto kernel I'm pulling
together, and not seeing the same behaviour that I expected, or what is
in your commit log. Are there any steps missing from what made the log ?

See below .. make sure to read to the bottom, since this is all largely
a discussion about the log in the end :)

 > git branch --contains fbe98bb9ed3dae23e320c6b113e35f129538d14a
* master

 > grep -C 2 ^VERSION Makefile
VERSION = 3
PATCHLEVEL = 14
SUBLEVEL = 0

So we have all the relevant commits, and a up to date tree. Operating
on the .config from a 64 bit x86 build:

 > grep USB_ETH .config
CONFIG_USB_ETH=y
CONFIG_USB_ETH_RNDIS=y
CONFIG_USB_ETH_EEM=y

 > make savedefconfig
scripts/kconfig/conf --savedefconfig=defconfig Kconfig
.config:5333:warning: override: USB_ETH changes choice state
.config:5336:warning: USB_G_NCM creates inconsistent choice state
.config:5337:warning: USB_GADGETFS creates inconsistent choice state
.config:5338:warning: USB_FUNCTIONFS creates inconsistent choice state
.config:5342:warning: USB_MASS_STORAGE creates inconsistent choice state
.config:5343:warning: USB_GADGET_TARGET creates inconsistent choice state
.config:5344:warning: USB_G_SERIAL creates inconsistent choice state
.config:5345:warning: USB_MIDI_GADGET creates inconsistent choice state
.config:5346:warning: USB_G_PRINTER creates inconsistent choice state
.config:5347:warning: USB_CDC_COMPOSITE creates inconsistent choice state
.config:5348:warning: USB_G_NOKIA creates inconsistent choice state
.config:5349:warning: USB_G_ACM_MS creates inconsistent choice state
.config:5351:warning: USB_G_HID creates inconsistent choice state
.config:5352:warning: USB_G_DBGP creates inconsistent choice state
.config:5355:warning: USB_G_WEBCAM creates inconsistent choice state
.config:6201:warning: symbol value 'm' invalid for VME_BUS

 > cp defconfig .config

 > yes '' | make oldconfig

 > grep USB_ETH .config
CONFIG_USB_ETH=m
CONFIG_USB_ETH_RNDIS=y
CONFIG_USB_ETH_EEM=y

So far so good, this matches what I'd expect. Now with olddefconfig / 
oldnoconfig

 > cp defconfig .config
 > make oldnoconfig
scripts/kconfig/conf --olddefconfig Kconfig
#
# configuration written to .config
#
yow-bashfiel-d3 [/home/bruc...rnel/linux]> grep USB_ETH .config
CONFIG_USB_ETH=m
CONFIG_USB_ETH_RNDIS=y
CONFIG_USB_ETH_EEM=y

.. CONFIG_USB_ETH is still =m.

I've also been running a whole series of configuration tests on the
defconfigs found in the various arch/platforms in the mainline kernel,
and on a modern (3.14-rc) kernel, getting the same results from
yes "" | oldconfig and olddefconfig. i.e. migrating their configs with
either technique results in the same resulting .config,

Which if you recall the above question was my big concern, was the
migration between kernel versions using the different techniques going
to yield different results on the same .config.

The answer to that is "it appears not", and really, taking a Kconfig's
default IS the right thing to do if you must make a choice, and aren't
familiar with the option.

** So, that leaves me with agreeing that the change should be ok from
that front, and that we definitely need the fallback to the yes "" |
oldconfig variant if the newer targets don't exist. But from my tests,
the commit log is slightly off .. again, maybe I messed something up
in my tests with 3.14, but it is worth double checking.

And finally, to allow someone who really doesn't like the command full
flexibility, I'm running with the following change, and it offers
an easy way to change behaviour .. opinions ?

--->----->--->----->--->----->--->----->
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b76a65699755..9510996d52c1 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -313,6 +313,8 @@ python sysroot_stage_all () {
      oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), 
d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
  }

+KERNEL_CONFIG_COMMAND ?= "yes '' | oe_runmake oldconfig"
+
  kernel_do_configure() {
         # fixes extra + in /lib/modules/2.6.37+
         # $ scripts/setlocalversion . => +
@@ -325,7 +327,7 @@ kernel_do_configure() {
         if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
                 cp "${WORKDIR}/defconfig" "${B}/.config"
         fi
-       yes '' | oe_runmake oldconfig
+       eval ${KERNEL_CONFIG_COMMAND}
  }
--->----->--->----->--->----->--->----->

Doing a v3 of the fallback version, with a checked commit log and
perhaps even the command flexibility would keep everyone happy and
I can add my Acked-by to that version.

Cheers,

Bruce


>
> On Tue, Jan 07, 2014 at 15:39:01 -0500, Bruce Ashfield wrote :
>> On 14-01-07 03:27 PM, Alexandre Belloni wrote:
>>> On 07/01/2014 16:32, Bruce Ashfield wrote:
>>>> On 14-01-07 09:18 AM, Alexandre Belloni wrote:
>>>>> When using a defconfig, using yes '' | make oldconfig may not result in
>>>>> the correct configuration being set. For example:
>>>>>
>>>>>    $ grep USB_ETH .config
>>>>>    CONFIG_USB_ETH=y
>>>>>    CONFIG_USB_ETH_RNDIS=y
>>>>>    CONFIG_USB_ETH_EEM=y
>>>>>    $ make savedefconfig
>>>>>    scripts/kconfig/conf --savedefconfig=defconfig Kconfig
>>>>>    $ cp defconfig .config
>>>>>    ‘defconfig’ -> ‘.config’
>>>>>    $ yes '' | make oldconfig
>>>>>    [...]
>>>>>    #
>>>>>    # configuration written to .config
>>>>>    #
>>>>>    $ grep USB_ETH .config
>>>>>    CONFIG_USB_ETH=m
>>>>>    CONFIG_USB_ETH_RNDIS=y
>>>>>    CONFIG_USB_ETH_EEM=y
>>>>>
>>>>> Using make olddefconfig solves that but we'll use oldnoconfig for
>>>>> backward compatibility with older kernels.
>>>>>
>>>>>    $ cp defconfig .config
>>>>>    ‘defconfig’ -> ‘.config’
>>>>>    $ make oldnoconfig
>>>>>    scripts/kconfig/conf --olddefconfig Kconfig
>>>>>    #
>>>>>    # configuration written to .config
>>>>>    #
>>>>>    $ grep USB_ETH .config
>>>>>    CONFIG_USB_ETH=y
>>>>>    CONFIG_USB_ETH_RNDIS=y
>>>>>    CONFIG_USB_ETH_EEM=y
>>>>>
>>>>> For more information, please refer to:
>>>>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=fbe98bb9ed3dae23e320c6b113e35f129538d14a
>>>>>
>>>>
>>>> It was my understanding that this commit changed the Kconfig behaviour
>>>> to set the selected options to =y and prevent the menu choice from
>>>> "hiding" the options in a depedent choice menu. But maybe I'm remembering
>>>> wrong.
>>>>
>>>> The point being, that with that commit in place. Doesn't the behaviour
>>>> match what we want with yes and oldconfig ?
>>>>
>>>
>>> Nope, that commit is fixing the issue when using make <target>_defconfig
>>> or make olddefconfig. Note that using make menuconfig already had the
>>> correct behavior before that commit.
>>
>> right. I'm pretty familiar with that code, so I knew this worked.
>>
>>>
>>> As shown in my commit log, using yes '' | make oldconfig is still
>>> getting it wrong.
>>
>> But that was also my point. Since the target suggested in this
>> patch hasn't always existed (and hence has a kernel version binding),
>> why not use olddefconfig with this patch, and leave the functionality
>> closer to its existing behaviour ? We'd still have a kernel capability
>> binding, but we'd not have the =y converted to =m, and the default of
>> 'y' for new functionality would be maintained.
>>
>>>
>>>> .. I'll run some tests to confirm for myself, but I thought I'd throw
>>>> the question out as well. I don't typically use defconfigs, so I need
>>>> to do a bit of leg work.
>>>>
>>>
>>> Yeah, using a full .config doesn't trigger that behavior.
>>
>> I don't use those either :) but the end result is the same.
>>
>> Cheers,
>>
>> Bruce
>>
>>>
>>>> I don't have any big issues with the patch, but I just want to be sure,
>>>> since changing this default could change the configs of many defconfig
>>>> users, and they may have been unknowingly relying on the old behaviour.
>>>>
>>>
>>> I can understand that. But I don't see any other way to make the really
>>> expected behavior to work without risking breaking anything.
>>>
>>
>


