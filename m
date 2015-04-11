Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8666F60043
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 04:30:42 +0000 (UTC)
Received: by ignm3 with SMTP id m3so25522991ign.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 21:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ARNUAkTkwXVuV/sGWDkW/mz9Mal4pHkEDSq5dVhQeQc=;
	b=gIUencSkmZ2E7Kw1vQsKjvK8VWWBQPU6G7i2tX2hC3yFt9D8xBOZzlr16CVjN4PeOr
	nCF1Kx0wA0oZ51z0i7ItIuaArSl4d44kZ5kdei8Y84rQX8nAuCub684aPBkVfrI5DElb
	8uQWuu0DFQx0Y+qWlJGctkufZP+NCHon5u31vsNBRIINwFAur9KSAchFghX3Q2G6PDf7
	w39M7dS03J8Ei53AwxZteNEKVTivWlFBl9OFm7FSwQCkQi7VeIYpdSfOs9v/eOT+y4yB
	Jc4W+xzzKz8EYY6kAw3kKo1YJaRI3SgvVLggJkG7hXyEmB2+hJv3f6euVLMP4/zMfzqR
	MFBQ==
MIME-Version: 1.0
X-Received: by 10.107.135.144 with SMTP id r16mr7553609ioi.13.1428726643852;
	Fri, 10 Apr 2015 21:30:43 -0700 (PDT)
Received: by 10.107.158.20 with HTTP; Fri, 10 Apr 2015 21:30:43 -0700 (PDT)
In-Reply-To: <CADkTA4PROF_Ho-az9isuCb+Q29cptOLOfQ14cC38CE-R7ZoQ2g@mail.gmail.com>
References: <1428715039-4209-1-git-send-email-arun@gumstix.com>
	<CADkTA4PROF_Ho-az9isuCb+Q29cptOLOfQ14cC38CE-R7ZoQ2g@mail.gmail.com>
Date: Sat, 11 Apr 2015 00:30:43 -0400
Message-ID: <CADkTA4McMpywcMCxavLuoc82zZt60OC0=082dpyOc6X72ye04g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Arun Bharadwaj <arun@gumstix.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Do not always checkout master branch in the kernel repository
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
X-List-Received-Date: Sat, 11 Apr 2015 04:30:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 10, 2015 at 11:27 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Fri, Apr 10, 2015 at 9:17 PM, Arun Bharadwaj <arun@gumstix.com> wrote:
>> It seems like we are checking if a particular branch exists and
>> then we still go ahead and set the machine_branch as master.
>> This doesn't seem correct to me as it would work only for
>> repositories which contain a branch called "master" but would
>> fail in other cases.
>
> In kernel checkout, we are simply creating the tree from a bare clone, or
> a reference clone. So in fact, we do want to want to check out a consistent
> branch to bring the working files into existence.
>
> Anyone building a repository without master is already using a fairly
> broken workflow .. so I'm not particularly concerned about that case.
>
> I have an whole set of pending changes to linux-yocto, so I'll grab this
> and throw it on my queue.

I knew this looked familiar. We already have this changed in master:

    kernel-yocto.bbclass: Bug Fix inside do_kernel_checkout()

     After we check the existence of 'machine_branch' with 'git show-ref'
     the following if statement should change the 'machine_branch'
     to the default (i.e. master) if the 'git show-ref' has returned a
     exit code that is not 0, not the other way around.

     Signed-off-by: Theodor Gherzan <theodor@resin.io>

(oe-core commit: cc95da21914d08bfbf1936830985f824e8813904)

So you must be running an older release (this wasn't a significant issue, so
it hasn't been backported).

Cheers,

Bruce

>
> Cheers,
>
> Bruce
>
>> ---
>>  meta/classes/kernel-yocto.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
>> index f42a5c2..410a6e8 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -211,7 +211,7 @@ do_kernel_checkout() {
>>         # Create a working tree copy of the kernel by checking out a branch
>>         machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
>>         git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
>> -       if [ $? -eq 0 ]; then
>> +       if [ $? -ne 0 ]; then
>>                 machine_branch="master"
>>         fi
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

