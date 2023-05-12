Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3A7C77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 14:47:23 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.26858.1683902836663308951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 07:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lTTn3sn+;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-76c67a69192so96248039f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683902836; x=1686494836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7b+JT1MhNQn1n18GB2oswIwKPQWKyffjdC5rRtebvLY=;
        b=lTTn3sn+np3P8hvSXJgnjnne8zKIZOEPTQCfFbWpEvzDvFVNwxSY/Dew1kf5vOSBax
         yGfMZyizHAVy7mHPZo5FCdNOhT9estjbx8g6FM8FIfZbTujh/i68pl5JMR1UIZKvwDR4
         jcOOeSsDp1YWdJ0h/xF+YcEKhmSnG9F3lacB5EB+103cKRmX1NUXzHSD0+zDEClmqdpC
         MnTC1cR62cNKNDf3l+XrQ+sfunfs92RV2N3+2OgS0qQDZNWijwEJA6Ptyksspj/+KDlR
         W9wSpqvuPuR87C9mJJ+CZtL1urnFe6sZXNvuub9E3hOWqFEJ3KlfTGK/ZU/XDQ4OEUmq
         P7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683902836; x=1686494836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b+JT1MhNQn1n18GB2oswIwKPQWKyffjdC5rRtebvLY=;
        b=lvvIzuvmxbKGo6UVX43OfmGaGWOX7e8CudyCPWN2IMeygFugXDhYEt7mQsnkAwIE5f
         /eo5/4VSdyyzBvGgopnfpD4Mtf0tmSsLcSahc2RN22Lj8OGKSJ44/BTZ3HUFfjBSCmc4
         WwjjfQKxcNTqAYz4j1dTWkPOve20ykSKfasG5Q2IgaNtkl8jUse1abQywPym9y8EM9+Q
         REPIxX4nP6S2FBtwZsQQ6/IMZJ/LrUQmdafd+rYNbch0+LESPnCV412vw5H6vK5U2RCy
         aMvAZYwRtaPSDEFxD+DV+2+HPeUVT9CVL1sczuxHsa3eL5fBW5JAszC/qo3+zsh0QXU6
         cQew==
X-Gm-Message-State: AC+VfDx+W2hGMk9rV0gNpffDOnC4q5PdZQmltyP2zdfcAYjRbhm8nJkd
	5CL26WZmQI4gZ7w83L45qtawnsxQi1+jIvI7AVA=
X-Google-Smtp-Source: ACHHUZ4GQXwZbs1PglETwxS20W0veuwFU4VK56kbjM+lHP1+2dajOqd95/FLyZol9utrzXAg7OHKglbEg3tQH9lfNHI=
X-Received: by 2002:a92:c6cb:0:b0:334:f876:86ad with SMTP id
 v11-20020a92c6cb000000b00334f87686admr15133074ilm.12.1683902835729; Fri, 12
 May 2023 07:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com>
 <015d196800fc8046575b7a6a9a1e38e893f2b1fa.camel@linuxfoundation.org>
 <CADkTA4OkMJOkA+JD1AOJOpt9pLwPJ0jFwpsg4gNZSC99zwPsmA@mail.gmail.com> <fa9f7858-af5c-7d48-d9b6-51ba874f25a1@windriver.com>
In-Reply-To: <fa9f7858-af5c-7d48-d9b6-51ba874f25a1@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 May 2023 10:47:14 -0400
Message-ID: <CADkTA4Nj_=p-Bkoz4ZwD91wTYTt4aoJk1cr5Y4d6OwaOSLW_Aw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] linux-yocto: fix missing pahole and elfutils
 when CONFIG_DEBUG_INFO_BTF enabled in devshell
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 14:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181185

