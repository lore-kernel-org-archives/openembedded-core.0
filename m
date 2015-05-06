Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id B441573F1C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 13:59:50 +0000 (UTC)
Received: by yhrr66 with SMTP id r66so2537291yhr.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 06:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xCNiyI1HoxE8yk8cLx6hhw5IyiSCw5am4Dn1/wVfOPI=;
	b=K7qy/qAAdHAadiyVI0Msbd/MnQ2E8cva8qIylei9xMP601DXkCsBQMFpAQjyG2Sgat
	3fxMLjODUnRum0/zMf9VUpWnHJ6T71RZPwELhkzOI55/V8JKjDceENry0m2jdC7Yumxa
	htg0lIswt5Etod8jP98d2NejMQr1U1+URENyt+VYQ4oJyDbJ83xi/g+Km8ysrlqXkN31
	riUxWRnUn/CRrfLtp9HmaJ5WEJvx7Vb5ESE45Z3ZAoCrT3k0S6m9Jwjkn6ycnymGHQOy
	NRlJKoLIAWbLZF/8SWU5sfAmvlbMiZR6+dG2VGmISv1eC44Bk4PFt33Rduv4yin+u8yE
	01Dw==
MIME-Version: 1.0
X-Received: by 10.236.61.137 with SMTP id w9mr21611803yhc.31.1430920791367;
	Wed, 06 May 2015 06:59:51 -0700 (PDT)
Received: by 10.129.109.20 with HTTP; Wed, 6 May 2015 06:59:51 -0700 (PDT)
In-Reply-To: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FD16@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBAB@deeres07.ebgroup.elektrobit.com>
	<CADkTA4PBkRTKFN7UFqZrpHTaZY2ANWqEQodu317XJer02p4mqw@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364938FCED@deeres07.ebgroup.elektrobit.com>
	<CADkTA4Ob1CLekk=Y+u+AfBZq_E4_9xHJbFc548Po0Utsx-tdRA@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364938FD16@deeres07.ebgroup.elektrobit.com>
Date: Wed, 6 May 2015 09:59:51 -0400
Message-ID: <CADkTA4NuJG11-9O6EJoEE0QE85Ng4WCWiuqo4dxnnkonAVSphA@mail.gmail.com>
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
X-List-Received-Date: Wed, 06 May 2015 13:59:53 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 6, 2015 at 9:57 AM,  <Steffen.Pankratz@elektrobit.com> wrote:
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Wednesday, May 06, 2015 3:37 PM
>> To: Pankratz, Steffen
>> Cc: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] KBUILD_DEFCONFIG issue
>
>
>> >> > I am in the process of creating a board support package (1) for
>> >> > NVIDIAs
>> >> Jetson TK1 board (2).
>> >> >
>> >> > In my kernel recipe I am using 'KBUILD_DEFCONFIG = "tegra_defconfig"'
>> >> but the build failed always.
>> >> >
>> >> > I think the issue is in do_kernel_metadata (meta/classes/kernel-
>> >> yocto.bbclass), if no defconfig exists, the config specified in
>> >> KBUILD_DEFCONFIG is never copied.
>> >> > Attached you will find a possible patch for this issue.
>> >>
>> >> The patch doesn't look quite right to me. It's going to inhibit an
>> >> in-tree config from being copied out to the workdir when it is
>> >> different than the defconfig that is already sitting there.
>> >
>> > That was by intention. I was following the comments above the code,
>> > which say 'if a defconfig exists it will not be overwritten'.
>> > So I changed the code that it is never overwritten and kept the warning if
>> the configs differ.
>> >
>>
>> I'll apply the change here and have another look, but that's not what I see
>> (just looking at the snippet), since we do want to overwrite it if the configs
>> are different.
>>
>> I can tweak the comment to be clear on that point.
>
> Ok.
>
>
>> >> The conditions that currently exist where for a specific use case,
>> >> and I can see that having the else clause you are adding would be
>> >> useful if there isn't already a defconfig on the SRC_URI (which is a
>> >> different case then it was created do handle).
>> >>
>> >> I can take your patch and stack it on my queue with a few changes,
>> >> assuming that is ok with you.
>> >
>> > Feel free to do so.
>> >
>> >
>> >> > Another, probably unrelated problem I face right now is, that
>> >> > basically
>> >> most of the options of the tegra_defconfig get removed by kconf_check.
>> >> > The kernel gets build, there are no warnings that things got
>> >> > removed but
>> >> in the files in .meta/cfg/standard/jetson-tk1  I see for example:
>> >> >
>> >> > Value requested for CONFIG_ARCH_TEGRA_124_SOC not in final .config
>> >> Requested value:  CONFIG_ARCH_TEGRA_124_SOC=y Actual value:
>> >> >
>> >> > Any ideas?
>> >>
>> >> The checking of the defconfig is inhibited on purpose. I only added
>> >> the functionality as an assist/crutch for folks that haven't migrated
>> >> to a base config + fragments.
>> >>
>> >> A defconfig does not specify whether or not options are important for
>> >> the board or not, whether or not it is a full defconfig or a minimal config,
>> etc.
>> >> Without that
>> >> extra information generating screens full of warnings isn't useful,
>> >> so it isn't generated at all.
>> >
>> > I am not quite sure what the correct way would be to continue and get a
>> kernel with everything I need and want.
>> > The config specified in KBUILD_DEFCONFIG gets stripped of many
>> necessary options need for the board.
>> > So this is obviously not the right approach.
>>
>> It would be the kernel configuration subsystem that is stripping the changes
>> when it processes the .config (i.e. nothing in the Yocto processing of those
>> same fragments).
>>
>> If you manually copy the defconfig into place and do a make oldconfig, are
>> you seeing lots of delta and questions being asked ?
>
> I did not see any questions or deltas:
>
> bitbake virtual/kernel -c devshell
>
> Then:
>
> cp arch/arm/configs/tegra_defconfig .config
> make oldconfig

odd. Is this something I can reproduce locally ? If you email me the details,
I'll poke at it and offer some suggestions.

Bruce

>
>
> --
> Regards
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

