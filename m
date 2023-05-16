Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5F1C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 12:55:52 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.20911.1684241747680118808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 05:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=koDWxPCV;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3318961b385so9100745ab.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 05:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684241747; x=1686833747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzvuAG8c3Xp8svB3sYl2pVe1zcdP22VheOpo+0RPYTM=;
        b=koDWxPCVHgPOHfpTqSA6xqjwjYc/rWSOrKk8nGry4yR+Y1/RfDDTmhuqLgC/VIwqae
         B+2iqHU43X7P8dnGkyZWfy/J0M9WhsfbpsQffy7QXGMmkGPXPBem+S9+BJZa5KSVyAm2
         CFd5xJV9VcQjzjNIok+byKBhPy3OdlTgXiHDT/Aa3jX4tJt4mI//FW8YJYi3h3sxLoAe
         FQqfl6XrcuTBTZpI0iI4bjOURpvXDIhK3FIYrnaaDaywf+g9JpPIlVmdb/xM87/g3MLt
         yjx7/bZyW1h/kdag34dzHaVPMuhcxqX0Dt9wZgLUdRbgBiznIoLeVDawlQYjS0JJmoPF
         cEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684241747; x=1686833747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzvuAG8c3Xp8svB3sYl2pVe1zcdP22VheOpo+0RPYTM=;
        b=Ad+JS66rey/Bai2iMxT53AyF96lZ4i42GLZ5NrEr0/i20K0Q3aezq9FOf8RsNgxtSm
         tPjoSeltgFAnUkZJxFoczVaoe0bd4KxAcrkDxUPFPFPDSnSB1ojsIa6sQwN1GMZjIznD
         sL71ll4YhE3tRJQ3owMr1PrUynWo9pPNyTDDgd3oEUUpKwG+AKqQNN2er0A9qRBU2Pjt
         dXS3LYp0KIe37Y37ZOcw5tAdYqQE3tT2t//6xX/1C/lpocE49vQ/EqGhv46ltzhutNBb
         fIGHxQadge6huZ6rg7Y4YI9thBuXjGuMZ0zAJSQM9Cl57ravO9TAkAYSlPEIR7PcBwGP
         la0A==
X-Gm-Message-State: AC+VfDygJKoVuKEfMB4VYD7+2ToqpNc81U7eFDh5zFEJKQ4zlptQg7Wi
	xC+g/LAVQwHPk21V4Db/EP2l5zSoK5iabJhzQbg=
X-Google-Smtp-Source: ACHHUZ6rEvNLNIuUJFCEeiIgbhSwtCt6xG2EHzUhxc2b+YuEUr5fa/wA9iHkgkke1BJGNNI49Xg9nhizY3SVbYdOIes=
X-Received: by 2002:a92:3652:0:b0:335:b2b2:6710 with SMTP id
 d18-20020a923652000000b00335b2b26710mr13342821ilf.15.1684241746619; Tue, 16
 May 2023 05:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com>
 <015d196800fc8046575b7a6a9a1e38e893f2b1fa.camel@linuxfoundation.org>
 <CADkTA4OkMJOkA+JD1AOJOpt9pLwPJ0jFwpsg4gNZSC99zwPsmA@mail.gmail.com>
 <fa9f7858-af5c-7d48-d9b6-51ba874f25a1@windriver.com> <175E6CB55C617FA5.27409@lists.openembedded.org>
 <CADkTA4M5JnHLpea+EEWG9gD2SPEG_R9KDjr6zGVEvRHusV9upQ@mail.gmail.com>
 <312184e0-32cb-ab57-50c0-7a8c5519a0c7@windriver.com> <175F5136C3E93ABB.30531@lists.openembedded.org>
 <CADkTA4M5ZodLTjZ1EF0CFt4zzvywrg9rW-CZkexV_1pNgAdwgg@mail.gmail.com> <70bd8fc7-34b3-a435-cd88-2c39987cb547@windriver.com>
In-Reply-To: <70bd8fc7-34b3-a435-cd88-2c39987cb547@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 16 May 2023 08:55:35 -0400
Message-ID: <CADkTA4Pk5y-QHZ_d7UJwqn_Q6rCCt_y2EGpr7WpW-Lt+SByJNw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 12:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181405

