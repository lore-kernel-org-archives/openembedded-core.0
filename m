Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87A8D77040
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 16:34:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u21GY7jl019852
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 1 Mar 2016 08:34:07 -0800
Received: from [128.224.124.174] (128.224.124.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 1 Mar 2016 08:34:06 -0800
To: Andre McCurdy <armccurdy@gmail.com>
References: <1456577083-19366-1-git-send-email-daniel.dragomir@windriver.com>
	<1456577083-19366-2-git-send-email-daniel.dragomir@windriver.com>
	<CAJ86T=UpqspDQ0R0Ts0krLxfAawdHUz+V2Sc418VZ5uxZMHL2g@mail.gmail.com>
From: Dragomir Daniel <daniel.dragomir@windriver.com>
Message-ID: <56D5C464.4050402@windriver.com>
Date: Tue, 1 Mar 2016 18:33:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UpqspDQ0R0Ts0krLxfAawdHUz+V2Sc418VZ5uxZMHL2g@mail.gmail.com>
X-Originating-IP: [128.224.124.174]
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] Add tune for 32-bit ARMv8-a
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
X-List-Received-Date: Tue, 01 Mar 2016 16:34:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/01/2016 02:02 AM, Andre McCurdy wrote:
> On Sat, Feb 27, 2016 at 4:44 AM, Daniel Dragomir
> <daniel.dragomir@windriver.com> wrote:
>> This patch adds tunes for 32-bit armv8 platforms. The user can select
>> the vector floating-point instruction set: vfpv3, vfpv4 or fp-armv8
>> and the Neon, crc and crypto extensions.
> Why vfpv3? Are there really any armv8a CPUs which have vfpv3 but not vfpv4?

Hello Andre,

I didn't checked before, I simply follow armv7a example and add the new 
features.
But it seams that you're right, all armv8a CPU support both vfp 
versions, so, I will remove armv8a-vfpv3 tune and keep just vfpv4 one.

>> Also, fix some parsing failures for armv7a*-neon-vfpv4 tunes.
> If you find any issues in arch-armv7a.inc then please double check
> arch-armv7ve.inc too. These two files are very closely related.
>
>> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
>> Signed-off-by: Cristian Bercaru <cristian.bercaru at windriver.com>
>> ---
>>   meta/conf/machine/include/arm/arch-armv7a.inc |  4 +-
>>   meta/conf/machine/include/arm/arch-armv8a.inc | 75 +++++++++++++++++++++++++++
>>   2 files changed, 77 insertions(+), 2 deletions(-)
>>   create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>>
>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
>> index d3b6f64..ff6bc29 100644
>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>> @@ -65,8 +65,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-v
>>   PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} armv7ahf-vfp-vfpv3d16-vfpv3 armv7at2hf-vfp-vfpv3d16-vfpv3"
>>   PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
>>   PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon armv7at2hf-vfp-neon"
>> -PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-vfp-neon-vfpv4"
>> -PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-vfp-neon-vfpv4 armv7at2hf-vfp-neon-vfpv4"
>> +PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-vfp-vfpv4-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-vfp-vfpv4-neon armv7at2hf-vfp-neon-vfpv4"
> Is this patch against jethro? Master seems to have a different fix:
>
>    http://git.openembedded.org/openembedded-core/commit/?id=6661718158f8fdcdf63b0d48e8fe72d3ac4778f2

Yes, against jethro branch. That's why I didn't saw this fix and also 
didn't saw the arch-armv7ve.inc file.
How do I proceed if I want to have armv8a support in jethro? Should I 
checkout the master branch and add my changes there and resend the patch 
with the note to be backported to jethro?
But this patch (with the fix for armv7a) and the one that add 
arch-armv7ve.inc will be back-ported to jethro too, or how is the process?

>>   # Big Endian
>>   AVAILTUNES += "armv7ab armv7atb armv7ab-vfpv3d16 armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3 armv7ab-neon armv7atb-neon"
>> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
>> new file mode 100644
>> index 0000000..2d8dd73
>> --- /dev/null
>> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
>> @@ -0,0 +1,75 @@
>> +DEFAULTTUNE ?= "armv8a"
>> +
>> +TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
>> +TUNECONFLICTS[armv8a] = "armv4 armv5 armv6 armv7 armv7a"
>> +
>> +TUNEVALID[crc] = "Enable CRC instrucitons for ARMv8-a"
>> +ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "crc", "-crc", "", d)}"
>> +
>> +TUNEVALID[crypto] = "Enable ARMv8 crypto extension."
>> +ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "crypto", "-crypto", "", d)}"
>> +
>> +TUNEVALID[fp-armv8] = "Enable ARMv8 Vector Floating Point unit."
>> +ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fp-armv8", "-fp-armv8", "", d)}"
>> +
>> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv8a", bb.utils.contains("TUNE_FEATURES", "crc", " -march=armv8-a+crc", " -march=armv8-a", d), "", d)}"
>> +
>> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "fp-armv8", bb.utils.contains("TUNE_FEATURES", "neon", bb.utils.contains("TUNE_FEATURES", "crypto", " -mfpu=crypto-neon-fp-armv8", " -mfpu=neon-fp-armv8", d), " -mfpu=fp-armv8", d), "", d)}"
>> +
>> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv8a", "armv8a:", "" ,d)}"
>> +
>> +require conf/machine/include/arm/arch-armv7a.inc
> You should include arch-armv7ve.inc here, not arch-armv7a.inc.

