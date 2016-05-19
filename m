Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 4914060125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 03:16:31 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 6636E68A01C; Thu, 19 May 2016 04:16:30 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 32F1168A019;
	Thu, 19 May 2016 04:16:29 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id D265067404E1;
	Thu, 19 May 2016 05:16:28 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <cover.1463562174.git.liezhi.yang@windriver.com>
	<4d1dd04acc6195e8e498741a36b67b208c62b32b.1463562174.git.liezhi.yang@windriver.com>
	<CAMKF1srNvmFgT0s_Tp174WO4SG2RAXUkhcg5_41Vu0V5NRHgwg@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <573D300C.5080309@mlbassoc.com>
Date: Thu, 19 May 2016 05:16:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1srNvmFgT0s_Tp174WO4SG2RAXUkhcg5_41Vu0V5NRHgwg@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 May 2016 03:16:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-18 22:07, Khem Raj wrote:
> On Wed, May 18, 2016 at 2:03 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> * It doesn't build on armv4:
>> {standard input}: Assembler messages:
>> {standard input}:52: Error: selected processor does not support `blx llint_throw_stack_overflow_error' in ARM mode
>> {standard input}:126: Error: selected processor does not support `bkpt #0' in ARM mode
>> {standard input}:128: Error: selected processor does not support `blx r0' in ARM mode
>> {standard input}:134: Error: selected processor does not support `bkpt #0' in ARM mode
>> {standard input}:185: Error: selected processor does not support `blx llint_throw_stack_overflow_error' in ARM mode
>> {standard input}:256: Error: selected processor does not support `blx r4' in ARM mode
>> {standard input}:310: Error: selected processor does not support `movw r2,#:lower16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
>> {standard input}:311: Error: selected processor does not support `movt r2,#:upper16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
>> {standard input}:315: Error: selected processor does not support `movw r2,#:lower16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
>> {standard input}:316: Error: selected processor does not support `movt r2,#:upper16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
>> [snip]
>>
>> * It can build on armv7a, but doesn't work on runtime, cause
>>    displaying problems or ephiphany hang.
>>
>> [YOCTO #9474]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-sato/webkit/webkitgtk_2.12.1.bb | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
>> index bdbcbea..23ead72 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
>> @@ -62,9 +62,14 @@ EXTRA_OECMAKE = " \
>>   EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
>>   EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=OFF "
>>
>> -# ARM JIT code does not build on ARMv5/6 anymore, apparently they test only on v7 onwards
>> +# ARM JIT code does not build on ARMv4/5/6 anymore
>>   EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=OFF "
>>   EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=OFF "
>> +EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
>> +
>> +# ARM JIT can build on armv7a, but doesnt' work on runtime, cause
>> +# displaying problems or ephiphany hang.
>> +EXTRA_OECMAKE_append_armv7a = " -DENABLE_JIT=OFF "
>
> this should work fine with thumb2 e.g. so this is a little broad brush
> here to diable it across
> all armv7

Why do you think that changing the instruction set (to thumb2) would
make the JIT work any better?

If you tell me how, I'll test it on my i.MX6 (Cortex-A9) which is
the platform that inspired the original bug report.

>
>>
>>   # binutils 2.25.1 has a bug on aarch64:
>>   # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