On Tue, May 16, 2023 at 4:56=E2=80=AFAM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> Hi Bruce,
>
>
> On 5/15/23 21:11, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Mon, May 15, 2023 at 8:34=E2=80=AFAM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >> On Mon, May 15, 2023 at 6:04=E2=80=AFAM Xiangyu Chen
> >> <xiangyu.chen@eng.windriver.com> wrote:
> >>> Hi Bruce,
> >>>
> >>>
> >>> Sorry for being late..
> >>>
> >>>
> >>> On 5/13/23 09:16, Bruce Ashfield wrote:
> >>>
> >>> CAUTION: This email comes from a non Wind River email account!
> >>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
> >>>
> >>> On Fri, May 12, 2023 at 10:47=E2=80=AFAM Bruce Ashfield via
> >>> lists.openembedded.org
> >>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >>>
> >>> On Wed, May 10, 2023 at 10:23=E2=80=AFPM Xiangyu Chen
> >>> <xiangyu.chen@eng.windriver.com> wrote:
> >>>
> >>> Hi Richard and Bruce,
> >>>
> >>>
> >>> Thanks for your suggestion,
> >>>
> >>>
> >>> On 5/11/23 00:25, Bruce Ashfield wrote:
> >>>
> >>> CAUTION: This email comes from a non Wind River email account!
> >>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
> >>>
> >>> On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
> >>> <richard.purdie@linuxfoundation.org> wrote:
> >>>
> >>> On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
> >>>
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
> >>>
> >>> Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS with th=
is
> >>> option documented somewhere?
> >>>
> >>> I also think the mention of devshell in the commit message is
> >>> misleading, this issue happens regardless of how you enable the optio=
n.
> >>> There are also other ways of enabling this than local.conf, you'd
> >>> likely not want people doing that at the end of development.
> >>>
> >>> I'm curious on Bruce's opinion but to me this at the very least needs=
 a
> >>> commit message rewrite and I'd question whether the docs elsewhere
> >>> would allow someone to discover this workflow anyway.
> >>>
> >>> I missed this entirely, thanks for replying to it, or I never would
> >>> have noticed.
> >>>
> >>> This mechanism isn't appropriate for these dependencies. I only added
> >>> it to work around pkgconfig issues (which we can more cleanly solve i=
n
> >>> newer kernels  (see what I've been doing with make-mod-scripts) .. so
> >>> it can eventually be dropped).
> >>>
> >>> We are already enabling elfutils-native conditionally on a
> >>> per-architecture basis (currently only x86-64).
> >>>
> >>> If we need it on more arches now, we should enable it in the version
> >>> specific recipes, or actually, we have moved far enough into newer
> >>> kernel's that it could be in the .inc now.
> >>>
> >>> This commit's background was some kernel debug options needs elfutils
> >>> and pahole native package, since the issue happens on enabling kernel
> >>> debug options and not all people needs it, so I conditionally add the
> >>> dependency in KERNEL_DEBUG_OPTION.
> >>>
> >>> If possible we can enable it in .inc because newer kernel tools like =
btf
> >>> are support using pkg-config to locate the libelf instead of finding =
it
> >>> from /usr/ folder, so we can use elfutils-natvie instead of installin=
g
> >>> elfutils package on host PC.
> >>>
> >>> Similarly, we should enable the pahole-native dependency on a per-arc=
h basis.
> >>>
> >>> As Richard mentioned, what's the reproducer to see the errors ? it
> >>> must be more than devshell.
> >>>
> >>> Yes, this happens on devshell and normal world if some kernel debug
> >>> options are enabled. We can reproduce this issue with following steps=
(I
> >>> have found the issue with kernel 5.15):
> >>>
> >>> 1. enable kernel option CONFIG_DEBUG_KERNEL  CONFIG_DEBUG_INFO and
> >>> CONFIG_DEBUG_INFO_BTF
> >>>
> >>> 2. build the kernel image, the compiler would report missing libelf.h
> >>> and gelf.h which contains in elfutils-native(this step not happens on
> >>> x86-64 due to it has been enabled).
> >>>
> >>> 3. enable elfutils-native by manual, the kernel source code can be
> >>> compiled successfully but failed in final step due to missing pahole.
> >>>
> >>>
> >>> If you can follow up with the steps to reproduce, I can take on the
> >>> refactoring and broader dependency cleanup question, since I can test
> >>> the wider matrix at the same time.
> >>>
> >>> Thanks, my local setup might missing some corner case, this is anothe=
r
> >>> reason I enable those native packages limit in KERNEL_DEBUG_OPTION :)=
.
> >>>
> >>> I've been thinking about this, and I've come to the following suggest=
ion:
> >>>
> >>> I plan on moving the elfutils-native to linux-yocto.inc, out of the
> >>> version specific
> >>> recipes.  I'll also drop the architecture specific nature of the
> >>> current DEPENDS.
> >>> The need for this is much more common now, and all of the reference k=
ernels
> >>> in master are new enough. The elfutils-native build dependency is not
> >>> significant
> >>> enough to worry about adding it for all architectures. If it does
> >>> become a problem,
> >>> there are options to make it conditional again.
> >>>
> >>> I can drop the HOST_LIBELF_LIBS work around in the linux-yocto.inc, a=
s
> >>> we can now properly detect libelf via pkg-config. I didn't need it in=
 any of
