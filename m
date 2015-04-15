Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA79605D2
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 16:49:59 +0000 (UTC)
Received: by oign205 with SMTP id n205so30474126oig.2
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 09:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2A0xn8ZC3nVhLwUSfBuxp/XG0LGIw5OShmNcNdXWK90=;
	b=abyCE1zvahRf593Co3kOER30QeHdPSsApujPA9g8OEvdnZ6yeGClm7TqQCfggFvtwk
	w4UaS/ro+vx04a9NMi93mcys3ok+4LgUkbHbg/59JF28k3zTlZMDpXZmvsoGtjwTQ3MO
	akPogMcngmScbY8kaTb1doOlBEVvjW+aahYG8DVddeSYf9bu0zLqNOlxqGEiobuaP5Mn
	t5Qz5taD7FrC+wtcdvh07EFEaA+QKr/4TJ68Pjo99+8crF1vV95t6+qqLLYt9oS59BGs
	aA2Q0zoYuZIN1T+u6RCgySY39Q66M0FjBufVigO0pBtKKpIW3zk96GMnd34HJe3/DcFb
	RBSg==
MIME-Version: 1.0
X-Received: by 10.202.229.139 with SMTP id c133mr16296245oih.99.1429116598725; 
	Wed, 15 Apr 2015 09:49:58 -0700 (PDT)
Received: by 10.202.9.193 with HTTP; Wed, 15 Apr 2015 09:49:58 -0700 (PDT)
In-Reply-To: <552E8DD9.6090202@mail.bg>
References: <355BE46A91031048906B695426A8D8E616B7BE37@DEFTHW99EH4MSX.ww902.siemens.net>
	<552E63F1.9090406@windriver.com> <552E824C.5080603@mail.bg>
	<CADkTA4Puh7QLQemCSrewmMqcnrUJFw4x6bEJsmKu=SRk6C07-A@mail.gmail.com>
	<552E8DD9.6090202@mail.bg>
Date: Wed, 15 Apr 2015 12:49:58 -0400
Message-ID: <CADkTA4MfMCqnPTJrNQGPz+ivJOYiN1ajzttzBVNBVqMVkdnPAg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Nikolay Dimitrov <picmaster@mail.bg>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Move device tree generation from include file to bbclass
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
X-List-Received-Date: Wed, 15 Apr 2015 16:49:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 15, 2015 at 12:12 PM, Nikolay Dimitrov <picmaster@mail.bg> wrote:
> Hi Bruce,
>
>
> On 04/15/2015 06:26 PM, Bruce Ashfield wrote:
>>
>> On Wed, Apr 15, 2015 at 11:22 AM, Nikolay Dimitrov
>> <picmaster@mail.bg> wrote:
>>>
>>> Hi Bruce,
>>>
>>>
>>> On 04/15/2015 04:13 PM, Bruce Ashfield wrote:
>>>>
>>>>
>>>> On 2015-04-15 08:33 AM, Bach, Pascal wrote:
>>>>>
>>>>>
>>>>> Hi
>>>>>
>>>>
>>>> Adding oe-core, since that's the right place to have a discussion
>>>> like this.
>>>>
>>>>> As ARM now also moved to device tree it look like in future we
>>>>> will have more kernels that are using device tree then ones
>>>>> that are not.
>>>>
>>>>
>>>>
>>>> True, but it has been like this for quite some time now :)
>>>>
>>>>> As far as I understand currently the generation of device
>>>>> trees is controlled via KERNEL_DEVICETREE and is handled in via
>>>>> an include file recipes-kernel/linux/linux-dtb.inc.
>>>>>
>>>>> I was thinking about moving this include into a class so it
>>>>> becomes easier to use. Before I dive into implementing
>>>>> something I would like some feedback from the community.
>>>>
>>>>
>>>>
>>>> The big trick with changing anything like this is compatibility
>>>> with existing recipes. Whatever we do, existing recipes and
>>>> layers shouldn't be broken .. or if they are broken, there
>>>> should be a compelling technical reason to do so.
>>>>
>>>>>
>>>>> I have the following variant in mind.
>>>>>
>>>>> Add the device tree generation to the current kernel.bbclass
>>>>> (or let kernel.bblcass inherit from a kernel-dtb.bbclass).
>>>>> This way all kernels would automatically be DT enabled. The
>>>>> class would check if KERNEL_DEVICETREE is set and generate
>>>>> device trees based on this information. For boards that don't
>>>>> have KERNEL_DEVICETREE set the class would do nothing and the
>>>>> behavior is like before. The advantage I see with this
>>>>> approach is that the only thing a user needs to do is to set
>>>>> KERNEL_DEVICETREE in the board and make sure the device trees
>>>>> are available in the kernel they like to build.
>>>>
>>>>
>>>>
>>>> That's pretty much the experience that most users have now, since
>>>> there's nearly always a kernel recipe created, that recipe
>>>> includes linux-dtb.inc, and sets KERNEL_DEVICETREE.
>>>
>>>
>>>
>>> As far as I understood, Pascal's idea is to remove the need for
>>> user recipes to include linux-dtb.inc, and provide this
>>> functionality via inheritance.
>>
>>
>> That is obvious. My questions are around "why". There's no big
>> technical advantage, and if you remove that existing file, you break
>>  existing recipes. Which means you need to leave a stub in place.
>>
>> So without a technical advantage, it's churn for the sake of churn.
>
>
> Well, removing redundancy and simplifying users' recipes could be
> considered an advantage. Also, as the contents of linux-dtb.inc are
> going to be moved to bbclass, the file can be left empty, later
> maintainers remove the extra line from all users' recipes in following
> commits. I don't see breaking as an option.

And we could argue that having more inherits in the base is a bad
thing for users that have no interest in device trees.

One person's advantage is another's churn. I was looking for technical
advantages or a plan for future features that might leverage this.

Cheers,

Bruce

>
>> Bruce
>>
>>>
>>>> Everything else happens to build and package the device tree.
>>>>
>>>> Was there something specifically that was causing issues with the
>>>> current way of building them ?
>>>>
>>>> Cheers,
>>>>
>>>> Bruce
>>>>
>>>>>
>>>>> I appreciate your feedback?
>>>>>
>>>>> Regards Pascal
>
>
> Kind regards,
> Nikolay



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

