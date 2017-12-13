Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94E5778874
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 14:17:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBDEH5lp026183
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Dec 2017 06:17:05 -0800 (PST)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Dec 2017 06:17:05 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1513168490.19417.183.camel@linuxfoundation.org>
	<694b540b-1fc8-0388-5419-01c6e3f100c6@windriver.com>
	<1513173904.16507.1.camel@linuxfoundation.org>
	<85f7c521-01c4-7870-0f57-7ca217fce8e3@windriver.com>
	<1513174448.16507.8.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <9c348b48-b93c-f1b4-9ab5-707c3af2a947@windriver.com>
Date: Wed, 13 Dec 2017 09:17:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1513174448.16507.8.camel@linuxfoundation.org>
Cc: "Lock, Joshua" <joshua.g.lock@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Fix for the APIC hangs in qemux86-64
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
X-List-Received-Date: Wed, 13 Dec 2017 14:17:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/13/2017 09:14 AM, Richard Purdie wrote:
> On Wed, 2017-12-13 at 09:07 -0500, Bruce Ashfield wrote:
>> On 12/13/2017 09:05 AM, Richard Purdie wrote:
>>>
>>> On Wed, 2017-12-13 at 08:38 -0500, Bruce Ashfield wrote:
>>>>
>>>> On 12/13/2017 07:34 AM, Richard Purdie wrote:
>>>>>
>>>>>
>>>>> Hi Bruce,
>>>>>
>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12301
>>>>>
>>>>> We've root caused the hangs we're seeing in qemux86-64 on our
>>>>> autobuilder workers. We've identified a commit on 4.15-rc3
>>>>> which
>>>>> fixes
>>>>> the issue but backporting it to the autobuilder's host kernels
>>>>> will
>>>>> be
>>>>> a pain.
>>>>>
>>>>> As a workaround I'd like to enable x2apic on qemux86-64. Since
>>>>> that
>>>>> works via MSRs it avoids the problem.
>>>>>
>>>>> Would it be a big issue to set CONFIG_X86_X2APIC=y for qemux86-
>>>>> 64?
>>>> Nope. No big deal at all. I've used the same config i the past
>>>> when doing work with rt-KVM, so I know it well.
>>>>
>>>> I'll prep a commit, and send it along as part of a rebased set
>>>> of kernel patches.
>>> Thanks, much appreciated.
>>>
>>> Did we get to the bottom of the 4.12 selftest failures?
>>>
>> Not yet no. I was distracted for a day, but need to learn how
>> to run them myself. I was able to log in via serial in my normal
>> boot flow, so that didn't get me anywhere.
>>
>> Is the selftest HOWO in the yocto docs ? I'll google it up this
>> morning.
> 
> No HOWTO but I did give you the command. In a poky checkout run:
> 
> oe-selftest -r runqemu.RunqemuTests.test_boot_deploy

Yah, that's where it went off the rails for me, so I figure that
I'm doing something stupid:

yow-bashfiel-d4 [/home/bruc...poky/build]> oe-selftest -r 
runqemu.RunqemuTests.test_boot_deploy
Traceback (most recent call last):
   File "/home/bruce/poky/scripts/oe-selftest", line 43, in <module>
     from oeqa.utils import load_test_components
ImportError: bad magic number in 'oeqa': b'\x03\xf3\r\n'

> 
> which runs a single test that fails (setup DL_DIR/SSTATE_MIRRORS first
> to speed it up a bit).
> 
> It may tell you to clear SANITY_TESTED_DISTROS, I think it auto adds
> meta-selftest now. You may also need to set DISPLAY to something (e.g.
> a dummy vncserver).

I'll keep smashing on it.

Bruce

> 
> Not sure what is different about the serial qemu is using verses your
> own tests...
> 
>>   > We may also need to backport the defconfig change back to the older
>>   > releases so we don't get the hangs in those builds either...
>>   Not a problem either. I'll prepare several.>
> 
> Thanks!
> 
> Cheers,
> 
> Richard
>>


