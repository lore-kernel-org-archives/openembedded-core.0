Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 02FE86AC43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 13:25:09 +0000 (UTC)
Received: by lbbsy1 with SMTP id sy1so140809362lbb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eigDZ8LG8UrdIO88+NSeXvR9nIg0fECgRv41gKjZKVk=;
	b=ca+PFWMr9gSigKVM4SG4eIVmlR1Jv60QUwNvtcNZbUVi4ussWFwbei6S5H7J11koNd
	lhmiHl7/W+VBinHv2z+bmnuKpqeQ/kxdhG/kc54RudfQM7ePvegDkEmORbBxBAOPYwzc
	0iM/Zqvv7Phxvms8rmFUuwnH2aGEI7Qa1kx8ulNN65m5tIgUqKuZqOrbVcgXsHK7OYRq
	E8GqxdvHLflRT7dSTnjHiLyqtP0FUuWvaC4yIRQKthNf+nOEiy1Pa/N60EPxOJKEQWtL
	DZGtmwDjdDbwZbihk0oYpLUdyZpAP37H59Y6rEPHgfL+KdXdzvQXoUu9Yj8Qnl9dLixx
	0V5g==
MIME-Version: 1.0
X-Received: by 10.152.203.134 with SMTP id kq6mr3789483lac.110.1427203509897; 
	Tue, 24 Mar 2015 06:25:09 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Tue, 24 Mar 2015 06:25:09 -0700 (PDT)
In-Reply-To: <55108DC7.7020801@opendreambox.org>
References: <1427125146-4871-1-git-send-email-obi@opendreambox.org>
	<CADkTA4MS10SSdxRibMSmUJbrBRGWwgmnk0COEwj_yUkjN8Howw@mail.gmail.com>
	<55108DC7.7020801@opendreambox.org>
Date: Tue, 24 Mar 2015 09:25:09 -0400
Message-ID: <CADkTA4N8gTdqHb3zvY+c2TNAMou04w=VVkuTWhJCZLFLAFL40Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-module-split.bbclass: fix autoloading from postinst script
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
X-List-Received-Date: Tue, 24 Mar 2015 13:25:12 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 23, 2015 at 6:03 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 23.03.2015 21:51, Bruce Ashfield wrote:
>> On Mon, Mar 23, 2015 at 11:39 AM, Andreas Oberritter
>> <obi@opendreambox.org> wrote:
>>> When using KERNEL_MODULE_AUTOLOAD, autoload was empty, causing
>>> "modprobe None" to get appended to the postinst script.
>>
>> I stared at this a bit and it looks right to me, but let me ask a
>> question. Are you saying
>> that KERNEL_MODULE_AUTOLOAD isn't working for anyone ? Or just in a specific
>> configuration ?
>>
>> I don't have a build to check this at the moment, but I swear my
>> autoloads were working!
>
> It already works on boot. This patch only fixes autoloading of modules
> installed from a package feed, i.e. modprobed by a postinst script.

Aha! Right you are, and of course the writing of the modules-load.d is already
using basename.

The entire routine could use a bit of cleaning up .. but this fix does
in fact look
fine to me.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Regards,
> Andreas
>
>>
>> Bruce
>>
>>>
>>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>>> ---
>>>  meta/classes/kernel-module-split.bbclass | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
>>> index 68a23f8..e1a70e6 100644
>>> --- a/meta/classes/kernel-module-split.bbclass
>>> +++ b/meta/classes/kernel-module-split.bbclass
>>> @@ -148,7 +148,7 @@ python split_kernel_module_packages () {
>>>              postinst = d.getVar('pkg_postinst_%s' % pkg, True)
>>>              if not postinst:
>>>                  bb.fatal("pkg_postinst_%s not defined" % pkg)
>>> -            postinst += d.getVar('autoload_postinst_fragment', True) % autoload
>>> +            postinst += d.getVar('autoload_postinst_fragment', True) % (autoload or basename)
>>>              d.setVar('pkg_postinst_%s' % pkg, postinst)
>>>
>>>          # Write out any modconf fragment
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
>>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

