Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id AAFD160C78
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 18:55:25 +0000 (UTC)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 013ItPuO001224
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Mon, 3 Feb 2020 12:55:26 -0600
To: Nathan Rossi <nathan@nathanrossi.com>
References: <20200131220751.106516-1-mark.hatle@kernel.crashing.org>
	<CA+aJhH0a5VSwdhGqg=5Ez+=TzDm0=Esu1kebDERWZTjkRp=7Ew@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <8a54da63-ab5a-8222-f401-aaea7debcfc5@kernel.crashing.org>
Date: Mon, 3 Feb 2020 12:55:25 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CA+aJhH0a5VSwdhGqg=5Ez+=TzDm0=Esu1kebDERWZTjkRp=7Ew@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] microblaze tune: Correct two minor issues with the microblaze tune
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
X-List-Received-Date: Mon, 03 Feb 2020 18:55:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/31/20 10:49 PM, Nathan Rossi wrote:
> On Sat, 1 Feb 2020 at 08:13, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>>
>> From: Mark Hatle <mark.hatle@xilinx.com>
>>
>> TUNE_ARCH - microblazeeb is not a valid architecture, microblaze is big
>>             endian, microblazeel is the little endian version.
>>
>> Version arguments:
>>   If a version feature is not defined, then we don't want to set either
>>   TUNE_CCARGS or MBPKGARCH_VERSION.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
>> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>> ---
>>  meta/conf/machine/include/microblaze/arch-microblaze.inc      | 2 +-
>>  .../include/microblaze/feature-microblaze-versions.inc        | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/meta/conf/machine/include/microblaze/arch-microblaze.inc
>> index eab7171cb2..265898b6b6 100644
>> --- a/meta/conf/machine/include/microblaze/arch-microblaze.inc
>> +++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
>> @@ -46,7 +46,7 @@ require conf/machine/include/microblaze/feature-microblaze-versions.inc
>>  require conf/machine/include/microblaze/feature-microblaze-math.inc
>>
>>  # Architecture name, either 'microblazeeb' or 'microblazeel' depending on endianess
> 
> Worth updating the comment at the same time.
> 
>> -TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "eb", "el", d)}"
>> +TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
> 
> This change will break some things in oe-core (and probably
> meta-xilinx too). They should be updated at the same time.

Do you have an example of what?  Cause without this, all autoconf invocation of
big endian failed for me due to invalid architecture.

> Might also be worth removing the microblazeeb references in siteinfo,
> and elf.py. Since they were added to support this.

I looked at these and left them "just in case", as they didn't seem to conflict
with anything that I saw.

--Mark

> Regards,
> Nathan
> 
>>
>>  # Package Architecture formatting
>>  TUNE_PKGARCH = "microblaze${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
>> diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
>> index 3221e2aab7..003fde3e07 100644
>> --- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
>> +++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
>> @@ -64,6 +64,6 @@ TUNECONFLICTS[v10.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3
>>  TUNECONFLICTS[v11.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6 v10.0"
>>
>>  # Version flags
>> -TUNE_CCARGS += "-mcpu=${@microblaze_current_version(d, True)}"
>> -MBPKGARCH_VERSION = "-${@microblaze_current_version(d)}"
>> +TUNE_CCARGS += "${@'-mcpu=${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
>> +MBPKGARCH_VERSION = "${@'-${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

