Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2876E73D17
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 03:26:47 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so3549469igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 20:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=OtOA5wJyjLxQ+drUScSGSnu/e1LgyCsLcVlFM9JWsMM=;
	b=SFe12A/7sbyi6UgLrmMdtkjz8wCcWG2PxrA0PHmNJj8SvQzQz0pXHTI0Wgnl1ZSVeh
	ZYRcBhtsgotWFQG0/GPTYnWF9dVObAPwKoCXp6zbHZrbPgUXE4xpt5SWykAcV6Si0tC7
	TiEniYu0/KILQvw2B5IpuK3feGIDgsCiLhEYRc542BQ/3Si0yUQDSOezuST3yhsEOn+L
	YDK759DLEcfUAMf/TtPrcp5nF6ejtFzmOmZiGP+2Hk67NF18SFQ/wb4kuxHD1R4gObJ7
	gvWfaAXmylYnGk9/oPqP595rfj8OlnzXkcXlskHWdoijTeyT0xMMmlYYBpErf9b3yIzV
	IaTw==
X-Received: by 10.50.59.148 with SMTP id z20mr1090824igq.77.1438831607841;
	Wed, 05 Aug 2015 20:26:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 5 Aug 2015 20:26:18 -0700 (PDT)
In-Reply-To: <CADkTA4N=sTfuTpxjiF3q+G6Joxet1eDgPa+9SQE2=Eaw6gEAjA@mail.gmail.com>
References: <1438696733-234279-1-git-send-email-paul.gortmaker@windriver.com>
	<1438699944.30526.5.camel@linuxfoundation.org>
	<55C0D3BF.6080205@windriver.com>
	<CADkTA4N=sTfuTpxjiF3q+G6Joxet1eDgPa+9SQE2=Eaw6gEAjA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Aug 2015 20:26:18 -0700
Message-ID: <CAMKF1srkc4eOJ0BWEO+sWk3yMptYgS1zOgf3hmFrvu8n+A8Fvw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: exclude drm headers from sysroot
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
X-List-Received-Date: Thu, 06 Aug 2015 03:26:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 7:00 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Tue, Aug 4, 2015 at 11:01 AM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> On 2015-08-04 10:52 AM, Richard Purdie wrote:
>>> On Tue, 2015-08-04 at 09:58 -0400, Paul Gortmaker wrote:
>>>> While diagnosing a problem with xf86-video-intel I noticed we had two
>>>> copies of drm headers in the sysroot; one from here and one from
>>>> the libdrm package.   The xf86-video-intel turned out to be another
>>>> thing, but that doesn't mean we want two copies in the sysroot with
>>>> different content and luck of include path indicating which one we
>>>> get.
>>>>
>>>> This one landed in usr/include/drm and the libdrm one put its files
>>>> at usr/include/libdrm, so there was no obvious over-write conflict.
>>>>
>>>> The obvious risk here would be unearthing implicit dependencies on
>>>> the libdrm; things trying to build before it has populated the sysroot
>>>> but two full highly parallel builds containing a full desktop graphics
>>>> suite did not show any issues.
>>>>
>>>> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>>>
>>> Is this something which should get addressed in the upstream kernel?
>>
>> I don't think so ; my (fun!) investigation into libdrm and the commits
>> there seem to indicate they tend to treat the kernel as the master
>> repository for header content and fold changes from the uapi dir in
>> the kernel back into libdrm content/repository.
>>
>> That said, since we (yocto) advocate people to not get all twitchy about
>> having the latest and greatest kernel headers, for wider compatibility,
>> it seemed most sensible to clobber the kernel ones and ensure the ones
>> we used matched the functionality of the libdrm that we are building and
>> actually installing.
>>
>> Maybe there are arguments for going the other way, but say if we were
>> using the 3.19 headers still, then we'd definitely be out of sync with
>> the libdrm binaries we generate and deploy.
>
> What about a scenario where libdrm isn't being built ? I agree that we do want
> the latest drm headers, and we don't want to encourage people to patch the
> kernel and then expect those headers to be in linux-libc-headers ... the latest
> headers can come from some sort of application specific package, like libdrm.
>
> But if someone isn't ever building libdrm, do we want to not have those headers
> in the sysroot ? We could say that any sane user of those headers has the
> right dependency, but there is a chance of some silent and unexpected behaviour.
>
> That being said, aren't there some more combinations to consider here ?
>
>   - get libdrm to install to a different location and not clobber libc
> headers ? You
>     said two copies in your commit message, are they to different
> places now ? or
>     is libdrm going right over top of the kernel versions ?
>
>    If we did this, applications would have to be modified to look in
> the right place ..
>    which really isn't a good thing either. But I mention the option anyway.
>
>    What is the delta in libdrm ? Do they leave a half and half sort of
> situation ?

I dont think you can ever make delta to be nil becauase a given X
version of libdrm might copy the headers from Y version of kernel
and our linux-libc-headers my be driven out of Z version of linux
kernel. So it will be a perpetual pain for linux-libc-headers to take
delta
based upon libdrm and slap it into kernel sources. If you want to sign
up for this thats fine but anytime libdrm is updated the patch to
kernel
headers will need to be updated and the reason we enforced it so hard
to pin linux-headers to one kernel version looses significance if we
start patching it based upon userspace packages. Unless libdrm starts
honoring backward compatibility with kernel APIs etc. its going to
remain

>
>  - That combination where libdrm isn't being built .. do we want
> incomplete headers ?
>    We could get the kernel to depend on libdrm I suppose :)
>
>  - What about SDK builds ? We need to make sure that libdrm is in the depenency
>    chain and pulled in before they are packaged up, or the headers
> will be missing.


thats only needed for packages depending upon libdrm should not be a problem.

>
> Bruce
>
>>
>> Paul.
>> --
>>
>>>
>>> I agree we likely don't want two sets of those.
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
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
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