> >>> my testing. Again, if this proves to be wrong, I'd enable it in a
> >>> different way now
> >>> (using what I've learned from fixing make-mod-scripts).
> >>>
> >>> As for the pahole-native dependency, there's been a "developer" kerne=
l-type
> >>> for quite some time. The design intention behind it was to enable opt=
ions like
> >>> this, and not make the "standard" or "production" kernel's too large =
by default.
> >>> So the dependency could be conditional on that kernel type ... but we=
 don't
> >>> want to break other kernels just because they've enabled that option.=
 We also
> >>> don't (and won't) get into the game of looking for individual options=
 in the
> >>> .config to enable something, since a) it is too late b) it is a movin=
g target.
> >>>
> >>> So that leaves the following options: a) enable pahole-native uncondi=
tionally
> >>> on the arches that support it (x86-64, aarch64) (and also move the pa=
hole
> >>> recipe into oe-core) b) make the KERNEL_DEBUG_OPTIONS less specific,
> >>> and simply call it KERNEL_DEBUG, when enabled, we could conditionally
> >>> add pahole-native (I'd also submit documentation for the functionalit=
y
> >>> c) something I haven't thought about ...
> >>>
> >>> I'm moving on the implementation now, but will adjust course if
> >>> there's something
> >>> I've missed.
> >>>
> >>> I have my implementation done, but I'm wondering what your configurat=
ion
> >>> was for testing pahole ?
> >>>
> >> My reply will be hard to read, as plain text reply to the html doesn't
> >> give us proper
> >> context indenting.
> >>
> >>> I have tested on a devshell, with oe-master branch, the kernel versio=
n using 5.15
> >>>
> >>> 1. enable pahole-native and elfutils-native in linux-yocto.inc as a d=
ependency.
> >>>
> >>> 2. enable CONFIG_DEBUG_KERNEL  CONFIG_DEBUG_INFO and
> >>> CONFIG_DEBUG_INFO_BTF under menuconfig
> >>>
> >>> 3. using "export PKG_CONFIG_SYSROOT_DIR=3D""" cleanning PKG_CONFIG_SY=
SROOT_DIR
> >>>
> >>> 4, make
> >>>
> >>>
> >>> If the test environment using bitbake, then we need to remove PAHOLE=
=3Dfalse flag in kernel EXTRA_OEMAKE in classes-recipe/kernel.bbclass, othe=
rwise, bitbake would report missing pahole error.
> >>>
> >> That's the same as my patch series (I've also changed PAHOLE=3Dfalse t=
o
> >> a conditional in my series).
> >>
> >>> I'm seeing the following in qemux86-64 at the end of the build:
> >>>
> >>> | Unsupported DW_TAG_unspecified_type(0x3b)
> >>> | Encountered error while encoding BTF.
> >>> |   LD      .tmp_vmlinux.kallsyms1
> >>> |   NM      .tmp_vmlinux.kallsyms1.syms
> >>> |   KSYMS   .tmp_vmlinux.kallsyms1.S
> >>> |   AS      .tmp_vmlinux.kallsyms1.S
> >>> |   LD      .tmp_vmlinux.kallsyms2
> >>> |   NM      .tmp_vmlinux.kallsyms2.syms
> >>> |   KSYMS   .tmp_vmlinux.kallsyms2.S
> >>> |   AS      .tmp_vmlinux.kallsyms2.S
> >>> |   LD      vmlinux
> >>> |   BTFIDS  vmlinux
> >>> | FAILED: load BTF from vmlinux: No such file or directory
> >>> | make[1]: *** [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-sou=
rce/scripts/Makefile.vmlinux:34:
> >>> vmlinux] Error 255
> >>> | make[1]: *** Deleting file 'vmlinux'
> >>> | make: *** [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source=
/Makefile:1255:
> >>> vmlinux] Error 2
> >>>
> >>> I haven't looked into it at all yet (but will do so over the weekend)
> >>> .. but I thought
> >>>
> >>> I haven't seen this problem yet(i'll pull the latest oe-core and meta=
-oe code and try again), if possible, could you share a patch with me so th=
at we can test it together? thanks.
> >>>
> >> I'm on oe-core master, with qemux86-64.
> >>
> >> I'll do a bit more work on the patch today, and can share it if I
> >> can't figure out where that unsupported tag is coming from.
> > It seems like it is a known issue, I found both a lkml thread and
> > debian bug from October 2022.
> >
> > Your 5.15 kernel wouldn't show the issue.
>
> Yes, this should not happens on 5.15 kernel.
>
>
> Today I synced the oe-core/poky to latest master version, removed the
> build dir and run oe-init-build-env again and switched to use default
> linux 6.1.25 instead of 5.15.
>
> Some kernel config has been updated, there is no CONFIG_DEBUG_INFO, I
> used CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT.
>
> So, currently my local setup kernel config is enabled
> CONFIG_DEBUG_KERNEL CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT and
> CONFIG_DEBUG_INFO_BTF, in order to make a easy test, I enabled
> elfutils-native and pahole-native as DEPEND directly in linux-yocto.in,
> and remove the PAHOLE=3Dfalse in EXTRA_OEMAKE.
>
> my oe-core rev: 35e5d29a7d654fc79bdb898d0f1fb277270dbfd5
>
> my meta-oe rev:b7aa66d734b911737b61610c1c47778e14b15c55
>
>
> When I ran bitbake linux-yocto -v -D, I have met the same issue,
>
> | Unsupported DW_TAG_unspecified_type(0x3b)
> | Encountered error while encoding BTF.
>
> It's bit strange that the I removed my local OS(ubuntu)'s pahole and the
> code can be compiled without error:
>
>
>    CC      init/version-timestamp.o
>    LD      .tmp_vmlinux.btf
>    BTF     .btf.vmlinux.bin.o
>    LD      .tmp_vmlinux.kallsyms1
>    NM      .tmp_vmlinux.kallsyms1.syms
>    KSYMS   .tmp_vmlinux.kallsyms1.S
>    AS      .tmp_vmlinux.kallsyms1.S
>    LD      .tmp_vmlinux.kallsyms2
>    NM      .tmp_vmlinux.kallsyms2.syms
>    KSYMS   .tmp_vmlinux.kallsyms2.S
>    AS      .tmp_vmlinux.kallsyms2.S
>    LD      vmlinux
>    BTFIDS  vmlinux
>    NM      System.map
>    SORTTAB vmlinux
>

