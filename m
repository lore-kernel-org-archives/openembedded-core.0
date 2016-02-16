Return-Path: <Daniel.Dragomir@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24A266E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 16:08:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1GG8qMx009643
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 16 Feb 2016 08:08:52 -0800
Received: from [128.224.124.174] (128.224.124.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 16 Feb 2016 08:08:51 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <1455632918-31605-1-git-send-email-daniel.dragomir@windriver.com>
	<1455632918-31605-2-git-send-email-daniel.dragomir@windriver.com>
	<20160216145436.GA2581@jama>
From: Dragomir Daniel <daniel.dragomir@windriver.com>
Message-ID: <56C3498D.1020508@windriver.com>
Date: Tue, 16 Feb 2016 18:08:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20160216145436.GA2581@jama>
X-Originating-IP: [128.224.124.174]
Cc: Cristian Bercaru <cristian.bercaru@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] add tunings for 32-bit ARMv8-a
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
X-List-Received-Date: Tue, 16 Feb 2016 16:08:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/16/2016 04:54 PM, Martin Jansa wrote:
> On Tue, Feb 16, 2016 at 04:28:38PM +0200, Daniel Dragomir wrote:
>> From: Cristian Bercaru <cristian.bercaru@windriver.com>
>>
>> This patch adds tunes for 32-bit armv8 platforms. The user can select
>> the vector floating-point instruction set: vfpv3, vfpv4 or fp-armv8
>> and the Neon, crc and crypto extensions.
> This adds TUNEVALID for various tune features which aren't valid for
> armv7a and lower (keep in mind that feature-arm-vfp.inc is included from arch-armv5.inc)
>
> Did you test this with tune-test script to at least confirm that it at
> least still parses for all arm* DEFAULTTUNEs?
>

I just took over my colleague work and I need to continue it.
Tunnings are new for meand I'm looking for a review about the actual 
approach
from my colleague for adding ARMv8-a tunning for 32-bit.

No, I didn't ran such script.
Can you please tell me how to run it or at least where is this located.
It's scripts/tune/test.sh from
http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune2-test 
?
It's there any Readme for it?

Thanks,
Daniel

