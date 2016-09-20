Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id CA4756079E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 14:07:58 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 8087BBE67D41D;
	Tue, 20 Sep 2016 15:07:44 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 20 Sep 2016 15:07:47 +0100
To: Mark Hatle <mark.hatle@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1474367601-16344-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<a6cf4902-365b-bb16-4c2b-a90440057f58@windriver.com>
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Message-ID: <430a4dad-1e49-8e73-077e-ae1530c5acfc@imgtec.com>
Date: Tue, 20 Sep 2016 15:07:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <a6cf4902-365b-bb16-4c2b-a90440057f58@windriver.com>
X-Originating-IP: [192.168.154.45]
Subject: Re: [Patch v2] arch-mips: Restructure mips64 and add mips64r2
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
X-List-Received-Date: Tue, 20 Sep 2016 14:07:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/20/2016 02:08 PM, Mark Hatle wrote:
> On 9/20/16 5:33 AM, Zubair Lutfullah Kakakhel wrote:
>> The current file structure felt slightly unsuitable for adding
>> MIPS64r2. So I restructured it slightly and added MIPS64r2
>> support
>>
>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>>
>> ---
>> V1 -> V2
>> Fixed a subtle bug in the include files for tune-mips64.inc which
>> resulted in a build failure for multi-lib configuration.
>
> (Sorry, I didn't see V1.)
>
> Can you explain why you moved the items out of arch-mips.inc?
>
> Generally we want the arch-*.inc file to set a base set of components that the
> optimized tunes can use.  It most case we define all of the core architecture
> 'features' and basic tunes in the arch files, and then add specific processor
> optimizations in the arch-*.inc files.

I struggled a bit with drawing the line about where the basic tunes were and where
the rest of them go.

The previous structure was like so.

include/mips/arch-mips.inc had the following tunes : "mips mips64-n32 mips64 mipsel
mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"

Which is a mix of 32/64 bit.

Then
include/tune-mips32.inc defined "mips32 mips32el mips32-nf mips32el-nf"
include/tune-mips32r2.inc defined "mips32r2 mips32r2el mips32r2-nf mips32r2el-nf"

include/tune-mips64.inc just had a require include/tune-mips32r2.inc which
includes the base which basically has the actual mips64 tunes.

With this restructure patch.

include/mips/arch-mips.inc defines no tunes.
include/tune-mips32.inc defines mips and mips32
include/tune-mips32r2.inc defines mips32r2
include/tune-mips64.inc defines mips64
include/tune-mips64r2.inc defines mips64r2

I could leave the existing layout as is and only add 64r2 as a separate patch.
But as I was poking around here, I tried to improve things a bit.

Any recommendation regarding which way would be preferred?

>
> Also I see 'mips64*-o32' defined.  I did not realize this was a valid
> configuration.  In the past o32 could only be compiled with mips/mips32*
> instructions.
>
> +TUNE_FEATURES_tune-mips64-nf-n32 = "n32 bigendian"
> +BASE_LIB_tune-mips64-nf-n32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64-nf-n32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64-nf-n32 = "mips64-nf-n32"
>
> +TUNE_FEATURES_tune-mips64el-nf-o32 = "o32"
> +BASE_LIB_tune-mips64el-nf-o32 = "lib32"
> +MIPSPKGSFX_VARIANT_tune-mips64el-nf-o32 = "${TUNE_ARCH}"
> +PACKAGE_EXTRA_ARCHS_tune-mips64el-nf-o32 = "mips64el-nf-o32"
>
> Also o32 and n32 are currently defined to use the same lib directory.  This is
> incorrect.  Per long time conventions, o32 belongs in 'lib', and n32 belongs in
> 'lib32'.  (n64 in lib64)
>
> So at a minimum the directory name of o32 needs to be fixed.

Thanks for pointing this out. I'll fix this in v3.

Regards,
ZubairLK

>
>> ---
>>  meta/conf/machine/include/mips/arch-mips.inc | 60 --------------------
>>  meta/conf/machine/include/tune-mips32.inc    | 22 +++++++-
>>  meta/conf/machine/include/tune-mips64.inc    | 78 ++++++++++++++++++++++++++
>>  meta/conf/machine/include/tune-mips64r2.inc  | 84 ++++++++++++++++++++++++++++
>>  4 files changed, 183 insertions(+), 61 deletions(-)
>>  create mode 100644 meta/conf/machine/include/tune-mips64r2.inc
>>
>> diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
>> index d3e83d1..6be84be 100644
>> --- a/meta/conf/machine/include/mips/arch-mips.inc
>> +++ b/meta/conf/machine/include/mips/arch-mips.inc
>> @@ -42,64 +42,4 @@ MIPSPKGSFX_ABI = "${@bb.utils.contains('TUNE_FEATURES', 'n32', '-n32', '', d)}"
>>  TUNE_ARCH = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
>>  TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
>>
>> -# Base tunes
>> -AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
>> -TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
>> -BASE_LIB_tune-mips = "lib"
>> -MIPSPKGSFX_VARIANT_tune-mips = "${TUNE_ARCH}"
>> -PACKAGE_EXTRA_ARCHS_tune-mips = "mips"
>>
>> -TUNE_FEATURES_tune-mips64-n32 = "n32 bigendian fpu-hard"
>> -BASE_LIB_tune-mips64-n32 = "lib32"
>> -MIPSPKGSFX_VARIANT_tune-mips64-n32 = "${TUNE_ARCH}"
>> -PACKAGE_EXTRA_ARCHS_tune-mips64-n32 = "mips64-n32"
>> -
>> -TUNE_FEATURES_tune-mips64 = "n64 bigendian fpu-hard"
>> -BASE_LIB_tune-mips64 = "lib64"
>> -MIPSPKGSFX_VARIANT_tune-mips64 = "${TUNE_ARCH}"
>> -PACKAGE_EXTRA_ARCHS_tune-mips64 = "mips64"
>> -
>> -TUNE_FEATURES_tune-mipsel = "o32 fpu-hard"
>> -BASE_LIB_tune-mipsel = "lib"
>> -MIPSPKGSFX_VARIANT_tune-mipsel = "${TUNE_ARCH}"
>> -PACKAGE_EXTRA_ARCHS_tune-mipsel = "mipsel"
>> -
>> -TUNE_FEATURES_tune-mips64el-n32 = "n32 fpu-hard"
>> -BASE_LIB_tune-mips64el-n32 = "lib32"
>> -MIPSPKGSFX_VARIANT_tune-mips64el-n32 = "${TUNE_ARCH}"
>> -PACKAGE_EXTRA_ARCHS_tune-mips64el-n32 = "mips64el-n32"
>> -
>> -TUNE_FEATURES_tune-mips64el = "n64 fpu-hard"
>> -BASE_LIB_tune-mips64el = "lib64"
>> -MIPSPKGSFX_VARIANT_tune-mips64el = "${TUNE_ARCH}"
>> -PACKAGE_EXTRA_ARCHS_tune-mips64el = "mips64el"
>> -
>> -TUNE_FEATURES_tune-mips-nf = "o32 bigendian"
>> -BASE_LIB_tune-mips-nf = "lib"
>> -MIPSPKGSFX_VARIANT_tune-mips-nf = "${TUNE_ARCH}"
>> -PACKAGE_EXTRA_ARCHS_tune-mips-nf = "mips-nf"
>> -
>> -TUNE_FEATURES_tune-mips64-nf-n32 = "n32 bigendian"
>> -BASE_LIB_tune-mips64-nf-n32 = "lib32"
>> -MIPSPKGSFX_VARIANT_tune-mips64-nf-n32 = "${TUNE_ARCH}"
>> -PACKAGE_EXTRA_ARCHS_tune-mips64-nf-n32 = "mips64-nf-n32"
>> -
>> -TUNE_FEATURES_tune-mips64-nf = "n64 bigendian"
>> -BASE_LIB_tune-mips64-nf = "lib64"
>> -MIPSPKGSFX_VARIANT_tune-mips64-nf = "${TUNE_ARCH}"
>> -PACKAGE_EXTRA_ARCHS_tune-mips64-nf = "mips64-nf"
>> -
>> -TUNE_FEATURES_tune-mipsel-nf = "o32"
>> -BASE_LIB_tune-mipsel-nf = "lib"
>> -MIPSPKGSFX_VARIANT_tune-mipsel-nf = "${TUNE_ARCH}"
>> -PACKAGE_EXTRA_ARCHS_tune-mipsel-nf = "mipsel-nf"
>> -
>> -TUNE_FEATURES_tune-mips64el-nf-n32 = "n32"
>> -BASE_LIB_tune-mips64el-nf-n32 = "lib32"
>> -MIPSPKGSFX_VARIANT_tune-mips64el-nf-n32 = "${TUNE_ARCH}"
>> -PACKAGE_EXTRA_ARCHS_tune-mips64el-nf-n32 = "mips64el-nf-n32"
>> -
>> -TUNE_FEATURES_tune-mips64el-nf = "n64"
>> -BASE_LIB_tune-mips64el-nf = "lib64"
>> -MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
>> -PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
>> diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
>> index ce0445f..4c3d93f 100644
>> --- a/meta/conf/machine/include/tune-mips32.inc
>> +++ b/meta/conf/machine/include/tune-mips32.inc
>> @@ -6,7 +6,27 @@ TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
>>  TUNECONFLICTS[mips32] = "n64 n32"
>>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips32', ' -march=mips32', '', d)}"
>>
>> -AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
>> +AVAILTUNES += "mips mipsel mips-nf mipsel-nf mips32 mips32el mips32-nf mips32el-nf"
>> +
>> +TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
>> +BASE_LIB_tune-mips = "lib"
>> +MIPSPKGSFX_VARIANT_tune-mips = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips = "mips"
>> +
>> +TUNE_FEATURES_tune-mipsel = "o32 fpu-hard"
>> +BASE_LIB_tune-mipsel = "lib"
>> +MIPSPKGSFX_VARIANT_tune-mipsel = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mipsel = "mipsel"
>> +
>> +TUNE_FEATURES_tune-mips-nf = "o32 bigendian"
>> +BASE_LIB_tune-mips-nf = "lib"
>> +MIPSPKGSFX_VARIANT_tune-mips-nf = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips-nf = "mips-nf"
>> +
>> +TUNE_FEATURES_tune-mipsel-nf = "o32"
>> +BASE_LIB_tune-mipsel-nf = "lib"
>> +MIPSPKGSFX_VARIANT_tune-mipsel-nf = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mipsel-nf = "mipsel-nf"
>>
>>  TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
>>  MIPSPKGSFX_VARIANT_tune-mips32 = "mips32"
>> diff --git a/meta/conf/machine/include/tune-mips64.inc b/meta/conf/machine/include/tune-mips64.inc
>> index 9be0e0f..06e0ee3 100644
>> --- a/meta/conf/machine/include/tune-mips64.inc
>> +++ b/meta/conf/machine/include/tune-mips64.inc
>> @@ -1,3 +1,81 @@
>>  DEFAULTTUNE ?= "mips64"
>>
>>  require conf/machine/include/tune-mips32r2.inc
>> +
>> +# Base tunes
>> +AVAILTUNES += "mips64 mips64el"
>> +
>> +TUNE_FEATURES_tune-mips64 = "n64 bigendian fpu-hard"
>> +BASE_LIB_tune-mips64 = "lib64"
>> +MIPSPKGSFX_VARIANT_tune-mips64 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64 = "mips64"
>> +
>> +TUNE_FEATURES_tune-mips64el = "n64 fpu-hard"
>> +BASE_LIB_tune-mips64el = "lib64"
>> +MIPSPKGSFX_VARIANT_tune-mips64el = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64el = "mips64el"
>> +
>> +# MIPS 64 Soft Float
>> +AVAILTUNES += "mips64-nf mips64el-nf"
>> +
>> +TUNE_FEATURES_tune-mips64-nf = "n64 bigendian"
>> +BASE_LIB_tune-mips64-nf = "lib64"
>> +MIPSPKGSFX_VARIANT_tune-mips64-nf = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64-nf = "mips64-nf"
>> +
>> +TUNE_FEATURES_tune-mips64el-nf = "n64"
>> +BASE_LIB_tune-mips64el-nf = "lib64"
>> +MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
>> +
>> +# MIPS 64 n32
>> +AVAILTUNES += "mips64-n32 mips64el-n32"
>> +
>> +TUNE_FEATURES_tune-mips64-n32 = "n32 bigendian fpu-hard"
>> +BASE_LIB_tune-mips64-n32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64-n32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64-n32 = "mips64-n32"
>> +
>> +TUNE_FEATURES_tune-mips64el-n32 = "n32 fpu-hard"
>> +BASE_LIB_tune-mips64el-n32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64el-n32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64el-n32 = "mips64el-n32"
>> +
>> +# MIPS 64 n32 and Soft Float
>> +AVAILTUNES += "mips64-nf-n32 mips64el-nf-n32"
>> +
>> +TUNE_FEATURES_tune-mips64-nf-n32 = "n32 bigendian"
>> +BASE_LIB_tune-mips64-nf-n32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64-nf-n32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64-nf-n32 = "mips64-nf-n32"
>> +
>> +TUNE_FEATURES_tune-mips64el-nf-n32 = "n32"
>> +BASE_LIB_tune-mips64el-nf-n32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64el-nf-n32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64el-nf-n32 = "mips64el-nf-n32"
>> +
>> +# MIPS 64 o32
>> +AVAILTUNES += "mips64-o32 mips64el-o32"
>> +
>> +TUNE_FEATURES_tune-mips64-o32 = "o32 bigendian fpu-hard"
>> +BASE_LIB_tune-mips64-o32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64-o32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64-o32 = "mips64-o32"
>> +
>> +TUNE_FEATURES_tune-mips64el-o32 = "o32 fpu-hard"
>> +BASE_LIB_tune-mips64el-o32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64el-o32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64el-o32 = "mips64el-o32"
>> +
>> +# MIPS 64 o32 and Soft Float
>> +AVAILTUNES += "mips64-nf-o32 mips64el-nf-o32"
>> +
>> +TUNE_FEATURES_tune-mips64-nf-o32 = "o32 bigendian"
>> +BASE_LIB_tune-mips64-nf-o32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64-nf-o32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64-nf-o32 = "mips64-nf-o32"
>> +
>> +TUNE_FEATURES_tune-mips64el-nf-o32 = "o32"
>> +BASE_LIB_tune-mips64el-nf-o32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64el-nf-o32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64el-nf-o32 = "mips64el-nf-o32"
>> diff --git a/meta/conf/machine/include/tune-mips64r2.inc b/meta/conf/machine/include/tune-mips64r2.inc
>> new file mode 100644
>> index 0000000..f64983d
>> --- /dev/null
>> +++ b/meta/conf/machine/include/tune-mips64r2.inc
>> @@ -0,0 +1,84 @@
>> +DEFAULTTUNE ?= "mips64r2"
>> +
>> +require conf/machine/include/tune-mips64.inc
>> +
>> +TUNEVALID[mips64r2] = "Enable mips64r2 specific processor optimizations"
>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips64r2', ' -march=mips64r2', '', d)}"
>> +
>> +# Base tunes
>> +AVAILTUNES += "mips64r2 mips64r2el"
>> +
>> +TUNE_FEATURES_tune-mips64r2 = "${TUNE_FEATURES_tune-mips64} mips64r2"
>> +BASE_LIB_tune-mips64r2 = "lib64"
>> +MIPSPKGSFX_VARIANT_tune-mips64r2 = "mips64r2"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64r2 = "mips64 mips64r2"
>> +
>> +TUNE_FEATURES_tune-mips64r2el = "${TUNE_FEATURES_tune-mips64el} mips64r2"
>> +BASE_LIB_tune-mips64r2el = "lib64"
>> +MIPSPKGSFX_VARIANT_tune-mips64r2el = "mips64r2el"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el = "mips64el mips64r2el"
>> +
>> +# MIPS 64r2 Soft Float
>> +AVAILTUNES += "mips64r2-nf mips64r2el-nf"
>> +
>> +TUNE_FEATURES_tune-mips64r2-nf = "${TUNE_FEATURES_tune-mips64-nf} mips64r2"
>> +BASE_LIB_tune-mips64r2-nf = "lib64"
>> +MIPSPKGSFX_VARIANT_tune-mips64r2-nf = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64r2-nf = "mips64-nf mips64r2-nf"
>> +
>> +TUNE_FEATURES_tune-mips64r2el-nf = "${TUNE_FEATURES_tune-mips64el-nf} mips64r2"
>> +BASE_LIB_tune-mips64r2el-nf = "lib64"
>> +MIPSPKGSFX_VARIANT_tune-mips64r2el-nf = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el-nf = "mips64el-nf mips64r2el-nf"
>> +
>> +# MIPS 64r2 n32
>> +AVAILTUNES += "mips64r2-n32 mips64r2el-n32"
>> +
>> +TUNE_FEATURES_tune-mips64r2-n32 = "${TUNE_FEATURES_tune-mips64-n32} mips64r2"
>> +BASE_LIB_tune-mips64r2-n32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64r2-n32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64r2-n32 = "mips64-n32 mips64r2-n32"
>> +
>> +TUNE_FEATURES_tune-mips64r2el-n32 = "${TUNE_FEATURES_tune-mips64el-n32} mips64r2"
>> +BASE_LIB_tune-mips64r2el-n32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64r2el-n32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el-n32 = "mips64el-n32 mips64r2el-n32"
>> +
>> +# MIPS 64r2 n32 and Soft Float
>> +AVAILTUNES += "mips64r2-nf-n32 mips64r2el-nf-n32"
>> +
>> +TUNE_FEATURES_tune-mips64r2-nf-n32 = "${TUNE_FEATURES_tune-mips64-nf-n32} mips64r2"
>> +BASE_LIB_tune-mips64r2-nf-n32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64r2-nf-n32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64r2-nf-n32 = "mips64-nf-n32 mips64r2-nf-n32"
>> +
>> +TUNE_FEATURES_tune-mips64r2el-nf-n32 = "${TUNE_FEATURES_tune-mips64el-nf-n32} mips64r2"
>> +BASE_LIB_tune-mips64r2el-nf-n32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64r2el-nf-n32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el-nf-n32 = "mips64el-nf-n32 mips64r2el-nf-n32"
>> +
>> +# MIPS 64r2 o32
>> +AVAILTUNES += "mips64r2-o32 mips64r2el-o32"
>> +
>> +TUNE_FEATURES_tune-mips64r2-o32 = "${TUNE_FEATURES_tune-mips64-o32} mips64r2"
>> +BASE_LIB_tune-mips64r2-o32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64r2-o32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64r2-o32 = "mips mips64-o32 mips64r2-o32"
>> +
>> +TUNE_FEATURES_tune-mips64r2el-o32 = "${TUNE_FEATURES_tune-mips64el-o32} mips64r2"
>> +BASE_LIB_tune-mips64r2el-o32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64r2el-o32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el-o32 = "mipsel mips64el-o32 mips64r2el-o32"
>> +
>> +# MIPS 64r2 o32 and Soft Float
>> +AVAILTUNES += "mips64r2-nf-o32 mips64r2el-nf-o32"
>> +
>> +TUNE_FEATURES_tune-mips64r2-nf-o32 = "${TUNE_FEATURES_tune-mips64-nf-o32} mips64r2"
>> +BASE_LIB_tune-mips64r2-nf-o32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64r2-nf-o32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64r2-nf-o32 = "mips-nf mips64r2-nf-o32"
>> +
>> +TUNE_FEATURES_tune-mips64r2el-nf-o32 = "${TUNE_FEATURES_tune-mips64el-nf-o32} mips64r2"
>> +BASE_LIB_tune-mips64r2el-nf-o32 = "lib32"
>> +MIPSPKGSFX_VARIANT_tune-mips64r2el-nf-o32 = "${TUNE_ARCH}"
>> +PACKAGE_EXTRA_ARCHS_tune-mips64r2el-nf-o32 = "mipsel-nf mips64r2el-nf-o32"
>>
>

