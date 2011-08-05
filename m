Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpRwO-0000y5-2x
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 23:28:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Aug 2011 14:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,325,1309762800"; d="scan'208";a="35633417"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2011 14:23:57 -0700
Message-ID: <4E3C5F6D.401@linux.intel.com>
Date: Fri, 05 Aug 2011 14:23:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>	<2c351319afd13acfca1283104172729925cfb696.1312469790.git.nitin.a.kamble@intel.com>	<1312560258.14274.125.camel@rex>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85FADF@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE85FADF@orsmsx504.amr.corp.intel.com>
Subject: Re: [PATCH 09/10] x86 tune inc files: add x32 abi tune parameters
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
X-List-Received-Date: Fri, 05 Aug 2011 21:28:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2011 11:07 AM, Kamble, Nitin A wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Richard Purdie
>> Sent: Friday, August 05, 2011 9:04 AM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 09/10] x86 tune inc files: add x32 abi
>> tune parameters
>>
>> On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
>>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>>>
>>> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
>>> ---
>>>   meta/conf/machine/include/ia32/arch-ia32.inc |   23
>> ++++++++++++++++++++---
>>>   meta/conf/machine/include/tune-core2.inc     |    4 ++++
>>>   meta/conf/machine/include/tune-x86_64.inc    |    2 +-
>>>   3 files changed, 25 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc
>> b/meta/conf/machine/include/ia32/arch-ia32.inc
>>> index 2709440..fb527da 100644
>>> --- a/meta/conf/machine/include/ia32/arch-ia32.inc
>>> +++ b/meta/conf/machine/include/ia32/arch-ia32.inc
>>> @@ -6,17 +6,29 @@ DEFAULTTUNE ?= "x86"
>>>   TARGET_FPU ?= ""
>>>   X86ARCH32 ?= "i586"
>>>   X86ARCH64 ?= "x86_64"
>>> +X86ARCHX32 ?= "x86_64"
>>>
>>>   # ELF32 ABI
>>>   TUNEVALID[m32] = "IA32 ELF32 standard ABI"
>>> -TUNECONFLICTS[m32] = "m64"
>>> +TUNECONFLICTS[m32] = "m64 mx32"
>>>   TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32",
>> "${X86ARCH32}", "" ,d)}"
>>> +ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "32",
>> "" ,d)}"
>>
>> Please drop the above line. There is no need to change that.
>>
>>>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32",
>> "", d)}"
>>>
>>> +# x32 ABI
>>> +TUNEVALID[mx32] = "IA32e (x86_64) ELF32 standard ABI"
>>> +TUNECONFLICTS[mx32] = "m64 m32"
>>> +TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32",
>> "${X86ARCHX32}", "" ,d)}"
>>> +ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "mx32",
>> "x32", "" ,d)}"
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-
>> mx32", "", d)}"
>>> +TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m
>> elf32_x86_64", "", d)}"
>>> +TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-
>> x32", "", d)}"
>>> +
>>
>> These are fine.
>>
>>>   # ELF64 ABI
>>>   TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
>>> -TUNECONFLICT[m64] = "m32"
>>> +TUNECONFLICT[m64] = "m32 mx32"
>>>   TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64",
>> "${X86ARCH64}", "" ,d)}"
>>> +ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "64",
>> "" ,d)}"
>>
>> Again, please drop the above line.
>>
>>>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64",
>> "", d)}"
>>>
>>>   TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86",
>> "x86_64", d)}"
>>> @@ -30,4 +42,9 @@ PACKAGE_EXTRA_ARCHS_tune-x86 = "x86"
>>>   AVAILTUNES += "x86-64"
>>>   TUNE_FEATURES_tune-x86-64 ?= "m64"
>>>   BASE_LIB_tune-x86-64 ?= "lib64"
>>> -PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86_64"
>>> +PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86-64"
>>
>> That is likely wrong, please drop this piece.
>>
>>> +
>>> +AVAILTUNES += "x86-64-x32"
>>> +TUNE_FEATURES_tune-x86-64-x32 ?= "mx32"
>>> +BASE_LIB_tune-x86-64-x32 ?= "lib"
>>> +PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "x86-64-x32"
>>
>> And this is wrong too.
>>
>> You really want:
>>
>> TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32",
>> "", d)}"
>> PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "x86_64-x32"
>>
>>> diff --git a/meta/conf/machine/include/tune-core2.inc
>> b/meta/conf/machine/include/tune-core2.inc
>>> index 25c2226..8a4de3e 100644
>>> --- a/meta/conf/machine/include/tune-core2.inc
>>> +++ b/meta/conf/machine/include/tune-core2.inc
>>> @@ -18,3 +18,7 @@ TUNE_FEATURES_tune-core2-64 ?=
>> "${TUNE_FEATURES_tune-x86-64} core2"
>>>   BASE_LIB_tune-core2-64 ?= "lib64"
>>>   PACKAGE_EXTRA_ARCHS_tune-core2-64 = "${PACKAGE_EXTRA_ARCHS_tune-x86-
>> 64} core2-64"
>>>
>>> +AVAILTUNES += "core2-x32"
>>> +TUNE_FEATURES_tune-core2-x32 ?= "${TUNE_FEATURES_tune-x86-64-x32}
>> core2"
>>> +BASE_LIB_tune-core2-x32 ?= "lib"
>>> +PACKAGE_EXTRA_ARCHS_tune-core2-x32 = "${PACKAGE_EXTRA_ARCHS_tune-
>> x86-64-x32} core2-x32"
>>
>> PACKAGE_EXTRA_ARCHS_tune-core2-x32 = "${PACKAGE_EXTRA_ARCHS_tune-x86-
>> 64-x32} core2-64-x32"
>>
>> Cheers,
>>
>> Richard
>>
>>
>
> Richard,
>    Changed the commits according to the comments, please pull/cherry-pick again.
>
It might be best to rebase against master and resend a V2 patch set so 
it's clear to RP and other in the community what you changed.

BTW, for the layer, do you really need to pull glibc back in?  Or can 
you use eglibc from oe-core with the correct settings for x32?


Sau!

> Thanks,
> Nitin
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