Ok, but armv7ve include file is not in jethro. Only in master.

Thanks,
Daniel

>
>> +# Little Endian base configs
>> +AVAILTUNES += "armv8a armv8a-vfpv3 armv8a-neon armv8a-vfpv4 armv8a-vfpv4-neon armv8a-fp-armv8 armv8a-fp-armv8-neon armv8a-crypto-fp-armv8-neon"
>> +ARMPKGARCH_tune-armv8a ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-vfpv3 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-vfpv4 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-vfpv4-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-fp-armv8 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-fp-armv8-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crypto-fp-armv8-neon ?= "armv8a"
>> +TUNE_FEATURES_tune-armv8a ?= "arm armv8a vfp"
>> +TUNE_FEATURES_tune-armv8a-vfpv3 ?= "${TUNE_FEATURES_tune-armv8a} vfpv3"
>> +TUNE_FEATURES_tune-armv8a-neon ?= "${TUNE_FEATURES_tune-armv8a} neon"
>> +TUNE_FEATURES_tune-armv8a-vfpv4 ?= "${TUNE_FEATURES_tune-armv8a} vfpv4"
>> +TUNE_FEATURES_tune-armv8a-vfpv4-neon ?= "${TUNE_FEATURES_tune-armv8a} neon vfpv4"
>> +TUNE_FEATURES_tune-armv8a-fp-armv8 ?= "${TUNE_FEATURES_tune-armv8a} fp-armv8"
>> +TUNE_FEATURES_tune-armv8a-fp-armv8-neon ?= "${TUNE_FEATURES_tune-armv8a} neon fp-armv8"
>> +TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon ?= "${TUNE_FEATURES_tune-armv8a} crypto neon fp-armv8"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv8a armv8a-vfp"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-vfp-vfpv3"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3} armv8a-vfp-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3} armv8a-vfp-vfpv4"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4} armv8a-vfp-neon armv8a-vfp-vfpv4-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-fp-armv8-vfp"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8} armv8a-vfp-neon armv8a-fp-armv8-vfp-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-fp-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon} armv8a-crypto-fp-armv8-vfp-neon"
>> +
>> +# CRC configs
>> +AVAILTUNES += "armv8a-crc armv8a-crc-vfpv3 armv8a-crc-neon armv8a-crc-vfpv4 armv8a-crc-vfpv4-neon armv8a-crc-fp-armv8 armv8a-crc-fp-armv8-neon armv8a-crc-crypto-fp-armv8-neon"
>> +ARMPKGARCH_tune-armv8a-crc ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-vfpv3 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-vfpv4 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-vfpv4-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-fp-armv8 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-fp-armv8-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-crypto-fp-armv8-neon ?= "armv8a"
>> +TUNE_FEATURES_tune-armv8a-crc ?= "${TUNE_FEATURES_tune-armv8a} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-vfpv3 ?= "${TUNE_FEATURES_tune-armv8a-vfpv3} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-neon ?= "${TUNE_FEATURES_tune-armv8a-neon} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-vfpv4 ?= "${TUNE_FEATURES_tune-armv8a-vfpv4} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-vfpv4-neon ?= "${TUNE_FEATURES_tune-armv8a-vfpv4-neon} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-fp-armv8 ?= "${TUNE_FEATURES_tune-armv8a-fp-armv8} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-fp-armv8-neon ?= "${TUNE_FEATURES_tune-armv8a-fp-armv8-neon} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-crypto-fp-armv8-neon ?= "${TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon} crc"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc-vfp"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-vfp-vfpv3 armv8a-crc-vfp-vfpv3"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3} armv8a-vfp-neon armv8a-crc-vfp-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3} armv8a-vfp-vfpv4 armv8a-crc-vfp-vfpv4"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4} armv8a-vfp-neon armv8a-crc-vfp-neon armv8a-vfp-vfpv4-neon armv8a-crc-vfp-vfpv4-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-vfp-fp-armv8 armv8a-crc-fp-armv8-vfp"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8} armv8a-vfp-neon armv8a-vfp-neon-fp-armv8 armv8a-crc-fp-armv8-vfp-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto-fp-armv8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon} armv8a-vfp-crypto-neon-fp-armv8 armv8a-crc-crypto-fp-armv8-vfp-neon"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


