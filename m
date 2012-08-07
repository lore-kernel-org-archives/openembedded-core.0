Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SymIu-0007N5-BK
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 18:06:44 +0200
Received: by qcad10 with SMTP id d10so2444568qca.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rb5/ONOW5dy/Dq2KsMUW2wF28z8RP0Swa8BsqaWK15k=;
	b=wX/I0ZTucb0LRbki0bgAGRFKKBzCrQWOsv8Tz2pgb9XI0tFSdta1uAJkwCfhJCsw1J
	dkzGTnv01Bg7W1iFNi30fda0KwOzYO468+56qMv3NBleAJpeBCCYI6oiDpekKKPIXcUL
	a2XdBos2XuwksdgzHQAkk8s2sTy3LVHSTA5GEEYPZ7Hyf3+TJXgI14rtu16lt5YaJ6gJ
	plbdueBShqEM3lPksx96jcunwpmjIX5e69kMeHQKbEon10F5Z3YtQqtXgpNtNzLfTo2y
	3G76yw9cLmHWIsJn30RUYWb0a7uNVrXMTp2kycaOH+wIQPx7lzlP0OJGdLkbUjDQ1Gex
	8xXw==
MIME-Version: 1.0
Received: by 10.224.179.135 with SMTP id bq7mr24547275qab.55.1344354897569;
	Tue, 07 Aug 2012 08:54:57 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Tue, 7 Aug 2012 08:54:57 -0700 (PDT)
In-Reply-To: <1344354080.9756.274.camel@ted>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <50212122.50109@windriver.com>
	<1344349336.9756.259.camel@ted> <50212648.8030204@windriver.com>
	<1344350670.9756.269.camel@ted> <502133A9.1080707@windriver.com>
	<1344354080.9756.274.camel@ted>
Date: Tue, 7 Aug 2012 11:54:57 -0400
Message-ID: <CADkTA4P3L11rSZZZr83hbcjPnfmewqDKkzA1jvCkN5PwkJKB3A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: darren.hart@intel.com
Subject: Re: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 16:06:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 7, 2012 at 11:41 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-08-07 at 11:26 -0400, Bruce Ashfield wrote:
>> I wasn't clear, I'm building the tree (and tools) standalone using
>> both a hand generated cross toolchain and the native toolchain. Neither
>> uses a sysroot, so if I merged that patch into the tree, then they
>> wouldn't find slang and the build breaks.
>
> I'm not sure you want that hand generated cross toolchain finding slang
> in that location, but anyhow... :)
>
>> > It would be nice to not have to guess at what the problem is though...
>>
>> Sorry about that, 400 unread email have me moving quickly this morning
>> and not taking enough time to put all the detail into what I am
>> writing. I added that above. And yes, it is some older RHEL/Suse boxes
>> and other ones that are derived from non debian systems that give me
>> pain.
>
> Ok, I understand the problem now.
>
>> > We had the autobuilder showing read for 5 days with radio silence and
>> > admittedly some confusion over a patch status. What am I meant to do
>> > given I'd really like to take the vacation I have planned this week?
>>
>> Sorry, I thought when Liang sent the patch the issue was resolved :(
>> We at least did. That's how it goes sometimes.
>
> Right, some of it is misunderstanding and bad timing etc. but I needed
> to do something. I agree its suboptimal but its a better position for
> OE-Core than we were in and we can recover from it.
>
>> > Anyhow, lets see if we can resolve this. Can you answer my previous
>> > question about whether changing this to -I=/usr/include/slang would
>> > work?
>>
>> It should, but there's a distinct lack of precedent for sysroot style
>> include paths in the kernel tools (behind the times), but in the end,
>> if it fixes the oe-core case, and doesn't break standalone builds
>> (the toolchain just has to no error on the syntax), it should be fine.
>>
>> I've already asked that a full kernel fix be generated, but I don't think
>> it will make the deadline for your vacation, or M3, so merging a sysroot
>> based include is probably the reasonable middle ground that I'll end
>> on.
>
> Lets try the sysroot prefix (=) approach then. The kernel is sparse on
> these since it never actually has to deal with sysroots (or userspace)
> often and is still learning in that area. I suspect this should be the
> fix upstream might take.

Agreed. And to close the loop, I'd prefer to leave what you merged as-is for
today, and by next week, have another pull request with an in tree and upstream
submitted patch to replace it.

Does that work for you ?

Bruce

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


