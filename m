Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QEb9f-00045t-Sk
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2011 07:49:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Apr 2011 22:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,267,1301900400"; d="scan'208";a="634082360"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga002.jf.intel.com with ESMTP; 25 Apr 2011 22:47:08 -0700
Message-ID: <4DB65C5B.2050409@linux.intel.com>
Date: Mon, 25 Apr 2011 22:47:07 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1303539961.git.sgw@linux.intel.com>	<a0629aa0dc55829565b7ab1725875eac065ab2f1.1303539961.git.sgw@linux.intel.com>	<4DB562CF.1020100@mlbassoc.com>
	<4DB59811.5040109@linux.intel.com> <4DB5ABDB.9070201@mlbassoc.com>
In-Reply-To: <4DB5ABDB.9070201@mlbassoc.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 07/37] modutils-initscripts: fix wrong order of module loading happening in udev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Apr 2011 05:49:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/25/2011 10:14 AM, Gary Thomas wrote:
> On 04/25/2011 09:49 AM, Saul Wold wrote:
>> On 04/25/2011 05:02 AM, Gary Thomas wrote:
>>> On 04/23/2011 12:28 AM, Saul Wold wrote:
>>>> From: =?UTF-8?q?Petr=20=C5=A0tetiar?=<ynezz@true.cz>
>>>>
>>>> In the current state, udev init script is loaded as 3rd and
>>>> modutils.sh as
>>>> 20th, so udevadm called in udev init script loads all kernel modules
>>>> in some
>>>> unpredictable order, not honoring in any way specified order of
>>>> modules in
>>>> /etc/modules. This causes some troubles mainly in the first boot. So
>>>> to fix
>>>> this we now move loading of the kernel modules just before we exec
>>>> udev init
>>>> script. Example of the current state:
>>>>
>>>> Starting udev
>>>> rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc0
>>>> rtc-m48t86 rtc-m48t86: battery ok
>>>> ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc1
>>>>
>>>> root@ts72xx:~# cat /etc/modules
>>>> rtc-ep93xx
>>>> ohci-hcd
>>>> ts72xx_sbcinfo
>>>> rtc-m48t86
>>>>
>>>> As you can guess, this is really wrong behaviour, because I've rtc1 as
>>>> the
>>>> main time source for my system.
>>>>
>>>> root@ts72xx:~# cat /etc/default/hwclock
>>>> HWCLOCKACCESS=yes
>>>> HWCLOCKDEVICE=/dev/rtc1
>>>>
>>>> Expected behaviour with this patch applied:
>>>>
>>>> Please wait: booting...
>>>> ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc0
>>>> usbcore: registered new device driver usb
>>>> ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>>>> ...
>>>> rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc1
>>>> rtc-m48t86 rtc-m48t86: battery ok
>>>> Starting udev
>>>>
>>>> Signed-off-by: Petr Štetiar<ynezz@true.cz>
>>>>
>>>> (based on http://patches.openembedded.org/patch/1917/)
>>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>>> ---
>>>> .../modutils/modutils-initscripts.bb | 4 ++--
>>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>>> b/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>>> index 1665955..5ae34b4 100644
>>>> --- a/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>>> +++ b/meta/recipes-kernel/modutils/modutils-initscripts.bb
>>>> @@ -4,10 +4,10 @@ LICENSE = "PD"
>>>> LIC_FILES_CHKSUM = "file://LICENSE;md5=7bf87fc37976e93ec66ad84fac58c098"
>>>> SRC_URI = "file://modutils.sh \
>>>> file://PD.patch"
>>>> -PR = "r4"
>>>> +PR = "r5"
>>>>
>>>> INITSCRIPT_NAME = "modutils.sh"
>>>> -INITSCRIPT_PARAMS = "start 20 S ."
>>>> +INITSCRIPT_PARAMS = "start 2 S ."
>>>>
>>>> inherit update-rc.d
>>>>
>>>
>>> Should there not be a corresponding change to modutils_2.4.27.bb? It's
>>> not clear to me
>>> where there are these two separate recipes, but they should at least be
>>> kept in sync.
>>>
>> Gary,
>>
>> Could you please resend this as a proper patch with Signed-off-by and commit info.
> 
> Attached.  However, as Koen pointed out, perhaps this recipe should just be dropped,
> at least for Poky?  I don't know that 2.4 kernels are built or supported?


Right, so for clarification, for 2.4 kernels, images should be built
using just the modutils_2.4.27.bb recipe. For 2.6 kernels, images should
be built using module_init_tools and modutils-initscripts.

In oe-core, task-base requires module-init-tools and task-core-boot
requires modutils-initscripts. That actually seems backwards to me as
modutils-initscripts is useless without module-init-tools.

There is a considerable amount of cruft in the kernel base classes
related to older kernels which I'd like to see purged. Perhaps a
meta-linux-2.4 layer would be a good place to keep things like these as
well as the modutils_2.4.27 recipe.

However, in terms of the immediate issue, I agree with Gary's patch.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


