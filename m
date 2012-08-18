Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1T2kHV-0005zl-JD
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 16:45:41 +0200
Received: by qadc11 with SMTP id c11so2734657qad.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2012 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=V09NDJZlF/oBCvteBBM1JeMm657hwtqJqDk15PjNcKw=;
	b=rd/7tlzUV4EQhdlO+UsNUJLGQClIAytXx7/OZlLUokr32ydQ1gXL2Sj61fiuemCaM1
	J8pfYiQ7uglTPKaCqcmlE/XBb78rOSov7TSEeyMH0XLOJAFcHfOP6TEYA8i9ZLO0kWx3
	LV7YWQKr+9MAYy+3dZ8OUVZN54+f83qUto/LRAlb478eJngiiENXtK0EhAzJkOptdjtn
	7MzeLeumT/LjpJYEn6vizeS406P1pSO/ktAkjeM3SGjGkdAoOiHPv811rk0KuiJWyWC8
	IXqMB7LqVElDfvw65zSfPJBoPkiDNx3sGTDGoH88sNj5sV3DQEsn70UIZCFjaLo3m0wC
	dd2Q==
MIME-Version: 1.0
Received: by 10.229.106.36 with SMTP id v36mr554729qco.92.1345300420571; Sat,
	18 Aug 2012 07:33:40 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Sat, 18 Aug 2012 07:33:40 -0700 (PDT)
In-Reply-To: <1345291665.27428.36.camel@ted>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
	<9adc11ebd961b769e39d0ac664998a2de014b058.1345059176.git.bruce.ashfield@windriver.com>
	<1345291665.27428.36.camel@ted>
Date: Sat, 18 Aug 2012 10:33:40 -0400
Message-ID: <CADkTA4MtFgZv1s4bW0MQVg7BDYX9ukQ7j5qs1416QDuh4cqCOg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] linux-yocto: make KBRANCH the exception and not the rule
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Aug 2012 14:45:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 18, 2012 at 8:07 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-08-15 at 16:06 -0400, Bruce Ashfield wrote:
>> The kernel branch is no longer required by the yocto-kern-tools
>> to locate BSP feature descriptions (it is the MACHINE:KTYPE
>> descriptor), so we no longer require that the BSP branch be
>> explicitly set.
>>
>> If a kernel branch is explicitly set, it is now used to trigger
>> a checks to ensure that the branch really is being built.
>> Otherwise the branch that the machine description creates will
>> be built (just as it always was).
>>
>> This further simplies the use and configuration of a linux-yocto
>> based kernel recipe.
>
> [...]
>
>>
>> -     # We have SRCREVs and we have branches so validation can continue!
>> -     current=`git branch |grep \*|sed 's/^\* //'`
>> -     if [ -n "$target_branch_head" ] && [ "$branch_head" != "$target_branch_head" ] &&
>> -           [ "$target_branch_head" != "AUTOINC" ]; then
>> -             ref=`git show ${target_branch_head} 2>&1 | head -n1 || true`
>> -             if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
>> -                     echo "ERROR ${target_branch_head} is not a valid commit ID."
>> -                     echo "The kernel source tree may be out of sync"
>> -                     exit 1
>> -             else
>> -                     echo "Forcing branch $current to ${target_branch_head}"
>> -                     git branch -m $current $current-orig
>> -                     git checkout -b $current ${target_branch_head}
>> -             fi
>> +     containing_branches=`git branch --contains $target_branch_head | sed 's/^..//'`
>> +     if [ -z "$containing_branches" ]; then
>> +             echo "ERROR: SRCREV was set to \"$target_branch_head\", but no branches"
>> +             echo "       contain this commit"
>> +             exit 1
>> +     fi
>> +     ref=`git show ${target_branch_head} 2>&1 | head -n1 || true`
>> +     if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
>> +         echo "ERROR ${target_branch_head} is not a valid commit ID."
>> +         echo "The kernel source tree may be out of sync"
>> +         exit 1
>>       fi
>
> There is a bit of uncertainty flying around at the moment about why
> these changes are failing on the autobuilder. For example:
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/560/steps/shell_138/logs/stdio
>
> Log data follows:
> | DEBUG: Executing shell function do_validate_branches
> | ERROR: SRCREV was set to "1c17c082b6ee565acc176cde5be835ac4269817b", but no branches
> |        contain this commit
> | ERROR: Function failed: do_validate_branches
>
> It looks like:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/bitbake/lib/bb/fetch2/git.py?id=64662290d3e7deb0b6093b3959c3f3eddb873893
>
> doesn't totally fix the problem. It allows the correct revisions to be
> found and sets alternatives correctly but imports the wrong branch
> config.

bugger. eh. But that's what I saw on the autobuilder as well. There are
two repos, one is being updated, another isn't and the older/non updated
one isn't being updated.

But what's causing the inconsistency in the .git and no ".git" repos ? i.e
aren't all the SRC_URIs now the same ? So why would one be fetched
into in the downloads, and the other used for the build ?

>
> I don't really want to have to require a patched git binary so we may
> end up having to rebuild the branch structure manually.

Where would we have to do the branch rebuild ? From what I saw, in the
broken repo, the blobs aren't even present .. so even if you know the
branch names, you can't set the SRCREV and just dump it in the branch
ref (which I've tried in the past, and it just breaks in equally impressive
ways as).

>
> I guess the older code cared less about the branch name and more about
> the revisions being present.

And the old code was wrong .. or at least not very good. It misses scenarios
where new BSPs are created, or other branches selected to be built by the
board descriptions. Human's working on a kernel, work on branches, not
git hashes and floating branches .. so this actually allows a BSP developer to
control the content, and have the build system build what he wants.

I can say is that this works fine here, has been working for over two months
within Wind River and never a failure seen, but the fetch infrastructure is
configured differently here.

We can skip the changes for 1.3, but they are a big step forward in the tools
and flexibility for working with the tree .. which was one of the macro goals
that I for 1.3.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


