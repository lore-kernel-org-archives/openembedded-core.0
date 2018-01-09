Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2A07892E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 01:45:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w091jopH000289
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Jan 2018 17:45:50 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 8 Jan 2018 17:45:38 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1513133105.git.liezhi.yang@windriver.com>
	<e911950fbee39af9c5889c41872f2f77f94cc9c1.1513133105.git.liezhi.yang@windriver.com>
	<1514983400.5525.137.camel@linuxfoundation.org>
	<8555d421-668e-a2ba-d405-4ef01ee2f3f4@windriver.com>
	<1514989197.5525.147.camel@linuxfoundation.org>
	<ad266515-4055-77cc-70b8-8a1240cf1e90@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <cd3f8296-57de-5e8e-2012-1736f8030e28@windriver.com>
Date: Tue, 9 Jan 2018 09:45:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <ad266515-4055-77cc-70b8-8a1240cf1e90@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] image-live.bbclass: remove MLPREFIX from syslinux
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
X-List-Received-Date: Tue, 09 Jan 2018 01:45:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


On 01/04/2018 07:13 PM, Robert Yang wrote:
> Hi RP,
> 
> Thanks for the reply.
> 
> On 01/03/2018 10:19 PM, Richard Purdie wrote:
>> On Wed, 2018-01-03 at 21:56 +0800, Robert Yang wrote:
>>>> Also, there are some things which never make sense as a multilib,
>>>> the
>>>> kernel is one example and I'm starting to wonder if syslinux would
>>>> be
>>>> another. In the kernel (and kernel module) case we'd provide all
>>>> the
>>>> libX variants from the same recipe, we may want to do that for
>>>> syslinux.
>>> I think that syslinux is different from kernel, 64bit kernel can
>>> provide 32bit kernel via kernel config, but syslinux can't (except
>>> these non arch files).
>>
>> Think about this differently. The system can ever only boot one single
>> kernel. The image can have several different multilibs running at once
>> in different userspace processes but there can only ever be one running
>> kernel.
>>
>> How that kernel is configured is obviously important but the key thing
>> is there can only be one running.
>>
>> The bootloader is similar in that you likely only ever want one and I
>> suspect syslinux is similar.
> 
> Makes sense, I will work on it.
> 
>>
>> Also, don't confuse this with multi-boot or multi partition systems
>> where there could be a "main" and a "backup" kernel. In those cases
>> there would only ever be one running at once.
>>
>>>> It may be we can't avoid the multiple compiler issue and the
>>>> current
>>>> codebase may not do so, I think currently we can avoid multiple
>>>> glibc
>>>> though.
>>> I'm not sure about a problem on this, should lib32-image can run
>>> 64bit programs or not ? If yes, then kernel should be 64bit, and we
>>> can't avoid building 64bit compilers. And I'm leaning to yes since we
>>> call it multilib, the pure 32bit image which can't run 64bit programs
>>> can't be called multilib.
>>
>> That is a configuration issue for the multilib you select. In general,
>> yes you'd want a 64 bit kernel.
>>
>>> I did a rough search on why glibc is built, when bitbake lib32-image,
>>> it is because:
>>>
>>> 64 bit kernel -> gcc-cross-x86_64 -> virtual/${TARGET_PREFIX}libc-
>>> for-gcc,
>>> and the TARGET_PREFIX is x86_64 when building gcc-cross-x86_64,
>>> While the virtual/x86_64-poky-linux-libc-for-gcc is provided by
>>> glibc.
>>>
>>> I tried to remove the depends, both "bitbake gcc-cross-x86_64" and
>>> "bitbake linux-yocto" can be built, but other recipes such as quilt
>>> would be failed:
>>
>> I find it interesting that gcc-cross-x86_64 would build without glibc.
>> If that really is the case we may be able to speed up our compiler
>> bootstrap so that could be worth investigating further.
>>
>> Its not surprising that libgcc won't build without glibc though.
>> Perhaps gcc-cross works since we split out the build of libgcc?
>>
>>>> collect2: error: ld returned 1 exit status
>>>> Makefile:978: recipe for target 'libgcc_s.so' failed
>>> And move virtual/${TARGET_PREFIX}libc-for-gcc to BASE_DEFAULT_DEPS
>>> can't make it work either, so it seems that we can't avoid building
>>> glibc.
>>
>> No, I'd forgotten that gcc-cross depends on glibc. Based on the above
>> there may still be some optimisation we can make here.
>>
>> In the back of my mind, I'm concious that one x86 cross compiler should
>> be able to work for 32 and 64 bit too, its just the compiler options
>> and libgcc etc. would need to be generated for both...
> 
> Build one toolchain for both x86 32 and 64 is possible, I'd like to work
> on it if it is worth.

Add Mark in the loop, here is his comments:
"""
We had a single toolchain built outside of the Yocto Project environment with a
custom spec file.  The only way to do this inside of the Yocto Project would be
to generate a custom spec file for the cross-toolchain based on a specific
configuration.

In the past when this was explored, it was deemed to not be a 'generic'
solution.  So using the stock GCC spec file(s) and/or multiple toolchains was
the better generic approach.
"""

So I'm leaning to keep the current status, multiple toolchains for multilib.

// Robert

> 
> // Robert
> 
>>
>>>> Regardless, I do think this needs a little more thought, we also
>>>> need
>>>> better multiple test cases as we're not catching issues like this.
>>>> think this needs to be revisited along with your outstanding
>>>> multilib
>>>> patch series which I haven't found the time to review yet (sorry).
>>> That's all right, I'm very glad to make mutilib work well, including
>>> adding test cases for them. It is nearly broken after changed from
>>> smart + rpm5 to dnf + rpm4, those patches fixed the problem.
>>
>> Agreed, its important and on my list of things to review, I've just had
>> to focus on getting build testing working properly and now I can try
>> and clear some of the patch backlog.
>>
>> Cheers,
>>
>> Richard
>>

