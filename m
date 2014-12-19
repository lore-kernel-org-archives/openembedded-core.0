Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 267907292A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 13:14:01 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id u10so763755lbd.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 05:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=E3Qv+8C/xAFkCHJgI1AmWd9+wYSsEH+3SBAYt4tblIg=;
	b=Hm6a6b5Hedfy1t/iMa4avVCS+KFIB4730LklPNM6yk+5S55a6s9GOkgeOrSWGzEOsN
	wYyO/zr2xo8csfIRBLOam6sKNU3R/W25Rb4VSQ0sQ3TcdnXRqKCmV2wqpqjLGrepc4ra
	hQdwq0vY9cZu7ppcjsAHAiKfr6vCKr1kHWMDHcHg4cWrCaveBaijKqSJ3G2wUxcvpRXe
	f6J1i6qzUCfjhh/79MTNJU2LLD1MtTlktHtPQ2Eh9JVFEkbDqZFwO7NIufJIgv6HEm7J
	L5BtWe/P4muxYey7aQpR1S84tgDNZT1sPg9aMx9TExcw8mSggKv8NqpuY8X/2Y57+EAZ
	0r+g==
MIME-Version: 1.0
X-Received: by 10.112.154.70 with SMTP id vm6mr5517204lbb.18.1418994841509;
	Fri, 19 Dec 2014 05:14:01 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Fri, 19 Dec 2014 05:14:01 -0800 (PST)
In-Reply-To: <54942326.8080806@windriver.com>
References: <1418984914.13316.6.camel@linuxfoundation.org>
	<1418992908.13316.14.camel@linuxfoundation.org>
	<54942326.8080806@windriver.com>
Date: Fri, 19 Dec 2014 08:14:01 -0500
Message-ID: <CADkTA4NUzd8md5aPvqhC2mp_hEC-hK8mZNyxQuJom_JUzOqN4w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Merging problems
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
X-List-Received-Date: Fri, 19 Dec 2014 13:14:10 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 19, 2014 at 8:07 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 2014-12-19, 7:41 AM, Richard Purdie wrote:
>>
>> On Fri, 2014-12-19 at 10:28 +0000, Richard Purdie wrote:
>>>
>>> I want to give people a headsup that we're having problems merging
>>> changes at the moment. We've been doing our best but the number of
>>> things building up which are causing issues is overwheling our ability
>>> to fix and stablise the build. It wasn't helped that I took a long
>>> weekend's vacation last weekend. There are changes being made or tested
>>> to the autobuilder which also isn't helping.
>>>
>>> The kernel series has several issues:
>>>
>>>    * a random failure in do_kernel_configme [i]
>>
>>
>> I think I have a handle on this. If you look at the autobuilder failure
>> it says:
>
>
> do you have a link to the actual failure ?

Aw crap. I see it in your original email now. I'll have a look.

Bruce

>
>>
>> | [INFO] Configuring target/machine combo: "standard/qemuppc"
>> | [INFO] collecting configs in patches/meta-series
>>
>> and what concerns me is "patches/meta-series". I my local builds it
>> says .meta/meta-series. Poking around kern-tools I see:
>>
>> """
>> # determine the meta directory name. The meta directory is at the top
>> level
>> # of the repository, and is untracked.
>> meta_dir_options=`git ls-files -o --directory`
>> for m in $meta_dir_options; do
>>      if [ -d "$m" ]; then
>>         meta_dir=`echo $m | sed 's%/%%'`
>>      fi
>> done
>>
>> if [ -z "$meta_dir" ]; then
>>      meta_dir=".meta"
>> fi
>> """
>>
>> which means that if a "patches" directory exists it will use it since
>> the command looks for untracked directories. I also noticed that some
>> places define the default as ".meta", some as "meta" and they look a bit
>> confused but that is probably a separate issue.
>
>
> They are consistent .. both are supported, we migrated from 'meta' to
> .meta some time ago, but there are old trees that still have to build.
>
>>
>> The question is then how does a "patches" directory end up in the kernel
>> source. I was able to create one with the commands:
>>
>> MACHINE=qemuppc bitbake linux-yocto perf -c clean
>> MACHINE=qemuppc bitbake linux-yocto -c patch
>> MACHINE=qemuppc bitbake perf -c unpack
>> MACHINE=qemuppc bitbake linux-yocto -c kernel_configme
>>
>> which doesn't fail like the autobuilder but does put the metadata into
>> the wrong place with the wrong data (into patches). I'm therefore
>> guessing this is a big horrible race.
>>
>> Why does perf -c unpack create a patches directory? base.bbclass has:
>>
>> do_unpack[cleandirs] = "${S}/patches"
>>
>> The fix is therefore probably to not run the fetch/unpack/patch tasks in
>> kernelsrc.bbclass.
>
>
> Very likely. I'll have a look. I noticed about 6 months ago that a patches
> directory was being created .. even when it was never going to be used.
> I took steps to remove it before the linux-yocto builds continued, but
> apparently it is sneaking back in through other means :)
>
> Bruce
>
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

