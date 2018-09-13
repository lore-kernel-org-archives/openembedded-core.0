Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5FCE571AC1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 23:46:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Sep 2018 16:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,371,1531810800"; d="scan'208";a="69839841"
Received: from dmatanko-mobl1.gar.corp.intel.com (HELO [10.249.77.31])
	([10.249.77.31])
	by fmsmga007.fm.intel.com with ESMTP; 13 Sep 2018 16:46:38 -0700
To: Andre McCurdy <armccurdy@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <20180913072547.12321-1-anuj.mittal@intel.com>
	<CAJ86T=V1LDa=b07pxFi3x-D0ijw0PZMFH_BwsHsoQodhjEOnNg@mail.gmail.com>
	<CA+chaQePowpbWZi_k-iJKdUn+ocPZC_0T4VBArs82DSuO0iJkw@mail.gmail.com>
	<CAJ86T=WukCufiTWU-p8L2cCA4DsnCxC-iPp+Ed-7nWviEAYjRQ@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <e8dd9925-9790-5fc6-3754-ab56951ab7c3@intel.com>
Date: Fri, 14 Sep 2018 07:46:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WukCufiTWU-p8L2cCA4DsnCxC-iPp+Ed-7nWviEAYjRQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-core2: use n270 instead of core2duo
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
X-List-Received-Date: Thu, 13 Sep 2018 23:46:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/14/2018 06:50 AM, Andre McCurdy wrote:
> On Thu, Sep 13, 2018 at 3:16 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Is this different issue than what was discussed in:
>> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg109516.html
>>
>> The message is slightly different (might be changed in newer qemu used now),
>> but the issue I had before was that features of selected -cpu and host cpu
>> didn't match and qemu failed with:
>> qemu-system-x86_64: warning: host doesn't support requested feature:
>> CPUID.01H:EDX.ss [bit 27]
>> when some features were missing and kvm was used.
>>

The message is different in this case because that one was for KVM, this
one is when using user space emulation so it's checking what can be
emulated and what is being asked by way of -cpu parameter [1].

>> If it's the same root cause, then it's not a bug in qemu.
> 
> Thanks. Looks like it could be the same issue - if qemu is running
> with KVM on a host which isn't natively compatible with the full
> core2duo feature set.

Similar problem, but a different issue in my opinion. So these features
(lm, syscall) that we see warnings about are only seen when building for
32 bit while running qemu-i386 for executing postinsts.

Looking at qemu commit logs, it doesn't look like these two features are
supported with qemu-i386. So, I changed the qemu -cpu value that is used
with qemu-i386 to a lower denominator which still supports the
instruction set that we build for for 32 bit.

[1] https://wiki.qemu.org/Documentation/TCG
[2]
https://github.com/qemu/qemu/commit/4586f157757acc5c8edcc954289c7aa51661235c

> 
> From the Yocto bug these warnings are coming from the nightly builds:
> 
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=12916
> 
> Has something changed recently? Have the nightly builds moved onto an
> AMD machine?
> 
> 
>> On Thu, Sep 13, 2018 at 11:33 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> On Thu, Sep 13, 2018 at 12:25 AM, Anuj Mittal <anuj.mittal@intel.com>
>>> wrote:
>>>> Fixes warnings in builds using core2-32 tune:
>>>>
>>>> warning: TCG doesn't support requested feature:
>>>> CPUID.80000001H:EDX.syscall [bit 11]
>>>> warning: TCG doesn't support requested feature: CPUID.80000001H:EDX.lm
>>>> [bit 29]
>>>>
>>>> when executing postinsts using qemu-i386.
>>>>
>>>> i386 target doesn't enable CPUID_EXT2_SYSCALL and CPUID_EXT2_LM [1]
>>>> while cpu choice of core2duo that we use for core2-32 TUNE does [2].
>>>> Use n270 cpu instead to use with qemu which supports SSSE3 and doesn't
>>>> have these bits enabled [3].
>>>>
>>>> [1] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L739
>>>> [2] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L1439
>>>> [3] https://github.com/qemu/qemu/blob/master/target/i386/cpu.c#L1603
>>>>
>>>> Fixes [YOCTO #12916]
>>>
>>> Is this working around a bug in qemu?
>>>
>>>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>> ---
>>>>  meta/conf/machine/include/tune-core2.inc | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/conf/machine/include/tune-core2.inc
>>>> b/meta/conf/machine/include/tune-core2.inc
>>>> index c686bb4682..ddde719bde 100644
>>>> --- a/meta/conf/machine/include/tune-core2.inc
>>>> +++ b/meta/conf/machine/include/tune-core2.inc
>>>> @@ -21,7 +21,7 @@ TUNE_FEATURES_tune-core2-32 =
>>>> "${TUNE_FEATURES_tune-x86} core2"
>>>>  BASE_LIB_tune-core2-32 = "lib"
>>>>  TUNE_PKGARCH_tune-core2-32 = "core2-32"
>>>>  PACKAGE_EXTRA_ARCHS_tune-core2-32 = "${PACKAGE_EXTRA_ARCHS_tune-i686}
>>>> core2-32"
>>>> -QEMU_EXTRAOPTIONS_core2-32 = " -cpu core2duo"
>>>> +QEMU_EXTRAOPTIONS_core2-32 = " -cpu n270"
>>>>
>>>>  AVAILTUNES += "core2-64"
>>>>  TUNE_FEATURES_tune-core2-64 = "${TUNE_FEATURES_tune-x86-64} core2"
>>>> --
>>>> 2.17.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


