Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4974C62137
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 05:38:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4J5cUI7026313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 18 May 2016 22:38:31 -0700
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 22:38:30 -0700
To: Khem Raj <raj.khem@gmail.com>, Gary Thomas <gary@mlbassoc.com>
References: <cover.1463562174.git.liezhi.yang@windriver.com>
	<4d1dd04acc6195e8e498741a36b67b208c62b32b.1463562174.git.liezhi.yang@windriver.com>
	<CAMKF1srNvmFgT0s_Tp174WO4SG2RAXUkhcg5_41Vu0V5NRHgwg@mail.gmail.com>
	<573D300C.5080309@mlbassoc.com>
	<ADCDD0F4-B972-4E59-9188-E65832744CF2@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <573D5154.1070609@windriver.com>
Date: Thu, 19 May 2016 13:38:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <ADCDD0F4-B972-4E59-9188-E65832744CF2@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] webkitgtk: turn off JIT on armv4 and armv7a
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
X-List-Received-Date: Thu, 19 May 2016 05:38:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit



On 05/19/2016 01:28 PM, Khem Raj wrote:
>
>> On May 18, 2016, at 8:16 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>>
>> On 2016-05-18 22:07, Khem Raj wrote:
>>> On Wed, May 18, 2016 at 2:03 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>> * It doesn't build on armv4:
>>>> {standard input}: Assembler messages:
>>>> {standard input}:52: Error: selected processor does not support `blx llint_throw_stack_overflow_error' in ARM mode
>>>> {standard input}:126: Error: selected processor does not support `bkpt #0' in ARM mode
>>>> {standard input}:128: Error: selected processor does not support `blx r0' in ARM mode
>>>> {standard input}:134: Error: selected processor does not support `bkpt #0' in ARM mode
>>>> {standard input}:185: Error: selected processor does not support `blx llint_throw_stack_overflow_error' in ARM mode
>>>> {standard input}:256: Error: selected processor does not support `blx r4' in ARM mode
>>>> {standard input}:310: Error: selected processor does not support `movw r2,#:lower16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
>>>> {standard input}:311: Error: selected processor does not support `movt r2,#:upper16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
>>>> {standard input}:315: Error: selected processor does not support `movw r2,#:lower16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
>>>> {standard input}:316: Error: selected processor does not support `movt r2,#:upper16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
>>>> [snip]
>>>>
>>>> * It can build on armv7a, but doesn't work on runtime, cause
>>>>    displaying problems or ephiphany hang.
>>>>
>>>> [YOCTO #9474]
>>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>   meta/recipes-sato/webkit/webkitgtk_2.12.1.bb | 7 ++++++-
>>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
>>>> index bdbcbea..23ead72 100644
>>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
>>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
>>>> @@ -62,9 +62,14 @@ EXTRA_OECMAKE = " \
>>>>   EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
>>>>   EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=OFF "
>>>>
>>>> -# ARM JIT code does not build on ARMv5/6 anymore, apparently they test only on v7 onwards
>>>> +# ARM JIT code does not build on ARMv4/5/6 anymore
>>>>   EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=OFF "
>>>>   EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=OFF "
>>>> +EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
>>>> +
>>>> +# ARM JIT can build on armv7a, but doesnt' work on runtime, cause
>>>> +# displaying problems or ephiphany hang.
>>>> +EXTRA_OECMAKE_append_armv7a = " -DENABLE_JIT=OFF "
>>>
>>> this should work fine with thumb2 e.g. so this is a little broad brush
>>> here to diable it across
>>> all armv7
>>
>> Why do you think that changing the instruction set (to thumb2) would
>> make the JIT work any better?
>
> Assembler implementation for JIT has always worked better with thumb2.
>
>>
>> If you tell me how, I'll test it on my i.MX6 (Cortex-A9) which is
>> the platform that inspired the original bug report.
>
>
> Try adding
>
> ARM_INSTRUCTION_SET_armv7a = “thumb"
> ARM_INSTRUCTION_SET_armv7ve = “thumb"
>
> in the webkitgtk recipe and see if it helps


Hi,

To be clear, webkitgtk can build on armv7a, but doesn't work on
runtime, cause displaying problems or ephiphany hang.

// Robert


>
>>
>>>
>>>>
>>>>   # binutils 2.25.1 has a bug on aarch64:
>>>>   # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
>>>> --
>>>> 2.7.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>> --
>> ------------------------------------------------------------
>> Gary Thomas                 |  Consulting for the
>> MLB Associates              |    Embedded world
>> ------------------------------------------------------------
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

