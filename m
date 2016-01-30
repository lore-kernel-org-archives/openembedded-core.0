Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADE87771D7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 01:25:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0U1PapG015798
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Jan 2016 17:25:36 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Jan 2016 17:25:35 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "liezhi.yang@windriver.com"
	<liezhi.yang@windriver.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
	<bb6291a740fc7e41120072e45fc2c5d8d93a0b5f.1454088695.git.hongxu.jia@windriver.com>
	<718c652c42b84c58a04e9c33261b30ba@XBOX02.axis.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56AC1101.70209@windriver.com>
Date: Sat, 30 Jan 2016 09:25:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <718c652c42b84c58a04e9c33261b30ba@XBOX02.axis.com>
Subject: Re: [PATCH 2/5] gcc-5.3.inc/base.bbclass: add gcc option to not record -fdebug-prefix-map to debugging info
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
X-List-Received-Date: Sat, 30 Jan 2016 01:25:41 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2016 01:47 AM, Peter Kjellerstedt wrote:
> Wouldn't it be better to swap the first and second commit and then
> move the addition of -gno-record-debug-prefix-map to the other commit
> where -fdebug-prefix-map are added.

OK

>
> You must also remember that not all use the compiler provided by
> OE-Core, so adding -gno-record-debug-prefix-map unconditionally to
> DEBUG_CFLAGS will break with unpatched compilers... (This also
> indicates that "Upstream-Status: Inappropriate [oe specific]" may
> not be quite right if you want this to be supported by other
> compiler versions).

Agree, we should conditionally add -gno-record-debug-prefix-map to
support other compiler. Thank you for pointing it out.

//Hongxu

