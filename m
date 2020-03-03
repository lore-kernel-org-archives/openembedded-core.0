Return-Path: <zhengjunling@huawei.com>
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6E8619E6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 14:39:44 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id BDCB67830CDA1EE2445A;
	Tue,  3 Mar 2020 22:39:43 +0800 (CST)
Received: from [127.0.0.1] (10.111.155.88) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Mar 2020
	22:39:34 +0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Khem Raj
	<raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20200302171153.28030-1-zhengjunling@huawei.com>
	<666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
	<9d41cd5d-7355-175d-391c-35231c9a7e92@huawei.com>
	<41b7391039564f10a0c8b4f63eeb4274@XBOX03.axis.com>
	<dec3b3e2-e293-8107-bf97-34a0804ff4b0@huawei.com>
	<241102f474044a96bb3d6fdaa96199b4@XBOX03.axis.com>
From: Junling Zheng <zhengjunling@huawei.com>
Message-ID: <4cf21ebb-cfb2-f020-2dfb-55fb57b315c5@huawei.com>
Date: Tue, 3 Mar 2020 22:39:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <241102f474044a96bb3d6fdaa96199b4@XBOX03.axis.com>
X-Originating-IP: [10.111.155.88]
X-CFilter-Loop: Reflected
Cc: "wangnan0@huawei.com" <wangnan0@huawei.com>
Subject: Re: [PATCH] arch-arm64.inc: Do not append aarch64 in MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 03 Mar 2020 14:39:44 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 2020/3/3 22:20, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Junling Zheng <zhengjunling@huawei.com>
>> Sent: den 3 mars 2020 15:14
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Khem Raj
>> <raj.khem@gmail.com>; openembedded-core@lists.openembedded.org
>> Cc: wangnan0@huawei.com
>> Subject: Re: [OE-core] [PATCH] arch-arm64.inc: Do not append aarch64 in
>> MACHINEOVERRIDES
>>
>> On 2020/3/3 19:59, Peter Kjellerstedt wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-
>>>> bounces@lists.openembedded.org> On Behalf Of Junling Zheng
>>>> Sent: den 3 mars 2020 04:11
>>>> To: Khem Raj <raj.khem@gmail.com>; openembedded-
>>>> core@lists.openembedded.org
>>>> Cc: wangnan0@huawei.com
>>>> Subject: Re: [OE-core] [PATCH] arch-arm64.inc: Do not append aarch64 in
>>>> MACHINEOVERRIDES
>>>>
>>>> On 2020/3/3 2:29, Khem Raj wrote:
>>>>>
>>>>>
>>>>> On 3/2/20 9:11 AM, Junling Zheng wrote:
>>>>>> Currently, for arch-arm64, poky will append the MACHINEOVERRIDES with
>>>>>> "aarch64:", which has the higher priority than
>> TRANSLATED_TARGET_ARCH.
>>>>>> So, for aarch64 big endian, the variable '<foo>_aarch64' will
>> override
>>>>>> not only '<foo>', but also '<foo>_aarch64-be', thus we will get an
>>>>>> incorrect variable.
>>>>>>
>>>>>> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
>>>>>> ---
>>>>>>   meta/conf/machine/include/arm/arch-arm64.inc | 2 --
>>>>>>   1 file changed, 2 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc
>>>> b/meta/conf/machine/include/arm/arch-arm64.inc
>>>>>> index 53f4566815..32294bd218 100644
>>>>>> --- a/meta/conf/machine/include/arm/arch-arm64.inc
>>>>>> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
>>>>>> @@ -4,8 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
>>>>>>     TUNEVALID[aarch64] = "Enable instructions for aarch64"
>>>>>>   -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES',
>> 'aarch64', 'aarch64:', '' ,d)}"
>>>>>> -
>>>>>
>>>>> if its removed here, where is it being added for other machines,
>>>> question is, should we treat aarch64 as LE equivalent of aarch64_be
>>>>> or should be treated as common aarch64 and a new define like
>> aarch64_le
>>>> defined.
>>>>>
>>>>
>>>> Currently, for arm64, we have aarch64_be to represent big endian, but
>> no
>>>> overrides to represent little endian only.
>>>>
>>>> So, IMO, we should treat aarch64 as little enaian only, like arm and
>>>> armeb.
>>>>
>>>>>>   # Little Endian base configs
>>>>>>   AVAILTUNES += "aarch64 aarch64_be"
>>>>>>   ARMPKGARCH_tune-aarch64 ?= "aarch64"
>>>
>>> Please, before removing "aarch64" from MACHINEOVERRIDES, add "armv8a" or
>>> similar. This is how it is done for the armv7* based chips. E.g., I
>> would
>>> expect to see tune-cortexa53.inc have:
>>>
>>> MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', 'armv8a:', '' ,d)}"
>>>
>>
>> arch-armv8a.inc has set "armv8a:" as overrides, and tune-cortexa53.inc
>> requires arch-armv8a.inc.
> 
> But it never adds "armv8a" (or ${TUNE_FEATURES_tune-armv8a}) to 
> TUNE_FEATURES, it adds "aarch64", so the above is never triggered...
> 

I guess the logic is: if you set DEFAULTTUNE as armv8a, then it will add "armv8a"
to TUNE_FEATURES, and then "armv8a:" will be added into MACHINEOVERRIDES. Am I right?

>>> Which corresponds to how it is done for armv7*.
>>>
>>> At least we currently rely on being able to do, e.g.:
>>>
>>> COMPATIBLE_MACHINE = "aarch64|armv7a|armv7ve"
>>>
>>> and if you remove "aarch64" from MACHINEOVERRIDES, we need a suitable
>>> substitute.
>>>
>>> //Peter
> 
> //Peter
> 
> 
> .
> 



