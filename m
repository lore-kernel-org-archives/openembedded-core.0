Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51233C77B7F
	for <webhook@archiver.kernel.org>; Sat, 13 May 2023 01:16:26 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.40067.1683940581326644210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 18:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rg404Q9O;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-763c3429a8cso278422639f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 18:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683940580; x=1686532580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ng6WtSMsHam/MXMyDdc2RNL60wfD+AgBcgJIkJMz4YE=;
        b=rg404Q9OAbpYudB7Z19QabPgmekjvRgkarEW3RpJGOmCVMyqEkvSyUYSfkHLHta07/
         TIgrTibC72NfWfL2PnTZdpTw5rPrtNg7k9+b31I4HlYd5CRia9oCgZqlG3Y59gJEVrOP
         4jYGTyCrLGFeu8WsUZkArEL6wu4gOuSLkCOgu3yalpHSWyT9oWg/2ISgQd3ZsXBANOSy
         ihGF1yWaeTzgiv+6MXDuPSbFj6/wmsvPzSqZMEnavCvW1rXvBF63f4FHwatrg/uHp+za
         EA71byABZ3LjjrB6EMAe5dztXeXLAkj5Fh8p8iEYuTWvjvDjuFw6cgsenKBJqfp1G0N8
         J8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683940580; x=1686532580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ng6WtSMsHam/MXMyDdc2RNL60wfD+AgBcgJIkJMz4YE=;
        b=FfK6BHb/5uAtZPDSXFCztE80YAE0qHgz2Fs54Yd06SnIldgGw2i0J6N4+MOWgSdpfC
         t9nRXDN++tz8k4fUvncfl4aTinbqfEknKZk58WlwFAjny5DHvWC2a5/DSsRw+YFoapdU
         Ao/l9K6SvOfiAwFNA5HboBA6fAjzyJFxXdojAGd0HqVbvb9a+KgnthXU2KpLESvl2zNy
         FAqOrmHahecxb0I380inZ7A3W7+gCrbnArnWVmtKT/VvDNy99fc+0ebn3F1QiLaliMqs
         PFoK3EXTzp9mWGw6ysfVO5tQVCw9EPUrUFwLfKrgJCSx8yqFomMZ2AcYVwq/7t82xnw+
         PVKQ==
X-Gm-Message-State: AC+VfDwls5BXX0nQbmLmeantQL3p4t33++GPDcgLRITYXAkZMOvZcrbe
	UfM4Vjzk2Nu7wfDXiD0H1wPfpYwqU+8YJQw7Ubc=
X-Google-Smtp-Source: ACHHUZ4KRCqjYBtuR6SUhrnVJDJmwj93NzT8L65UKkgKoBiFnhYoECcIqFSuvX/QI7nhqoDDvqOUvGjm1fpwkXQM2Yo=
X-Received: by 2002:a6b:6d06:0:b0:76c:7b40:9b66 with SMTP id
 a6-20020a6b6d06000000b0076c7b409b66mr5163359iod.1.1683940580459; Fri, 12 May
 2023 18:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com>
 <015d196800fc8046575b7a6a9a1e38e893f2b1fa.camel@linuxfoundation.org>
 <CADkTA4OkMJOkA+JD1AOJOpt9pLwPJ0jFwpsg4gNZSC99zwPsmA@mail.gmail.com>
 <fa9f7858-af5c-7d48-d9b6-51ba874f25a1@windriver.com> <175E6CB55C617FA5.27409@lists.openembedded.org>
In-Reply-To: <175E6CB55C617FA5.27409@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 May 2023 21:16:09 -0400
Message-ID: <CADkTA4M5JnHLpea+EEWG9gD2SPEG_R9KDjr6zGVEvRHusV9upQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] linux-yocto: fix missing pahole and elfutils
 when CONFIG_DEBUG_INFO_BTF enabled in devshell
To: bruce.ashfield@gmail.com
Cc: Xiangyu Chen <xiangyu.chen@eng.windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 May 2023 01:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181195

On Fri, May 12, 2023 at 10:47=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Wed, May 10, 2023 at 10:23=E2=80=AFPM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
> >
> > Hi Richard and Bruce,
> >
> >
> > Thanks for your suggestion,
> >
> >
> > On 5/11/23 00:25, Bruce Ashfield wrote:
> > > CAUTION: This email comes from a non Wind River email account!
> > > Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
> > >
> > > On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > >> On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
> > >>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> > >>>
> > >>> after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the make=
 would report some
> > >>> errors due to pahole and elfuitls is missing, since this is a debug=
 option, so conditionally
> > >>> add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone need =
enable CONFIG_DEBUG_INFO_BTF
> > >>> option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D "btf" in=
 local.conf to solve the pahole
