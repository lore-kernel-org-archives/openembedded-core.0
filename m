Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD83DC0015E
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 21:56:34 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.2463.1689803784452014374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 14:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WbYnmAql;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3458a08310aso1150835ab.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 14:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689803783; x=1692395783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIKOmUuwcUQkZ75A6BfzKUiaWHV/g5H21Ps0GztO6HQ=;
        b=WbYnmAqlMrqE82G7wUvq8KhXoe9xdyLOYgV0SvFMm7kfbyKD+vDw77/z14aCrOJdFB
         1MmFKEzVK/jwz00jWOV2Tt4RrhhZWc4jtxOGGczNG2t0hyfu8mWiqi19iqdPBnVG5mHk
         xzYbfI/ydCmTQWBCOTXEvE0oy+UBdGoU0V3braKi98Xll5b4LMrkyg7QjN5UITwDmb11
         XrhCCUjrueHC6bqXz3bEzoygM8o7m7mhIdykCkRm6xcKrs0xXJ5KDfl9gL7JbsijuMa3
         eCLz8T5g3ra1hbeT5u+XfJx1+UfQJ2Vin2bb0GdMRFqvFvi/YYnpmBrSN+UuFGNSgpf0
         kyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689803783; x=1692395783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIKOmUuwcUQkZ75A6BfzKUiaWHV/g5H21Ps0GztO6HQ=;
        b=kjjnSg4zH5521jszHND/ipqdnbJgJbFrGNXKLITgoY+/Uij9ngCC35/0fzS8FPTuMj
         lYocO+VGechEaelw8O2nZV6o4bzI1g0GPURDNt/mYlC9Gu8q49QOMBQzQfEz0oME+2At
         9qcbDvFNuqkHFBgXFPqAZHhqJf4Izn4M5JTNy16JKD7zVXcXswQrT1IidnhDedL+z0lg
         j5314fWCWbiH2Fd5jlvIU/QlnNslKxE4v12t8gnJHkr4+h5GLD5zA7JBfjxA0Uesjphj
         sN9RMZUN44dcvreKaKNeqAhPDuVdVKs7Mqeree3bKL/jq3NoUexbuwYrDPQtKzNVFo3t
         kqsA==
X-Gm-Message-State: ABy/qLbzAiBtRtOdQmSkjFGvTW+357e7gnZdavtLnryrlehiIFrC1hzw
	WXvuC9liLrIdeWMwkMQc1vUSF7qlxnw0yGuBNA0=
X-Google-Smtp-Source: APBJJlFQbhMDR/JNopkCsC04VFasuk3tIMaRKhy8Q3fLI7ljnVlEb7yeTMYtVuWD6aCebo2PXjDidtbZqP8t0FHgyaQ=
X-Received: by 2002:a05:6e02:152e:b0:342:512a:ccec with SMTP id
 i14-20020a056e02152e00b00342512accecmr4124203ilu.31.1689803783576; Wed, 19
 Jul 2023 14:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4O92vHqJbTEqUDPktnuaCp-vzskCZeb_5iqr5NmfGNONg@mail.gmail.com> <TY2PR02MB3678ED281AB36D9AB6CBA9C68139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
In-Reply-To: <TY2PR02MB3678ED281AB36D9AB6CBA9C68139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Jul 2023 17:56:13 -0400
Message-ID: <CADkTA4OBjLFxO8x3X1tBvzwU9P=nFU4iVx-qgAphbrboqxu1nw@mail.gmail.com>
Subject: Re: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
To: Petr Gotthard <petr.gotthard@advantech.cz>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 21:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184616

On Wed, Jul 19, 2023 at 4:10=E2=80=AFPM Petr Gotthard
<petr.gotthard@advantech.cz> wrote:
>
> Thanks Bruce,
>
> > -----Original Message-----
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: Wednesday, July 19, 2023 7:44 PM
> > To: Petr Gotthard <petr.gotthard@advantech.cz>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSIO=
N
> >
> > Hmm.
> >
> > I explicitly tested this scenario to make sure it worked, since you run=
 into the
> > same issue when building modules on-target.
> >
> > make-mod-scripts is running out of the same SCM as the main kernel buil=
d, so it
> > should match, and did in my testing (otherwise lttng-modules wouldn't w=
ork).
> >
> > Can you send the exact steps, which kernel recipe you are using, etc.
> > That way I can reproduce the problem locally.
> >
>
> I am using an AM335x with meta-ti (latest master). I think that the "beag=
lebone" might be close enough.
> I did not set any kernel versions explicitly. The KERNEL_LOCALVERSION is =
set by the meta-ti itself in their setup-defconfig.inc:
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linu=
x/setup-defconfig.inc

I'm not familiar with what meta-ti's recipes do with respect to kernel
configuration, so I'm only commenting on what I just skimmed from the
link you provided.

Not directly related, but what is going on with .scmversion in that
.inc, will probably break in kernels 6.3+, which is what I'm trying to
head off with the movement of KERNEL_LOCALVERSION/LOCALVERSION to the
base class, it needs to be visible in multiple places.

>
> The kernel is "linux-ti-staging_6.1" with quite standard settings. Recent=
ly I did explicitly set
> CONFIG_LOCALVERSION_AUTO=3Dn
> which was "y" by default. With the default "y" setting I was getting a ke=
rnel version with two identical suffixes ("6.1.33-g8f7f371be2-g8f7f371be2",=
 whereas the make-mod-scripts used "6.1.33-g8f7f371be2").

Did that only start happening recently ? because with the
localversion_auto and a set .scmversion, that's what I'd expect to
happen (see below).

>
> The out-of-tree modules I am building are using recipes almost identical =
to the "poky/meta-skeleton/recipes-kernel/hello-mod". Again, no kernel vers=
ion specified.
>
> I tried to build the lttng-modules and see the same issue: "modinfo lttng=
-clock.ko" returns
> filename:       /home/...-linux-gnueabi/lttng-modules/2.13.9-r0/packages-=
split/kernel-module-lttng-clock-6.1.33-g8f7f371be2/lib/modules/6.1.33-g8f7f=
371be2/kernel/lttng-modules/lttng-clock.ko
> vermagic:       6.1.33 SMP mod_unload ARMv7 p2v8
>
> which indicates the vermagic (without the -gxxxx sufix) is different to t=
he kernel version (with the sufix).
>

The more globally unset LOCALVERSION will be picked up by the kernel
build (as invoked by the kernel or make-mod-scripts), and yes, will
inhibit scm querying.

The previous method was only working with some good luck (in general,
not related to anything meta-ti is doing).  That configure in meta-ti
is shooting right through the middle and hence why everything is
lining up as the unset LOCALVERSION should actually be getting a "+" ,
but if CONFIG_LOCALVERSION_AUTO is set, it won't actually run the code
that queries the scm, which makes the .scmversion file what is picked
up. It's all rather fragile :)

I'm curious if on-target module builds work on those boards, since as
near as I can tell the versions won't match (as the .scmversion file
isn't captured, so the vermagic will be different).

As a workaround, it should be possible to either set the LOCALVERSION
globally (or duplicate the variable to make-mod-scripts), so it'll be
the same, or it needs LOCALVERSION be completely unset in
make-mod-scripts, so the kernel localversion script won't pick it up
at all (and use the .scm querying to match).

Let me run some tests on a modified 6.1 linux-yocto and get back to
you. I should be able to mock up a similar localversion configuration.
There are options like using a localversion file, but I'd rather avoid
that if possible, since it'll surely break some other use cases, and
would have to be added to the artifacts for on-target/SDK builds, etc.

Bruce

>
> Petr
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

