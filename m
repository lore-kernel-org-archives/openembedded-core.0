Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4A14745D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 02:43:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3N2hmks019695
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 22 Apr 2018 19:43:48 -0700
Received: from server.local (128.224.20.40) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 22 Apr 2018 19:43:47 -0700
To: Hongxu Jia <hongxu.jia@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1524194387-10021-1-git-send-email-hongxu.jia@windriver.com>
	<a4322404-74b3-b502-ec68-ba8202cd6b9c@windriver.com>
	<431769c8-5fd6-c22e-b9bd-d28a7f68935e@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <c0e00297-3eab-3056-ade6-6f64b8673915@windriver.com>
Date: Sun, 22 Apr 2018 22:43:46 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <431769c8-5fd6-c22e-b9bd-d28a7f68935e@windriver.com>
Subject: Re: [PATCH] kernel-devsrc: fix cpio randomly hit insane file name
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
X-List-Received-Date: Mon, 23 Apr 2018 02:43:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2018-04-22 10:15 PM, Hongxu Jia wrote:
> On 2018年04月20日 20:50, Bruce Ashfield wrote:
>> On 04/19/2018 11:19 PM, Hongxu Jia wrote:
>>> Occasionally compile kernel-devsrc failed at world build.
>>> ...
>>> |0 blocks
>>> |cpio: ./tools/perf/arch/arm/util/sedr7ORqk: Cannot stat:
>>> No such file or directory
>>> |0 blocks
>>> ...
>>> cpio tried to find a file at ${S}/tools/perf and failed
>>> if the input list is not valid.
>>>
>>> The reason is perf and kernel-devsrc have the same ${S},
>>> Perf sed ${S}/tools/perf/* at do_configure, kernel-devsrc
>>> cpio ${S} at do_install. The former task affects the latter
>>> one, so let the latter depends the former to avoid the conflict.
>>
>> While I have my devsrc rewrite ready to go for the 2.6 release
>> window, it would still suffer from this, so I'm making the same
>> change to the new recipe.
>>
>> I do have a question though. Why not just add DEPENDS on perf ?
>> Won't that be the same, since it means the configure of this
>> recipe depends on the configure of perf ?
>>
> 
> For this fix, I think depends perf or perf's do_configure are the same,
> maybe the latter could be built earlier.
> 
> Since you will rewrite devsrc, my question is should we rewrite the perf?
> It is not a good idea to modify shared kernel's ${S}, any recipe depends
> "virtual/kernel:do_shared_workdir" may have potential conflict with it.
> I thinks it is the root cause of this issue.

This fix is fine to solve the issue, I wouldn't necessarily go all
the way to re-writing the perf recipe.

Well, I wouldn't call it a re-write, since all we could change is
to make a copy of the kernel shared source directory into a perf
specific dir, and modify it there. But the complication is on
build, since perf can dip into the rest of the kernel build
infrastructure if you aren't careful.

Definitely something to consider for 2.6.

Bruce

> 
> //Hongxu
> 
>> Cheers,
>>
>> Bruce
>>
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb 
>>> b/meta/recipes-kernel/linux/kernel-devsrc.bb
>>> index 8bbfa23..5ebeabc 100644
>>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>>> @@ -18,6 +18,9 @@ inherit module-base
>>>   do_install[depends] += "virtual/kernel:do_shared_workdir"
>>>   # Need the source, not just the output of populate_sysroot
>>>   do_install[depends] += "virtual/kernel:do_install"
>>> +# Perf `sed ${S}/tools/perf/*' at do_configure, make sure it is done
>>> +# before kernel-devsrc `cpio ${S}' at do_install
>>> +do_install[depends] += "virtual/perf:do_configure"
>>>     # There's nothing to do here, except install the source where we 
>>> can package it
>>>   do_fetch[noexec] = "1"
>>>
>>
> 


