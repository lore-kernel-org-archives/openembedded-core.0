Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0B97E73755
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 12:46:56 +0000 (UTC)
Received: by ykec202 with SMTP id c202so2038864yke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=EqGeOYFnf724sVm/h2C92ntqoIKCqhC8nU7Xs8R9SX0=;
	b=MLfdN0VB6X8wBQ92OEpU3bmw7PngvUGUmNbYJe0PMqqdv7A4mz/2076uin+9AOhArN
	WBB/3q1kNPq8wcJj6gH0I+mu7F0cwFtlLLELY6yW4weQSSA9S6WVCK9iWTXayVtZVqoT
	iwFeWiT9T8rzbDFXf4gDV/cWKNF83TrEeiqXX++FwRpwAVyorYhRsDd7VJieraUPAWxS
	yyq3nprFxWJaeHfG8FsvQC9kr/fFVkvzUluubF3XHOB5pvMscVTX8J56StmI7t1lEgL4
	vKnvqilhf6eCHyG5yu4N75wwMYUOVlnqUmiyx17uw3GYLRre1OoQXx/YRPizTSuzHBSE
	rZUg==
MIME-Version: 1.0
X-Received: by 10.170.172.213 with SMTP id o204mr28764350ykd.123.1430916417915;
	Wed, 06 May 2015 05:46:57 -0700 (PDT)
Received: by 10.129.109.20 with HTTP; Wed, 6 May 2015 05:46:57 -0700 (PDT)
In-Reply-To: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBAB@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBAB@deeres07.ebgroup.elektrobit.com>
Date: Wed, 6 May 2015 08:46:57 -0400
Message-ID: <CADkTA4PBkRTKFN7UFqZrpHTaZY2ANWqEQodu317XJer02p4mqw@mail.gmail.com>
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
X-List-Received-Date: Wed, 06 May 2015 12:46:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2015 at 3:10 AM,  <Steffen.Pankratz@elektrobit.com> wrote:
> Hi
>
> I am in the process of creating a board support package (1) for NVIDIAs J=
etson TK1 board (2).
>
> In my kernel recipe I am using 'KBUILD_DEFCONFIG =3D "tegra_defconfig"' b=
ut the build failed always.
>
> I think the issue is in do_kernel_metadata (meta/classes/kernel-yocto.bbc=
lass), if no defconfig exists, the config specified in KBUILD_DEFCONFIG is =
never copied.
> Attached you will find a possible patch for this issue.

The patch doesn't look quite right to me. It's going to inhibit an
in-tree config from being
copied out to the workdir when it is different than the defconfig that
is already sitting there.

The conditions that currently exist where for a specific use case, and
I can see that
having the else clause you are adding would be useful if there isn't
already a defconfig
on the SRC_URI (which is a different case then it was created do handle).

I can take your patch and stack it on my queue with a few changes, assuming=
 that
is ok with you.

> Feedback is welcome.
>
> Another, probably unrelated problem I face right now is, that basically m=
ost of the options of the tegra_defconfig get removed by kconf_check.
> The kernel gets build, there are no warnings that things got removed but =
in the files in .meta/cfg/standard/jetson-tk1  I see for example:
>
> Value requested for CONFIG_ARCH_TEGRA_124_SOC not in final .config Reques=
ted value:  CONFIG_ARCH_TEGRA_124_SOC=3Dy Actual value:
>
> Any ideas?

The checking of the defconfig is inhibited on purpose. I only added
the functionality
as an assist/crutch for folks that haven't migrated to a base config +
fragments.

A defconfig does not specify whether or not options are important for
the board or
not, whether or not it is a full defconfig or a minimal config, etc.
Without that
extra information generating screens full of warnings isn't useful, so
it isn't generated
at all.

Cheers,

Bruce

>
>
> Kind regards
> -Steffen
>
> (1) https://bitbucket.org/kratz00/meta-jetson-tk1/src
> (2) http://elinux.org/JetsonTK1
>
> --
> Steffen Pankratz
> Expert, Software Integration & Services
>
> EB - Driving the Future of Software
> Phone:  +49 9131 7701-6605
> Fax: +49 9131 7701 6333
> steffen.pankratz@elektrobit.com
> http://automotive.elektrobit.com/
> PGP-Key: http://keyserver.elektrobit.com/
>
> Elektrobit Automotive GmbH, Am Wolfsmantel 46, 91058 Erlangen, Germany Ma=
naging Directors Alexander Kocher, Gregor Zink Register Court F=C3=BCrth HR=
B 488
>
>
>
> ----------------------------------------------------------------
> Please note: This e-mail may contain confidential information
> intended solely for the addressee. If you have received this
> e-mail in error, please do not disclose it to anyone, notify
> the sender promptly, and delete the message from your system.
> Thank you.
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

