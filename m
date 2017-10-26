Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B681C71B27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 06:10:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9Q6AT7r022197
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 25 Oct 2017 23:10:29 -0700
Received: from [128.224.163.189] (128.224.163.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 25 Oct 2017 23:10:27 -0700
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <cover.1508748511.git.Qi.Chen@windriver.com>
	<4f1aa881f21424b71dd9fda2c47240c14166c471.1508748511.git.Qi.Chen@windriver.com>
	<CAJTo0LZZ34aPOfko6usC9VY558FK+T3RSVbevfH0UKtAz8vJYw@mail.gmail.com>
	<CAMKF1srmj96zxxMXgu5wfvG8vMR-1N11LpgN6kY4tC8_v71oJg@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <0efcf859-1695-1cea-b017-f25fd3d11e41@windriver.com>
Date: Thu, 26 Oct 2017 14:11:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srmj96zxxMXgu5wfvG8vMR-1N11LpgN6kY4tC8_v71oJg@mail.gmail.com>
X-Originating-IP: [128.224.163.189]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: fix strange behaviour on qemumips64
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
X-List-Received-Date: Thu, 26 Oct 2017 06:10:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/2017 01:14 AM, Khem Raj wrote:
> On Mon, Oct 23, 2017 at 4:41 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> Can we trust the mips64 compiler at all?  Is there a specific optimisation
>> that systemd is turning on that is causing this breakage?  Have you reported
>> this to the gcc bugzilla?
>>
>> Ross
>>
>> On 23 October 2017 at 11:44, Chen Qi <Qi.Chen@windriver.com> wrote:
>>> On qemumips64, `systemctl status <unit>' would have the output of
>>> `systemctl show <unit>'. This is incorrect.
>>>
>>> However, it's not the code logic that cause such problem. It's the
>>> compilation flags.
>>>
>>> Looking back the history, we had problem with systemd on qemumips64
>>> which is also related to compilation flags. We solved that by using
>>> tweaking FULL_OPTIMIZATION for mips64 to have "-fno-tree-switch-conversion
>>> -fno-tree-tail-merge".
>>>
>>> Now systemd has been upgraded to 234, and we don't have the above problem
>>> any more. However, a new problem appears, and that is the output of
>>> `systemctl
>>> status <unit>'.
>>>
>>> Hence, we set '-O0' flag for mips64 when building systemd to avoid
>>> potential
>>> strange problems.
>>>
>>> [YOCTO #12266]
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   meta/recipes-core/systemd/systemd_234.bb | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_234.bb
>>> b/meta/recipes-core/systemd/systemd_234.bb
>>> index 36fd3f8..b294604 100644
>>> --- a/meta/recipes-core/systemd/systemd_234.bb
>>> +++ b/meta/recipes-core/systemd/systemd_234.bb
>>> @@ -158,8 +158,8 @@ CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG',
>>> 'valgrind', ' -DVALGRIND=1', ''
>>>   # disable problematic GCC 5.2 optimizations [YOCTO #8291]
>>>   FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns
>>> -fno-schedule-insns2"
>>>
>>> -# Avoid login failure on qemumips64 when pam is enabled
>>> -FULL_OPTIMIZATION_append_mips64 = " -fno-tree-switch-conversion
>>> -fno-tree-tail-merge"
>>> +# Disable optimization on qemumips64 to avoid strange behaviour
>>> +FULL_OPTIMIZATION_append_mips64 = " -O0"
>>>
> I think we need a narrowed-down case may be a opt pass which is causing
> the problem. reduce the opt level to -O0 will pessimise the code and impact
> the performance.
>
> Firstly, try to use normal -O2 and remove disabling tree-switch-conversion and
> tail call disable.

Hi Ross & Khem,

I did some more tests today. Below is the result.

I wanted to narrow down the option, but things went strange.

With '-O0', we don't have this problem.
With '-O1', the problem could be reproduced.
The strangest thing is that when using '-O0' and other optimizations 
that O1 enables compared to O0, the problem cannot be reproduced.
In theory, as '-O1' = '-O0' + <other optimizations>, the problem should 
be reproduced when using '-O0' + <other optimizations'. But in fact, 
it's not reproduced.
I'm referring to https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html.

Regarding gcc flags turned on by systemd, I can confirm that when using 
'-O1' and '-O0', the options are the same.

Best Regards,
Chen Qi

>>>   COMPILER_NM ?= "${HOST_PREFIX}gcc-nm"
>>>   COMPILER_AR ?= "${HOST_PREFIX}gcc-ar"
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


