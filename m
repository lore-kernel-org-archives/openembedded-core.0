Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB08965C9C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 14:38:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4FEcKpC013128
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 May 2015 07:38:20 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 15 May 2015 07:38:20 -0700
Message-ID: <555604DB.3020603@windriver.com>
Date: Fri, 15 May 2015 10:38:19 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Andre McCurdy <armccurdy@gmail.com>
References: <1431373976-20993-1-git-send-email-dmitry_eremin@mentor.com>	
	<CAJTo0LZUd4bcbfTL+TbtiXOU1wc9ZaFGP0mTM_Y0hVMb1eMqWg@mail.gmail.com>	
	<20150512144749.GD2714@jama>	
	<CAJ86T=X08DRhpZjH8Ge0vjXXuk1dfa2RbXiDarNX153-oE1Cmw@mail.gmail.com>
	<1431611197.30971.212.camel@linuxfoundation.org>
	<5554B329.2090708@windriver.com> <55559DB6.3000600@mentor.com>
In-Reply-To: <55559DB6.3000600@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND][PATCH 1/3] meta: add new qemuarma9 machine definition
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
X-List-Received-Date: Fri, 15 May 2015 14:38:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-15 03:18 AM, Dmitry Eremin-Solenikov wrote:
> On 05/14/2015 05:37 PM, Bruce Ashfield wrote:
>> On 2015-05-14 09:46 AM, Richard Purdie wrote:
>>> On Wed, 2015-05-13 at 18:17 -0700, Andre McCurdy wrote:
>>>> On Tue, May 12, 2015 at 7:47 AM, Martin Jansa
>>>> <martin.jansa@gmail.com> wrote:
>>>>> On Tue, May 12, 2015 at 03:25:43PM +0100, Burton, Ross wrote:
>>>>>> On 11 May 2015 at 20:52, Dmitry Eremin-Solenikov
>>>>>> <dmitry_eremin@mentor.com>
>>>>>> wrote:
>>>>>>
>>>>>>> Currently qemuarm is limited to 256 Mb of RAM. Sometimes this is too
>>>>>>> little to run necessary applications. Add a new arm configuration
>>>>>>> based
>>>>>>> on Versatile Express board, Cortex-A9 CPU, allowing up to 1Gb of
>>>>>>> RAM.
>>>>>>>
>>>>>>
>>>>>> Not sure I'm keen on oe-core having two almost-identical qemuarm
>>>>>> machines.
>>>>>> Why not just change the qemuarm machine to use the A9?
>>>>>
>>>>> Then we should officially drop thumb1 support, because current qemuarm
>>>>> builds are quite broken when thumb is enabled and dropping current
>>>>> qemuarm or replacing it with A9 variant will prevent oe-core to be
>>>>> testable on autobuilder. See
>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>>>>
>>>> +1 for updating qemuarm to an ARMv7 CPU.
>>>
>>> One thing I did notice about the new proposed arm machine was the lack
>>> of graphics support. We really do need a machine with graphics. If we
>>> could get a machine which had graphics and more memory that would be
>>> much more attractive to switch to.
>>>
>>> This also has implications on the kernel support (cc Bruce).
>>
>> I've been using the qemuarma9 machine in some different contexts for
>> a while now, and in fact, there's a BSP definition in linux-yocto
>> already for it.
>>
>> So from that point of view, the kernel impacts are understood.
>>
>> But not only does the qemuarma9 lack graphics, it also has issues
>> with disk and USB, so generally it isn't as usable as the arm926
>> qemu variant.
>
> I ended up enabling virtio to get disc working in qemuarma9. Such setup
> is used in provided runqemu patches. However I did not include a patch
> to linux-yocto recipe/git tree.

Interesting. That didn't work all that well when I tried, but that was
over a year ago. The solution was to use SD card images here, but they
have limitations as well.

>
>>
>> There are other options that have newer CPUs, or just changing the
>> cpu .. but a wholesale switch to the "qemuarma9" machine tends to
>> bring some new challenges.
>
> Yes, that is why in the patches I proposed qemuarma9 as an alternative
> (rather then a replacement) to plain qemuarm.

Agreed (and I got that part), but my counter argument is that there are
other machines to chose from and it is better to find one that meets all
the needs, versus maintaining two.

Bruce

>


