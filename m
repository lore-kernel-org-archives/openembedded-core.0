Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3936F60646
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 08:18:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01P8Hugm017452
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 25 Feb 2020 00:18:06 -0800
Received: from [0.0.0.0] (147.11.103.217) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 25 Feb 2020 00:17:45 -0800
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1581991613-30949-1-git-send-email-li.zhou@windriver.com>
	<CADkTA4Oo=uvRps0UUcbrk+eZDhaN3Fi8M-RDcdKuLz-zAOGM3A@mail.gmail.com>
	<342f0a1b-aec2-932a-2a49-cd2b896d8822@windriver.com>
	<CADkTA4Mp8rTZf2z3cCehWipMT66BXhyhkzfZQaB1LGqS88OEXw@mail.gmail.com>
From: zhou li <li.zhou@windriver.com>
Message-ID: <e817eb26-13ce-efb3-288f-09c654628971@windriver.com>
Date: Tue, 25 Feb 2020 16:17:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4Mp8rTZf2z3cCehWipMT66BXhyhkzfZQaB1LGqS88OEXw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: fix missing generated files from the packet
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
X-List-Received-Date: Tue, 25 Feb 2020 08:18:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 2/18/20 9:36 PM, Bruce Ashfield wrote:
> On Mon, Feb 17, 2020 at 10:58 PM zhou li <li.zhou@windriver.com> wrote:
>>
>> On 2/18/20 10:12 AM, Bruce Ashfield wrote:
>>> On Mon, Feb 17, 2020 at 9:07 PM Li Zhou <li.zhou@windriver.com> wrote:
>>>> The file arch/arm/include/generated/asm/unistd-nr.h is needed by some
>>>> external kernel module. Error occurs when building the module with
>>>> the SDK.
>>>>
>>>> Add arch/${ARCH}/include/generated dir and files under it to
>>>> kernel-devsrc package to solve this issue.
>>>>
>>>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>>>> ---
>>>>    meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
>>>> index b6f2dbc..8621fe1 100644
>>>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>>>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>>>> @@ -108,6 +108,12 @@ do_install() {
>>>>           fi
>>>>
>>>>           cp -a include $kerneldir/build/include
>>>> +
>>>> +       if [ -d arch/${ARCH}/include/generated ]; then
>>>> +           mkdir -p $kerneldir/build/arch/${ARCH}/include
>>>> +           cp -r arch/${ARCH}/include/generated $kerneldir/build/arch/${ARCH}/include
>>>> +       fi
>>> This is just papering over the real problem.
>>>
>>> Anything that is generated, should be regenerated when the headers are
>>> used/prepared.
>>>
>>> What is missing and/or why isn't that happening with this ?
>>>
>>> Bruce
>>
>> In some old version yocto, the file
>> arch/arm/include/generated/asm/unistd-nr.h can be directly used from our
>> sdk. So now it isn't permitted any more? And we should figure out how to
> Anything in the generated subdirectories of the kernel build should be
> regenerated when we do the make prepare/scripts/modules_prepare steps.
> If it isn't being regenerated, then we are missing something in devsrc
> that can regenerate them (either a step in the preparation, a
> Makefile, a script ..).
>
> If we start pulling bits and pieces out of generated, we'll end up
> constantly having to take more and more, when the right thing (by the
> way our minimal devsrc is designed) is to have it regenerated.
>
> It's valid to use it, but we shouldn't need to copy it if it can be
> generated. If it can't be generated, we should document why with a
> comment in the code and in the commit message of the change.


Hi, Bruce:

        Thank you for your reply. I try and find that <make archprepare> 
can generate the header file mentioned.

Then do you mean that the user should run <make archprepare> to generate 
the header files needed first, and then make their own code using those 
header files?

Thanks a lot.


>
> Bruce
>
>
>> generate it again when developing the external kernel modules? Thank you.
>>
>>
>>>> +
>>>>        )
>>>>
>>>>        # now grab the chunks from the source tree that we need
>>>> --
>>>> 1.9.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>> --
>> Best Regards!
>> Zhou Li
>> Phone number: 86-10-84778511
>>
>
-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