> //Peter
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Hongxu Jia
>> Sent: den 29 januari 2016 18:36
>> To: openembedded-core@lists.openembedded.org;
>> liezhi.yang@windriver.com; raj.khem@gmail.com;
>> richard.purdie@linuxfoundation.org
>> Subject: [OE-core] [PATCH 2/5] gcc-5.3.inc/base.bbclass: add gcc option
>> to not record -fdebug-prefix-map to debugging info
>>
>> Add option '-gno-record-debug-prefix-map' and '-grecord-debug-prefix-
>> map'
>> for gcc. If '-gno-record-debug-prefix-map' is used, it does not record
>> '-fdebug-prefix-map' to gcc command line switches in DWARF
>> DW_AT_producer.
>>
>> The patch could make sure the debugging informaion does not has TMPDIR
>> and also leaves gcc switches in.
>>
>> Compile without this fix:
>> objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
>> ...
>> |    <5f>   DW_AT_producer    : (indirect string, offset: 0x1b): GNU
>> C99 5.3.0
>> -m32-march=core2 -mtune=core2 -msse3 -mfpmath=sse -mpreferred-stack-
>> boundary=4
>> -g -O2 -std=gnu99 -fgnu89-inline -fdebug-prefix-
>> map=/buildarea/raid0/hjia/buil
>> d-20160127-yocto-buildpath-2/tmp/sysroots/lib32-qemux86-64=
>> -feliminate-unused-debug-types -fmerge-all-constants -frounding-math
>> -ftls-model=initial-exec
>> ...
>>
>> Compile with this fix:
>> objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
>> ...
>> |    <5f>   DW_AT_producer    : (indirect string, offset: 0xa1): GNU
>> C99 5.3.0
>> -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -mpreferred-stack-
>> boundary=4
>> -g -O2 -std=gnu99 -fgnu89-inline -feliminate-unused-debug-types -
>> fmerge-all-constants
>> -frounding-math -ftls-model=initial-exec
>> ...
>>
>> [YOCTO #7058]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/conf/bitbake.conf                             |  1 +
>>   meta/recipes-devtools/gcc/gcc-5.3.inc              |  3 +-
>>   ...48-add-option-gno-record-debug-prefix-map.patch | 65
>> ++++++++++++++++++++++
>>   3 files changed, 68 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-
>> gno-record-debug-prefix-map.patch
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index bebaaf4..e2e55e8 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -552,6 +552,7 @@ DEBUG_FLAGS ?= "-g \
>>       -fdebug-prefix-map=${S}=/usr/src/${BPN} \
>>       -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
>>       -fdebug-prefix-map=${STAGING_DIR_HOST}= \
>> +    -gno-record-debug-prefix-map \
>>   "
>>
>>   # Disabled until the option works properly -feliminate-dwarf2-dups
>> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-
>> devtools/gcc/gcc-5.3.inc
>> index 80999c1..3a36e50 100644
>> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
>> @@ -76,7 +76,8 @@ SRC_URI = "\
>>              file://0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-
>> necess.patch \
>>              file://0045-Support-for-arm-linux-musl.patch \
>>              file://0046-Get-rid-of-ever-broken-fixincludes-on-
>> musl.patch \
>> -	   file://0047-Fix-nios2-musl-build.patch \
>> +           file://0047-Fix-nios2-musl-build.patch \
>> +           file://0048-add-option-gno-record-debug-prefix-map.patch \
>>             "
>>
>>   BACKPORTS = ""
>> diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-gno-
>> record-debug-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-5.3/0048-
>> add-option-gno-record-debug-prefix-map.patch
>> new file mode 100644
>> index 0000000..e1efaeb
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-5.3/0048-add-option-gno-record-
>> debug-prefix-map.patch
>> @@ -0,0 +1,65 @@
>> +From f1c5f8e9b568122c9a5afd323fd6d76250b83c94 Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Thu, 28 Jan 2016 15:25:23 +0800
>> +Subject: [PATCH] add option gno-record-debug-prefix-map
>> +
>> +If option gno-record-debug-prefix-map used, it does not
>> +record -fdebug-prefix-map to gcc command line switches
>> +in DWARF DW_AT_producer.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + gcc/common.opt  | 8 ++++++++
>> + gcc/dwarf2out.c | 8 ++++++++
>> + 2 files changed, 16 insertions(+)
>> +
>> +diff --git a/gcc/common.opt b/gcc/common.opt
>> +index 0c4f86b..e4c6bd6 100644
>> +--- a/gcc/common.opt
>> ++++ b/gcc/common.opt
>> +@@ -2516,6 +2516,14 @@ grecord-gcc-switches
>> + Common RejectNegative Var(dwarf_record_gcc_switches,1)
>> + Record gcc command line switches in DWARF DW_AT_producer.
>> +
>> ++gno-record-debug-prefix-map
>> ++Common RejectNegative Var(dwarf_record_debug_prefix_map,0) Init(1)
>> ++Don't record -fdebug-prefix-map in gcc command line switches in DWARF
>> DW_AT_producer.
>> ++
>> ++grecord-debug-prefix-map
>> ++Common RejectNegative Var(dwarf_record_debug_prefix_map,1)
>> ++Record -fdebug-prefix-map in gcc command line switches in DWARF
>> DW_AT_producer.
>> ++
>> + gno-split-dwarf
>> + Common Driver RejectNegative Var(dwarf_split_debug_info,0) Init(0)
>> + Don't generate debug information in separate .dwo files
>> +diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
>> +index f90329b..646a706 100644
>> +--- a/gcc/dwarf2out.c
>> ++++ b/gcc/dwarf2out.c
>> +@@ -19383,6 +19383,8 @@ gen_producer_string (void)
>> +       case OPT_SPECIAL_input_file:
>> +       case OPT_grecord_gcc_switches:
>> +       case OPT_gno_record_gcc_switches:
>> ++      case OPT_grecord_debug_prefix_map:
>> ++      case OPT_gno_record_debug_prefix_map:
>> +       case OPT__output_pch_:
>> +       case OPT_fdiagnostics_show_location_:
>> +       case OPT_fdiagnostics_show_option:
>> +@@ -19415,6 +19417,12 @@ gen_producer_string (void)
>> + 	  default:
>> + 	    break;
>> + 	  }
>> ++
>> ++	/* Don't record -fdebug-prefix-map in gcc command line
>> ++	   switches in DWARF DW_AT_producer */
>> ++	if (save_decoded_options[j].opt_index==OPT_fdebug_prefix_map_ &&
>> ++	    !dwarf_record_debug_prefix_map)
>> ++	  continue;
>> + 	switches.safe_push
>> (save_decoded_options[j].orig_option_with_args_text);
>> + 	len += strlen
>> (save_decoded_options[j].orig_option_with_args_text) + 1;
>> + 	break;
>> +--
>> +1.9.1
>> +
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


