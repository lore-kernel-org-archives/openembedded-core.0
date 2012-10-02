Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TIycV-0005Lu-3D
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 11:18:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Oct 2012 02:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,522,1344236400"; d="scan'208";a="200527208"
Received: from lpalcu-linux (HELO [10.237.105.41]) ([10.237.105.41])
	by orsmga001.jf.intel.com with ESMTP; 02 Oct 2012 02:05:25 -0700
Message-ID: <506AAE54.2030708@intel.com>
Date: Tue, 02 Oct 2012 12:05:24 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1349156215-16686-1-git-send-email-raj.khem@gmail.com>
	<CAMKF1soLwgEoyR0RkYLpjsGGNi07gLsjVcZtzbR=arHuGt9wbg@mail.gmail.com>
In-Reply-To: <CAMKF1soLwgEoyR0RkYLpjsGGNi07gLsjVcZtzbR=arHuGt9wbg@mail.gmail.com>
Subject: Re: [PATCH] binutils-crossdk: Fix interp size expansion
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 09:18:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 10/02/2012 10:33 AM, Khem Raj wrote:
> i need to check it with 1 more case. Please hold on for applying it. I
> welcome testing
> 
> On Mon, Oct 1, 2012 at 10:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Currently for sdk binutils we expand the size of .interp
>> section to 0x1000 assuming that its at the beginning of
>> the linker map but there may be program header before that
>> so actually we want to add 0x1000 - sizeof(.interp) section
>> to current location and not assign is absolutely to 0x1000
Why does it matter if there is another program header before .interp?
The .interp section should start at the end of the previous section.
>>
>> This fixes errors like
>>
>> built in linker script:11 cannot move location counter backwards (from
>> 0000000000401054 to 0000000000401000)
This error usually means that the data inside that section exceeds the
allocated size of the section. Assuming .interp section is the first,
the linker is trying to squeeze 0x1054 bytes in a 0x1000 bytes section.
And that is kind of weird. We might be missing something here...
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../binutils/binutils-crosssdk_2.22.bb             |    2 +-
>>  .../binutils/binutils/relocatable_sdk.patch        |   10 +++++-----
>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
>> index c936549..d3c25b6 100644
>> --- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
>> +++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
>> @@ -2,7 +2,7 @@ require binutils-cross_${PV}.bb
>>
>>  inherit crosssdk
>>
>> -PR = "r1"
>> +PR = "r2"
>>
>>  PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
>> index 33f9e68..4a2494a 100644
>> --- a/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
>> +++ b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
>> @@ -7,16 +7,16 @@ by the relocating script.
>>
>>  Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>>
>> -Index: binutils-2.22/ld/scripttempl/elf.sc
>> +Index: git/ld/scripttempl/elf.sc
>>  ===================================================================
>> ---- binutils-2.22.orig/ld/scripttempl/elf.sc
>> -+++ binutils-2.22/ld/scripttempl/elf.sc
>> -@@ -116,7 +116,7 @@ if test -n "${COMMONPAGESIZE}"; then
>> +--- git.orig/ld/scripttempl/elf.sc     2012-10-01 21:42:18.729294685 -0700
>> ++++ git/ld/scripttempl/elf.sc  2012-10-01 22:26:35.149173335 -0700
>> +@@ -125,7 +125,7 @@
>>     DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
>>   fi
>>   if test -z "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}"; then
>>  -  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp) }"
>> -+  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp); . = 0x1000; }"
>> ++  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp); . = (. & 0x1000) + 0x1000; }"
This line confuses me. You will have here an .interp size of 0x1000 or
0x2000. Is this the intent?

Thanks,
Laurentiu
>>   fi
>>   if test -z "$PLT"; then
>>     IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
>> --
>> 1.7.9.5
>>
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


