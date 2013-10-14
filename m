Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 06E456D18C
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 16:00:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Oct 2013 09:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,493,1378882800"; d="scan'208";a="418959491"
Received: from unknown (HELO [10.255.15.234]) ([10.255.15.234])
	by orsmga002.jf.intel.com with ESMTP; 14 Oct 2013 09:00:47 -0700
Message-ID: <525C152E.1040604@linux.intel.com>
Date: Mon, 14 Oct 2013 09:00:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <1381761079-8709-1-git-send-email-Chase.Maupin@ti.com>
	<CAAQYJAtZYFkxBMHz8eO_KCnXrToKb1uocVsDtnoeOphqQCYkSA@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED101597AC445@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101597AC445@DLEE11.ent.ti.com>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: update local rules for new touchscreen device
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
X-List-Received-Date: Mon, 14 Oct 2013 16:00:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/2013 07:09 AM, Maupin, Chase wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On
>> Behalf Of Andrea Adami
>> Sent: Monday, October 14, 2013 8:59 AM
>> To: Openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] udev: update local rules for new
>> touchscreen device
>>
>> On Mon, Oct 14, 2013 at 4:31 PM, Chase Maupin
>> <Chase.Maupin@ti.com> wrote:
>>> * While working with a new capacitive touchscreen it was found
>>>    that the existing udev rule that creates the
>>>    /dev/input/touchscreen0 symlink was too restrictive and did
>> not
>>>    match the MODALAIS entry for this touchscreen. which is:
>>>
>>>    MODALIAS=input:b0018v0000p0000e0000-
>> e0,1,3,k14A,ra0,1,2F,35,36,39,mlsfw
>>>
>>> * By looking at the input_print_modalias function in the Linux
>>>    kernel drivers/input/input.c file and referencing the meaning
>>>    of the evbits and attributes of the input_dev structure it
>> seems
>>>    that for identification of a touchscreen the match with ,18
>>>    which was matching part of the absbit structure is overkill.
>>>
>>> * It seems that the absbit entry is used for devices like
>>>    touchscreens and if that the the "a" is followed by 0 and 1
>> this
>>>    is sufficient.
>>>
>>> * So the logic has now been changed to check for the "e" 0 and 3
>>>    values which correspond to EV_SYN and EV_ABS, then check for
>>>    the "a" attribute with 0 and 1.
>>>
>>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>>> ---
>>>   meta/recipes-core/udev/udev/local.rules |    4 +++-
>>>   meta/recipes-core/udev/udev_182.bb      |    2 +-
>>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/udev/udev/local.rules
>> b/meta/recipes-core/udev/udev/local.rules
>>> index 72d92ef..d0cbf91 100644
>>> --- a/meta/recipes-core/udev/udev/local.rules
>>> +++ b/meta/recipes-core/udev/udev/local.rules
>>> @@ -17,5 +17,7 @@
>>>   ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*",
>> RUN+="/sbin/modprobe $env{MODALIAS}"
>>>
>>>   # Create a symlink to any touchscreen input device
>>> -SUBSYSTEM=="input", KERNEL=="event[0-9]*",
>> ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*",
>> SYMLINK+="input/touchscreen0"
>>> +# Trigger based on input type, that the evbit (-e) has EV_SYN
>> and EV_ABS,
>>> +# has an EV_ABS value (-a) which is used for touchscreen type
>> devices.
>>> +SUBSYSTEM=="input", KERNEL=="event[0-9]*",
>> ATTRS{modalias}=="input:*-e0*,3,*a0,1,*",
>> SYMLINK+="input/touchscreen0"
>>>
>>> diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-
>> core/udev/udev_182.bb
>>> index d66292e..a90c289 100644
>>> --- a/meta/recipes-core/udev/udev_182.bb
>>> +++ b/meta/recipes-core/udev/udev_182.bb
>>> @@ -1,6 +1,6 @@
>>>   include udev.inc
>>>
>>> -PR = "r7"
>>> +PR = "r8"
>>>
PR Bump is not needed anymore.

>>>   # module-init-tools from kmod_git will provide libkmod runtime
>>>   DEPENDS += "module-init-tools"
>>> --
>>> 1.7.0.4
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> Agreed
>>
>> I noticed it some time ago but the patch is still on hold....
>> http://patchwork.openembedded.org/patch/25093/
>
> Thanks.  I missed this.  I can confirm this works for my TS device as well.
>
There was some discussion about this back then also, I would ask that 
Paul verifies that this patch is OK.

Thanks
	Sau!



>>
>>
>> Acked-by: Andrea Adami <andrea.adami@gmail.com>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

