Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6EA60B47
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 18:36:06 +0000 (UTC)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 013Ia4Wf001037
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Mon, 3 Feb 2020 12:36:05 -0600
To: Nathan Rossi <nathan@nathanrossi.com>
References: <20200131233305.118454-1-mark.hatle@kernel.crashing.org>
	<CA+aJhH1nnqrUzwdRuju04NY=YsTfafkQLA7ucMMUUcPyozpEmA@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <5e6edcb4-8eca-7bb8-5fc4-5c0504d4f130@kernel.crashing.org>
Date: Mon, 3 Feb 2020 12:36:04 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CA+aJhH1nnqrUzwdRuju04NY=YsTfafkQLA7ucMMUUcPyozpEmA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] microblaze tune: Enable 64-bit
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
X-List-Received-Date: Mon, 03 Feb 2020 18:36:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/31/20 10:50 PM, Nathan Rossi wrote:
> On Sat, 1 Feb 2020 at 09:33, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>>
>> From: Mark Hatle <mark.hatle@xilinx.com>
>>
>> 64-bit is not yet available in Linux, but some non-Linux uses exist.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>>  meta/conf/machine/include/microblaze/arch-microblaze.inc | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/meta/conf/machine/include/microblaze/arch-microblaze.inc
>> index 265898b6b6..fb777d929c 100644
>> --- a/meta/conf/machine/include/microblaze/arch-microblaze.inc
>> +++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
>> @@ -4,6 +4,9 @@
>>  TUNEVALID[microblaze] = "MicroBlaze"
>>  MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "microblaze", "microblaze:", "", d)}"
>>
>> +TUNEVALID[64-bit] = "64-bit MicroBlaze"
>> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "microblaze64:", "", d)}"
> 
> This should probably TUNECONFLICTS with all unsupported versions.

I have no information on what versions are unsupported with 64-bit.  If I
receive that information, I will add it as conflicts.

--Mark

> Regards,
> Nathan
> 
> 
>> +
>>  # Endian
>>  TUNEVALID[bigendian] = "Use Microblaze Big Endian"
>>  TUNECONFLICTS[bigendian] += "v10.0"
>> @@ -26,6 +29,7 @@ TUNECONFLICTS[frequency-optimized] += "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0
>>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "barrel-shift", "-mxl-barrel-shift", "-mno-xl-barrel-shift", d)}"
>>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "pattern-compare", "-mxl-pattern-compare", "-mno-xl-pattern-compare", d)}"
>>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "frequency-optimized", "-mxl-frequency", "", d)}"
>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "-m64", "", d)}"
>>
>>  # Disable reorder for v8.30 if pattern-compare is not enabled
>>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "reorder", \
>> @@ -48,6 +52,9 @@ require conf/machine/include/microblaze/feature-microblaze-math.inc
>>  # Architecture name, either 'microblazeeb' or 'microblazeel' depending on endianess
>>  TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
>>
>> +# Add 64-bit to the PKGARCH if enabled.
>> +MBPKGARCH_SIZE = "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "64", "", d)}"
>> +
>>  # Package Architecture formatting
>> -TUNE_PKGARCH = "microblaze${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
>> +TUNE_PKGARCH = "microblaze${MBPKGARCH_SIZE}${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

