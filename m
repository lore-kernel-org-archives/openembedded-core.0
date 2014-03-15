Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id EE0F86B5B0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 04:47:44 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id e16so2334618lan.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 21:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Hj2tQU10IQoIPEtlP9kXPzB8lJuPPh+2pxa9WCqfY/c=;
	b=HVkIvdYlh20OrvsQZmMNwXFkc7SEuLUjKoupOF47WkaDD8FWBxhA8wgu+JAcHcIhSW
	k3+LENOFkEpT4LpQksDBenPpuVOOGe1hGfbw7el0YhJCp6p/38yVePeCjaqnlE47TEsw
	xabq6/oe4qF7+rJOA7w1KIaLAHcB5mbcFMSQs4KE2VkjWSA7oop8QPlJLhlz1xYO4uXX
	XAeAomexIRC2Q4OsOByb/R0dYgohYt4vzjPTV6+/z3BvQmePrRgMkWItjcmSGrf54/36
	uyP/GPrYzCSVU0VS973wAZKIepLo8TvFssXxsn3QrsO8fYlVCdhYxMOAtalXJ5BLU9+H
	NwZA==
MIME-Version: 1.0
X-Received: by 10.152.190.135 with SMTP id gq7mr8230893lac.28.1394858863671;
	Fri, 14 Mar 2014 21:47:43 -0700 (PDT)
Received: by 10.112.170.166 with HTTP; Fri, 14 Mar 2014 21:47:43 -0700 (PDT)
In-Reply-To: <CF4927A2.786EB%dvhart@linux.intel.com>
References: <0b46d38b8e08d22c308a49d3ccb96ae9c8f14121.1394831720.git.dvhart@linux.intel.com>
	<CADkTA4NkEu6-4tgea7zj9k2n1rQQMMBDvMCiDDJuRqo-LwocqQ@mail.gmail.com>
	<CF4927A2.786EB%dvhart@linux.intel.com>
Date: Sat, 15 Mar 2014 00:47:43 -0400
Message-ID: <CADkTA4M5OSNnE_xdTQWweCEY7FhAiMHtgXi-DD8wcLB9Ap0nTw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-custom: Use SRCREV_machine
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
X-List-Received-Date: Sat, 15 Mar 2014 04:47:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Mar 15, 2014 at 12:42 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> On 3/14/14, 20:51, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
>>On Fri, Mar 14, 2014 at 5:15 PM, Darren Hart <dvhart@linux.intel.com>
>>wrote:
>>> The Yocto kernel tools look for SRCREV_machine in do_validate_branches,
>>> if it's empty, it just returns and silently continues. This likely needs
>>> at least a warning. However, this recipe should be using SRCREV_machine,
>>> and not just SRCREV.
>
> Saul had a recipe using Linus' git tree and an old rev in master. It
> worked in 1.3, but not in 1.5. He found that without setting
> SRCREV_machine specifically, the wrong SRCREV would be checked out, and
> the subsequent patches would fail to apply. Saul can provide specifics.
> Happy to have this wait until we've spelled it out correctly.

ok, that sounds plausible.

he change looks fine to me, since every other kernel user of the kernel-yocto
machine_meta SRCREV has machine properly specified, this one should
as well ..regardless of what was happening.

So consider this Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Bruce

>
> --
> Darren
>
>>
>>I can't think of anything that breaks with this .. but my spidey
>>senses are tingling.
>>
>>This log should tell us what actually broke in the end ? What failed
>>to build / work
>>or otherwise explode ?
>>
>>Bruce
>>
>>>
>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>> Reported-by: Saul Wold <sgw@linux.intel.com>
>>> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> ---
>>>  .../recipes-kernel/linux/linux-yocto-custom.bb     |    2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>>b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>> index 4115d2f..42162f3 100644
>>> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>> @@ -54,7 +54,7 @@ LINUX_VERSION_EXTENSION ?= "-custom"
>>>  # Override SRCREV to point to a different commit in a bbappend file to
>>>  # build a different release of the Linux kernel.
>>>  # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
>>> -SRCREV="76e10d158efb6d4516018846f60c2ab5501900bc"
>>> +SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
>>>
>>>  PR = "r1"
>>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>> --
>>> 1.7.9.5
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>>--
>>"Thou shalt not follow the NULL pointer, for chaos and madness await
>>thee at its end"
>>
>
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

