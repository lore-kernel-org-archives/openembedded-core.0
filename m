Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1312A6067D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 21:35:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w03LZd94007138
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 Jan 2018 13:35:40 -0800 (PST)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 3 Jan 2018 13:35:39 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Bai, Haiqing"
	<Haiqing.Bai@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1511938459-22871-1-git-send-email-Haiqing.Bai@windriver.com>
	<1512946109.19417.136.camel@linuxfoundation.org>
	<C2A454FDE6C23F41BD5011E2458C46C9CEF081F1@ALA-MBD.corp.ad.wrs.com>
	<1513070552.19417.153.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <ebbe74ac-1574-3793-7ff8-eba517c5578c@windriver.com>
Date: Wed, 3 Jan 2018 16:35:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1513070552.19417.153.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.3]
Subject: Re: [PATCH] gmp: depends on flex-native to fix parallel building issue
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
X-List-Received-Date: Wed, 03 Jan 2018 21:35:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2017-12-12 04:22 AM, Richard Purdie wrote:
> Let me make this simpler. Which release of the project did you see this
> issue with?
> 
> I believe this issue would only occur with morty and early, pyro, rocko
> and master are not affected.

I expect I'm missing an undocumented recipe rule here but...


Yes, the race seems to only occur on morty and earlier, but
the dependency is real and not yet listed explicitly in the recipe.

  $ grep flex tmp/work/i586-poky-linux/gmp/6.1.2-r0/temp/log.do_configure
    checking for flex... flex

It's resolved transitively through:
    gmp -> something -> binutils-cross-foo -> flex-native

I was on the fence about whether to be explicit or to rely on
most/all recipes pulling in binutils-cross-foo via default
rules. In looking at the guidance in 4.3.9 Dependencies:
 
http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#new-dependencies
and briefly checking out LLVM's lld loader recipe where it seems
that flex-native might not be needed so it's best to be explicit.

Unless there's an objection, Bai will re-submit the simple
fix with an updated commit log. If anyone has time, they
can check if the LLVM lld build really does NOT pull in flex-native
and if not, then add explicit dependencies as required.

../Randy


> 
> Cheers,
> 
> Richard
> 
> On Tue, 2017-12-12 at 07:13 +0000, Bai, Haiqing wrote:
>> Comments below. thanks
>>
>> -----Original Message-----
>> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
>> Sent: 2017年12月11日 6:48
>> To: Bai, Haiqing; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] gmp: depends on flex-native to fix
>> parallel building issue
>>
>> On Wed, 2017-11-29 at 14:54 +0800, Haiqing Bai wrote:
>>>
>>> fix below parallel building issue:
>>> configure:27365: result: flex
>>> configure:27403: flex conftest.l
>>> .../sysroots/x86_64-linux/usr/bin/flex.real: No such file or
>>> directory
>>> configure:27407: $? = 127
>>> configure:27409: checking lex output file root
>>> configure:27420: error: cannot find output from flex; giving up
>>>
>>> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
>>> ---
>>>   meta/recipes-support/gmp/gmp.inc | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-
>>> support/gmp/gmp.inc index abac8cf..1b35eaa 100644
>>> --- a/meta/recipes-support/gmp/gmp.inc
>>> +++ b/meta/recipes-support/gmp/gmp.inc
>>> @@ -10,3 +10,5 @@ PACKAGECONFIG[readline] = "--with-readline=yes,
>>> --with-readline=no,readline"
>>>   
>>>   ARM_INSTRUCTION_SET_armv4 = "arm"
>>>   ARM_INSTRUCTION_SET_armv5 = "arm"
>>> +
>>> +DEPENDS = "flex-native"
>> With recipe specific sysroots this should now be deterministic. The
>> log above suggests you were not using recipe specific sysroots? This
>> would therefore only be applicable to morty and earlier?
>> [This issue is founded on x86-64 building,  but it does not mean it
>> is only related with x86.  Actually this is caused by the defect of
>> the traditional probe mechanism of 'configure',  the package
>> configure
>> script try to probe whether has package 'flex' , then some optional
>> actions will be done by it.  In this issue,  when this probe
>> happens,   /usr/bin/flex exists but '/usr/bin/flex.real' has not
>> created for the
>> parallel building,  then configure reports the error and exits from
>> building.   Since there are no atomic guarantee for the package
>> output during parallel building, so here add this depends]
>>
>> Cheers,
>>
>> Richard
>>


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