On Wed, May 10, 2023 at 10:23=E2=80=AFPM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> Hi Richard and Bruce,
>
>
> Thanks for your suggestion,
>
>
> On 5/11/23 00:25, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
> >>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>>
> >>> after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the make w=
ould report some
> >>> errors due to pahole and elfuitls is missing, since this is a debug o=
ption, so conditionally
> >>> add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone need en=
able CONFIG_DEBUG_INFO_BTF
> >>> option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D "btf" in l=
ocal.conf to solve the pahole
> >>> and elfutils dependency.
> >> Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS with thi=
s
> >> option documented somewhere?
> >>
> >> I also think the mention of devshell in the commit message is
> >> misleading, this issue happens regardless of how you enable the option=
.
> >> There are also other ways of enabling this than local.conf, you'd
> >> likely not want people doing that at the end of development.
> >>
> >> I'm curious on Bruce's opinion but to me this at the very least needs =
a
> >> commit message rewrite and I'd question whether the docs elsewhere
> >> would allow someone to discover this workflow anyway.
> > I missed this entirely, thanks for replying to it, or I never would
> > have noticed.
> >
> > This mechanism isn't appropriate for these dependencies. I only added
> > it to work around pkgconfig issues (which we can more cleanly solve in
> > newer kernels  (see what I've been doing with make-mod-scripts) .. so
> > it can eventually be dropped).
> >
> > We are already enabling elfutils-native conditionally on a
> > per-architecture basis (currently only x86-64).
> >
> > If we need it on more arches now, we should enable it in the version
> > specific recipes, or actually, we have moved far enough into newer
> > kernel's that it could be in the .inc now.
> This commit's background was some kernel debug options needs elfutils
> and pahole native package, since the issue happens on enabling kernel
> debug options and not all people needs it, so I conditionally add the
> dependency in KERNEL_DEBUG_OPTION.
>
> If possible we can enable it in .inc because newer kernel tools like btf
> are support using pkg-config to locate the libelf instead of finding it
> from /usr/ folder, so we can use elfutils-natvie instead of installing
> elfutils package on host PC.
>
> >
> > Similarly, we should enable the pahole-native dependency on a per-arch =
basis.
> >
> > As Richard mentioned, what's the reproducer to see the errors ? it
> > must be more than devshell.
>
> Yes, this happens on devshell and normal world if some kernel debug
> options are enabled. We can reproduce this issue with following steps(I
> have found the issue with kernel 5.15):
>
> 1. enable kernel option CONFIG_DEBUG_KERNEL  CONFIG_DEBUG_INFO and
> CONFIG_DEBUG_INFO_BTF
>
> 2. build the kernel image, the compiler would report missing libelf.h
> and gelf.h which contains in elfutils-native(this step not happens on
> x86-64 due to it has been enabled).
>
> 3. enable elfutils-native by manual, the kernel source code can be
> compiled successfully but failed in final step due to missing pahole.
>
>
> >
> > If you can follow up with the steps to reproduce, I can take on the
> > refactoring and broader dependency cleanup question, since I can test
> > the wider matrix at the same time.
>
> Thanks, my local setup might missing some corner case, this is another
> reason I enable those native packages limit in KERNEL_DEBUG_OPTION :).
>

I've been thinking about this, and I've come to the following suggestion:

I plan on moving the elfutils-native to linux-yocto.inc, out of the
version specific
recipes.  I'll also drop the architecture specific nature of the
current DEPENDS.
The need for this is much more common now, and all of the reference kernels
in master are new enough. The elfutils-native build dependency is not
significant
enough to worry about adding it for all architectures. If it does
become a problem,
there are options to make it conditional again.

I can drop the HOST_LIBELF_LIBS work around in the linux-yocto.inc, as
we can now properly detect libelf via pkg-config. I didn't need it in any o=
f
my testing. Again, if this proves to be wrong, I'd enable it in a
different way now
(using what I've learned from fixing make-mod-scripts).

As for the pahole-native dependency, there's been a "developer" kernel-type
for quite some time. The design intention behind it was to enable options l=
ike
this, and not make the "standard" or "production" kernel's too large by def=
ault.
So the dependency could be conditional on that kernel type ... but we don't
want to break other kernels just because they've enabled that option. We al=
so
don't (and won't) get into the game of looking for individual options in th=
e
.config to enable something, since a) it is too late b) it is a moving targ=
et.

So that leaves the following options: a) enable pahole-native unconditional=
ly
on the arches that support it (x86-64, aarch64) (and also move the pahole
recipe into oe-core) b) make the KERNEL_DEBUG_OPTIONS less specific,
and simply call it KERNEL_DEBUG, when enabled, we could conditionally
add pahole-native (I'd also submit documentation for the functionality
c) something I haven't thought about ...

I'm moving on the implementation now, but will adjust course if
there's something
I've missed.

Bruce


>
> Xiangyu
>
> > Bruce
> >
> >> Cheers,
> >>
> >> Richard
> >>
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