>> Signed-off-by: Cristian Bercaru <cristian.bercaru@windriver.com>
>> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
>> ---
>>   meta/conf/machine/include/arm/arch-armv7a.inc      |  1 -
>>   meta/conf/machine/include/arm/arch-armv8a.inc      | 65 ++++++++++++++++++++++
>>   meta/conf/machine/include/arm/feature-arm-neon.inc |  3 -
>>   meta/conf/machine/include/arm/feature-arm-vfp.inc  | 59 ++++++++++++++++----
>>   4 files changed, 112 insertions(+), 16 deletions(-)
>>   create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>>   delete mode 100644 meta/conf/machine/include/arm/feature-arm-neon.inc
>>
>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
>> index d3b6f64..ac85fda 100644
>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>> @@ -6,7 +6,6 @@ TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv7a", " -march=armv7-a
>>   MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "armv7a:", "" ,d)}"
>>   
>>   require conf/machine/include/arm/arch-armv6.inc
>> -require conf/machine/include/arm/feature-arm-neon.inc
>>   
>>   # Little Endian base configs
>>   AVAILTUNES += "armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16 armv7a-vfpv3 armv7at-vfpv3 armv7a-neon armv7at-neon"
>> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
>> new file mode 100644
>> index 0000000..1b062b8
>> --- /dev/null
>> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
>> @@ -0,0 +1,65 @@
>> +DEFAULTTUNE ?= "armv8a"
>> +
>> +TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
>> +TUNEVALID[crc] = "Enable CRC instrucitons for ARMv8-a"
>> +TUNECONFLICTS[armv8a] = "armv4 armv5 armv6 armv7 armv7a"
>> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv8a", " -march=armv8-a", "", d)}"
>> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "crc", "+crc", "", d)}"
>> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv8a", "armv8a:", "" ,d)}"
>> +
>> +require conf/machine/include/arm/arch-armv7a.inc
>> +
>> +# Little Endian base configs
>> +AVAILTUNES += "armv8a armv8a-vfpv3 armv8a-neon armv8a-vfpv4 armv8a-neon-vfpv4 armv8a-fp-armv8 armv8a-neon-fp-armv8 armv8a-crypto-neon-fp-armv8"
>> +ARMPKGARCH_tune-armv8a ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-vfpv3 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-vfpv4 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-neon-vfpv4 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-fp-armv8 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-neon-fp-armv8 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crypto-neon-fp-armv8 ?= "armv8a"
>> +TUNE_FEATURES_tune-armv8a ?= "arm armv8a vfp"
>> +TUNE_FEATURES_tune-armv8a-vfpv3 ?= "${TUNE_FEATURES_tune-armv8a} vfpv3"
>> +TUNE_FEATURES_tune-armv8a-neon ?= "${TUNE_FEATURES_tune-armv8a} neon"
>> +TUNE_FEATURES_tune-armv8a-vfpv4 ?= "${TUNE_FEATURES_tune-armv8a} vfpv4"
>> +TUNE_FEATURES_tune-armv8a-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv8a} neon vfpv4"
>> +TUNE_FEATURES_tune-armv8a-fp-armv8 ?= "${TUNE_FEATURES_tune-armv8a} fp-armv8"
>> +TUNE_FEATURES_tune-armv8a-neon-fp-armv8 ?= "${TUNE_FEATURES_tune-armv8a} neon fp-armv8"
>> +TUNE_FEATURES_tune-armv8a-crypto-neon-fp-armv8 ?= "${TUNE_FEATURES_tune-armv8a} crypto neon fp-armv8"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv8a armv8a-vfp"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-vfp-vfpv3"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3} armv8a-vfp-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv3} armv8a-vfp-vfpv4"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4} armv8a-vfp-neon armv8a-vfp-neon-vfpv4"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-vfp-fp-armv8"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon-fp-armv8 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8} armv8a-vfp-neon-fp-armv8"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-neon-fp-armv8 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-neon-fp-armv8} armv8a-vfp-crypto-neon-fp-armv8"
>> +
>> +# CRC configs
>> +AVAILTUNES += "armv8a-crc armv8a-crc-vfpv3 armv8a-crc-neon armv8a-crc-vfpv4 armv8a-crc-neon-vfpv4 armv8a-crc-fp-armv8 armv8a-crc-neon-fp-armv8 armv8a-crc-crypto-neon-fp-armv8"
>> +ARMPKGARCH_tune-armv8a-crc ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-vfpv3 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-neon ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-vfpv4 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-neon-vfpv4 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-fp-armv8 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-neon-fp-armv8 ?= "armv8a"
>> +ARMPKGARCH_tune-armv8a-crc-crypto-neon-fp-armv8 ?= "armv8a"
>> +TUNE_FEATURES_tune-armv8a-crc ?= "${TUNE_FEATURES_tune-armv8a} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-vfpv3 ?= "${TUNE_FEATURES_tune-armv8a-vfpv3} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-neon ?= "${TUNE_FEATURES_tune-armv8a-neon} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-vfpv4 ?= "${TUNE_FEATURES_tune-armv8a-vfpv4} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-neon-vfpv4 ?= "${TUNE_FEATURES_tune-armv8a-neon-vfpv4} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-fp-armv8 ?= "${TUNE_FEATURES_tune-armv8a-fp-armv8} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-neon-fp-armv8 ?= "${TUNE_FEATURES_tune-armv8a-neon-fp-armv8} crc"
>> +TUNE_FEATURES_tune-armv8a-crc-crypto-neon-fp-armv8 ?= "${TUNE_FEATURES_tune-armv8a-crypto-neon-fp-armv8} crc"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc-vfp"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-vfp-vfpv3 armv8a-crc-vfp-vfpv3"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3} armv8a-vfp-neon armv8a-crc-vfp-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv3} armv8a-vfp-vfpv4 armv8a-crc-vfp-vfpv4"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4} armv8a-vfp-neon armv8a-crc-vfp-neon armv8a-vfp-neon-vfpv4 armv8a-crc-vfp-neon-vfpv4"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-vfp-fp-armv8 armv8a-vfp-fp-crc-armv8"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon-fp-armv8 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8} armv8a-vfp-neon-fp-armv8 armv8a-crc-vfp-neon-fp-armv8"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto-neon-fp-armv8 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon-fp-armv8} armv8a-vfp-crypto-neon-fp-armv8 armv8a-crc-vfp-crypto-neon-fp-armv8"
>> +
>> diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/conf/machine/include/arm/feature-arm-neon.inc
>> deleted file mode 100644
>> index e8b2b85..0000000
>> --- a/meta/conf/machine/include/arm/feature-arm-neon.inc
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -TUNEVALID[neon] = "Enable Neon SIMD accelerator unit."
>> -TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "neon", bb.utils.contains("TUNE_FEATURES", "vfpv4", " -mfpu=neon-vfpv4", " -mfpu=neon", d), "" , d)}"
>> -ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "neon", "-neon", "", d)}"
>> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
>> index 3dfbeac..12a4e81 100644
>> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
>> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
>> @@ -1,17 +1,52 @@
>>   TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
>> -ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp", "" ,d)}"
>> -
>>   TUNEVALID[vfpv3d16] = "Enable Vector Floating Point Version 3 with 16 registers (vfpv3-d16) unit."
>> -TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16", " -mfpu=vfpv3-d16", "", d)}"
>> -ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16", "-vfpv3d16", "" ,d)}"
>> -
>>   TUNEVALID[vfpv3] = "Enable Vector Floating Point Version 3 with 32 registers (vfpv3) unit."
>> -TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", " -mfpu=vfpv3", "", d)}"
>> -ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", "-vfpv3", "" ,d)}"
>> -
>>   TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
>> -ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv4", "-vfpv4", "" ,d)}"
>> -
>> +TUNEVALID[fp-armv8] = "Enable ARMv8 Vector Floating Point unit."
>> +TUNEVALID[neon] = "Enable vfpv3 and Neon SIMD accelerator unit."
>> +TUNEVALID[crypto] = "Enable ARMv8 crypto extension."
>>   TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
>> -TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
>> -ARMPKGSFX_EABI .= "${@bb.utils.contains("TUNE_FEATURES", [ "callconvention-hard", "vfp" ], "hf", "", d)}"
>> +
>> +python () {
>> +	if bb.utils.contains("TUNE_FEATURES", "crc", True, False, d):
>> +		d.appendVar("ARMPKGSFX_FPU", "-crc")
>> +
>> +	if bb.utils.contains("TUNE_FEATURES", "vfp", True, False, d):
>> +		d.appendVar("ARMPKGSFX_FPU", "-vfp")
>> +
>> +	if bb.utils.contains("TUNE_FEATURES", "vfpv3d16", True, False, d):
>> +		d.appendVar("TUNE_CCARGS", " -mfpu=vfpv3-d16")
>> +		d.appendVar("ARMPKGSFX_FPU", "-vfpv3d16")
>> +
>> +	if bb.utils.contains("TUNE_FEATURES", "vfpv3", True, False, d):
>> +			d.appendVar("TUNE_CCARGS", " -mfpu=vfpv3")
>> +			d.appendVar("ARMPKGSFX_FPU", "-vfpv3")
>> +	elif bb.utils.contains("TUNE_FEATURES", "vfpv4", True, False, d):
>> +		if bb.utils.contains("TUNE_FEATURES", "neon", True, False, d):
>> +			d.appendVar("TUNE_CCARGS", " -mfpu=neon-vfpv4")
>> +			d.appendVar("ARMPKGSFX_FPU", "-neon-vfpv4")
>> +		else:
>> +			d.appendVar("TUNE_CCARGS", " -mfpu=vfpv4")
>> +			d.appendVar("ARMPKGSFX_FPU", "-vfpv4")
>> +	elif bb.utils.contains("TUNE_FEATURES", "fp-armv8", True, False, d):
>> +		if bb.utils.contains("TUNE_FEATURES", "neon", True, False, d):
>> +			if bb.utils.contains("TUNE_FEATURES", "crypto", True, False, d):
>> +				d.appendVar("TUNE_CCARGS", " -mfpu=crypto-neon-fp-armv8")
>> +				d.appendVar("ARMPKGSFX_FPU", "-crypto-neon-fp-armv8")
>> +			else:
>> +				d.appendVar("TUNE_CCARGS", " -mfpu=neon-fp-armv8")
>> +				d.appendVar("ARMPKGSFX_FPU", "-neon-fp-armv8")
>> +		else:
>> +			d.appendVar("TUNE_CCARGS", " -mfpu=fp-armv8")
>> +			d.appendVar("ARMPKGSFX_FPU", "-fp-armv8")
>> +	elif bb.utils.contains("TUNE_FEATURES", "neon", True, False, d):
>> +		d.appendVar("TUNE_CCARGS", " -mfpu=neon")
>> +		d.appendVar("ARMPKGSFX_FPU", "-neon")
>> +
>> +	if bb.utils.contains("TUNE_FEATURES", "callconvention-hard", True, False, d):
>> +		d.appendVar("TUNE_CCARGS", " -mfloat-abi=hard")
>> +	else:
>> +		d.appendVar("TUNE_CCARGS", " -mfloat-abi=softfp")
>> +	if bb.utils.contains("TUNE_FEATURES", [ "vfp", "callconvention-hard" ], True, False, d):
>> +		d.appendVar("ARMPKGSFX_EABI", "hf")
>> +}
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