Indeed!

What's the toolchain version on your ubuntu install ? It is likely
either our toolchain version or configuration in combination with the
kernel version that is adding the section that pahole can't
understand/decode.

If you want to work with my patches, you can find my branch here:

https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel

(you also need the linux-yocto bumps on that branch as they'll contain
the kernel-cache SRCREV bumps to pick up the fragments for BTF, etc).

Bruce

>
>
> >
> > You can find a link to the lkml thread from the debian bug:
> > https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg18735=
53.html
>
> >
> > I'll clean up my patch, since this isn't something I can fix immediatel=
y.
> >
> > If you do track down patches in the latest kernel that haven't been
> > sent to -stable, we can backport them to fix the linux-yocto builds
> > with pahole.
> >
> > Bruce
> >
>
> Br,
>
> Xiangyu
>
> >> Bruce
> >>
> >>> I should check with you first to get the details on how you were test=
ing pahole
> >>> functionality.
> >>>
> >>> Bruce
> >>>
> >>>
> >>> Br,
> >>>
> >>> Xiangyu
> >>>
> >>> Bruce
> >>>
> >>>
> >>> Xiangyu
> >>>
> >>> Bruce
> >>>
> >>> Cheers,
> >>>
> >>> Richard
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
> >>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#181248): https://lists.openembedded.org/g/openembe=
dded-core/message/181248
> >> Mute This Topic: https://lists.openembedded.org/mt/98753313/1050810
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
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

