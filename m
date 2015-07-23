Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id A45BD761B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 13:10:32 +0000 (UTC)
Received: by ykay190 with SMTP id y190so218742236yka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 06:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lh4/9BgSotwKF8V0w3a315bnoyERJJhmCXWyxU0npWs=;
	b=VLRiw97J/w+WbwTL5fDFOFOYj2qXuOCN7+/UfHUngP+8IGGJP5B9NHlZy8tqwJdOAg
	1c4d9htMOpvMGZVD1uopQjKpgLzwHGJ/dsBl0vWWYr7T50V9z2/ABQcdz4xgRXWQXRsm
	gj4Q4PurZHxESwD8NQ9lFdn6wopGhjgG+t3pd2/EbGJ4TFlZTlTYuXfvxvJd2zn2Xjja
	ZhvqQe2MOFCxE6rrhwf31yBHyj1GJlolKjx9/XB41WlKZXwRiJ81aaMbntDcSgD3t4al
	4Bp5r/38+GZvw07ROcbOf05vrsFHLQenqjS2dI7LBHnTJiA/YfitDljXQOTPlNiW0j57
	k3Tg==
MIME-Version: 1.0
X-Received: by 10.170.84.215 with SMTP id b206mr8217006yka.21.1437657030569;
	Thu, 23 Jul 2015 06:10:30 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Thu, 23 Jul 2015 06:10:30 -0700 (PDT)
In-Reply-To: <1437638193.821.89.camel@linuxfoundation.org>
References: <cover.1437491325.git.bruce.ashfield@windriver.com>
	<CADkTA4NTzQhvmCt4J9BkbsAh6CL5joomn-NDA8=0kgjd6wcTxQ@mail.gmail.com>
	<CADkTA4MeGsBtd1iCOOWNhbb4TspG6=OMc6eJ=+wtE_rWWR=-MA@mail.gmail.com>
	<1437638193.821.89.camel@linuxfoundation.org>
Date: Thu, 23 Jul 2015 09:10:30 -0400
Message-ID: <CADkTA4N76E2P5vL=6SuM5xqveotp1tpYon0HN0M8CMa2aXrN7w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] linux-yocto: build changes, 4.1 and libc-headers
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
X-List-Received-Date: Thu, 23 Jul 2015 13:10:42 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 23, 2015 at 3:56 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2015-07-22 at 15:48 -0400, Bruce Ashfield wrote:
>> On Wed, Jul 22, 2015 at 10:03 AM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>> > On Tue, Jul 21, 2015 at 11:21 AM, Bruce Ashfield
>> > <bruce.ashfield@windriver.com> wrote:
>> >> Hi all,
>> >>
>> >> This series absolutely needs some more testing and runs through the
>> >> autobuilder, but I've done pretty much all I can do with it here.
>> >>
>> >> I have more changes to the build process that will follow this, but
>> >> these changes need to show that they are stable, so here's the first
>> >> blast.
>> >>
>> >> With this series:
>> >>
>> >>   - I create the 4.1, and 4.1-rt linux-yocto content. This will be
>> >>     the new LTSI kernel. Deletion of 3.14 and 3.19 will follow once
>> >>     all machines have been moved forward.
>> >>
>> >>   - libc-headers updated to match the 4.1 kernel version.
>> >>
>> >> And the one that could cause some issues/compatibility issues is the
>> >> split of the kernel configuration data from the kernel tree itself.
>> >>
>> >> From the commit log:
>> >>
>> >>   The linux-yocto tree has always been a combined set of kernel changes
>> >>   and configuration (meta) data carried in a single tree. While this
>> >>   format is effective at keeping kernel configuration and source
>> >>   modifications synchronized, it isn't always obvious to developers on
>> >>   how to manipulate the meta data versus the source.
>> >>
>> >>   With this change, we remove the meta data processing from the
>> >>   kernel-yocto class and use the external meta-data repository that
>> >>   has always been used to seed the linux-yocto meta branch.
>> >>
>> >>   After this change, linux-yocto can no longer process combined trees,
>> >>   and is simplified as a result.
>> >>
>> >> I'm interested to find out if we get any breakages or severe compability
>> >> issues with the change. I don't want to support both variants of the
>> >> meta data (in and out of tree), since the goal is to reduce complexity
>> >> in the code. Once this change lands, I'll further streamline things.
>> >>
>> >> I've built core-image-kernel-dev and boot tested the qemu* machines.
>> >> qemuppc continues to show a boot failure with systemd, but we have a
>> >> bugzilla to track that.
>> >>
>> >> I'm now doing graphical testing, but wanted to get this out and soaking
>> >> for other images types while I wait for builds to churn.
>> >
>> > As a follow up, my qemuarm boots that worked on Friday, are now hanging.
>> > I'm bisecting to find out what happened.
>>
>> And a final follow up.
>>
>> qemuarm (console and graphics) works fine .. but only if you use gcc
>> 4.9.x, gcc 5.1
>> is doing something evil.
>>
>> We've looked into this in the past, so it is a known issue, but I need
>> to handle these
>> separately.
>
> We got the results of a run of those changes through the autobuilder
> without the noise of other failures. The error reporting system shows:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=d687cdfd04f3d97923c93239ea902bb38e2ea336
>
> and I believe we have the following issues:
>
> a) qemux86/qemux86-64 are throwing warnings about errors in logs
> b) perf has some weird make race
> c) the qemuarm build looks like qemu either segfaulted or was killed
> d) we're occasionally seeing 3.19 and 3.14 fetch failures:
> https://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds/394/steps/BuildImages/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/87/steps/Running%20oe-selftest/logs/stdio

I explained to Ross that dependent layers need to be updated if they set
their own SRCREV_meta, since the repository is completely different. I
sent a patch for meta-intel to deal with it. Obviously, I only built with the
core BSPs during testing.

>

I'll definitely need help on these, since I wasn't seeing any of these issues
during my testing. Otherwise, this won't be done until September (vacation
and other issues to deal with).

But I'll see what I can do.

I unfortunately can't merge anything but critical kernel patches until
these go in as well
since the meta branch is gone in the new scripts, which means SRCREV_meta is
a constant conflict.

Cheers,

Bruce

> To try and promote more sstate cache reuse whilst we sort the remaining
> issues, I merged the linux-libc-header part, we need to get the above
> fixed before the other pieces can merge.
>
> Cheers,
>
> Richard
>
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

