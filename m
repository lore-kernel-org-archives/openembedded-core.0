Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3391873DA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 20:37:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4DKb8s9012625
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 May 2015 13:37:08 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 13 May 2015 13:37:07 -0700
Message-ID: <5553B5F3.6010907@windriver.com>
Date: Wed, 13 May 2015 16:37:07 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Mike Looijmans
	<mike.looijmans@topic.nl>
References: <5549B621.4060008@topic.nl>	
	<1430915731.8074.34.camel@linuxfoundation.org>
	<5551972F.9070202@topic.nl>	
	<1431513222.30971.163.camel@linuxfoundation.org>
	<1431531868.30971.175.camel@linuxfoundation.org>
In-Reply-To: <1431531868.30971.175.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Changing external kernel module results in rebuild of whole kernel
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
X-List-Received-Date: Wed, 13 May 2015 20:37:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-13 11:44 AM, Richard Purdie wrote:
> On Wed, 2015-05-13 at 11:33 +0100, Richard Purdie wrote:
>> On Tue, 2015-05-12 at 08:01 +0200, Mike Looijmans wrote:
>>> As things are now, I'd much prefer the "taring up and then extracting a large
>>> (GB) sized sstate object" option, since that at least worked correctly.
>>
>> Sorry for the delayed reply, I didn't understand exactly what was
>> happening without looking at a build. By far the easiest "fix" right now
>> is:
>>
>> RM_WORK_EXCLUDE += "<my kernel recipe PN>"
>>
>> This won't cost that much diskspace and should avoid the problem you're
>> seeing.
>>
>> The problem is module.bbclass has a DEPENDS on virtual/kernel which
>> means it depends on <kernel>:do_populate_sysroot. As well as triggering
>> the unpack to repopulate the shared work area for the kernel, this means
>> it will cause the thing to effectively repackage.
>>
>> There are various ideas coming to mind:
>>
>> * We could drop virtual/kernel from DEPENDS which would shorten the
>> kernel dependency chain by removing populate_sysroot from the equation.
>>
>> * We could change the task dependencies of populate_sysroot in
>> kernel.bbclass so that it doesn't depend on do_install (it doesn't
>> handle files any more now anyway).
>>
>> * We could figure out why populate_sysroot from sstate isn't good enough
>> for bitbake and change the sstate code to use sstate more heavily. If I
>> remember rightly, we currently rerun all a task's tasks rather than pull
>> it half from sstate and half not.
>>
>> None of these jumps out at me as an easy or necessarily desirable fix.
>
> I do have some patches:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=c4aed2ba7ae74e54a4ae8ac7aeda291704bde82a
> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=7a20f175c0a1cdec208471e5f7ff5f560f0b609e
> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=c5f3cdca3e16d90c4e5bbb3abe5e136b8025f1a4
>
> What I've noticed is that rm_work does not remove the data from
> shared-work. What it does do is remove the stamp file which causes all
> the tasks to rerun even if the data was there. The above patches make
> "do_shared_work" a semi sstate task, one which is never generated into
> the sstate feed but does have the right stamp functionality. This
> basically stops kernel modules from rerunning kernel tasks even with
> rm_work.
>
> Whether these patches are a good idea, I'm less sure.
>
> Bruce: You might want to look at the module.bbclass changes in the first
> patch. I think there is some duplication between module and module-base
> I need to remove.


I looked at the series, and it looks sane to me. Nice to move that
dependency to a common location, rather than requiring and end module
recipe (like lttng to get it correct).

For the overlap, I assume you were talking about them both now
having the do_configure[depends] += "virtual/kernel:do_shared_workdir" ?

Since module inherits module base, looks like that can be shuffled down
to the lowest class. It's also a bit odd (to my eyes) that module.bbclass
has the do_make_scripts dependency, while module-base.bbclass has the
actual routines ..

Definitely from sorting out that looks to be in order.

Bruce


>
> Cheers,
>
> Richard
>
>
>


