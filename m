Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CE5C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 05:06:06 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.7288.1637643965475994770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 21:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NveaaExe;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id g14so86757869edb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 21:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nKrYBT0iKBwKe5MLYowkrGM1r21D2y4DyPvJ0p+UaC4=;
        b=NveaaExeHSXTf8MWLwQfTSeIjkWPjjRs7PFWQbNqU9gRxil/iNTe2qLZfpEhxp0uoF
         g5JtuHTaUCIdNEfUtAPn8HOg/ESQaQK0cgmLfVKEJ6ohFpOMME3UYe5a6/yd91+GfRpq
         /DbaJtDafAMRvcrAxB0QQxKSJpDVICnEatQ8xsuBXTg+t3V9iF1XQbjWxTMaCFAq8dsA
         f8SaLtJrXIiPVbb6FirmEwbLlZT6cm0PGoU0JzgTNBsQsxKIUexbOkOy6tpZxg3EICmX
         RRy3RBspI4jxGKLM7K3RVbjrv9nTETC249UmkBoCBkzOvBKf9RlMS/ROe/OzzJRSD9Ev
         gUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nKrYBT0iKBwKe5MLYowkrGM1r21D2y4DyPvJ0p+UaC4=;
        b=I6bzTrRhp1rJV4yST+M/cOZdIFAJq5iaN5doP/yrUtgu/Szn5zXiMECv6sfwTXeMhF
         hNuysSOb4JTBldFM3yuqSDLR7sCiSC21L7tRRupIBdA8gvzaNWG9lgyQyauyZZhvQbOS
         c5A1P9jU9p4yyupkWW9t356A9SIHN4frkyEqP3xCuDPx/FVQHDEqUCoQM9f+ciBeHp13
         nnbty4zraSlpRypSVh6ljHmNWI2ZhlXpQH1VCH6mkg27OKyti67A270hTM2FUBl43glz
         a+kDiUru19CC6wkuE5BQ26RmSZdWbjfYb2CBp7Uq++YwHnQpydJssDFf6u7NA3cMfesc
         jViw==
X-Gm-Message-State: AOAM532DdY+bd9f5i+C+74PhoV862Ee0xs5AduPEguWfOJoDxC7vxDpN
	2MCGwKBOSihBjuZxWtHdVuGNg8YCK5tCAY3GZx4=
X-Google-Smtp-Source: 
 ABdhPJxfBwmltblDirCH5TeAVob4TXtEaBFJ5vJOOQmXCfY4AT9q2KDp48VfnEpv3sqlADGxCF9BM6G/l6+w80Tlj+I=
X-Received: by 2002:a05:6402:278e:: with SMTP id
 b14mr4669335ede.354.1637643963391;
 Mon, 22 Nov 2021 21:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20211122163459.41079-1-max.krummenacher@toradex.com>
 <CADkTA4N0kF36bOyQu=jOkT_253zQy9sXqnywv9z_E5GZeewpJw@mail.gmail.com>
 <CAEUSe7_pESAniiBwAv2oASHi6je67zf7sMw1F2TNcas_1raspA@mail.gmail.com>
 <CADkTA4NNawU1htCkTv9T-uEZ=-e82nKZG9yN9M9oO19B9VQLXQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NNawU1htCkTv9T-uEZ=-e82nKZG9yN9M9oO19B9VQLXQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Nov 2021 00:05:52 -0500
Message-ID: 
 <CADkTA4MZnysUoZc6MxrzrQAD4zMUdW3Pyo-nnnd5V49Uy2hy6w@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/2] perf: sort-pmuevents: some fixes
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Cc: Max Krummenacher <max.oss.09@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 05:06:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158596

On Mon, Nov 22, 2021 at 8:39 PM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Mon, Nov 22, 2021 at 12:23 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org=
> wrote:
> >
> > Hello!
> >
> > On Mon, 22 Nov 2021 at 10:51, Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
> > > On Mon, Nov 22, 2021 at 11:35 AM Max Krummenacher <max.oss.09@gmail.c=
om> wrote:
> > [...]
> > > > Note that the kernel itself doesn't build either as after 5.15 it n=
ow
> > > > does try to run the dt_binding_check for which the kernel recipe do=
es
> > > > not provide whatever stuff is needed.
> > > > I just did a revert patch for commit 53182e81f47d ("kbuild: Enable
> > > > DT schema checks for %.dtb targets") to get over that.
> > >
> > > I have a fixefor that particular problem (the bindings),  so you can
> > > safely continue to ignore it .. but I hadn't gotten around to fixing
> > > perf yet.
> > [...]
> >
> > I don't mean to hijack the subject, but do you have some quick
> > pointers on that? We're seeing the same on linux-next and
> > linux-mainline since that patch landed in those trees, and have
>
> I'm trying to come up with a way to fix this without needing a kernel pat=
ch.
>

FYI: I have this sorted out now.

The commits to get 5.16 building with device tree validation are here:

https://github.com/zeddii/openembedded-core/tree/zedd/kernel

(I would have pushed it to my poky-contrib zedd/kernel branch, but
there's something broken on the machine tonight).

You'll need to add the DEPENDS to your kernel recipe, like I did for
linux-yocto-dev, but outside of that the pkg-config tweaking that I
did avoided the need for kernel patches. The dtschema recipe + the
imported meta-python recipes should "just work". I haven't done a
second pass to make sure I found all the dependencies, but it is close
.. and if you have meta-python in your layers, you won't have any
issues.

For now, the DEPENDS are recipe specific, since they are fairly heavy,
and the mapping of PV -> ARCH -> conditional dependencies is still a
WIP (it gets brittle/complex very quickly) .. but moving the DEPENDS
into kernel.bbclass is something that I'm working on as well.

I still need more cleanup, but I expect that I can submit the queue by
the end of the week.

.. and the proof:

qemuarm64 login: root
uroot@qemuarm64:~# uname -a
Linux qemuarm64 5.16.0-rc2-yoctodev-standard #1 SMP PREEMPT Sun Nov 21
21:47:39 UTC 2021 aarch64 aarch64 aarch64 GNU/Linux
root@qemuarm64:~#

Cheers,

Bruce


> Sounds like you are already aware of the pkgconfig issue, which is
> what I'm attempting to fix via environment manipulation versus a
> patch.
>
> We do need python dtschema as well, as a new native dependency of the
> bindings check, which unfortunately pulls in ruamel and jsonschema.
> Those are both in meta-python, so they need to migrate to core to
> support the new checking.
>
> There's also a problem with nproc being used, and it was giving me an
> error on one of my servers, I haven't looked into it more yet.
>
> I have a quick recipe here as well. And with those two pieces in
> place, I'm up and running again.
>
> The right thing for the short term, is that revert. There's quite a
> bit of sorting out to do, to get this in decent shape for core ...
> personally, I'd like to make the checking optional for those that
> don't want it .. but that goes against what Rob is trying to do in the
> kernel :D
>
> If those issues sound familiar, and there's interest, I can drop my
> WIP commits into a branch and share.
>
> Bruce
>
> > soft-reverted the commit for now. This (incomplete) recipe has not
> > helped us get through that:
> >
> >   https://github.com/mrchapp/meta-lkft/blob/d/add-dtschema/recipes-devt=
ools/python/dtschema_2021.10.bb
> >
> > Thanks and greetings!
> >
> > Daniel D=C3=ADaz
> > daniel.diaz@linaro.org
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

