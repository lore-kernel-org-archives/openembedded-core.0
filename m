Return-Path: <ayaka@soulik.info>
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
	by mail.openembedded.org (Postfix) with ESMTP id EA55875513
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 16:00:26 +0000 (UTC)
Received: from [IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4] (unknown
	[IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPSA id 42A361025B0;
	Sat, 16 Jun 2018 01:01:04 +0900 (JST)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <20180615032226.9899-1-ayaka@soulik.info>
	<20180615032226.9899-2-ayaka@soulik.info>
	<CAP71Wjz91m61fs9kxg1F7NCTq=X8Mtkc-CeBFNKZGgi=6tEgmA@mail.gmail.com>
From: ayaka <ayaka@soulik.info>
Message-ID: <420b5ed6-a424-9376-9996-bd1a242faafa@soulik.info>
Date: Sat, 16 Jun 2018 00:00:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAP71Wjz91m61fs9kxg1F7NCTq=X8Mtkc-CeBFNKZGgi=6tEgmA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/5] arch-armv8a.inc: add tune include for armv8
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
X-List-Received-Date: Fri, 15 Jun 2018 16:00:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/15/2018 05:57 PM, Nicolas Dechesne wrote:
> On Fri, Jun 15, 2018 at 5:22 AM, Randy Li <ayaka@soulik.info> wrote:
>> There are some addtional instructions apart from bare armv8,
>> also there is armv8.1, armv8.2.
>>
>> Most the processor would support crc, except X-gene 1.
>>
>> Signed-off-by: Randy Li <ayaka@soulik.info>
>> ---
>>   meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
>>   meta/conf/machine/include/arm/arch-armv8a.inc | 28 +++++++++++++++++++++++++++
>>   2 files changed, 28 insertions(+), 1 deletion(-)
>>   delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
> My previous comment still applies here. You can't just delete this
> file. It's used by many BSP. and it's even used in oe-core itself:
>
> layers/openembedded-core/meta/conf/machine/include/tune-thunderx.inc:require
> conf/machine/include/arm/arch-armv8.inc
> layers/openembedded-core/meta/conf/machine/qemuarm64.conf:require
> conf/machine/include/arm/arch-armv8.inc
I am very sorry about, should I modify those files the same time?
Since some cortex-m processors also support armv8 instructions, it would 
be used to run Linux in the
future.
Also there would be armv81a, armv82a for the optimization of the 
armv8.1, armv8.2.
That is why I want to rename it.

Apart from that ,would you pleased with the contents below?
>
>>   create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>>
>> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
>> deleted file mode 100644
>> index 5e832fae6d..0000000000
>> --- a/meta/conf/machine/include/arm/arch-armv8.inc
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -require conf/machine/include/arm/arch-arm64.inc
>> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
>> new file mode 100644
>> index 0000000000..323d0d7f0f
>> --- /dev/null
>> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
>> @@ -0,0 +1,28 @@
>> +DEFAULTTUNE ?= "armv8a-crc"
>> +
>> +TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
>> +TUNEVALID[simd] = "Enable instructions for ARMv8-a Advanced SIMD and floating-point"
>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
>> +TUNEVALID[crc] = "Enable instructions for ARMv8-a Cyclic Redundancy Check (CRC)"
>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"
>> +TUNEVALID[crypto] = "Enable instructions for ARMv8-a cryptographic"
>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
>> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '' ,d)}"
>> +
>> +require conf/machine/include/arm/arch-arm64.inc
>> +
>> +# Little Endian base configs
>> +AVAILTUNES += "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
>> +ARMPKGARCH_tune-armv8a                    ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc                ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crypto             ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-crypto         ?= "armv8a"
>> +TUNE_FEATURES_tune-armv8a                  = "aarch64 armv8a simd"
>> +TUNE_FEATURES_tune-armv8a-crc              = "${TUNE_FEATURES_tune-armv8a} crc"
>> +TUNE_FEATURES_tune-armv8a-crypto           = "${TUNE_FEATURES_tune-armv8a} crypto"
>> +TUNE_FEATURES_tune-armv8a-crc-crypto       = "${TUNE_FEATURES_tune-armv8a-crc} crypto"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
>> --
>> 2.14.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


