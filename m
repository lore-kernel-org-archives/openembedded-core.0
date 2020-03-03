Return-Path: <zhengjunling@huawei.com>
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by mail.openembedded.org (Postfix) with ESMTP id 7553A618E6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 03:10:56 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 3600E7EAB79A3031FAA4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 11:10:55 +0800 (CST)
Received: from [127.0.0.1] (10.111.155.88) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Mar 2020
	11:10:45 +0800
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20200302171153.28030-1-zhengjunling@huawei.com>
	<666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
From: Junling Zheng <zhengjunling@huawei.com>
Message-ID: <9d41cd5d-7355-175d-391c-35231c9a7e92@huawei.com>
Date: Tue, 3 Mar 2020 11:10:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
X-Originating-IP: [10.111.155.88]
X-CFilter-Loop: Reflected
Cc: wangnan0@huawei.com
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
X-List-Received-Date: Tue, 03 Mar 2020 03:10:56 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 2020/3/3 2:29, Khem Raj wrote:
> 
> 
> On 3/2/20 9:11 AM, Junling Zheng wrote:
>> Currently, for arch-arm64, poky will append the MACHINEOVERRIDES with
>> "aarch64:", which has the higher priority than TRANSLATED_TARGET_ARCH.
>> So, for aarch64 big endian, the variable '<foo>_aarch64' will override
>> not only '<foo>', but also '<foo>_aarch64-be', thus we will get an
>> incorrect variable.
>>
>> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
>> ---
>>   meta/conf/machine/include/arm/arch-arm64.inc | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
>> index 53f4566815..32294bd218 100644
>> --- a/meta/conf/machine/include/arm/arch-arm64.inc
>> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
>> @@ -4,8 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
>>     TUNEVALID[aarch64] = "Enable instructions for aarch64"
>>   -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'aarch64:', '' ,d)}"
>> -
> 
> if its removed here, where is it being added for other machines, question is, should we treat aarch64 as LE equivalent of aarch64_be
> or should be treated as common aarch64 and a new define like aarch64_le defined.
> 

Currently, for arm64, we have aarch64_be to represent big endian, but no overrides to represent little endian only.

So, IMO, we should treat aarch64 as little enaian only, like arm and armeb.

>>   # Little Endian base configs
>>   AVAILTUNES += "aarch64 aarch64_be"
>>   ARMPKGARCH_tune-aarch64 ?= "aarch64"
>>
> 
> 