> > >>> and elfutils dependency.
> > >> Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS with t=
his
> > >> option documented somewhere?
> > >>
> > >> I also think the mention of devshell in the commit message is
> > >> misleading, this issue happens regardless of how you enable the opti=
on.
> > >> There are also other ways of enabling this than local.conf, you'd
> > >> likely not want people doing that at the end of development.
> > >>
> > >> I'm curious on Bruce's opinion but to me this at the very least need=
s a
> > >> commit message rewrite and I'd question whether the docs elsewhere
> > >> would allow someone to discover this workflow anyway.
> > > I missed this entirely, thanks for replying to it, or I never would
> > > have noticed.
> > >
> > > This mechanism isn't appropriate for these dependencies. I only added
> > > it to work around pkgconfig issues (which we can more cleanly solve i=
n
> > > newer kernels  (see what I've been doing with make-mod-scripts) .. so
> > > it can eventually be dropped).
> > >
> > > We are already enabling elfutils-native conditionally on a
> > > per-architecture basis (currently only x86-64).
> > >
> > > If we need it on more arches now, we should enable it in the version
> > > specific recipes, or actually, we have moved far enough into newer
> > > kernel's that it could be in the .inc now.
> > This commit's background was some kernel debug options needs elfutils
> > and pahole native package, since the issue happens on enabling kernel
> > debug options and not all people needs it, so I conditionally add the
> > dependency in KERNEL_DEBUG_OPTION.
> >
> > If possible we can enable it in .inc because newer kernel tools like bt=
f
> > are support using pkg-config to locate the libelf instead of finding it
> > from /usr/ folder, so we can use elfutils-natvie instead of installing
> > elfutils package on host PC.
> >
> > >
> > > Similarly, we should enable the pahole-native dependency on a per-arc=
h basis.
> > >
> > > As Richard mentioned, what's the reproducer to see the errors ? it
> > > must be more than devshell.
> >
> > Yes, this happens on devshell and normal world if some kernel debug
> > options are enabled. We can reproduce this issue with following steps(I
> > have found the issue with kernel 5.15):
> >
> > 1. enable kernel option CONFIG_DEBUG_KERNEL  CONFIG_DEBUG_INFO and
> > CONFIG_DEBUG_INFO_BTF
> >
> > 2. build the kernel image, the compiler would report missing libelf.h
> > and gelf.h which contains in elfutils-native(this step not happens on
> > x86-64 due to it has been enabled).
> >
> > 3. enable elfutils-native by manual, the kernel source code can be
> > compiled successfully but failed in final step due to missing pahole.
> >
> >
> > >
> > > If you can follow up with the steps to reproduce, I can take on the
> > > refactoring and broader dependency cleanup question, since I can test
> > > the wider matrix at the same time.
> >
> > Thanks, my local setup might missing some corner case, this is another
> > reason I enable those native packages limit in KERNEL_DEBUG_OPTION :).
> >
>
> I've been thinking about this, and I've come to the following suggestion:
>
> I plan on moving the elfutils-native to linux-yocto.inc, out of the
> version specific
> recipes.  I'll also drop the architecture specific nature of the
> current DEPENDS.
> The need for this is much more common now, and all of the reference kerne=
ls
> in master are new enough. The elfutils-native build dependency is not
> significant
> enough to worry about adding it for all architectures. If it does
> become a problem,
> there are options to make it conditional again.
>
> I can drop the HOST_LIBELF_LIBS work around in the linux-yocto.inc, as
> we can now properly detect libelf via pkg-config. I didn't need it in any=
 of
> my testing. Again, if this proves to be wrong, I'd enable it in a
> different way now
> (using what I've learned from fixing make-mod-scripts).
>
> As for the pahole-native dependency, there's been a "developer" kernel-ty=
pe
> for quite some time. The design intention behind it was to enable options=
 like
> this, and not make the "standard" or "production" kernel's too large by d=
efault.
> So the dependency could be conditional on that kernel type ... but we don=
't
> want to break other kernels just because they've enabled that option. We =
also
> don't (and won't) get into the game of looking for individual options in =
the
> .config to enable something, since a) it is too late b) it is a moving ta=
rget.
>
> So that leaves the following options: a) enable pahole-native uncondition=
ally
> on the arches that support it (x86-64, aarch64) (and also move the pahole
> recipe into oe-core) b) make the KERNEL_DEBUG_OPTIONS less specific,
> and simply call it KERNEL_DEBUG, when enabled, we could conditionally
> add pahole-native (I'd also submit documentation for the functionality
> c) something I haven't thought about ...
>
> I'm moving on the implementation now, but will adjust course if
> there's something
> I've missed.

I have my implementation done, but I'm wondering what your configuration
was for testing pahole ?

I'm seeing the following in qemux86-64 at the end of the build:

| Unsupported DW_TAG_unspecified_type(0x3b)
| Encountered error while encoding BTF.
|   LD      .tmp_vmlinux.kallsyms1
|   NM      .tmp_vmlinux.kallsyms1.syms
|   KSYMS   .tmp_vmlinux.kallsyms1.S
|   AS      .tmp_vmlinux.kallsyms1.S
|   LD      .tmp_vmlinux.kallsyms2
|   NM      .tmp_vmlinux.kallsyms2.syms
|   KSYMS   .tmp_vmlinux.kallsyms2.S
|   AS      .tmp_vmlinux.kallsyms2.S
|   LD      vmlinux
|   BTFIDS  vmlinux
| FAILED: load BTF from vmlinux: No such file or directory
| make[1]: *** [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/sc=
ripts/Makefile.vmlinux:34:
vmlinux] Error 255
| make[1]: *** Deleting file 'vmlinux'
| make: *** [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/Makef=
ile:1255:
vmlinux] Error 2

I haven't looked into it at all yet (but will do so over the weekend)
.. but I thought
I should check with you first to get the details on how you were testing pa=
hole
functionality.

Bruce


>
> Bruce
>
>
> >
> > Xiangyu
> >
> > > Bruce
> > >
> > >> Cheers,
> > >>
> > >> Richard
> > >>
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181185): https://lists.openembedded.org/g/openembedde=
d-core/message/181185
> Mute This Topic: https://lists.openembedded.org/mt/98753313/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

