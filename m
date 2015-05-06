Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD5C73F22
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 13:36:55 +0000 (UTC)
Received: by yhcb70 with SMTP id b70so2376067yhc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=A8PK8X7mzL78ronLuj4xG9vFtiLoHIkjw9juoxr5WAo=;
	b=DB3/pdOogDKKtVb1Wz21YIQuc3HoSmM2AZ4xntZk6N2m7kfgSakKZDgaaF7Q4xhwbP
	R0Z5Y6SrVI649KT7kOds+8iFzI5F8ltlbyKKq3D7ETNrPGT5PSCpp1PCFHx6IbKj2dDD
	mHS/V1Ve+MMyz9ZwobpFa0ejdy0mMccFHOzujEmxxkAZq5xFMA8RSzHpNm3gQS7GfnLl
	k3UYek9lYNhRqDljLxYoiJVwFOUqgDsh+7EyKXvYmviFnbyX7gkhDWRUjpXPJ4m4oFMc
	6pUVNqwhsU4cL4yeZaR1eCGd2BSBt103PL4NCJh33z9czLpIPIbXFbKA/aogUqw2UN/3
	NR4Q==
MIME-Version: 1.0
X-Received: by 10.236.98.200 with SMTP id v48mr17351040yhf.12.1430919417300;
	Wed, 06 May 2015 06:36:57 -0700 (PDT)
Received: by 10.129.109.20 with HTTP; Wed, 6 May 2015 06:36:57 -0700 (PDT)
In-Reply-To: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FCED@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBAB@deeres07.ebgroup.elektrobit.com>
	<CADkTA4PBkRTKFN7UFqZrpHTaZY2ANWqEQodu317XJer02p4mqw@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364938FCED@deeres07.ebgroup.elektrobit.com>
Date: Wed, 6 May 2015 09:36:57 -0400
Message-ID: <CADkTA4Ob1CLekk=Y+u+AfBZq_E4_9xHJbFc548Po0Utsx-tdRA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Steffen.Pankratz@elektrobit.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: KBUILD_DEFCONFIG issue
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
X-List-Received-Date: Wed, 06 May 2015 13:36:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 6, 2015 at 9:28 AM,  <Steffen.Pankratz@elektrobit.com> wrote:
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Wednesday, May 06, 2015 2:47 PM
>
> Hi Bruce
>
>> > I am in the process of creating a board support package (1) for NVIDIAs
>> Jetson TK1 board (2).
>> >
>> > In my kernel recipe I am using 'KBUILD_DEFCONFIG = "tegra_defconfig"'
>> but the build failed always.
>> >
>> > I think the issue is in do_kernel_metadata (meta/classes/kernel-
>> yocto.bbclass), if no defconfig exists, the config specified in
>> KBUILD_DEFCONFIG is never copied.
>> > Attached you will find a possible patch for this issue.
>>
>> The patch doesn't look quite right to me. It's going to inhibit an in-tree
>> config from being copied out to the workdir when it is different than the
>> defconfig that is already sitting there.
>
> That was by intention. I was following the comments above the code,
> which say 'if a defconfig exists it will not be overwritten'.
> So I changed the code that it is never overwritten and kept the warning if the configs differ.
>

I'll apply the change here and have another look, but that's not what I see
(just looking at the snippet), since we do want to overwrite it if the configs
are different.

I can tweak the comment to be clear on that point.

>
>> The conditions that currently exist where for a specific use case, and I can
>> see that having the else clause you are adding would be useful if there isn't
>> already a defconfig on the SRC_URI (which is a different case then it was
>> created do handle).
>>
>> I can take your patch and stack it on my queue with a few changes, assuming
>> that is ok with you.
>
> Feel free to do so.
>
>
>> > Another, probably unrelated problem I face right now is, that basically
>> most of the options of the tegra_defconfig get removed by kconf_check.
>> > The kernel gets build, there are no warnings that things got removed but
>> in the files in .meta/cfg/standard/jetson-tk1  I see for example:
>> >
>> > Value requested for CONFIG_ARCH_TEGRA_124_SOC not in final .config
>> Requested value:  CONFIG_ARCH_TEGRA_124_SOC=y Actual value:
>> >
>> > Any ideas?
>>
>> The checking of the defconfig is inhibited on purpose. I only added the
>> functionality as an assist/crutch for folks that haven't migrated to a base
>> config + fragments.
>>
>> A defconfig does not specify whether or not options are important for the
>> board or not, whether or not it is a full defconfig or a minimal config, etc.
>> Without that
>> extra information generating screens full of warnings isn't useful, so it isn't
>> generated at all.
>
> I am not quite sure what the correct way would be to continue and get a kernel with everything I need and want.
> The config specified in KBUILD_DEFCONFIG gets stripped of many necessary options need for the board.
> So this is obviously not the right approach.

It would be the kernel configuration subsystem that is stripping the changes
when it processes the .config (i.e. nothing in the Yocto processing of those
same fragments).

If you manually copy the defconfig into place and do a make oldconfig, are you
seeing lots of delta and questions being asked ?

Bruce

> I could not find documentation about why options and what options get removed.
> Or instead of using KBUILD_DEFCONFIG, should I specify a defconfig in SRC_URI?
> Or do I need to create fragments for all the options which got removed?
>
>
> --
> Thanks and regards
> -Steffen
>
>
> ----------------------------------------------------------------
> Please note: This e-mail may contain confidential information
> intended solely for the addressee. If you have received this
> e-mail in error, please do not disclose it to anyone, notify
> the sender promptly, and delete the message from your system.
> Thank you.
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

